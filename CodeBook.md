# Project - Geatting and Cleaning Data Course CodeBook.md
Antonio Lloris Amor  
Tuesday, August 19, 2014  

## 1. Common Transformations

There are four common transformations for the new data files of this data set.

1. To unify measures of "train" and "test" ('**./UCI HAR Dataset/test/X_test.txt**'
and '**./UCI HAR Dataset/train/X_train.txt**' files).
2. To complete the unified measurements with information about subject and
activity (id and description).
3. To give a descriptive name to the columns of the unified measurements (from
'**./UCI HAR Dataset/features.txt**' file).
4. To extract only the measurements on the mean and standard deviation from the 561
unified measurements ("train"+"test").

## 2. mean_std_dataset.csv 

### 2.1 File Format

Is in csv format. The first row is a header with the name of the variables.

All measurement fields have a normalizated value bounded within [-1,1], and all
character fields are within quotation marks.

### 2.2 File Content

This file has 67 columns, 66 are from the 561 measurements availables in unified
information ("train"+"test") and the last column is the activity description. 

The colums are:

1. **tBodyAcc-mean()-X**
2. **tBodyAcc-mean()-Y**
3. **tBodyAcc-mean()-Z**
4. **tBodyAcc-std()-X**
5. **tBodyAcc-std()-Y**
6. **tBodyAcc-std()-Z**
7. **tGravityAcc-mean()-X**
8. **tGravityAcc-mean()-Y**
9. **tGravityAcc-mean()-Z**
10. **tGravityAcc-std()-X**
11. **tGravityAcc-std()-Y**
12. **tGravityAcc-std()-Z**
13. **tBodyAccJerk-mean()-X**
14. **tBodyAccJerk-mean()-Y**
15. **tBodyAccJerk-mean()-Z**
16. **tBodyAccJerk-std()-X**
17. **tBodyAccJerk-std()-Y**
18. **tBodyAccJerk-std()-Z**
19. **tBodyGyro-mean()-X**
20. **tBodyGyro-mean()-Y**
21. **tBodyGyro-mean()-Z**
22. **tBodyGyro-std()-X**
23. **tBodyGyro-std()-Y**
24. **tBodyGyro-std()-Z**
25. **tBodyGyroJerk-mean()-X**
26. **tBodyGyroJerk-mean()-Y**
27. **tBodyGyroJerk-mean()-Z**
28. **tBodyGyroJerk-std()-X**
29. **tBodyGyroJerk-std()-Y**
30. **tBodyGyroJerk-std()-Z**
31. **tBodyAccMag-mean()**
32. **tBodyAccMag-std()**
33. **tGravityAccMag-mean()**
34. **tGravityAccMag-std()**
35. **tBodyAccJerkMag-mean()**
36. **tBodyAccJerkMag-std()**
37. **tBodyGyroMag-mean()**
38. **tBodyGyroMag-std()**
39. **tBodyGyroJerkMag-mean()**
40. **tBodyGyroJerkMag-std()**
41. **fBodyAcc-mean()-X**
42. **fBodyAcc-mean()-Y**
43. **fBodyAcc-mean()-Z**
44. **fBodyAcc-std()-X**
45. **fBodyAcc-std()-Y**
46. **fBodyAcc-std()-Z**
47. **fBodyAccJerk-mean()-X**
48. **fBodyAccJerk-mean()-Y**
49. **fBodyAccJerk-mean()-Z**
50. **fBodyAccJerk-std()-X**
51. **fBodyAccJerk-std()-Y**
52. **fBodyAccJerk-std()-Z**
53. **fBodyGyro-mean()-X**
54. **fBodyGyro-mean()-Y**
55. **fBodyGyro-mean()-Z**
56. **fBodyGyro-std()-X**
57. **fBodyGyro-std()-Y**
58. **fBodyGyro-std()-Z**
59. **fBodyAccMag-mean()**
60. **fBodyAccMag-std()**
61. **fBodyBodyAccJerkMag-mean()**
62. **fBodyBodyAccJerkMag-std()**
63. **fBodyBodyGyroMag-mean()**
64. **fBodyBodyGyroMag-std()**
65. **fBodyBodyGyroJerkMag-mean()**
66. **fBodyBodyGyroJerkMag-std()**
67. **ActivityLabel**: Description of the activity. Is a character field with
any of these values: "*WALKING*", "*WALKING_UPSTAIRS*", "*WALKING_DOWNSTAIRS*",
"*SITTING*", "*STANDING*", "*LAYING*"

The interpretation of these names (1 to 66) is as follows:

**[d][Signal]-[Variable]-[Axis]** or **[d][Signal]-[Variable]**

**[d]**: Domain of the signals:

* "**f**": frequency domain.
* "**t**": time domain. These variables are the result of the application of a
Fast Fourir Transform (FFT) to the corresponding time variable.  

**[Signal]**: Signals derived from the original experiment data:

* "**BodyAcc**": Body acceleration.
* "**GrabityAcct**": Gravity acceleration.
* "**BodyAccJerk**": Body acceleration derived in time.
* "**BodyGyro**": Body angular velocity.
* "**BodyGyroJerk**": Body angular velocity derived in time.
* "**BodyAccMag**": Magnitude of BodyAcc signal (calculated using the Euclidean
norm).
* "**GravityAccMag**": Magnitude of GravityAcc signal (calculated using the
Euclidean norm). 
* "**BodyAccJerkMag**": Magnitude of BodyAccJerk signal (calculated using the
Euclidean norm). 
* "**BodyGyroMag**":  Magnitude of BodyGyro signal (calculated using the
Euclidean norm).
* "**BodyGyroJerkMag**": Magnitude of BodyGyroJerk signal (calculated using the
Euclidean norm).

**[Variable]**: Estimated variables from [Signal].

* "**mean()**": Mean value.
* "**standard**": Standard desviation.

**[Axis]**: Direction (3-axial) of the signal.

* "**X**": X direction.
* "**Y**": Y direction.
* "**Z**": Z direction.

## 3. activity_performer_dataset.txt 

### 3.1 File Format

The columns are separated by " " and the first row is a header with the name of
the variables.

All measurement fields have a normalizated value bounded within [-1,1], and all
character fields are within quotation marks.

### 3.2 File Content

This file has 69 fields. Each row has 66 measurement for an activity
(`IdActivityLabel`) performed by a subject (`IdPerformer`).

The starting point for this dataset is described in section "1. Common
Transformations". Values for columns 1 to 66 are the result of aggregate the
measurements by activity and subject and calculate their average value. 

The name of each column (1 to 66) is formed by the original name and "APMean-"
prefix. For example, `APMean-tBodyAcc-mean()-X`: average value for
`tBodyAcc-mean()` measurement agregated by activity and subject. For
interpretating original names go to "2.2 File Content"

Columns 67 to 69:

67. **IdPerformer**: Identifier of the subject who perform activity. Integer,
its values are between 1 and 30.
68. **IdActivityLabel**: Identifier of the activity performed by a subject.
Integer, its values are between 1 and 6.
69. **ActivityLabel**: Description of the activity. Is a character field with
any of these values: "*WALKING*", "*WALKING_UPSTAIRS*", "*WALKING_DOWNSTAIRS*",
"*SITTING*", "*STANDING*", "*LAYING*"

The correspondence between "IdActivityLabel" and "Activity Label" is in 
[**'./UCI HAR Dataset/activity_labels.txt'**](file:./UCI HAR Dataset/activity_labels.txt) file.                                                  

     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
