#################################
# R script called run_analysis.R
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#################################

# Install package if they didn't installed
if(!require("data.table")){
	install.packages("data.table")
}

if(!require("dplyr")){
	install.packages("dplyr")
}

if(!require("reshape2")){
	install.packages("reshape2")
}

print("Loading library.")
# Load library
library(data.table)
library(dplyr)
library(reshape2)

print("Reading data.")
# Read measurement data
featuresDF <- read.table("./UCI HAR Dataset/features.txt", col.names = c("ID", "FeatureName"))
trainDF <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = featuresDF$FeatureName)
testDF <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = featuresDF$FeatureName)

# Read subject and set SubjectID as column name
trainSubject <-read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "SubjectID")
testSubject  <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "SubjectID")

# Read activity and set ActivityID as column name
trainActivity <- read.table("./UCI HAR Dataset/train/Y_train.txt", col.names = "ActivityID")
testActivity <- read.table("./UCI HAR Dataset/test/Y_test.txt", col.names = "ActivityID")

# Read activity names
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("ActivityID", "Activity"))

print("Merging data.")
# Bind train data and test data
trainTestDF <- rbind(trainDF, testDF)
allActivities <- rbind(trainActivity, testActivity)
allSubjects <- rbind(trainSubject, testSubject)

print("Filter mean and standard deviation measurements.")
# Get column names that is man and std
meanStdNames <-grep("mean\\.|std", colnames(trainTestDF), value = TRUE)

# Subsetting on colnames that is mean and std
meanStdDF <- trainTestDF[, c(meanStdNames)]

print("Set readable column names.")
# Replace ... in names to . 
newColNames <- sub("\\.\\.\\.", "\\.", names(meanStdDF))
# Get rid of ending ..
newColNames <- sub("\\.\\.$", "", newColNames)
newColNames <- sub("^t", "Time", newColNames)
newColNames <- sub("^f", "Frequency", newColNames)
newColNames <- sub("mean", "Mean", newColNames)
newColNames <- sub("\\.std", "\\.STDEV", newColNames)
newColNames <- sub("Acc\\.", "Acceleration\\.", newColNames)

# Set new column names
setnames(meanStdDF, colnames(meanStdDF), newColNames)

print("Marshalling data to create a full dataset.")
# Add a new column Activity to activity dataframe using activity labels
allActivities$Activity <- apply(allActivities, 1, function(x) activityLabels[x, 2])

# Add activity to subject data
subjectActivityDF <- mutate(allSubjects, Activity = allActivities$Activity)
# Bind activity with mean and STDEV data
activityRegDF <- cbind(subjectActivityDF, meanStdDF)

print("Create tidy data.")
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Use subject ID and Activity to melt down with the rest the of the columns which are means and STDEVs as variables
meltDF <- melt(activityRegDF, id = c("SubjectID", "Activity"), names(activityRegDF[ -c(1, 2)]))
tidyTrainTest <- dcast(meltDF, SubjectID + Activity ~ variable, mean)

print("Save tidy data to ActivityRecognitionTrainTest.txt.")
# Write to file
write.table(tidyTrainTest, file = "./ActivityRecognitionTrainTest.txt")