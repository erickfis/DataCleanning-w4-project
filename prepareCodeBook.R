# This script will create an updated code book for the data set we are preparing
# 
# First, it will get the description of the variables through reading the file 
# features_info.txt
# Then, it will get a list of the variables through reading the file features.txt
# Then it will select the mean and std variables, as required by the project.

prepareCodeBook <- function(treatedData) {
       
        prefix <- "UCI HAR Dataset/"
        
        
# features_info.txt 
# the first lines of this file contains the description we want in the new code book
        
        typeFile <- paste0(prefix, "features_info.txt")       
        finfo <- readLines(typeFile, 11)
        
        
# Now we get the variables names in the new dataset

        selVars <- colnames(treatedData)
        
# lets feed some more description between the two
        
        mDescription <- "\n \n The selected variables are listed below: \n \n "
        
# Now we need to put those info on a new codebook
        
        
        
        fileConn<-file("newCodeBook.txt")
        writeLines(c(finfo, mDescription, selVars), fileConn)
        close(fileConn)
        
        
}