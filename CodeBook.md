## Codebook

### Original Naming of Features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Features are normalized and bounded within [-1,1].

### Naming of Features for Course Project

mean: Mean value estimate.
std: Standard deviation estimate.
X|Y|Z : Directions.
ave: Average value for each activity and each subject.

#### Variables

There are 68 variables in total.

- **Id Variables**: 2 variables
    - subject
    - activity
- **Time Domain**: 40 variables
    - [ave]tBodyAcc[mean|std][X|Y|Z]
    - [ave]tGravityAcc[mean|std][X|Y|Z]
    - [ave]tBodyAccJerk[mean|std][X|Y|Z]
    - [ave]tBodyGyro[mean|std][X|Y|Z]
    - [ave]tBodyGyroJerk[mean|std][X|Y|Z]
    - [ave]tBodyAccMag[mean|std]
    - [ave]tGravityAccMag[mean|std]
    - [ave]tBodyAccJerkMag[mean|std]
    - [ave]tBodyGyroMag[mean|std]
    - [ave]tBodyGyroJerkMag[mean|std]
- **Frequency Domain Variables**: 26 variables
    - [ave]fBodyAcc[mean|std][X|Y|Z]
    - [ave]fBodyAccJerk[mean|std][X|Y|Z]
    - [ave]fBodyGyro[mean|std][X|Y|Z]
    - [ave]fBodyAccMag[mean|std]
    - [ave]fBodyBodyAccJerkMag[mean|std]
    - [ave]fBodyBodyGyroMag[mean|std]
    - [ave]fBodyBodyGyroJerkMag[mean|std]