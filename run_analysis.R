# Create one R script called run_analysis.R that does the following.

# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject.


# Download dataset
if (!file.exists("./UCI\ HAR\ Dataset")) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, "UCI-HAR-dataset.zip")
  unzip("./UCI-HAR-dataset.zip")
}

# read activity labels and column names for both data sets
activity_labels <- read.table("./UCI\ HAR\ Dataset/activity_labels.txt", header = FALSE, sep = "", na.strings = "N/A", nrows = -1, col.names = c("activityid", "activity"))
colnames_df <- read.table("./UCI\ HAR\ Dataset/features.txt", header = FALSE, sep = "", na.strings = "N/A", as.is = 2, nrows = -1)
colnames <- c("activityid", "subject", colnames_df[,2])

# read train data set
train_df <- read.table("./UCI\ HAR\ Dataset/train/X_train.txt", header = FALSE, sep = "", na.strings = "N/A", nrows = -1)
train_subjects <- read.table("./UCI\ HAR\ Dataset/train/subject_train.txt", header = FALSE, sep = "", na.strings = "N/A", nrows = -1)
train_rows <- read.table("./UCI\ HAR\ Dataset/train/y_train.txt", header = FALSE, sep = "", na.strings = "N/A", nrows = -1)
train_df <- cbind(train_rows, train_subjects, train_df)

# read test dataset
test_df <- read.table("./UCI\ HAR\ Dataset/test/X_test.txt", header = FALSE, sep = "", na.strings = "N/A", nrows = -1)
test_subjects <- read.table("./UCI\ HAR\ Dataset/test/subject_test.txt", header = FALSE, sep = "", na.strings = "N/A", nrows = -1)
test_rows <- read.table("./UCI\ HAR\ Dataset/test/y_test.txt", header = FALSE, sep = "", na.strings = "N/A", nrows = -1)
test_df <- cbind(test_rows, test_subjects, test_df)

# merge train and test data sets
df <- rbind(train_df, test_df)

# add column names
colnames(df) <- colnames

# add activity labels
df <- merge(activity_labels, df)

# Extract measurements on the mean and standard deviation for each measurement
library(dplyr)
df <- select(df, activityid, activity, subject, contains("mean()"), contains("std()"))

# Appropriately labels the data set with descriptive variable names
colnames(df) <- gsub("\\(|\\)", "", colnames(df))
colnames(df) <- gsub("-", "", colnames(df))
colnames(df) <- gsub("^t", "Time", colnames(df))
colnames(df) <- gsub("^f", "Frequency", colnames(df))
colnames(df) <- gsub("Acc", "Acceleration", colnames(df))
colnames(df) <- gsub("Gyro", "Gyroscopic", colnames(df))
colnames(df) <- gsub("Mag", "Magnitude", colnames(df))
colnames(df) <- gsub("BodyBody", "Body", colnames(df))
colnames(df) <- gsub("mean", "Mean", colnames(df))
colnames(df) <- gsub("std", "Std", colnames(df))

# Create a second, independent tidy data set with the average of each 
# variable for each activity and each subject
df_tydy <- df %>% group_by(activityid, activity, subject) %>% summarise_each(funs(mean))
write.table(df_tydy, file = "tydydata.txt", quote = FALSE, sep = " ", row.names = FALSE)
