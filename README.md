## Getting and Cleaning Data Course Project

### Loading Data

Raw data contained in a zip file `getdata-projectfiles-UCI HAR Dataset.zip`. This file is downloaded and decompressed into working folder. Therefore all data files are in the folder "UCI HAR Dataset" which is in the working folder.

Main data files are `X_test.txt` for test dataset and `X_train.txt` for trainind dataset. Files `y_test.txt` and `y_train.txt` contain activity information for each row of respective main data file. Files `subject_test.txt` and `subject_test.txt` contain subject information for each row of respective main data file. The R function `scan()` is used to read data files because its high performance.

The activity lookup table is read from the file `activity_labels.txt`. The feature list is read from the file `features.txt`. The R function `read.table()` is used for both operation since performance isn't an issue.

### Selecting Features

Feature naming convetion is clearly mentioned in the "features_info.txt" file. A regular expression is built using this information and only features which is either a mean or a standart deviation are choosen. The R function `grep()` return row indices of selected features. The row index of a feature in the feature lookup table is same as the column index of the same feature in the main data file. Hence, selected indices indicate variables or columns to be kept from main data files and are stored in the R variable `selected`.


### Merging and Combining Data

The R function `scan()` is very fast; however, read data into a vector. Since we know number of columns of target matrix, which has number of features (561) columns, using R function `matrix()` one can obtain easily the target matrix. However, `matrix()` copies the data which is very big. Using `dim()` function, the target matrix obtained without copying big data. One problem with `dim()` is that it fills 1st. column, than 2nd. and so on although our data is structured the other way: 1st row, than 2nd row, etc. We may use transpose of matrix to overcome this problem.

Subject data and activity data are stored in vectors. The R function `c()` is used to merge subject data and activity data. The function `cbind()`, remember that our columns are our rows, is used to merge feature data. Subjects and activities vectors ans feature data matrix are than combined to have a `data.frame`.

### Naming Activities and Variables

We have activity lookup table, `activityLabels`. Using this table variable `activity` is made a factor variable, hence, numbers indicating activities are matched with activity labels.

We have also feature names. They can be used as variable names. First, non alphanumeric characters are removed from feature names using `gsub()` function. Then feature names are assigned as variable names.

### Tidying

Taking features that are a mean or a standart deviation we selected 66 features. The tidy data table might have arranged into 7 columns table, since all features are normalized to [-1, 1] range, as follows:


| Subject      | Activity                       | Feature                           | Component   | Domain          | Mean | Std |
|--------------|--------------------------------|-----------------------------------|-------------|-----------------|------|-----|
|  1, 2, 3, ...| WALKING, WALKING_UPSTAIRS, ... | BodyAcc, GravityAcc, BodyGyro, ...|X, Y, Z, Mag | Time, Frequency | ...  | ... |


However, the column `Feature` is not a variable, is a column that holds variable names. Therefore, 66 selected features are kept as variables and along with the id variables `subject` and `activity` we have 68 columns tidy data table.

Features averages are taken using `aggregate()` function which returns a second tidy data table. This data frame is saved using `table.write()` function and can be read back using `table.read()` function as follows:

```
data <- table.read("getdata-output.txt", headers = TRUE)
```