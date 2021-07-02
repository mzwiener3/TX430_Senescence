library(caret) # caret allows you to run many different ML methods with uniform syntax by train() function. See supported methods: https://topepo.github.io/caret/available-models.html
library(caretEnsemble) # with caretEnsemble you can run many models simultaneously and see which works best 
library(doParallel) # doParallel is for parallel computation in caret. In other words you will use many cores which will speed-up you computation many times. 
library(reticulate) # reticulate gives you R interface to npy function from python; see https://rstudio.github.io/reticulate/articles/arrays.html
library(FactoMineR) # FactoMineR is for factor analysis, we will use only PCA from it but it contains many other useful method: 
library(ggplot2) # ggplot2 is for elegant graphics 
#need also data.table package for this script but it will be used without loading into session since it will change properties/behavior of data frame
# you need also pls, glmnet, kernlab package. You can install them with install.package("package name")

# load data
X <- read.csv("signaturesAll.csv") # hypespectral data
y <- read.csv("labelsAll.csv", stringsAsFactors = F) # corresponding classes/labels 
wv <- read.table("wavelength.txt", header = T,) # wavelength names in nm. They are only necessary for plotting 

table(y$x) # see how many pixels from each classes you have

### create color palette for plotting ###
# if you don't like this colors you can change it with any of this value: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

groupCol <- c("black", "sienna4", "green4", "#984ea3", "#ff7f00", "darkgoldenrod1")

### make plot with average hypespectral value fro each classes ###
groupMean <- aggregate(.~y$x, X, FUN=mean) # calculate average fro each wave length, separately for each classes. If you are in R studio you can use View(groupMean) to see results

colnames(groupMean)[2:244] <- wv$Wavelength.nm. # change column names into wave length in nm so we can use it latter in X axis in plot

groupMean <- data.table::melt(groupMean)# ggplot in general requires data in long format instead of wide so you have to transform (melt) it. Use View() function again.
#Aldo, you can call any function from any package using :: like it is done above. data.table package is super useful but it aggressively  change lots of default R behavior and 
# don't want it here. So we don't use library(data.table) but instead we call melt function directly from the package. There will be some warning in terminal, just ignore it. 

groupMean$variable <- as.numeric(as.character(groupMean$variable)) # convert wave length into numeric value so we can use is as continuous value in X axis
colnames(groupMean)[1] <- "label" #change column name

### make average wave length plot ###
ggplot(groupMean, aes(x=variable, y=value, colour=label)) + 
  geom_line(size=2, alpha=0.8) + 
  theme_bw() + 
  theme(legend.position = "top") + scale_colour_manual(values = groupCol)+ 
  xlab('Wavelength (nm)') + ylab("Intensity")

### perform PCA ###
resPCA <- PCA(X, graph = F) # calculate PCA

pc <- resPCA$ind$coord # obtain coorination for each pixel 
pc <- as.data.frame(pc) # change into data.frame object so it can work well with ggplot2


### make PCA plot ###
ggplot(pc, aes(Dim.1, Dim.2, colour=y$x)) + 
  geom_point(alpha=0.8)  + theme_bw() + 
  scale_colour_manual(values = groupCol) + 
  theme(legend.position = "top") +
  stat_ellipse(size=2) + xlab("PC1") + ylab('PC2')

################################################################################
################################################################################

### Modeling ###

y2 <- y$x # create vector with class labels
y2[y2=="Background2"] <- "Background" # change Background2 into Background. Our model doesn't care about this difference. We need this info only for plotting
y2 <- as.factor(as.numeric(as.factor(y2))) # change original labels into numeric value 


### here you can specify various parameters for model training, we will use only few parameters, see ?trainControl for more info###
myControl <- trainControl(method="cv", # here you specify method for model performance validation, could be cross-validation (cv), bootstrap and few others 
                          number = 5, # we will use 5-fold cross-validation, so we will split data into 5 pieces (4 for modeling and one for validation). Like in the video.
                          allowParallel = T, # allow parallel computing (using many cores). If you are on Windows, probably you have to remove it.
                          sampling = "up") # remember table(y$x)? You have unbalance data, that is you have for example many more pixel background in your training set
# then panicle. This could affect model so we will artificially increase panicle pixels into the same number as background pixels by taking same pixels many times.
# This is not perfect situation but there isn't better choice. Other approach will be to take only small sample of background pixel to decrease it's number in panicle. 
# But it looks like that up-scaling works better here. You can read more about it here: https://topepo.github.io/caret/subsampling-for-class-imbalances.html

### Next, you have to specify which method you would like to use. You can choose from this list: https://topepo.github.io/caret/available-models.html
# as you can see there are lots of option, we will use 3 methods 
tuneList <- list(
  pls <- caretModelSpec(method="pls", tuneLength = 30), # default number of component in pls is 3 which is very low so we increase here up to 30  
  glmnnet <- caretModelSpec(method="glmnet"), # we can leave default parameters for rest models 
  svm <- caretModelSpec(method = "svmRadial")
) 

cl <- makePSOCKcluster(detectCores()) # here you activate parallel computing. With detectCores() you will allow computation with all available cores in your PC. 
registerDoParallel(cl)


res <- caretList(X, y2, # If you are already familiar with model formula in R you know that it should looks like this, for example glm(y ~ X). caret has a little 
                 #different syntax, first you put your data frame with predictors (X; so wave length in our case) and after comma vector with depended variable 
                 # so labels in our case (y/y2)
                 tuneList = tuneList, # here you specify your list with models 
                 trControl = myControl, # and here parameters 
                 preProcess = c("center","scale")) # finally we would like to scale and center our predictors (X). This is probably not super important in our case
# since all predictors are in the same scale (all are wave length), but this is common practice so let just leave it here. 
#your data set are quite big (8586 rows) so it took almost hour to finish it on my laptop

stopCluster(cl) # stop parallel computing
gc() # clean RAM

dotplot(resamples(res), metric = "Accuracy") # now lets compare model performance by it's accuracy, you can see that SVM works best in this case, so 
#we will use it to make prediction 

### Prediction ###
np <- import("numpy") # import numpy function. This is super strange and unusual syntax in R, I am not very familiar with it so I give up with 
#deeper explanation why it's look like this. Anyway you can use python npy function like this: np$X where X is function name. See below we will use "load"

# Finally, lets perform prediction on all photo with simple loop

lf <- list.files("myNpy/", pattern = "npy") # firs obtain names of npy files 

# and now apply loop over it
for (i in lf) {
  npy <- np$load(file = paste("myNpy/", i, sep = "")) # np$load allow us to load 3D npy directly to the R without any conversion. This is extremely useful, because we save
  # tons of time and disc space 
  x <- as.data.frame(array_reshape(npy, c(dim(npy)[1]*dim(npy)[2],243))) # next we have convert npy (storage in R as series of integer) to data.frame. 
  #caret only allows prediction on data frame
  colnames(x) <- colnames(X) # columns in our new data set need to have the same names as in original 
  resPred <- predict(res$svmRadial, x) # now we perform prediction
  # if you would like to make any other computation, like fracion of dry leaf, etc... here is the best moment to include it
  write.table(matrix(resPred, nrow = 320), paste("results/", i, ".csv", sep = ""), row.names = F, col.names = F, quote = F, sep = "\t") # Finally, we save results as
  # matrix with 320 rows which correspond to 320 with values in each cell from 1 to 6. We can convert this file into RGB latter with python. 
  print(paste(i, "Done!"))
}
