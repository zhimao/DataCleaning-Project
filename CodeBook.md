## Synopsis
This is a codebook for  Data Cleaning class week 4 assignment.

### Assignment: Getting and Cleaning Data Course Project
The code book describes the variables, the data, and any transformations performed to clean up the data. 

### Action taken for the data
* Download the data. 
* Reads in data. 
* Clan and combine data. 
* Marshall data to include the required format and info.   

### Thought process 
* First is to read the README file to get background and information about the data. 
* Browse the data directory for to see how the data is structured and understand which file contains what for what purposes.
  * We can see there are test directory and train directory. 
  * In both test and train directory, there is a 
    * Subject_ file   - Numbers from 1 to 30. Based on README, there are 30 volunteers for the experiment. This indicates the subject who was doing the experiment test. 
    * X_ file    - A list of numeric number. It the feature measurement data. 
    * Y_ file    - Numbers from 1 to 5. This is indicates activitis as number. 
  * Top level files
    * feature.txt - Based on feature info, they are measurements. Bacially variables which can be map to X_ file as column names.
    * activity_labels - Numbers from 1 to 5 which can map to Y_file and has a column of activity name.
    * Count of rows in file train + test is the same for each catergory. For example, the (train.X row count + test.X row count) == (train.Y row count + test.Y row count). And this number is equal to (subject_train count + subject_test count). This also indicated by README that 30 percent of the data was used to generate "test" data and 70 percent of the data was used to generate "train" data. So we could merge them "test" and "train" data and get the whole picture. 
    * Now we also know that activity(Y_ file) and subject are also variables for the tidy data.  
* Decide which file to read in as datatable and how to read it. 
  * actvitiy_label.txt 
  * test/subject_test.txt
  * test/X_test.txt
  * test/Y_test.txt
  * train/subject_train.txt
  * train/X_train.txt
  * train/Y_train.txt
  * Use read.table()
  * There is no header to skip
* Decide which file contains the data column names.
 * features.txt
* Now, we have a few datatables. Now we need to do some cleaning based on requirement
 * Combind train and test datatables. 
 * Map activity label to activities. 
 * Add Subject and activities to combine feature measurements data. 

### High level workflow
* Read measurement data, train and test 
  * X_train.txt, X_test.txt.
* Read subject train and test and set SubjectID as column name. 
  * subject_train.txt, subject_test.txt
* Read activity and set ActivityID as column name
  * Y_train.txt, Y_test.txt
* Read activity names
 * activity_labels.txt
* Combine train data and test data
* Filter column names that is only for mean and std
* Subsetting on colnames that is mean and std
* Make column names more readable
* Combine subject, activity, and measurement to one datatable
* Write dataframe to file

### List of variables 
SubjectID is the identify of the person who conducted the experiment.

Activity is what user are doing when conducting the experiment.

The rest are features measure data for mean and standard devication.  
#### Decode the measurement data names
* Features measurement are normalized and bounded within [-1,1].
* Features can be time domain singal or fequrency domain singal. It is indicated by names as "Time" and "Frequency". 
* Features name contains "Gyro" indicates angular velocity for for each window sample. The units are radians/second.
* The acceleration signal is in standard gravity units 'g'.


