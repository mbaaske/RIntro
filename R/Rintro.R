###############################################################################
#
# Author: baaske
# Date: 04/30/2018
#
# Import: https://github.com/mbaaske/RIntro.git
#
###############################################################################

# clear current workspace (global environment)
rm(list=ls())

# get info current R session
PATH <- getwd()        # get working directory
INFO <- Sys.info()     # get system info  
objects()              # show all loaded variables
ls()                   # objects in your workspace

# show everything
PATH
INFO[c("sysname","nodename","user")]

# Getting help:
help()              # general help
?length             # help for `length`
help.search(lapply) # help for function `lapply`
help.start()        # start html help system

# Vectors:
2+2
round(pi,3)
sqrt(10)
1000*(1+0.075)^5-1000
sin(c(30,60,90)*pi/180)

# vectors and subsetting
a <- 2*3
a
a^2
b <- a^2
a <- c(17,1,3,9)
a
a[2]
a[c(1,3)]
a[-2]
a[2] <- 1
a

# Characters and categories
(x <- "Hallo")                     # character vector
(y <- factor(c("C","A","C","B")))  # characters as categories
(z <- factor(c(1,1,2)))            # numbers as factors
(x <- c(1,2,3))                    # distroy x and overwrite
x[4]                               # NA = Not Available
try(x[4])                          # catch error

# objects and classes
class(1.7) # "numeric"
class(x)   # "character" = character vector
class(y)   # "factor" categories
class(z)
mode(1.7)
x <- as.integer(x)
class(x)
z <- as.character(z)
class(z)

# Save contents of workspace, into the file .RData
save.image()
# Save into the file archive.RData
save.image(file="archive.RData")
# save single objects
save(x, y,z, file="tmpobj.RData")
# save as RDS (could be big data)
saveRDS(list(x,y,z),file="myfile.rds")
# read as RDS
XYZ <- readRDS(file="myfile.rds")

# attach (reload) to current workspace after some restart of R session
attach("tmpobj.RData")
ls()

# vectors and repeating components
10:5
-1:2
# a sequence
seq(5,10)
seq(5,10,by=0.1)
# repeat
rep(1:3,times=3)
rep(1:3,each=3)

# replicate
x <- 1:5
y <- 3:1
# multiply elements
x*y
(M <- matrix(sample(1:10),nr=5))
as.numeric(M%*%c(2,2))

# data frames
?data.frame    # help on data frames
example(data.frame)   # some examples

# Construct a data frame of study courses
g <- data.frame(StG=c("GTB","MPV","BGM"),Anz=c(75,11,62))
g
class(g)   # "data.frame" = Datenmatrix
names(g)   # categories in g
g[,2]	   # 2nd column
g[3,]	   # 3rd row
g[3,2]	   # single e

g[c(2,3),] # select 2nd and 3rd row
g$Anz      # select category `Anz`
g$Anz[1]   # select first element of `Anz`

# Extending the  data frame
(g <- rbind(g,c("GTB",26)))
# add category
(g <- cbind(g,Sem=c(3,1,3,5)))
# add factor level
(g <- rbind(g,data.frame(StG=factor("BGOK"),Anz=57,Sem=3)))

# some basic statistics
runif(n=10) # uniform on [0,1]
rnorm(n=20,mean=5,sd=2)  # normal distribution
rnorm(n=20)   # standard normal (mean=0, sd=1)       
rpois(n=20,lambda=5) # Poisson with parameter lambda
rexp(n=20,rate=5) # exponential distribution

#characteristics
x <- runif(100)
min(x)    # Minimum
max(x)    # Maximum
mean(x)   # Mean
median(x) # Median
var(x)    # variance
sd(x)	  # standard deviation/error
summary(x) # overview

# loops and functions
for(i in 7:9) {print(i)}
x <- 0
while(x < 3){print(x); x <- x+1}
fun <- function(x) x^2
fun(2.3)

# Logical switches
x <- sample(1:10,size=1)
if(x < 5) {print("Yeah!")} else {print("Oh, noo!")}
print(x)

###################################################################################