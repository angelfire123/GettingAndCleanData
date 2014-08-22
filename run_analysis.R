# Getting and Cleaning Data - Course Project - run_analysis.R
# by Cristian Popescu (August 21st, 2014)
#
#


library("reshape2")

#mean and standard deviations are columns
#1 tBodyAcc-mean()-X
#2 tBodyAcc-mean()-Y
#3 tBodyAcc-mean()-Z
#4 tBodyAcc-std()-X
#5 tBodyAcc-std()-Y
#6 tBodyAcc-std()-Z
#41 tGravityAcc-mean()-X
#42 tGravityAcc-mean()-Y
#43 tGravityAcc-mean()-Z
#44 tGravityAcc-std()-X
#45 tGravityAcc-std()-Y
#46 tGravityAcc-std()-Z
#81 tBodyAccJerk-mean()-X
#82 tBodyAccJerk-mean()-Y
#83 tBodyAccJerk-mean()-Z
#84 tBodyAccJerk-std()-X
#85 tBodyAccJerk-std()-Y
#86 tBodyAccJerk-std()-Z
#121 tBodyGyro-mean()-X
#122 tBodyGyro-mean()-Y
#123 tBodyGyro-mean()-Z
#124 tBodyGyro-std()-X
#125 tBodyGyro-std()-Y
#126 tBodyGyro-std()-Z
#161 tBodyGyroJerk-mean()-X
#162 tBodyGyroJerk-mean()-Y
#163 tBodyGyroJerk-mean()-Z
#164 tBodyGyroJerk-std()-X
#165 tBodyGyroJerk-std()-Y
#166 tBodyGyroJerk-std()-Z
#201 tBodyAccMag-mean()
#202 tBodyAccMag-std()
#214 tGravityAccMag-mean()
#215 tGravityAccMag-std()
#227 tBodyAccJerkMag-mean()
#228 tBodyAccJerkMag-std()
#240 tBodyGyroMag-mean()
#241 tBodyGyroMag-std()
#253 tBodyGyroJerkMag-mean()
#254 tBodyGyroJerkMag-std()
#266 fBodyAcc-mean()-X
#267 fBodyAcc-mean()-Y
#268 fBodyAcc-mean()-Z
#269 fBodyAcc-std()-X
#270 fBodyAcc-std()-Y
#271 fBodyAcc-std()-Z
#294 fBodyAcc-meanFreq()-X
#295 fBodyAcc-meanFreq()-Y
#296 fBodyAcc-meanFreq()-Z
#345 fBodyAccJerk-mean()-X
#346 fBodyAccJerk-mean()-Y
#347 fBodyAccJerk-mean()-Z
#348 fBodyAccJerk-std()-X
#349 fBodyAccJerk-std()-Y
#350 fBodyAccJerk-std()-Z
#373 fBodyAccJerk-meanFreq()-X
#374 fBodyAccJerk-meanFreq()-Y
#375 fBodyAccJerk-meanFreq()-Z
#424 fBodyGyro-mean()-X
#425 fBodyGyro-mean()-Y
#426 fBodyGyro-mean()-Z
#427 fBodyGyro-std()-X
#428 fBodyGyro-std()-Y
#429 fBodyGyro-std()-Z
#452 fBodyGyro-meanFreq()-X
#453 fBodyGyro-meanFreq()-Y
#454 fBodyGyro-meanFreq()-Z
#503 fBodyAccMag-mean()
#504 fBodyAccMag-std()
#513 fBodyAccMag-meanFreq()
#516 fBodyBodyAccJerkMag-mean()
#517 fBodyBodyAccJerkMag-std()
#526 fBodyBodyAccJerkMag-meanFreq()
#529 fBodyBodyGyroMag-mean()
#530 fBodyBodyGyroMag-std()
#539 fBodyBodyGyroMag-meanFreq()
#542 fBodyBodyGyroJerkMag-mean()
#543 fBodyBodyGyroJerkMag-std()
#552 fBodyBodyGyroJerkMag-meanFreq()

