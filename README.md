# Project - Geatting and Cleaning Data Course README.md
Antonio Lloris Amor  
Tuesday, August 19, 2014  

## 1. Objetive of this Data Set

The purpose of this data set is to demonstrate the ability to collect, work
with, and clean a data set adquired during the realization of the course
"Getting and Cleaning Data". The goal is to prepare tidy data that can be used
for later analysis.

This data set is derived from ["Human Activity Recognition Using Smartphones 
Dataset Version 1.0"](file:./UCI HAR Dataset/README.txt)**[1]**.

## 2. Files Included in the Data Set

'**README.md**': This file.   
'**[CodeBook.md](file:./CodeBook.md)'**: It describe the content of generated
files.  
'**[run_analysis.R](file:./run_analysis.R)**': Contains the script that generate
the two files with tidy data.  
'**[load_data.R](file:./load_data.R)**': This function load data from "test" or
"train" and complement it with information about the activity and the subject.  
'**[./dataset/mean_std_dataset.csv](file:./dataset/mean_std_dataset.csv)**': The
first file generated in this data set. For information about its content go to
['CodeBook.md'](file:./CodeBook.md).  
'**[./dataset/activity_performer_dataset.txt](file:./dataset/activity_performer_dataset.txt)**'
: The second file generated in this data set. For information about its content
go to ['CodeBook.md'](file:./CodeBook.md).   
'**[./UCI HAR Dataset/](file:./UCI HAR Dataset/.)**': The original data set.**[1]**

## 3. Source Files

For generate this data set we used the following files:

* ['**./UCI HAR Dataset/features.txt**'](file:./UCI HAR Dataset/features.txt)
These are all available measurements (names) from original data set.
* ['**./UCI HAR Dataset/activity_labels.txt**'](file:./UCI HAR Dataset/activity_labels.txt)
Link the class labels with their activity name. In files ('y_train.txt' and
'y_test.txt') there are only the identifier of the activity, not the description.
* [**'./UCI HAR Dataset/train/X_train.txt**'](file:./UCI HAR Dataset/train/X_train.txt)
This is one of the main files. We will extract from this file the measurements
that we need for create the new data set. Each row in this file is a vector with
561 measurements.
* ['**./UCI HAR Dataset/train/y_train.txt**'](file:./UCI HAR Dataset/train/y_train.txt)
In this file we can find the activity id.
* ['**./UCI HAR Dataset/train/subject_train.txt**'](file:./UCI HAR Dataset/train/subject_train.txt)
Each row identifies the subject who performed the activity that generate the
measurements of the 'X_train.txt' file.
* ['**./UCI HAR Dataset/test/X_test.txt**'](file:./UCI HAR Dataset/test/X_test.txt)
This is one of the main files. We will extract from this file the measurements
that we need for create the new data set. Each row in this file is a vector with
561 measurements.
* ['**./UCI HAR Dataset/test/y_test.txt**'](file:./UCI HAR Dataset/test/y_test.txt)
In this file we can find the activity id.
* ['**./UCI HAR Dataset/test/subject_test.txt**'](file:./UCI HAR Dataset/test/subject_test.txt)
Each row identifies the subject who performed the activity that generate the
measurements of the 'X_test.txt' file.

Row 1234 (for example) in 'X_train.txt' is related with row 1234 in 'y_train.txt'
and with row 1234 in 'subject_train.txt'. Row 1234 in 'y_train.txt' is related with
one row (and only one) in 'activity_labels.txt'.


## 4. Data Provided by this Data Set

The data set is composed by two files :

* '**./dataset/mean_std_dataset.csv**'. A subset of 66 from the 561 measurements
available in X_train.txt and X_test.txt in addition it has a description of the activity
that generate the measurements.
* '**./dataset/activity_performer_dataset.txt**'. It is a grouping by activity and performer
of the data file 'mean_std_dataset.csv'. The file has 69 fields, 67 of these
fields are from 'mean_std_dataset.csv' and the others two fields are: id of subject
and id of activity.  

## 5 How are Generated the New Data?

Generate new data is a nine-step process:

1. Load data from "train" or "test". Only the measurements on the mean and
standard desviation for each measurement.
2. Add to these data: subject, activity and ativity description.
3. Merge complete "train" data with complete "test" data and generate a unified
data frame (`merge_data`).
4. Select from `merge_data` fields needed for generate the first data
file ('mean_std_dataset.csv').
5. Generate it.
6. Aggregate `merge_data` by activity and subject and calculate the average
value of all measurements for obtain `activity_performer_data`.
7. Rename columns of `activity_performer_data` with "APMean-" prefix.
8. Select from `activity_performer_data` fields needed to generate the second
data file ('activity_performer_dataset.txt').
9. Generate it.

Step 1 and 2 are made by load_data.R script. Steps 3 to 9 are made by
run_analysis.R script.


**[1]**: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
Multiclass Hardware-Friendly Support Vector Machine. International Workshop of
Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012






