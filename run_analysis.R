
#0: Pre Steps

#Obtain feature and activity 
library(readr)
library(dplyr)
setwd("C:/Users/slc404/OneDrive - Sherwin-Williams/Rprojects/Coursera/Getting Data Clean/week 4/Project/")
features <- read_table2("data/UCI HAR Dataset/features.txt", col_names = FALSE)
activity_label <- read_table2("data/UCI HAR Dataset/activity_labels.txt", col_names = FALSE)

#Obtain train
X_train <- read_table("data/UCI HAR Dataset/train/X_train.txt", col_names = features$X2)
subject_train <- read_table("data/UCI HAR Dataset/train/subject_train.txt", col_names = "subject")
Y_train <- read_table("data/UCI HAR Dataset/train/Y_train.txt", col_names = "activity")
train<-cbind(Y_train,subject_train,X_train)

#Obtain Test
X_test <- read_table("data/UCI HAR Dataset/test/X_test.txt", col_names = features$X2)
subject_test <- read_table("data/UCI HAR Dataset/test/subject_test.txt", col_names = "subject")
Y_test <- read_table("data/UCI HAR Dataset/test/Y_test.txt", col_names = "activity")
test<-cbind(Y_test,subject_test,X_test)

#1.	Merges the training and the test sets to create one data set.
data<-rbind(test, train)

#2.	Extracts only the measurements on the mean and standard deviation for each measurement.
#select the mean
data_mean <- data %>% select(subject, contains("mean"))
#select the std
data_std <- data %>% select(subject, contains("std"))
#combined columns  
data_mean_std <- cbind(data$activity, data_mean, data_std) 
names(data_mean_std)[1] <- "activity" #rename activity column

# 3.	Uses descriptive activity names to name the activities in the data set
data_mean_std$activity[data_mean_std$activity==1]<-"Walking"
data_mean_std$activity[data_mean_std$activity==2]<-"Walking_upstairs"
data_mean_std$activity[data_mean_std$activity==3]<-"Walking_downstairs"
data_mean_std$activity[data_mean_std$activity==4]<-"Sitting"
data_mean_std$activity[data_mean_std$activity==5]<-"Standing"
data_mean_std$activity[data_mean_std$activity==6]<-"Laying"

#4.	Appropriately labels the data set with descriptive variable names.
data_clean_name<-data_mean_std
#create valid names
valid_column_name <- make.names(names=names(data_mean_std), unique=TRUE, allow_ = TRUE)
names(data_mean_std) <- valid_column_name
data_clean_name<-data_mean_std

#5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
final <- data_clean_name%>%
  group_by(subject,activity)%>%
  summarise_all(funs(mean))

write.table(data_clean_name, file ="data_clean_name.txt" ,row.names = FALSE, )