#define the columns indexes
newIndex <- 3 # 1 is subject; 2 is volunteer id; 3 is activity and 4 starts the X_{train,test} files
tBodyAccMeanX <- newIndex + 1
tBodyAccMeanY <- newIndex +2 
tBodyAccMeanZ <- newIndex + 3
tBodyAccStdX <- newIndex + 4
tBodyAccStdY <- newIndex + 5
tBodyAccStdZ <- newIndex + 6
tGravityAccMeanX <- newIndex + 41
tGravityAccMeanY <- newIndex + 42
tGravityAccMeanZ <- newIndex + 43
tGravityAccStdX <- newIndex + 44
tGravityAccStdY <- newIndex + 45
tGravityAccStdZ <- newIndex + 46
tBodyAccJerkMeanX <- newIndex + 81
tBodyAccJerkMeanY <- newIndex + 82
tBodyAccJerkMeanZ <- newIndex + 83
tBodyAccJerkStdX <- newIndex + 84
tBodyAccJerkStdY <- newIndex + 85
tBodyAccJerkStdZ <- newIndex + 86
tBodyGyroMeanX <- newIndex + 121
tBodyGyroMeanY <- newIndex + 122
tBodyGyroMeanZ <- newIndex + 123
tBodyGyroStdX <- newIndex + 124
tBodyGyroStdY <- newIndex + 125
tBodyGyroStdZ <- newIndex + 126
tBodyGyroJerkMeanX <- newIndex + 161 
tBodyGyroJerkMeanY <- newIndex + 162
tBodyGyroJerkMeanZ <- newIndex + 163
tBodyGyroJerkStdX <- newIndex + 164
tBodyGyroJerkStdY <- newIndex + 165
tBodyGyroJerkStdZ <- newIndex + 166
tBodyAccMagMean <- newIndex + 201
tBodyAccMagStd <- newIndex + 202
tGravityAccMagMean <- newIndex + 214 
tGravityAccMagStd <- newIndex + 215
tBodyAccJerkMagMean <- newIndex + 227
tBodyAccJerkMagStd <- newIndex + 228
tBodyGyroMagMean <- newIndex + 240
tBodyGyroMagStd <- newIndex + 241
tBodyGyroJerkMagMean <- newIndex + 253 
tBodyGyroJerkMagStd <- newIndex + 254
fBodyAccMeanX <- newIndex + 266
fBodyAccMeanY <- newIndex + 267
fBodyAccMeanZ <- newIndex + 268
fBodyAccStdX <- newIndex + 269
fBodyAccStdY <- newIndex + 270
fBodyAccStdZ <- newIndex + 271
fBodyAccMeanFreqX <- newIndex + 294 
fBodyAccMeanFreqY <- newIndex + 295
fBodyAccMeanFreqZ <- newIndex + 296
fBodyAccJerkMeanX <- newIndex + 345
fBodyAccJerkMeanY <- newIndex + 346
fBodyAccJerkMeanZ <- newIndex + 347
fBodyAccJerkStdX <- newIndex + 348
fBodyAccJerkStdY <- newIndex + 349
fBodyAccJerkStdZ <- newIndex + 350
fBodyAccJerkMeanFreqX <- newIndex + 373 
fBodyAccJerkMeanFreqY <- newIndex + 374
fBodyAccJerkMeanFreqZ <- newIndex + 375
fBodyGyroMeanX <- newIndex + 424
fBodyGyroMeanY <- newIndex + 425
fBodyGyroMeanZ <- newIndex + 426
fBodyGyroStdX <- newIndex + 427
fBodyGyroStdY <- newIndex + 428
fBodyGyroStdZ <- newIndex + 429
fBodyGyroMeanFreqX <- newIndex + 452 
fBodyGyroMeanFreqY <- newIndex + 453
fBodyGyroMeanFreqZ <- newIndex + 454
fBodyAccMagMean <- newIndex + 503
fBodyAccMagStd <- newIndex + 504
fBodyAccMagMeanFreq <- newIndex + 513 
fBodyBodyAccJerkMagMean <- newIndex + 516 
fBodyBodyAccJerkMagStd <- newIndex + 517
fBodyBodyAccJerkMagMeanFreq <- newIndex + 526 
fBodyBodyGyroMagMean <- newIndex + 529
fBodyBodyGyroMagStd <- newIndex + 530
fBodyBodyGyroMagMeanFreq <- newIndex + 539 
fBodyBodyGyroJerkMagMean <- newIndex + 542
fBodyBodyGyroJerkMagStd <- newIndex + 543
fBodyBodyGyroJerkMagMeanFreq <- newIndex + 552 


