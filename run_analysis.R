## Data preparation - Human Activity Recognition Using Smartphones Data Set

##Load required libraries
library(dplyr)
library(tidyr)

## This script assumes that data set has been downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
setwd("./UCI HAR Dataset")
##Read the test dataset (subject, activity and measurements) and label attributes
f_label = read.table("features.txt", header = FALSE)
tb_test = read.table("./test/X_test.txt", header = FALSE)
names(tb_test) <- f_label$V2
tb_test_y = read.table("./test/y_test.txt", header = FALSE)
a_label = read.table("activity_labels.txt", header = FALSE)
tb_test_y <- inner_join(tb_test_y, a_label)
names(tb_test_y) <- c("activitycode", "activityname")
tb_test <- bind_cols(tb_test_y, tb_test)
tb_test_subject = read.table("./test/subject_test.txt", header = FALSE)
names(tb_test_subject) <- "subject"
tb_test <- bind_cols(tb_test_subject, tb_test)

##Read the training dataset (subject, activity and measurements) and label attributes
tb_train = read.table("./train/X_train.txt", header = FALSE)
names(tb_train) <- f_label$V2
tb_train_y = read.table("./train/y_train.txt", header = FALSE)
tb_train_y <- inner_join(tb_train_y, a_label)
names(tb_train_y) <- c("activitycode", "activityname")
tb_train <- bind_cols(tb_train_y, tb_train)
tb_train_subject = read.table("./train/subject_train.txt", header = FALSE)
names(tb_train_subject) <- "subject"
tb_train <- bind_cols(tb_train_subject, tb_train)

## Merge the training and the test data sets to create one data set
tb_test_train <- rbind.data.frame(tb_test, tb_train)

## Extract only the measurements on the mean and standard deviation for each measurement 
l_col <-  "mean\\(|std\\("
mnstvariables <- tb_test_train[, grepl(l_col, colnames(tb_test_train))]

## Data set attributes contains subject, activityname and the extracted measurements
## Uses descriptive activity names to name the activities in the data set
##Appropriately labels the data set with descriptive variable names
mnstvariables <- cbind(mnstvariables, tb_test_train$subject)
colnames(mnstvariables)[67] <- "subject"
mnstvariables <- cbind(mnstvariables, tb_test_train$activityname)
colnames(mnstvariables)[68] <- "activityname"

##From the data set creates a second, independent tidy data set with the average of each variable for each activity and each subject
s_var<- gather(mnstvariables,key = measure, value=value,1:66)
s_varg<- group_by(s_var, subject,activityname,measure)
s_vargs <- summarize(s_varg, average = mean(value))

