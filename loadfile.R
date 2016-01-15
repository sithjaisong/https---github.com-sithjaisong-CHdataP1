# Here is the script for extract the data for analyse the crop health data in phase 1

# set working directory
#options(stringsAsFactors = FALSE)
#setwd("~/Google Drive/survey1")

# I will create the script for make the lists of the files of the survey excel file 


#  set the 

setwd("~/Google Drive/survey1") # this is for Mac
#setwd("E:/Google Drive/survey1") # this is for Window

# list the folders
dirlist <- list.dirs() 
#[2] IDN#85
#[3] IND#85
#[4] PHL#40
#[5] THA#105
#[6] VNM#70

# load file from Indonesia
list.ind <- list.files(dirlist[3], pattern = ".xlsx")

# I will use only one file frist

#data <- list.idn[1]

# load package
library(readxl)

dataf1.ind <- matrix(nrow =0, ncol = 18)

for(i in 1: length(list.idn)){
  
  dataf1 <- read_excel(paste(dirlist[3], "/", list.idn[i], sep = ""), sheet = 1, col_names = FALSE)
  
  dataf1 <- as.matrix(dataf1) # change to matrix class

  new.row <- form1(dataf1)
  new.row$filenames <- as.character(list.idn[i])

  dataf1.idn <- rbind(dataf1.idn, new.row)
}

dataf1.idn <- as.data.frame(dataf1.idn)

names(dataf1.idn) <- c('field.no', 
                   'field.area',
                   'farmer.name',
                   'land.form',
                   'prev.crop',
                   'fallow.prd',
                  'soil.prob',
                   'crop.est.method',
                   'seed.age',
                  'rice.var',
                  'var.type',
                  'Ntotal',
                  'Ptotal',
                  'Ktotal',
                   'yld.area1',
                   'yld.area2',
                   'yld.area3', 
                  'filename')

row.names(dataf1.idn) <- NULL

dataf1.idn <- data.frame(lapply(dataf1.idn, as.character), stringsAsFactors=FALSE)

write.csv(dataf1.idn, file = "dataf1.idn.csv")


for(i in 1: length(list.idn)){
  
  dataf2 <- read_excel(paste(dirlist[2], "/", data, sep = ""), sheet = 2, col_names = FALSE)

  
  }


dataf2 <- read_excel(paste(dirlist[2], "/", data, sep = ""), sheet = 2, col_names = FALSE)


dataf2 <- as.matrix(dataf2)
