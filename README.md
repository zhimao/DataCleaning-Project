## Synopsis
This is for Data Cleaning class week 4 assignment. 

### Assignment: Getting and Cleaning Data Course Project
You should create one R script called run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Links
* [Assignment link to GitHub](http://example.com "Title").
* [Data to use for the project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

###  Files
* README.md - This file. 
* run_analysis.R - R script to clean data.
* CodeBook.md - Describes the variables, the data, and any transformations or work performed to clean up the data
* ActivityRecognitionTrainTest.txt - tidy data

### How to run "run_analysis.R"
* Download and unzip the data to a directory. For example,  to /user/zhimao/assignment4.
* Open R console
* Change working directory to where the directory "UCI HAR Dataset" (from first bullet) is at.
    * For example, path to "UCI HAR Dataset" is "/user/zhimao/assignment4/UCI HAR Dataset",  then set the working directory to /user/zhimao/assignment4.
* Copy the run_analysis.R to /user/zhimao/assignment4
* Run the R script 
    * source("run_analysis.R")
* A tidy data file "ActivityRecognitionTrainTest.txt" is created under the same directory

### Sample run
```
> source("run_analysis.R")

…

[1] "Loading library."
[1] "Reading data."
[1] "Merging data."
[1] "Filter mean and standard deviation measurements."
[1] "Set readable column names."
[1] "Marshalling data to create a full dataset."
[1] "Create tidy data."
[1] "Save tidy data to ActivityRecognitionTrainTest.txt."
```
