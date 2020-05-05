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
•	Merges the training and the test sets to create one data set.
•	Extracts only the measurements on the mean and standard deviation for each measurement.
•	Add activity labels 
•	Created a second dataset that contained both the mean for subject and activity

Libraries Used:
library(readr)
library(dplyr) 
 
