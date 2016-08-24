#Coursera Cleanning Data Week 4 Assignment

library(dplyr)
library(stringr)

# Download and unzip the dataset:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, "smart_phone_data.zip", method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip("smart_phone_data.zip") 
}

# Read in the files
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

#Bind the data
X_data <- rbind(X_test, X_train)
y_data <- rbind(y_test, y_train)
sbj_data <- rbind(subject_test, subject_train)

#give column names to data
names(X_data) <- features$V2
names(y_data) <- c("activity")
names(sbj_data) <- c("subject")

#combine all data together into data frame
df <- cbind(sbj_data, y_data)
df <- cbind(df, X_data)




