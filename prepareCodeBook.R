# This script will create an updated code book for the data set we are preparing
# It will the called automatically by the main scrip
# It will only work after the main script was run.

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
        

# lets add units information for each variable
        
        
        selVars[grep("^t", selVars)] <- paste(selVars[grep("^t", selVars)], " - time")
        selVars[grep("^f", selVars)] <- paste(selVars[grep("^f", selVars)], " - frequency")
      
        
        
        
# lets feed some more description between the two
        
        mDescription <- "\n \nThe selected variables in the new data set are listed below allong with their units: \n \n "
        
# Now we need to put those info on a new codebook
        
        
        
        fileConn<-file("newCodeBook.txt")
        writeLines(c(finfo, mDescription, selVars), fileConn)
        close(fileConn)
        
        
}