```
"SubjectID"  - Ingeter. Range from 1 to 30. Subject identifier.                         
"Activity"   - Factor with 6 levels "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING". What subject is doing while collecting the data.        
"TimeBodyAcceleration.Mean.X" - numeric     
"TimeBodyAcceleration.Mean.Y" - numeric          
"TimeBodyAcceleration.Mean.Z" - numeric           
"TimeBodyAcceleration.STDEV.X" - numeric     
"TimeBodyAcceleration.STDEV.Y" - numeric     
"TimeBodyAcceleration.STDEV.Z" - numeric       
"TimeGravityAcceleration.Mean.X" - numeric     
"TimeGravityAcceleration.Mean.Y" - numeric     
"TimeGravityAcceleration.Mean.Z" - numeric     
"TimeGravityAcceleration.STDEV.X" - numeric    
"TimeGravityAcceleration.STDEV.Y" - numeric    
"TimeGravityAcceleration.STDEV.Z" - numeric    
"TimeBodyAccelerationJerk.Mean.X" - numeric            
"TimeBodyAccelerationJerk.Mean.Y" - numeric             
"TimeBodyAccelerationJerk.Mean.Z" - numeric             
"TimeBodyAccelerationJerk.STDEV.X" - numeric           
"TimeBodyAccelerationJerk.STDEV.Y" - numeric             
"TimeBodyAccelerationJerk.STDEV.Z" - numeric            
"TimeBodyGyro.Mean.X" - numeric               
"TimeBodyGyro.Mean.Y" - numeric                
"TimeBodyGyro.Mean.Z" - numeric                
"TimeBodyGyro.STDEV.X" - numeric              
"TimeBodyGyro.STDEV.Y" - numeric               
"TimeBodyGyro.STDEV.Z" - numeric               
"TimeBodyGyroJerk.Mean.X" - numeric           
"TimeBodyGyroJerk.Mean.Y" - numeric            
"TimeBodyGyroJerk.Mean.Z" - numeric            
"TimeBodyGyroJerk.STDEV.X" - numeric      
"TimeBodyGyroJerk.STDEV.Y" - numeric          
"TimeBodyGyroJerk.STDEV.Z" - numeric          
"TimeBodyAccelerationMag.Mean" - numeric              
"TimeBodyAccelerationMag.STDEV" - numeric              
"TimeGravityAccMag.Mean" - numeric           
"TimeGravityAccMag.STDEV" - numeric         
"TimeBodyAccelerationJerkMag.Mean" - numeric            
"TimeBodyAccelerationJerkMag.STDEV" - numeric          
"TimeBodyGyroMag.Mean" - numeric              
"TimeBodyGyroMag.STDEV" - numeric              
"TimeBodyGyroJerkMag.Mean" - numeric           
"TimeBodyGyroJerkMag.STDEV" - numeric        
"FrequencyBodyAcceleration.Mean.X" - numeric   
"FrequencyBodyAcceleration.Mean.Y" - numeric  
"FrequencyBodyAcceleration.Mean.Z" - numeric  
"FrequencyBodyAcceleration.STDEV.X" - numeric  
"FrequencyBodyAcceleration.STDEV.Y" - numeric 
"FrequencyBodyAcceleration.STDEV.Z" - numeric 
"FrequencyBodyAccelerationJerk.Mean.X" - numeric        
"FrequencyBodyAccelerationJerk.Mean.Y" - numeric       
"FrequencyBodyAccelerationJerk.Mean.Z" - numeric      
"FrequencyBodyAccelerationJerk.STDEV.X" - numeric       
"FrequencyBodyAccelerationJerk.STDEV.Y" - numeric       
"FrequencyBodyAccelerationJerk.STDEV.Z" - numeric      
"FrequencyBodyGyro.Mean.X" - numeric           
"FrequencyBodyGyro.Mean.Y" - numeric          
"FrequencyBodyGyro.Mean.Z" - numeric          
"FrequencyBodyGyro.STDEV.X" - numeric        
"FrequencyBodyGyro.STDEV.Y" - numeric         
"FrequencyBodyGyro.STDEV.Z" - numeric        
"FrequencyBodyAccelerationMag.Mean"  - numeric         
"FrequencyBodyAccelerationMag.STDEV" - numeric         
"FrequencyBodyBodyAccelerationJerkMag.Mean" - numeric 
"FrequencyBodyBodyAccelerationJerkMag.STDEV" - numeric
"FrequencyBodyBodyGyroMag.Mean" - numeric      
"FrequencyBodyBodyGyroMag.STDEV" - numeric    
"FrequencyBodyBodyGyroJerkMag.Mean" - numeric 
"FrequencyBodyBodyGyroJerkMag.STDEV" - numeric   

```

## Reference 
Data used for this project: [Human Activity Recognition Using Smartphones Data Set ] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)
