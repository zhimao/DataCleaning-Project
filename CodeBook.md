## Synopsis
This is a codebook for  Data Cleaning class week 4 assignment. 

### Assignment: Getting and Cleaning Data Course Project
You should create one R script called run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Thought process 
### How to clean data
* First is to read the README file. 
* Browse the data directory for to see how the data is structured and understand which file contains what for what purposes. 
  * We can see there is test dir and train dir. 
  * For each test and train directory, there is 
    * Subject   - Numbers from 1 to 30. Based on readme, ther are 30 party for the exercises. This indicates the person that doing the test. 
    * X file    - A bunch of numeric number. Must be measturement data
    * Y file    - Numbers from 1 to 5. This is activity data
  * Top level has some files
    * feature.txt - Based on feature info, they are measurements. This is like variables which could be column names.
    * activity_labels - Numbers 1 to 5 with activity name. This must be related to the Y file
    * Count of rows in file train + test is the same for each catergory. For example, the (train.X row count + test.X row count) == (train.Y row count + test.Y row count). And this number is equal to (subject_train count + subject_test count). This also indicated by readme that 30 percent of the data is put to "test" and 70 percent of the data is put to "train". So we could merge them "test" and "train" data. 
    * Now we also know that activity(y file) and subject are also variables for the tidy data.  
* Decide which file to read in as datatable and how to read it. 
  * All txt files, so use read.table()
  * There is no header to skip
* Decide which file contains the data column names. 
* 

### High level workflow
* Read measurement data, train and test 
  * X_train.txt, X_test.txt.
* Read subject train and test and set SubjectID as column name. 
  * subject_train.txt, subject_test.txt
* Read activity and set ActivityID as column name
  * Y_train.txt, Y_test.txt
* Read activity names
* Bind train data and test data
* Get column names that is man and std
* Subsetting on colnames that is mean and std
* Make column names more readable
* Bind columns to one datatable
* Write dataframe to file

### Data column names 
From column 3 to the rest is all num type.
```
"SubjectID"  - ingeter. Range from 1 to 5. Subject identifier                        
"Activity"   - Factor with 6 levels "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"                     
"TimeBodyAcceleration.Mean.X" - num     
"TimeBodyAcceleration.Mean.Y" - num          
"TimeBodyAcceleration.Mean.Z" - num           
"TimeBodyAcceleration.STDEV.X"      
"TimeBodyAcceleration.STDEV.Y"       
"TimeBodyAcceleration.STDEV.Z"       
"TimeGravityAcceleration.Mean.X"    
"TimeGravityAcceleration.Mean.Y"     
"TimeGravityAcceleration.Mean.Z"     
"TimeGravityAcceleration.STDEV.X"   
"TimeGravityAcceleration.STDEV.Y"    
"TimeGravityAcceleration.STDEV.Z"    
"TimeBodyAccJerk.Mean.X"            
"TimeBodyAccJerk.Mean.Y"             
"TimeBodyAccJerk.Mean.Z"             
"TimeBodyAccJerk.STDEV.X"           
"TimeBodyAccJerk.STDEV.Y"            
"TimeBodyAccJerk.STDEV.Z"            
"TimeBodyGyro.Mean.X"               
"TimeBodyGyro.Mean.Y"                
"TimeBodyGyro.Mean.Z"                
"TimeBodyGyro.STDEV.X"              
"TimeBodyGyro.STDEV.Y"               
"TimeBodyGyro.STDEV.Z"               
"TimeBodyGyroJerk.Mean.X"           
"TimeBodyGyroJerk.Mean.Y"            
"TimeBodyGyroJerk.Mean.Z"            
"TimeBodyGyroJerk.STDEV.X"          
"TimeBodyGyroJerk.STDEV.Y"           
"TimeBodyGyroJerk.STDEV.Z"           
"TimeBodyAccMag.Mean"               
"TimeBodyAccMag.STDEV"               
"TimeGravityAccMag.Mean"             
"TimeGravityAccMag.STDEV"           
"TimeBodyAccJerkMag.Mean"            
"TimeBodyAccJerkMag.STDEV"           
"TimeBodyGyroMag.Mean"              
"TimeBodyGyroMag.STDEV"              
"TimeBodyGyroJerkMag.Mean"           
"TimeBodyGyroJerkMag.STDEV"         
"FrequencyBodyAcceleration.Mean.X"   
"FrequencyBodyAcceleration.Mean.Y"   
"FrequencyBodyAcceleration.Mean.Z"  
"FrequencyBodyAcceleration.STDEV.X"  
"FrequencyBodyAcceleration.STDEV.Y"  
"FrequencyBodyAcceleration.STDEV.Z" 
"FrequencyBodyAccJerk.Mean.X"        
"FrequencyBodyAccJerk.Mean.Y"        
"FrequencyBodyAccJerk.Mean.Z"       
"FrequencyBodyAccJerk.STDEV.X"       
"FrequencyBodyAccJerk.STDEV.Y"       
"FrequencyBodyAccJerk.STDEV.Z"      
"FrequencyBodyGyro.Mean.X"           
"FrequencyBodyGyro.Mean.Y"           
"FrequencyBodyGyro.Mean.Z"          
"FrequencyBodyGyro.STDEV.X"        
"FrequencyBodyGyro.STDEV.Y"          
"FrequencyBodyGyro.STDEV.Z"         
"FrequencyBodyAccMag.Mean"           
"FrequencyBodyAccMag.STDEV"          
"FrequencyBodyBodyAccJerkMag.Mean"  
"FrequencyBodyBodyAccJerkMag.STDEV"  
"FrequencyBodyBodyGyroMag.Mean"      
"FrequencyBodyBodyGyroMag.STDEV"    
"FrequencyBodyBodyGyroJerkMag.Mean"  
"FrequencyBodyBodyGyroJerkMag.STDEV"  - num   

```
