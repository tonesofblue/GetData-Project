## Load test data: subjects, activities and measurements.
testSubjects <- scan("UCI HAR Dataset/test/subject_test.txt", what = integer())
testActivities <- scan("UCI HAR Dataset/test/y_test.txt", what = integer())
testData <- scan("UCI HAR Dataset/test/X_test.txt", what = double())

## Load training data: subjects, activities and measurements.
trainSubjects <- scan("UCI HAR Dataset/train/subject_train.txt", what = integer())
trainActivities <- scan("UCI HAR Dataset/train/y_train.txt", what = integer())
trainData <- scan("UCI HAR Dataset/train/X_train.txt", what = double())

## Read activity labels.
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", as.is = TRUE)

## Read features.
features <- read.table("UCI HAR Dataset/features.txt", as.is = TRUE)

## [Task 2] Select only features that are a mean or a standart deviation.
selected <- grep("[tf].+-(mean|std)\\(\\)", features[[2]])

## We used 'scan' function to load data into a vector. We need data in table form.
## Using 'dim' function data is not copied; however, data transformed to matrix column by
## column. We will take transpose of it to obtain the target matrix.
dim(testData) <- c(nrow(features), length(testSubjects))
dim(trainData) <- c(nrow(features), length(trainSubjects))

## [Task 1] Merge the training and the test sets to create one data set.
subjects <- c(testSubjects, trainSubjects)
activities <- c(testActivities, trainActivities)
data <- cbind(testData[selected,], trainData[selected,])

## Combine all into data frame.
## [Task 3] Use descriptive activity names to name the activities in the data set.
df1 <- data.frame(subject = subjects, 
                  activity = factor(activities, activityLabels[[1]], labels = activityLabels[[2]]), 
                  t(data))

## [Task 4] Set column names from features' names to have descriptive variable
## names.
colNames <- gsub("[()-]", "", features[selected, 2])
names(df1) <- c("subject", "activity", colNames)

## [Task 5] Create a second, independent tidy data set with the average of each 
## variable for each activity and each subject. 
df2 <- aggregate(df1[, colNames], df1[, c("subject", "activity")], mean)
names(df2) <- c("subject", "activity", paste("ave", colNames, sep = ""))
    
## Output.
write.table(df2, file = "getdata-output.txt", row.names = FALSE)