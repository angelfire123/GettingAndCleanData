---
title: "CodeBook - Getting and Cleaning Data - Course Project"
author: "Cristian Popescu"
date: "Thursday, August 21, 2014"
output: html_document
---


```r
library(knitr)
library(markdown)
```

The purpose of this document is to highlight the required steps that *run_analysis.R* script does in order to collect, work with, and clean the data set defined and captured in *getdata-projectfiles-UCI HAR Dataset.zip*.

It was considered that both *Y_train.txt* and *Y_test.txt* (from  *getdata-projectfiles-UCI HAR Dataset.zip*) contain the activities ids that were required to be cross referenced with *activity_labels.txt* in order to determine the proper descriptions for each set of data.

Both *X_train* and *X_test* files contain the main data focus from which the mean and standard deviation will have to be extracted. The following columns (number in the *X_train* or *X_test* and descriptions) were highlighted as having the measurements on the mean and standard deviation for each measurement (accordingly to *features.txt* from  *getdata-projectfiles-UCI HAR Dataset.zip*):

* 1 tBodyAcc-mean()-X
* 2 tBodyAcc-mean()-Y
* 3 tBodyAcc-mean()-Z
* 4 tBodyAcc-std()-X
* 5 tBodyAcc-std()-Y
* 6 tBodyAcc-std()-Z
* 41 tGravityAcc-mean()-X
* 42 tGravityAcc-mean()-Y
* 43 tGravityAcc-mean()-Z
* 44 tGravityAcc-std()-X
* 45 tGravityAcc-std()-Y
* 46 tGravityAcc-std()-Z
* 81 tBodyAccJerk-mean()-X
* 82 tBodyAccJerk-mean()-Y
* 83 tBodyAccJerk-mean()-Z
* 84 tBodyAccJerk-std()-X
* 85 tBodyAccJerk-std()-Y
* 86 tBodyAccJerk-std()-Z
* 121 tBodyGyro-mean()-X
* 122 tBodyGyro-mean()-Y
* 123 tBodyGyro-mean()-Z
* 124 tBodyGyro-std()-X
* 125 tBodyGyro-std()-Y
* 126 tBodyGyro-std()-Z
* 161 tBodyGyroJerk-mean()-X
* 162 tBodyGyroJerk-mean()-Y
* 163 tBodyGyroJerk-mean()-Z
* 164 tBodyGyroJerk-std()-X
* 165 tBodyGyroJerk-std()-Y
* 166 tBodyGyroJerk-std()-Z
* 201 tBodyAccMag-mean()
* 202 tBodyAccMag-std()
* 214 tGravityAccMag-mean()
* 215 tGravityAccMag-std()
* 227 tBodyAccJerkMag-mean()
* 228 tBodyAccJerkMag-std()
* 240 tBodyGyroMag-mean()
* 241 tBodyGyroMag-std()
* 253 tBodyGyroJerkMag-mean()
* 254 tBodyGyroJerkMag-std()
* 266 fBodyAcc-mean()-X
* 267 fBodyAcc-mean()-Y
* 268 fBodyAcc-mean()-Z
* 269 fBodyAcc-std()-X
* 270 fBodyAcc-std()-Y
* 271 fBodyAcc-std()-Z
* 294 fBodyAcc-meanFreq()-X
* 295 fBodyAcc-meanFreq()-Y
* 296 fBodyAcc-meanFreq()-Z
* 345 fBodyAccJerk-mean()-X
* 346 fBodyAccJerk-mean()-Y
* 347 fBodyAccJerk-mean()-Z
* 348 fBodyAccJerk-std()-X
* 349 fBodyAccJerk-std()-Y
* 350 fBodyAccJerk-std()-Z
* 373 fBodyAccJerk-meanFreq()-X
* 374 fBodyAccJerk-meanFreq()-Y
* 375 fBodyAccJerk-meanFreq()-Z
* 424 fBodyGyro-mean()-X
* 425 fBodyGyro-mean()-Y
* 426 fBodyGyro-mean()-Z
* 427 fBodyGyro-std()-X
* 428 fBodyGyro-std()-Y
* 429 fBodyGyro-std()-Z
* 452 fBodyGyro-meanFreq()-X
* 453 fBodyGyro-meanFreq()-Y
* 454 fBodyGyro-meanFreq()-Z
* 503 fBodyAccMag-mean()
* 504 fBodyAccMag-std()
* 513 fBodyAccMag-meanFreq()
* 516 fBodyBodyAccJerkMag-mean()
* 517 fBodyBodyAccJerkMag-std()
* 526 fBodyBodyAccJerkMag-meanFreq()
* 529 fBodyBodyGyroMag-mean()
* 530 fBodyBodyGyroMag-std()
* 539 fBodyBodyGyroMag-meanFreq()
* 542 fBodyBodyGyroJerkMag-mean()
* 543 fBodyBodyGyroJerkMag-std()
* 552 fBodyBodyGyroJerkMag-meanFreq()

