########
#1: Import data
library(readr)
library(dplyr)
setwd("C:/Users/slc404/OneDrive - Sherwin-Williams/Rprojects/Coursera/Getting Data Clean/week 4/Project/")
X_test <- read_table2("data/UCI HAR Dataset/test/X_test.txt", col_names = FALSE)
X_train <- read_table2("data/UCI HAR Dataset/train/X_train.txt", col_names = FALSE)
subject_test <- read_table2("data/UCI HAR Dataset/test/subject_test.txt", col_names = FALSE)
subject_train <- read_table2("data/UCI HAR Dataset/train/subject_train.txt", col_names = FALSE)
features <- read_table2("data/UCI HAR Dataset/features.txt", col_names = FALSE)
activity_label <- read_table2("data/UCI HAR Dataset/activity_labels.txt", col_names = FALSE)
Y_test <- read_table2("data/UCI HAR Dataset/test/Y_test.txt", col_names = FALSE)
Y_train <- read_table2("data/UCI HAR Dataset/train/Y_train.txt", col_names = FALSE)

#2: Add names to the columns
colnames(X_test)=features$X2
colnames(X_train)=features$X2

#3: Add subject and activity to column
#add activity lables for test
Y_test$X1[Y_test$X1==1]<-"Walking"
Y_test$X1[Y_test$X1==2]<-"Walking_upstairs"
Y_test$X1[Y_test$X1==3]<-"Walking_downstairs"
Y_test$X1[Y_test$X1==4]<-"Sitting"
Y_test$X1[Y_test$X1==5]<-"Standing"
Y_test$X1[Y_test$X1==6]<-"Laying"

#add activity lables for train
Y_train$X1[Y_train$X1==1]<-"Walking"
Y_train$X1[Y_train$X1==2]<-"Walking_upstairs"
Y_train$X1[Y_train$X1==3]<-"Walking_downstairs"
Y_train$X1[Y_train$X1==4]<-"Sitting"
Y_train$X1[Y_train$X1==5]<-"Standing"
Y_train$X1[Y_train$X1==6]<-"Laying"


#Add names to the columns for test
colnames(Y_test)=c("activity") 
colnames(subject_test)=c("subject")

#Add names to the columns for train
colnames(Y_train)=c("activity") 
colnames(subject_train)=c("subject")


#Add subject to first column and activity to second column
X_test_com<-cbind(subject_test, Y_test, X_test) #test
X_train_com<-cbind(subject_train, Y_train, X_train) #train

#4 Combines test and train data set
combine_data<-rbind(X_test_com, X_train_com)

#5 Second dataset that average for each variable and subject
#mean for each subject
new_df_subject<-aggregate(combine_data, FUN=mean, by=list(combine_data$subject))
#mean for each activity
new_df_activity<-aggregate(combine_data, FUN=mean, by=list(combine_data$activity))
#new dataframe with subject and activity
new_tidy_data<-rbind(new_df_activity, new_df_subject)

write.table(new_tidy_data, file ="new_tidy_data.txt" ,row.names = FALSE, )
