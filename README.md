# Getting and Cleaning Data Course Project

In order to perform dataset analysis run_analysis.R file was created. This script does the following:

1. Downloads UCI HAR dataset.
2. Reads activity labels and column names for both data sets.
3. Reads the train dataset.
4. Reads the test dataset.
5. Merges train and test datasets in one data frame.
6. Adds column names to the data frame.
7. Adds activity labels.
8. Extracts measurements on the mean and standard deviation.
9. Appropriately labels the data set with descriptive variable names.
10. Creates a second, independent tidy data set with the average of each variable for each activity and each subject and store the result in tydydata.txt file.