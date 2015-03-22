---
title: "run_analysis.R"
author: "Ryan Brown"
date: "Sunday, March 22, 2015"
output: html_document
---

run_analysis.R is a script for formatting and outputting select data from the Human Activity Recognition Using Smartphones Dataset Version 1.0 as downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip on 22/03/2015.

Section 1 loads the relevant tables from locally downloaded files. The original data set has data, test IDs, activity names, and column names in separate files for the test and train data sets. These have to be loaded separately.

Section 2 formats the data loaded in Section 1 to prepare it for forming the full data set. Columns are given meaningful names and activity indicators are matched to their full activity name.

Section 3 creates full data sets from the test and train data sets (where full here means including subject ID and activity ID with meaningful column names). It then joins these data sets together. Lastly, it selects only the fields that represent the mean and standard deviation measurements of the different movements as measure in the original file.

Section 4 summarizes the average mean and standard deviation measurements of each subject for each activity then writes this data to a .txt file.

Code book:

The following signals are contained in the file. Each listed signal is included as 6 separate fields, namely, the mean and standard deviation for each dimension of motion (X,Y, and Z). 

tBodyAcc-XYZ: Acceleration of body given in standard gravity units 'g'
tGravityAcc-XYZ: Acceleration of gravity given in standard gravity units 'g'
tBodyAccJerk-XYZ: Acceleration of body differentiated in time, give in units 'g/s'
tBodyGyro-XYZ: Angular acceleration of body in 'radian/s'
tBodyGyroJerk-XYZ: Angular acceleration of body in 'radian/s^2'
tBodyAccMag: Euclidean magnitude of total acceleration from the three dimensions of body acceleration, given in 'g'
tGravityAccMag: Euclidean magnitude of total acceleration from the three dimensions of gravity acceleration, given in 'g'
tBodyAccJerkMag: Euclidean magnitude of total body jerk from the three dimensions of body acceleration, given in 'g/s'
tBodyGyroMag: Euclidean magnitude of total angular acceleration from the three dimensions, given in 'radian/s'
tBodyGyroJerkMag: Euclidean magnitude of total angular jerk from the three dimensions, given in 'radian/s^2'
fBodyAcc-XYZ: Fast fourier transform of tBodyAcc-XYZ
fBodyAccJerk-XYZ: Fast fourier transform of tAccJerk-XYZ
fBodyGyro-XYZ: Fast fourier transform of tBodyGyro-XYZ
fBodyAccMag: Fast fourier transform of tBodyAccMag
fBodyAccJerkMag: Fast fourier transform of tBodyAccJerkMag
fBodyGyroMag: Fast fourier transform of tBodyGyroMag
fBodyGyroJerkMag: Fast fourier transform of tBodyGyroJerkMag  
