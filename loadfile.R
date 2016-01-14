# Here is the script for extract the data for analyse the crop health data in phase 1

# set working directory
#options(stringsAsFactors = FALSE)
#setwd("~/Google Drive/survey1")

# I will create the script for make the lists of the files of the survey excel file 


#  set the 

#setwd("~/Google Drive/survey1") # this is for Mac
setwd("E:/Google Drive/survey1") # this is for Window

# list the folders
dirlist <- list.dirs() 
#[2] IDN#85
#[3] IND#85
#[4] PHL#40
#[5] THA#105
#[6] VNM#70

# load file from Indonesia
list.idn <- list.files(dirlist[2], pattern = ".xls")

# I will use only one file frist

data <- list.idn[1]

# load package
library(readxl)
dataf1 <- read_excel(paste(dirlist[2], "/", data, sep = ""), sheet = 1, col_names = FALSE)

dataf1 <- as.matrix(dataf1) # change to matrix class

dataf2 <- read_excel(paste(dirlist[2], "/", data, sep = ""), sheet = 2, col_names = FALSE)

dataf2 <- as.matrix(dataf2)
