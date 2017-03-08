#Updated Code Book
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

 
#Variables used 
 
 
The selected variables in the new data set are listed below allong with their units: 
 
 
tbodyacc-mean()-x  - time 

tbodyacc-mean()-y  - time 

tbodyacc-mean()-z  - time 

tbodyacc-std()-x  - time 

tbodyacc-std()-y  - time 

tbodyacc-std()-z  - time 

tgravityacc-mean()-x  - time 

tgravityacc-mean()-y  - time 

tgravityacc-mean()-z  - time 

tgravityacc-std()-x  - time 

tgravityacc-std()-y  - time 

tgravityacc-std()-z  - time 

tbodyaccjerk-mean()-x  - time 

tbodyaccjerk-mean()-y  - time 

tbodyaccjerk-mean()-z  - time 

tbodyaccjerk-std()-x  - time 

tbodyaccjerk-std()-y  - time 

tbodyaccjerk-std()-z  - time 

tbodygyro-mean()-x  - time 

tbodygyro-mean()-y  - time 

tbodygyro-mean()-z  - time 

tbodygyro-std()-x  - time 

tbodygyro-std()-y  - time 

tbodygyro-std()-z  - time 

tbodygyrojerk-mean()-x  - time 

tbodygyrojerk-mean()-y  - time 

tbodygyrojerk-mean()-z  - time 

tbodygyrojerk-std()-x  - time 

tbodygyrojerk-std()-y  - time 

tbodygyrojerk-std()-z  - time 

tbodyaccmag-mean()  - time 

tbodyaccmag-std()  - time 

tgravityaccmag-mean()  - time 

tgravityaccmag-std()  - time 

tbodyaccjerkmag-mean()  - time 

tbodyaccjerkmag-std()  - time 

tbodygyromag-mean()  - time 

tbodygyromag-std()  - time 

tbodygyrojerkmag-mean()  - time 

tbodygyrojerkmag-std()  - time 

fbodyacc-mean()-x  - frequency 

fbodyacc-mean()-y  - frequency 

fbodyacc-mean()-z  - frequency 

fbodyacc-std()-x  - frequency 

fbodyacc-std()-y  - frequency 

fbodyacc-std()-z  - frequency 

fbodyacc-meanfreq()-x  - frequency 

fbodyacc-meanfreq()-y  - frequency 

fbodyacc-meanfreq()-z  - frequency 

fbodyaccjerk-mean()-x  - frequency 

fbodyaccjerk-mean()-y  - frequency 

fbodyaccjerk-mean()-z  - frequency 

fbodyaccjerk-std()-x  - frequency 

fbodyaccjerk-std()-y  - frequency 

fbodyaccjerk-std()-z  - frequency 

fbodyaccjerk-meanfreq()-x  - frequency 

fbodyaccjerk-meanfreq()-y  - frequency 

fbodyaccjerk-meanfreq()-z  - frequency 

fbodygyro-mean()-x  - frequency 

fbodygyro-mean()-y  - frequency 

fbodygyro-mean()-z  - frequency 

fbodygyro-std()-x  - frequency 

fbodygyro-std()-y  - frequency 

fbodygyro-std()-z  - frequency 

fbodygyro-meanfreq()-x  - frequency 

fbodygyro-meanfreq()-y  - frequency 

fbodygyro-meanfreq()-z  - frequency 

fbodyaccmag-mean()  - frequency 

fbodyaccmag-std()  - frequency 

fbodyaccmag-meanfreq()  - frequency 

fbodybodyaccjerkmag-mean()  - frequency 

fbodybodyaccjerkmag-std()  - frequency 

fbodybodyaccjerkmag-meanfreq()  - frequency 

fbodybodygyromag-mean()  - frequency 

fbodybodygyromag-std()  - frequency 

fbodybodygyromag-meanfreq()  - frequency 

fbodybodygyrojerkmag-mean()  - frequency 

fbodybodygyrojerkmag-std()  - frequency 

fbodybodygyrojerkmag-meanfreq()  - frequency 