The *run_analysis.R* will define first the previous indexes as variables/constants in order to be easy to work with. After all the data is properly loaded into *myCompleteMatrixXY* object (as required by the 1st bullet of the assignment: *Merges the training and the test sets to create one data set*), the new defined indexes (properly prorated accordingly to the new locations) will help to extract only the measurements on the mean and standard deviation for each measurement (for both *train* and *test* subjects). Having said that, the 2nd requirement of the assignment is complete. The new measurements will be stored in a new dataset *myDataFrame*.

In the new dataset *myDataFrame*, we will appropriately labels the data set with descriptive variable names and also use descriptive activity names to name the activities in the data set (requirements 3 and 4 from the course project).

Last bullet of the course project is to creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

In order to do that, we will have to  reshape the *myDataFrame* previously created and keep the *subjects* and *activities* columns as keys whereas the rest of the columns will be variables/values pairs (*tBodyAccMeanX*,*tBodyAccMeanY*,*tBodyAccMeanZ*,*tBodyAccStdX*,*tBodyAccStdY*,*tBodyAccStdZ*,*tGravityAccMeanX*,*tGravityAccMeanY*,*tGravityAccMeanZ*,*tGravityAccStdX*,*tGravityAccStdY*,*tGravityAccStdZ*,*tBodyAccJerkMeanX*,*tBodyAccJerkMeanY*,*tBodyAccJerkMeanZ*,*tBodyAccJerkStdX*,*tBodyAccJerkStdY*,*tBodyAccJerkStdZ*,*tBodyGyroMeanX*,*tBodyGyroMeanY*,*tBodyGyroMeanZ*,*tBodyGyroStdX*,*tBodyGyroStdY*,*tBodyGyroStdZ*,*tBodyGyroJerkMeanX*,*tBodyGyroJerkMeanY*,*tBodyGyroJerkMeanZ*,*tBodyGyroJerkStdX*,*tBodyGyroJerkStdY*,*tBodyGyroJerkStdZ*,*tBodyAccMagMean*,*tBodyAccMagStd*,*tGravityAccMagMean*,*tGravityAccMagStd*,*tBodyAccJerkMagMean*,*tBodyAccJerkMagStd*,*tBodyGyroMagMean*,*tBodyGyroMagStd*,*tBodyGyroJerkMagMean*,*tBodyGyroJerkMagStd*,*fBodyAccMeanX*,*fBodyAccMeanY*,*fBodyAccMeanZ*,*fBodyAccStdX*,*fBodyAccStdY*,*fBodyAccStdZ*,*fBodyAccMeanFreqX*,*fBodyAccMeanFreqY*,*fBodyAccMeanFreqZ*,*fBodyAccJerkMeanX*,*fBodyAccJerkMeanY*,*fBodyAccJerkMeanZ*,*fBodyAccJerkStdX*,*fBodyAccJerkStdY*,*fBodyAccJerkStdZ*,*fBodyAccJerkMeanFreqX*,*fBodyAccJerkMeanFreqY*,*fBodyAccJerkMeanFreqZ*,*fBodyGyroMeanX*,*fBodyGyroMeanY*,*fBodyGyroMeanZ*,*fBodyGyroStdX*,*fBodyGyroStdY*,*fBodyGyroStdZ*,*fBodyGyroMeanFreqX*,*fBodyGyroMeanFreqY*,*fBodyGyroMeanFreqZ*,*fBodyAccMagMean*,*fBodyAccMagStd*,*fBodyAccMagMeanFreq*,*fBodyBodyAccJerkMagMean*,*fBodyBodyAccJerkMagStd*,*fBodyBodyAccJerkMagMeanFreq*,*fBodyBodyGyroMagMean*,*fBodyBodyGyroMagStd*,*fBodyBodyGyroMagMeanFreq*,*fBodyBodyGyroJerkMagStd*, *fBodyBodyGyroJerkMagMean*). 

The new dataset will be named *myMeltData*. To create an average of each variable for each activity and each subject, we will use the function aggregate with the group of *subject*, *activity* and *variable* and wil call the function *mean*. The result will be stored in *myTityData*. We will save *myTidyData* in the myTityTable.txt with the row names ignored. The location of the new *myTityTable.txt* will be in the project workspace *C:/R_workspace2/Getting_and_Cleaning_Data/*.




```r
knit("CodeBook.Rmd")    
```

```
## 
## 
## processing file: CodeBook.Rmd
```

```
##   |                                                                         |                                                                 |   0%  |                                                                         |................                                                 |  25%
##   ordinary text without R code
## 
##   |                                                                         |................................                                 |  50%
## label: unnamed-chunk-3
##   |                                                                         |.................................................                |  75%
##   ordinary text without R code
## 
##   |                                                                         |.................................................................| 100%
## label: unnamed-chunk-4
```

```
## output file: CodeBook.md
```

```
## [1] "CodeBook.md"
```

```r
markdownToHTML("CodeBook.md", output="CodeBook.html")
```
