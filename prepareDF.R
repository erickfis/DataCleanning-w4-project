# This script job is to prepare the data sets to be binded. 
# There are two data sets, test and train, so this script has to be called 
# one time for each case


prepareDF <- function(type = "test") {

        prefix <- "UCI HAR Dataset/"
        
# y_type.txt         
# this loads the activity index corresponding to the observations made
# activities index can be found in the y_ files.
        
        typeFile <- paste0(prefix, type,"/y_",type,".txt")       
        atividadesI <- read.table(typeFile)

# activity_labels.txt
# this file contains the numbered labels corresponding to the activities observed. 
# Each number in the y_type.txt file corresponds to one activity described here.
# This will read the file with readlines() to get a char vector

        typeFile <- paste0(prefix, "activity_labels.txt")       
        nomeAtividades <- readLines(typeFile)

# but these values are in uppercases, contain numbers and underscores, lets fix this        

        nomeAtividades <- gsub("[0-9]","", nomeAtividades)
        nomeAtividades <- tolower(nomeAtividades)
        nomeAtividades <- gsub("_", "", nomeAtividades)
        nomeAtividades <- str_trim(nomeAtividades)
        
        
# now lets match the activity index with its labels 

        atividadesI$activity <- nomeAtividades[atividadesI[,]]
        names(atividadesI) <- c("aI", "activity")

# subject_type.txt
# this file says which of the 30 subjects is responsible for each observation.
# this code will load the file into a data set        

        typeFile <- paste0(prefix, type,"/subject_",type,".txt")       
        subjectData <- read.table(typeFile)

        
        
# X_type.txt
# Loads actual data

        typeFile <- paste0(prefix, type,"/X_",type,".txt")       
        typeData <- read.table(typeFile)

# features.txt 
# this file contains the proper names of the variables presented in
# the X_ files. Its a lot of variables! This scripts reads the file to a char
# vector. We will not do any text modification yet to prevent some problems. We
# will do this after selecting the vars we want

        typeFile <- paste0(prefix, "features.txt")       
        nomesVar <- readLines(typeFile)

# this renames the columns of our data with the names from features.txt
  
        names(typeData) <- nomesVar

        
# this selects the columns we want, but we need to convert the data set into
# tbl_df type to use this tools

        selVars <- nomesVar[grepl("mean|std", nomesVar)]
        typeData <- tbl_df(typeData)
        DataSel <- select(typeData, one_of(selVars))
        
        

# Now we can fix these variables names, removing numbers, underscores, spaces
# and using lowercases

        nomesVar <- names(DataSel)
        nomesVar <- gsub("[0-9]","", nomesVar)
        nomesVar <- tolower(nomesVar)
        nomesVar <- gsub("_", "", nomesVar)
        nomesVar <- str_trim(nomesVar)
        names(DataSel) <- nomesVar
       
# Next step: identity the activities observed in this data set. This
# can be done now by binding the atividadesI and DataSel data sets
# through cbind.data.frame. Finally, after binding, we will rename the
# activities column. The output of this script is the finalData table

      
        finalData <- bind_cols(subjectData,atividadesI,DataSel)
        # finalData <- cbind.data.frame(subjectData,atividadesI$activity,DataSel)
        # finalData <- tbl_df(finalData)
        finalData <- finalData %>% 
                select(-2) %>%
                        rename(subject = V1) 
        finalData
}