myMatrixSubjectXYTest <- cbind(c('test'), read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/test/subject_test.txt", header=FALSE))
myMatrixSubjectXYTest <- cbind(myMatrixSubjectXYTest, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/test/y_test.txt", header=FALSE))
myMatrixSubjectXYTest <- cbind(myMatrixSubjectXYTest, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/test/X_test.txt", header=FALSE))
myMatrixSubjectXYTest <- cbind(myMatrixSubjectXYTest, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", header=FALSE))
myMatrixSubjectXYTest <- cbind(myMatrixSubjectXYTest, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt", header=FALSE))
myMatrixSubjectXYTest <- cbind(myMatrixSubjectXYTest, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", header=FALSE))
myMatrixSubjectXYTest <- cbind(myMatrixSubjectXYTest, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", header=FALSE))
myMatrixSubjectXYTest <- cbind(myMatrixSubjectXYTest, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", header=FALSE))
myMatrixSubjectXYTest <- cbind(myMatrixSubjectXYTest, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", header=FALSE))
myMatrixSubjectXYTest <- cbind(myMatrixSubjectXYTest, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", header=FALSE))
myMatrixSubjectXYTest <- cbind(myMatrixSubjectXYTest, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", header=FALSE))
myMatrixSubjectXYTest <- cbind(myMatrixSubjectXYTest, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt", header=FALSE))


# setting the column names:
names(myMatrixSubjectXYTest)[1]<-"subject"
names(myMatrixSubjectXYTest)[2]<-"volunteer"
names(myMatrixSubjectXYTest)[3]<-"activity"



myMatrixSubjectXYTrain <- cbind(c('train'), read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/train/subject_train.txt", header=FALSE))
myMatrixSubjectXYTrain <- cbind(myMatrixSubjectXYTrain, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/train/y_train.txt", header=FALSE))
myMatrixSubjectXYTrain <- cbind(myMatrixSubjectXYTrain, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/train/X_train.txt", header=FALSE))
myMatrixSubjectXYTrain <- cbind(myMatrixSubjectXYTrain, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", header=FALSE))
myMatrixSubjectXYTrain <- cbind(myMatrixSubjectXYTrain, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", header=FALSE))
myMatrixSubjectXYTrain <- cbind(myMatrixSubjectXYTrain, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", header=FALSE))
myMatrixSubjectXYTrain <- cbind(myMatrixSubjectXYTrain, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", header=FALSE))
myMatrixSubjectXYTrain <- cbind(myMatrixSubjectXYTrain, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", header=FALSE))
myMatrixSubjectXYTrain <- cbind(myMatrixSubjectXYTrain, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", header=FALSE))
myMatrixSubjectXYTrain <- cbind(myMatrixSubjectXYTrain, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", header=FALSE))
myMatrixSubjectXYTrain <- cbind(myMatrixSubjectXYTrain, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", header=FALSE))
myMatrixSubjectXYTrain <- cbind(myMatrixSubjectXYTrain, read.table("C:/R_workspace2/Getting_and_Cleaning_Data/UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt", header=FALSE))

# setting the column names:
names(myMatrixSubjectXYTrain)[1]<-"subject"
names(myMatrixSubjectXYTrain)[2]<-"volunteer"
names(myMatrixSubjectXYTrain)[3]<-"activity"



myCompleteMatrixXY <- rbind (myMatrixSubjectXYTest, myMatrixSubjectXYTrain)
names(myCompleteMatrixXY)[1]<-"subject"
names(myCompleteMatrixXY)[2]<-"volunteer"
names(myCompleteMatrixXY)[3]<-"activity"

# flagging and naming the columns with respect to the mean and standard deviations

names(myCompleteMatrixXY)[tBodyAccMeanX] <-"tBodyAccMeanX"
names(myCompleteMatrixXY)[tBodyAccMeanY] <-"tBodyAccMeanY"
names(myCompleteMatrixXY)[tBodyAccMeanZ] <-"tBodyAccMeanZ"
names(myCompleteMatrixXY)[tBodyAccStdX] <-"tBodyAccStdX"
names(myCompleteMatrixXY)[tBodyAccStdY] <-"tBodyAccStdY"
names(myCompleteMatrixXY)[tBodyAccStdZ] <-"tBodyAccStdZ"
names(myCompleteMatrixXY)[tGravityAccMeanX] <-"tGravityAccMeanX"
names(myCompleteMatrixXY)[tGravityAccMeanY] <-"tGravityAccMeanY"
names(myCompleteMatrixXY)[tGravityAccMeanZ] <-"tGravityAccMeanZ"
names(myCompleteMatrixXY)[tGravityAccStdX] <-"tGravityAccStdX"
names(myCompleteMatrixXY)[tGravityAccStdY] <-"tGravityAccStdY"
names(myCompleteMatrixXY)[tGravityAccStdZ] <-"tGravityAccStdZ"
names(myCompleteMatrixXY)[tBodyAccJerkMeanX] <-"tBodyAccJerkMeanX"
names(myCompleteMatrixXY)[tBodyAccJerkMeanY] <-"tBodyAccJerkMeanY"
names(myCompleteMatrixXY)[tBodyAccJerkMeanZ] <-"tBodyAccJerkMeanZ"
names(myCompleteMatrixXY)[tBodyAccJerkStdX] <-"tBodyAccJerkStdX"
names(myCompleteMatrixXY)[tBodyAccJerkStdY] <-"tBodyAccJerkStdY"
names(myCompleteMatrixXY)[tBodyAccJerkStdZ] <-"tBodyAccJerkStdZ"
names(myCompleteMatrixXY)[tBodyGyroMeanX] <-"tBodyGyroMeanX"
names(myCompleteMatrixXY)[tBodyGyroMeanY] <-"tBodyGyroMeanY"
names(myCompleteMatrixXY)[tBodyGyroMeanZ] <-"tBodyGyroMeanZ"
names(myCompleteMatrixXY)[tBodyGyroStdX] <-"tBodyGyroStdX"
names(myCompleteMatrixXY)[tBodyGyroStdY] <-"tBodyGyroStdY"
names(myCompleteMatrixXY)[tBodyGyroStdZ] <-"tBodyGyroStdZ"
names(myCompleteMatrixXY)[tBodyGyroJerkMeanX] <-"tBodyGyroJerkMeanX"
names(myCompleteMatrixXY)[tBodyGyroJerkMeanY] <-"tBodyGyroJerkMeanY"
names(myCompleteMatrixXY)[tBodyGyroJerkMeanZ] <-"tBodyGyroJerkMeanZ"
names(myCompleteMatrixXY)[tBodyGyroJerkStdX] <-"tBodyGyroJerkStdX"
names(myCompleteMatrixXY)[tBodyGyroJerkStdY] <-"tBodyGyroJerkStdY"
names(myCompleteMatrixXY)[tBodyGyroJerkStdZ] <-"tBodyGyroJerkStdZ"
names(myCompleteMatrixXY)[tBodyAccMagMean] <-"tBodyAccMagMean"
names(myCompleteMatrixXY)[tBodyAccMagStd] <-"tBodyAccMagStd"
names(myCompleteMatrixXY)[tGravityAccMagMean] <-"tGravityAccMagMean"
names(myCompleteMatrixXY)[tGravityAccMagStd] <-"tGravityAccMagStd"
names(myCompleteMatrixXY)[tBodyAccJerkMagMean] <-"tBodyAccJerkMagMean"
names(myCompleteMatrixXY)[tBodyAccJerkMagStd] <-"tBodyAccJerkMagStd"
names(myCompleteMatrixXY)[tBodyGyroMagMean] <-"tBodyGyroMagMean"
names(myCompleteMatrixXY)[tBodyGyroMagStd] <-"tBodyGyroMagStd"
names(myCompleteMatrixXY)[tBodyGyroJerkMagMean] <-"tBodyGyroJerkMagMean"
names(myCompleteMatrixXY)[tBodyGyroJerkMagStd] <-"tBodyGyroJerkMagStd"
names(myCompleteMatrixXY)[fBodyAccMeanX] <-"fBodyAccMeanX"
names(myCompleteMatrixXY)[fBodyAccMeanY] <-"fBodyAccMeanY"
names(myCompleteMatrixXY)[fBodyAccMeanZ] <-"fBodyAccMeanZ"
names(myCompleteMatrixXY)[fBodyAccStdX] <-"fBodyAccStdX"
names(myCompleteMatrixXY)[fBodyAccStdY] <-"fBodyAccStdY"
names(myCompleteMatrixXY)[fBodyAccStdZ] <-"fBodyAccStdZ"
names(myCompleteMatrixXY)[fBodyAccMeanFreqX] <-"fBodyAccMeanFreqX"
names(myCompleteMatrixXY)[fBodyAccMeanFreqY] <-"fBodyAccMeanFreqY"
names(myCompleteMatrixXY)[fBodyAccMeanFreqZ] <-"fBodyAccMeanFreqZ"
names(myCompleteMatrixXY)[fBodyAccJerkMeanX] <-"fBodyAccJerkMeanX"
names(myCompleteMatrixXY)[fBodyAccJerkMeanY] <-"fBodyAccJerkMeanY"
names(myCompleteMatrixXY)[fBodyAccJerkMeanZ] <-"fBodyAccJerkMeanZ"
names(myCompleteMatrixXY)[fBodyAccJerkStdX] <-"fBodyAccJerkStdX"
names(myCompleteMatrixXY)[fBodyAccJerkStdY] <-"fBodyAccJerkStdY"
names(myCompleteMatrixXY)[fBodyAccJerkStdZ] <-"fBodyAccJerkStdZ"
names(myCompleteMatrixXY)[fBodyAccJerkMeanFreqX] <-"fBodyAccJerkMeanFreqX"
names(myCompleteMatrixXY)[fBodyAccJerkMeanFreqY] <-"fBodyAccJerkMeanFreqY"
names(myCompleteMatrixXY)[fBodyAccJerkMeanFreqZ] <-"fBodyAccJerkMeanFreqZ"
names(myCompleteMatrixXY)[fBodyGyroMeanX] <-"fBodyGyroMeanX"
names(myCompleteMatrixXY)[fBodyGyroMeanY] <-"fBodyGyroMeanY"
names(myCompleteMatrixXY)[fBodyGyroMeanZ] <-"fBodyGyroMeanZ"
names(myCompleteMatrixXY)[fBodyGyroStdX] <-"fBodyGyroStdX"
names(myCompleteMatrixXY)[fBodyGyroStdY] <-"fBodyGyroStdY"
names(myCompleteMatrixXY)[fBodyGyroStdZ] <-"fBodyGyroStdZ"
names(myCompleteMatrixXY)[fBodyGyroMeanFreqX] <-"fBodyGyroMeanFreqX"
names(myCompleteMatrixXY)[fBodyGyroMeanFreqY] <-"fBodyGyroMeanFreqY"
names(myCompleteMatrixXY)[fBodyGyroMeanFreqZ] <-"fBodyGyroMeanFreqZ"
names(myCompleteMatrixXY)[fBodyAccMagMean] <-"fBodyAccMagMean"
names(myCompleteMatrixXY)[fBodyAccMagStd] <-"fBodyAccMagStd"
names(myCompleteMatrixXY)[fBodyAccMagMeanFreq] <-"fBodyAccMagMeanFreq"
names(myCompleteMatrixXY)[fBodyBodyAccJerkMagMean] <-"fBodyBodyAccJerkMagMean"
names(myCompleteMatrixXY)[fBodyBodyAccJerkMagStd] <-"fBodyBodyAccJerkMagStd"
names(myCompleteMatrixXY)[fBodyBodyAccJerkMagMeanFreq] <-"fBodyBodyAccJerkMagMeanFreq"
names(myCompleteMatrixXY)[fBodyBodyGyroMagMean] <-"fBodyBodyGyroMagMean"
names(myCompleteMatrixXY)[fBodyBodyGyroMagStd] <-"fBodyBodyGyroMagStd"
names(myCompleteMatrixXY)[fBodyBodyGyroMagMeanFreq] <-"fBodyBodyGyroMagMeanFreq"
names(myCompleteMatrixXY)[fBodyBodyGyroJerkMagMean] <-"fBodyBodyGyroJerkMagMean"
names(myCompleteMatrixXY)[fBodyBodyGyroJerkMagMeanFreq] <-"fBodyBodyGyroJerkMagMeanFreq"
names(myCompleteMatrixXY)[fBodyBodyGyroJerkMagStd] <-"fBodyBodyGyroJerkMagStd"


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 4. Appropriately labels the data set with descriptive variable names. 
myDataFrame<-data.frame(
  subject = myCompleteMatrixXY$subject,
  #volunteer = myCompleteMatrixXY$volunteer, #maybe we do not need the volunteer id afterall since it's not part of requirements for #5
  activity = myCompleteMatrixXY$activity,
  tBodyAccMeanX  = myCompleteMatrixXY$tBodyAccMeanX,
  tBodyAccMeanY  = myCompleteMatrixXY$tBodyAccMeanY,
  tBodyAccMeanZ  = myCompleteMatrixXY$tBodyAccMeanZ,
  tBodyAccStdX  = myCompleteMatrixXY$tBodyAccStdX,
  tBodyAccStdY  = myCompleteMatrixXY$tBodyAccStdY,
  tBodyAccStdZ  = myCompleteMatrixXY$tBodyAccStdZ,
  tGravityAccMeanX  = myCompleteMatrixXY$tGravityAccMeanX,
  tGravityAccMeanY  = myCompleteMatrixXY$tGravityAccMeanY,
  tGravityAccMeanZ  = myCompleteMatrixXY$tGravityAccMeanZ,
  tGravityAccStdX  = myCompleteMatrixXY$tGravityAccStdX,
  tGravityAccStdY  = myCompleteMatrixXY$tGravityAccStdY,
  tGravityAccStdZ  = myCompleteMatrixXY$tGravityAccStdZ,
  tBodyAccJerkMeanX  = myCompleteMatrixXY$tBodyAccJerkMeanX,
  tBodyAccJerkMeanY  = myCompleteMatrixXY$tBodyAccJerkMeanY,
  tBodyAccJerkMeanZ  = myCompleteMatrixXY$tBodyAccJerkMeanZ,
  tBodyAccJerkStdX  = myCompleteMatrixXY$tBodyAccJerkStdX,
  tBodyAccJerkStdY  = myCompleteMatrixXY$tBodyAccJerkStdY,
  tBodyAccJerkStdZ  = myCompleteMatrixXY$tBodyAccJerkStdZ,
  tBodyGyroMeanX  = myCompleteMatrixXY$tBodyGyroMeanX,
  tBodyGyroMeanY  = myCompleteMatrixXY$tBodyGyroMeanY,
  tBodyGyroMeanZ  = myCompleteMatrixXY$tBodyGyroMeanZ,
  tBodyGyroStdX  = myCompleteMatrixXY$tBodyGyroStdX,
  tBodyGyroStdY  = myCompleteMatrixXY$tBodyGyroStdY,
  tBodyGyroStdZ  = myCompleteMatrixXY$tBodyGyroStdZ,
  tBodyGyroJerkMeanX  = myCompleteMatrixXY$tBodyGyroJerkMeanX,
  tBodyGyroJerkMeanY  = myCompleteMatrixXY$tBodyGyroJerkMeanY,
  tBodyGyroJerkMeanZ  = myCompleteMatrixXY$tBodyGyroJerkMeanZ,
  tBodyGyroJerkStdX  = myCompleteMatrixXY$tBodyGyroJerkStdX,
  tBodyGyroJerkStdY  = myCompleteMatrixXY$tBodyGyroJerkStdY,
  tBodyGyroJerkStdZ  = myCompleteMatrixXY$tBodyGyroJerkStdZ,
  tBodyAccMagMean  = myCompleteMatrixXY$tBodyAccMagMean,
  tBodyAccMagStd  = myCompleteMatrixXY$tBodyAccMagStd,
  tGravityAccMagMean  = myCompleteMatrixXY$tGravityAccMagMean,
  tGravityAccMagStd  = myCompleteMatrixXY$tGravityAccMagStd,
  tBodyAccJerkMagMean  = myCompleteMatrixXY$tBodyAccJerkMagMean,
  tBodyAccJerkMagStd  = myCompleteMatrixXY$tBodyAccJerkMagStd,
  tBodyGyroMagMean  = myCompleteMatrixXY$tBodyGyroMagMean,
  tBodyGyroMagStd  = myCompleteMatrixXY$tBodyGyroMagStd,
  tBodyGyroJerkMagMean  = myCompleteMatrixXY$tBodyGyroJerkMagMean,
  tBodyGyroJerkMagStd  = myCompleteMatrixXY$tBodyGyroJerkMagStd,
  fBodyAccMeanX  = myCompleteMatrixXY$fBodyAccMeanX,
  fBodyAccMeanY  = myCompleteMatrixXY$fBodyAccMeanY,
  fBodyAccMeanZ  = myCompleteMatrixXY$fBodyAccMeanZ,
  fBodyAccStdX  = myCompleteMatrixXY$fBodyAccStdX,
  fBodyAccStdY  = myCompleteMatrixXY$fBodyAccStdY,
  fBodyAccStdZ  = myCompleteMatrixXY$fBodyAccStdZ,
  fBodyAccMeanFreqX  = myCompleteMatrixXY$fBodyAccMeanFreqX,
  fBodyAccMeanFreqY  = myCompleteMatrixXY$fBodyAccMeanFreqY,
  fBodyAccMeanFreqZ  = myCompleteMatrixXY$fBodyAccMeanFreqZ,
  fBodyAccJerkMeanX  = myCompleteMatrixXY$fBodyAccJerkMeanX,
  fBodyAccJerkMeanY  = myCompleteMatrixXY$fBodyAccJerkMeanY,
  fBodyAccJerkMeanZ  = myCompleteMatrixXY$fBodyAccJerkMeanZ,
  fBodyAccJerkStdX  = myCompleteMatrixXY$fBodyAccJerkStdX,
  fBodyAccJerkStdY  = myCompleteMatrixXY$fBodyAccJerkStdY,
  fBodyAccJerkStdZ  = myCompleteMatrixXY$fBodyAccJerkStdZ,
  fBodyAccJerkMeanFreqX  = myCompleteMatrixXY$fBodyAccJerkMeanFreqX,
  fBodyAccJerkMeanFreqY  = myCompleteMatrixXY$fBodyAccJerkMeanFreqY,
  fBodyAccJerkMeanFreqZ  = myCompleteMatrixXY$fBodyAccJerkMeanFreqZ,
  fBodyGyroMeanX  = myCompleteMatrixXY$fBodyGyroMeanX,
  fBodyGyroMeanY  = myCompleteMatrixXY$fBodyGyroMeanY,
  fBodyGyroMeanZ  = myCompleteMatrixXY$fBodyGyroMeanZ,
  fBodyGyroStdX  = myCompleteMatrixXY$fBodyGyroStdX,
  fBodyGyroStdY  = myCompleteMatrixXY$fBodyGyroStdY,
  fBodyGyroStdZ  = myCompleteMatrixXY$fBodyGyroStdZ,
  fBodyGyroMeanFreqX  = myCompleteMatrixXY$fBodyGyroMeanFreqX,
  fBodyGyroMeanFreqY  = myCompleteMatrixXY$fBodyGyroMeanFreqY,
  fBodyGyroMeanFreqZ  = myCompleteMatrixXY$fBodyGyroMeanFreqZ,
  fBodyAccMagMean  = myCompleteMatrixXY$fBodyAccMagMean,
  fBodyAccMagStd  = myCompleteMatrixXY$fBodyAccMagStd,
  fBodyAccMagMeanFreq  = myCompleteMatrixXY$fBodyAccMagMeanFreq,
  fBodyBodyAccJerkMagMean  = myCompleteMatrixXY$fBodyBodyAccJerkMagMean,
  fBodyBodyAccJerkMagStd  = myCompleteMatrixXY$fBodyBodyAccJerkMagStd,
  fBodyBodyAccJerkMagMeanFreq  = myCompleteMatrixXY$fBodyBodyAccJerkMagMeanFreq,
  fBodyBodyGyroMagMean  = myCompleteMatrixXY$fBodyBodyGyroMagMean,
  fBodyBodyGyroMagStd  = myCompleteMatrixXY$fBodyBodyGyroMagStd,
  fBodyBodyGyroMagMeanFreq  = myCompleteMatrixXY$fBodyBodyGyroMagMeanFreq,
  fBodyBodyGyroJerkMagMean  = myCompleteMatrixXY$fBodyBodyGyroJerkMagMean,
  fBodyBodyGyroJerkMagStd = myCompleteMatrixXY$fBodyBodyGyroJerkMagStd,
  fBodyBodyGyroJerkMagMeanFreq  = myCompleteMatrixXY$fBodyBodyGyroJerkMagMeanFreq  
)

# 3. Uses descriptive activity names to name the activities in the data set
myDataFrame$activity[myDataFrame$activity == 1] <- "WALKING"
myDataFrame$activity[myDataFrame$activity == 2] <- "WALKING_UPSTAIRS"
myDataFrame$activity[myDataFrame$activity == 3] <- "WALKING_DOWNSTAIRS"
myDataFrame$activity[myDataFrame$activity == 4] <- "SITTING"
myDataFrame$activity[myDataFrame$activity == 5] <- "STANDING"
myDataFrame$activity[myDataFrame$activity == 6] <- "LAYING"



#reshape
myMeltData<-melt(myDataFrame, id =c("subject","activity"), measure.vars=c("tBodyAccMeanX","tBodyAccMeanY","tBodyAccMeanZ","tBodyAccStdX","tBodyAccStdY","tBodyAccStdZ","tGravityAccMeanX","tGravityAccMeanY","tGravityAccMeanZ","tGravityAccStdX","tGravityAccStdY","tGravityAccStdZ","tBodyAccJerkMeanX","tBodyAccJerkMeanY","tBodyAccJerkMeanZ","tBodyAccJerkStdX",
                                                                          "tBodyAccJerkStdY","tBodyAccJerkStdZ","tBodyGyroMeanX","tBodyGyroMeanY","tBodyGyroMeanZ","tBodyGyroStdX","tBodyGyroStdY","tBodyGyroStdZ","tBodyGyroJerkMeanX","tBodyGyroJerkMeanY","tBodyGyroJerkMeanZ","tBodyGyroJerkStdX","tBodyGyroJerkStdY","tBodyGyroJerkStdZ","tBodyAccMagMean","tBodyAccMagStd",
                                                                          "tGravityAccMagMean","tGravityAccMagStd","tBodyAccJerkMagMean","tBodyAccJerkMagStd","tBodyGyroMagMean","tBodyGyroMagStd","tBodyGyroJerkMagMean","tBodyGyroJerkMagStd","fBodyAccMeanX","fBodyAccMeanY","fBodyAccMeanZ","fBodyAccStdX","fBodyAccStdY","fBodyAccStdZ","fBodyAccMeanFreqX","fBodyAccMeanFreqY",
                                                                          "fBodyAccMeanFreqZ","fBodyAccJerkMeanX","fBodyAccJerkMeanY","fBodyAccJerkMeanZ","fBodyAccJerkStdX","fBodyAccJerkStdY","fBodyAccJerkStdZ","fBodyAccJerkMeanFreqX","fBodyAccJerkMeanFreqY","fBodyAccJerkMeanFreqZ","fBodyGyroMeanX","fBodyGyroMeanY","fBodyGyroMeanZ","fBodyGyroStdX","fBodyGyroStdY","fBodyGyroStdZ",
                                                                          "fBodyGyroMeanFreqX","fBodyGyroMeanFreqY","fBodyGyroMeanFreqZ","fBodyAccMagMean","fBodyAccMagStd","fBodyAccMagMeanFreq","fBodyBodyAccJerkMagMean","fBodyBodyAccJerkMagStd","fBodyBodyAccJerkMagMeanFreq","fBodyBodyGyroMagMean","fBodyBodyGyroMagStd","fBodyBodyGyroMagMeanFreq","fBodyBodyGyroJerkMagStd", "fBodyBodyGyroJerkMagMean"))


#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

attach(myMeltData)
myTidyData <-aggregate(myMeltData, by=list(subject,activity, variable), FUN=mean, na.rm=TRUE)

#save the table
write.table(myTidyData, "C:/R_workspace2/Getting_and_Cleaning_Data/myTityTable.txt", row.name=FALSE)
