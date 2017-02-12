# Getting and Cleaning Data Course Project

The purpose of this project is to collect, work with, and clean UCI HAR Dataset.

## Dataset Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

### Notes

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

### Measurements abbreviations

**Jerk: sudden movement acceleration.
**Std: standard deviation.
**XYZ: denote 3-axial signals in the X, Y and Z directions.

## Cleaning the dataset

In order to clean up the data it was necessary to do the following steps.

### 1. Merges the training and the test sets to create one data set

The dataset included the following files:

- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

All of them were read and properly loaded in one data frame.

### 2. Extracts only the measurements on the mean and standard deviation for each measurement

Mean and standard deviation measurements were extracted.

### 3. Uses descriptive activity names to name the activities in the data set

Activity labels were added in the date frame using the activity id.

### 4. Appropriately labels the data set with descriptive variable names

Variable names were transformed make them more descriptive:

* activityid: activity identifier
* activity: activity labels
* subject: subject identifier
* TimeBodyAccelerationMeanX
* TimeBodyAccelerationMeanY
* TimeBodyAccelerationMeanZ
* TimeGravityAccelerationMeanX
* TimeGravityAccelerationMeanY
* TimeGravityAccelerationMeanZ
* TimeBodyAccelerationJerkMeanX
* TimeBodyAccelerationJerkMeanY
* TimeBodyAccelerationJerkMeanZ
* TimeBodyGyroscopicMeanX
* TimeBodyGyroscopicMeanY
* TimeBodyGyroscopicMeanZ
* TimeBodyGyroscopicJerkMeanX
* TimeBodyGyroscopicJerkMeanY
* TimeBodyGyroscopicJerkMeanZ
* TimeBodyAccelerationMagnitudeMean
* TimeGravityAccelerationMagnitudeMean
* TimeBodyAccelerationJerkMagnitudeMean
* TimeBodyGyroscopicMagnitudeMean
* TimeBodyGyroscopicJerkMagnitudeMean
* FrequencyBodyAccelerationMeanX
* FrequencyBodyAccelerationMeanY
* FrequencyBodyAccelerationMeanZ
* FrequencyBodyAccelerationJerkMeanX
* FrequencyBodyAccelerationJerkMeanY
* FrequencyBodyAccelerationJerkMeanZ
* FrequencyBodyGyroscopicMeanX
* FrequencyBodyGyroscopicMeanY
* FrequencyBodyGyroscopicMeanZ
* FrequencyBodyAccelerationMagnitudeMean
* FrequencyBodyAccelerationJerkMagnitudeMean
* FrequencyBodyGyroscopicMagnitudeMean
* FrequencyBodyGyroscopicJerkMagnitudeMean
* TimeBodyAccelerationStdX
* TimeBodyAccelerationStdY
* TimeBodyAccelerationStdZ
* TimeGravityAccelerationStdX
* TimeGravityAccelerationStdY
* TimeGravityAccelerationStdZ
* TimeBodyAccelerationJerkStdX
* TimeBodyAccelerationJerkStdY
* TimeBodyAccelerationJerkStdZ
* TimeBodyGyroscopicStdX
* TimeBodyGyroscopicStdY
* TimeBodyGyroscopicStdZ
* TimeBodyGyroscopicJerkStdX
* TimeBodyGyroscopicJerkStdY
* TimeBodyGyroscopicJerkStdZ
* TimeBodyAccelerationMagnitudeStd
* TimeGravityAccelerationMagnitudeStd
* TimeBodyAccelerationJerkMagnitudeStd
* TimeBodyGyroscopicMagnitudeStd
* TimeBodyGyroscopicJerkMagnitudeStd
* FrequencyBodyAccelerationStdX
* FrequencyBodyAccelerationStdY
* FrequencyBodyAccelerationStdZ
* FrequencyBodyAccelerationJerkStdX
* FrequencyBodyAccelerationJerkStdY
* FrequencyBodyAccelerationJerkStdZ
* FrequencyBodyGyroscopicStdX
* FrequencyBodyGyroscopicStdY
* FrequencyBodyGyroscopicStdZ
* FrequencyBodyAccelerationMagnitudeStd
* FrequencyBodyAccelerationJerkMagnitudeStd
* FrequencyBodyGyroscopicMagnitudeStd
* FrequencyBodyGyroscopicJerkMagnitudeStd

### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

The average of each measurement was obtained grouping by activity and subject. The resulting data frame was stored in tydydata.txt file.