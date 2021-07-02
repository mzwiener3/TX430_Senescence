library(ggplot2)
library(ggpubr)
library(tidyverse)
theme_set(theme_classic(base_size = 15, base_family = "NimbusSan"))
#449          
dat <- read.csv('449_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

a <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 449 N2")

a + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#450
dat <- read.csv('450_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

b <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 450 N2")

b + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#451
dat <- read.csv('451_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

c <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 451 N2")

c + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#452
dat <- read.csv('452_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

d <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 452 N2")

d + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#453
dat <- read.csv('453_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

e <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 453 N2")

e + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#454
dat <- read.csv('454_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

f <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 454 N1")

f + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#455
dat <- read.csv('455_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

g <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 455 N1")

g + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#456
dat <- read.csv('456_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

h<- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 456 N1")

h + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#457
dat <- read.csv('457_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

i <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 457 N1")

i + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#458
dat <- read.csv('458_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

j <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 458 N1")

j + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#459
dat <- read.csv('459_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

k <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 459 N3")

k + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#460
dat <- read.csv('460_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

l <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 460 N3")

l + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#461
dat <- read.csv('461_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

m <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 461 N3")

m + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#462
dat <- read.csv('462_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

n <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 462 N3")

n + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#463
dat <- read.csv('463_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

o <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 463 N3")

o + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#464
dat <- read.csv('464_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

p <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 464 N4")

p + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#465
dat <- read.csv('465_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

q <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 465 N4")

q + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#466
dat <- read.csv('466_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

r <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 466 N4")

r + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#467
dat <- read.csv('467_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

s <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 467 N4")

s + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#468
dat <- read.csv('468_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

t <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 468 N4")

t + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#469
dat <- read.csv('469_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

u <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 469 N5")

u + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#470
dat <- read.csv('470_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

v <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 470 N5")

v + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#471
dat <- read.csv('471_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

w <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 471 N5")

w + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#472
dat <- read.csv('472_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

x <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 472 N5")

x + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

#473
dat <- read.csv('473_pixels.csv')
dat$day <- as.Date(paste("2021-",dat$day))
datLong <- dat %>% pivot_longer(cols = c(14,15,18))

y <- ggplot(datLong, aes(day, value, group=paste(Taxa, name), colour=name), ) + geom_line(size=3) + scale_colour_manual(values = c("brown", "green", "yellow")) + xlab("Date") + ylab("Pixel count (mm)") + ggtitle("Plant 473 N5")

y + theme(axis.text.x = element_text(angle = 90), panel.background = element_rect(fill = "white", colour = "grey50"), legend.position = "bottom", plot.title = element_text(hjust = 0.5))

library(scales)

a1<- ggarrange(a, b, c, d, e, common.legend = T)

a2<- ggarrange(f, g, h, i, j, common.legend = T)

a3<- ggarrange(k, l, m, n, o, common.legend = T)

a4<- ggarrange(p, q, r, s, t, common.legend = T)

a5<- ggarrange(u, v, w, x, y, common.legend = T)




