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
library("reshape2")


## please set your working direcory to be where this file is located


### this will download the UCI Samsung data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "uci-data.zip", method = "curl")
zipF<- "uci-data.zip"
unzip(zipF)


# this will treat the data sets, pls view the readme.md
source("prepareDF.R")

testDF <- prepareDF("test")
trainDF <- prepareDF("train")

### binding th data sets now

completeDF <- bind_rows(testDF, trainDF)

### transform subject in factors so we can group them later

completeDF <- mutate(completeDF, subject = as.factor(subject))


# # Up to now, we got an really wide data set.
# Now we will melt, sort and group it, creatting a really tall data set
# But this new data set brings the average of each variable for each activity and each subject.


meltDF <- melt(completeDF, id= c("subject", "activity"))

agrupado <- meltDF %>% arrange(subject, activity, variable) %>%
                group_by(subject, activity, variable)

treatedData <- summarise(agrupado, mean = mean(value))


### Now we will save our work to the disk

write.csv(treatedData, "treatedData.csv")
write.table(treatedData, "treatedDataTable.txt", row.names = FALSE)

# At last, this will prepare the new code book

source("prepareCodeBook.R")
prepareCodeBook(treatedData)



