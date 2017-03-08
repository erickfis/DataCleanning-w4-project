# This script downloads, loads, cleans and tidies the original data set from the 
# UCI Samsung experimment. It also creates a new code book for the new data set. 
# The modifications it does are discussed in the readme.md file
# The treated data set is stored in the object "treatedData" and in the csv
# file "treatedData.csv". 
# You are required to put these 3 R scripts in the project dir
# we suggest the dir would be  ~/project/

# the following libraries are required
library("stringr")
library("tidyr")
library("dplyr")



dir.create("~/project")
setwd("~/project")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "uci-data.zip", method = "curl")
zipF<- "uci-data.zip"
unzip(zipF)

source("prepareDF.R")

testDF <- prepareDF("test")
trainDF <- prepareDF("train")


completeDF <- bind_rows(testDF, trainDF)

### transform subject in factors

completeDF <- mutate(completeDF, subject = as.factor(subject))


# From the data set in step 4, creates a second, independent tidy data set with the average of
# each variable for each activity and each subject.
# 

agrupado <- group_by(completeDF, activity, subject)

treatedData <- summarise_each(agrupado, funs(mean))


write.csv(treatedData, "treatedData.csv")
write.table(treatedData, "treatedDataTable.txt", row.names = FALSE)

# At last, this in prepare the new code book

source("prepareCodeBook.R")
prepareCodeBook(treatedData)



