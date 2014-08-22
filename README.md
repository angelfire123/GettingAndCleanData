---
title: "README - Getting and Cleaning Data - Course Project"
author: "Cristian Popescu"
date: "Thursday, August 21, 2014"
output: html_document
---


```r
library(knitr)
library(markdown)
```

The original archive *getdata-projectfiles-UCI HAR Dataset.zip* was unarchived into the R worspace *C:/R_workspace2/Getting_and_Cleaning_Data/* to be available to the *run_analysis.R* script.

The following list of files will be required to run the application.


### For the testing set of data (from *getdata-projectfiles-UCI HAR Dataset.zip* file)

* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/test/y_test.txt
* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt
* UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt
* UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt
* UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt
* UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt
* UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt
* UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt
* UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt
* UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt

### For the train set of data (from *getdata-projectfiles-UCI HAR Dataset.zip* file)

* UCI HAR Dataset/train/subject_train.txt
* UCI HAR Dataset/train/y_train.txt
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt
* UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt
* UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt
* UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt
* UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt
* UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt
* UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt
* UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt
* UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt

### run_analysis.R

R scripting file that is computing the data previously captured and creates a new tiny data set with required information as per the assignment

### myTityTable.txt

The dump of the tiny data set computed by run_analysis.R

### CodeBook.Rmd and CodeBook.md

Tehnical document with the steps and decissions taken in order to collect, work with, and clean a data set as per the assignment's requirements.

### README.Rmd, README.md

Current file with the list of files.


```r
knit("README.Rmd")    
```

```
## 
## 
## processing file: README.Rmd
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
## output file: README.md
```

```
## [1] "README.md"
```

```r
markdownToHTML("README.md", output="README.html")
```
