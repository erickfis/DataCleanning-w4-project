#Read me

##Objective

The main goal of this project is to clean and to tidy the dataset from UCI Samsung Experiment. It also creates a new code book for the new data set.

The experiment is about recording gps and gyroscope data of  30 volunteers while they perform actions like walking, walking up or downstairs, sitting, laying and standing. 
It was recorded 10299 observations for 561 variables!

This treatment is required because the original dataset is really messy. Some of the problems it has: 

- data is split in several parts
- the main data is split in two datasets: test and train
- the two main datasets have no indications of which variables are being presented, just v1, v2… v561
- the two main datasets  don’t bring information about the subjects or the activities being observed. This  information is also split in other files


Therefore, this set of scripts will do the following:

- download original data
- do some needed cleaning and tidying
- extracts only the measurements on the mean and standard deviation for each measurement.
- uses descriptive activity names to name the activities in the data set
- appropriately labels the data set with descriptive variable names.


Then it finally creates a second, independent tidy data set with the average of each variable for each activity and each subject.



The experiment description can be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


##How to use

You have to download this project to your computer. Once there, set the dir where you downloaded the files as the working directory on R.  

This project contains the following files:

- run_analysis.R
- prepareDF.R
- prepareCodeBook.R

The key to understand and prepare the original data is to know that:

- data is split in several parts
- the main data is split in two parts: test and train. Lets call it types
- main data are store in type/X_type.txt
- the file features.txt contains the names of the variables presented in the main data
- the file activity_labels.txt contains the activities that are being observed
- the file type/y_type.txt contains the index for the activities observed in the main data
- the file type/subject_type.txt contains the index for volunteers  observed in the main data


### run_analysis.R

This is the script you will call to get the job done. 


It will do the following:

- loads the required R libraries 
- downloads the UCI dataset
- extracts it to the working directory
- prepares the datasets through prepareDF.R – details in the next section
- binds the two datasets into one, to a really wide data set.
- melt, sort and group the data, creatting a really tall data set
- But this new data set brings the average of each variable for each activity and each subject.

- stores the new, clean and tidy dataset into the object called treatedData
- stores the new, clean and tidy dataset into the file “treatedData.csv”
- stores the new, clean and tidy dataset into the file “treatedDataTable.txt”
- calls the prepareCodeBook.R scrit to write a new code book to the file “newCodeBook.txt”



### prepareDF.R

You don’t need to call this manually. The main script, run_analysis.R will do it.

This script job is to prepare the data sets to be binded. 
There are two data sets types: test and train, so this script has to be called one time for each case.

This script will do the following:

- loads the activity index corresponding to the observations made (y_type.txt  contains the activity index corresponding to the observations made)
- read the activities labels  file with readlines() to get a char vector, but these values are in uppercases, contain numbers and underscores, so lets fix this (activity_labels.txt contains the numbered labels corresponding to the activities observed. Each number  in the y_type.txt file corresponds to one activity described here.
- matches the activity index with its labels 
- loads the subject info into a data set (file subject_type.txt - this file says which of the 30 subjects is responsible for each observation)
- loads actual data ( X_type.txt)
- reads the var names file to a char vector. (file features.txt -  this file contains the proper names of the variables presented in the X_ files. Its a lot of variables!)
- renames the columns of our data with the names from features.txt
- selects the columns we want, but we need to convert the data set into tbl_df type to use this tools
- fix variables names, removing numbers, underscores, spaces and using lowercases
- identifies the activities observed in this data set by binding the activities and data sets


The output of this script is the finalData data table.


### prepareCodeBook.R

You don’t need to call this manually. The main script, run_analysis.R will do it.


This script will create an updated code book for the data set we are preparing.

- first, it will get the description of the variables through reading the first lines of the file features_info.txt
- Then, it will get a list of the variables through reading the column names of the new dataset.
- Then it will print all the info to a new file called “newCodeBook.txt”