# Getting-Data-Clean-Project
Files:
Readme – This file
Codebook – describing variables and data manipulation
run_analysis.R  - R code

Description of the DATA:
Data was use from this website:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
According to the website, the data is from “Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.”
The following was conducted on the dataset:
•	Import data
•	Add names to the columns
•	Add subject and activity to column
•	Add activity labels for test and train
•	Add names to the columns for test and train
•	Add subject to first column and activity to second column
•	Combines test and train data set
•	Created a second dataset that contained both the mean for subject and activity


Libraries Used:
library(readr)
library(dplyr) 
