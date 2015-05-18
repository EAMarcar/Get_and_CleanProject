# Class Project for Getting and Cleaning Data
#
## Codebook Containing: Variables and Extraction Process for Human Activity Recognition Dataset 

##  Data Collection Description

SUMMARY: The purpose of this data extraction exercise was to extract data from the Human Activity Recognition Using Smartphones Dataset (HAR Dataset)
Version 1.0. The original data contained a 561-feature vector with time and frequency domain variables across 30 subjects and 6 activities.

The original data was dowloaded from this url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data and associated fles were downloaded on May 7, 2015 at 4:17pm EDT. 

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

DETAILS: run_analysis.R produces two datasets:
- The first combines the subject, activity and a subset (mean and standard deviation measures only) of the time and frequency domain variables from the original HAR dataset. 
- The second is a summary of the means of each slected variable by subject by activity

The script reads in the following files that are part of the HAR Dataset described above:

- 'features.txt': List of all features.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels
- 'test/subject_train.txt': Test group subjects who performed the activity for each window sample.
- 'train/subject_train.txt': Training group subjects who performed the activity for each window sample. 

Data from the activity_labels.txt file is contained in the script.

The original data contains for each record:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment 

This script reduces the 561 festures variables to only those containing mean or standard deviation measurements.
This subset contains 66 features variables.  

The resulting dataset is HAR_tidy with 68 variables (subject, activity and 66 measures of mean or standard deviation).  The slection was made by choosing variables with "mean" or "std" in the name. 
This included a set of variables labled "meanFreq" which are "the weighted average of the frequency components to obtain a mean frequency."  Since this was not strictly a mean or std,these were dropped.
The script is written in a such so that these can be easily included if that is required.

The HAR_tidy dataset is then summarized across subject and activity to produce a second datset. 
The second datset is ave_tidy.  It contains the same 68 variables, but the valuse of the measurements are the means of the HAR_tidy variable values summarized across sbject and activity.

## Datasets ##

## Output 1: HAR_tidy ##

Contents: 10299 rows; 68 variables:

Variable/values:		

- Subject
	- Value: 1-30  (subject identifier)

- Activity  
	- lying 
	- sitting
	- standing
	- walking,
	- walking_downstairs
	- walking_upstairs
	
*Note: Each of the following variables represents a measure of the sensor signals (accelerometer and gyroscope). See HAR Datsaset for more details.  Features are normalized and bounded within [-1,1]. Only variables representing mean or standard deviation have been selected.*

- tBodyAcc-mean()-X	
- tBodyAcc-mean()-Y	
- tBodyAcc-mean()-Z	
- tBodyAcc-std()-X	
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z
- tGravityAcc-mean()-X
- tGravityAcc-mean()-Y
- tGravityAcc-mean()-Z
- tGravityAcc-std()-X
- tGravityAcc-std()-Y
- tGravityAcc-std()-Z
- tBodyAccJerk-mean()-X
- tBodyAccJerk-mean()-Y
- tBodyAccJerk-mean()-Z
- tBodyAccJerk-std()-X
- tBodyAccJerk-std()-Y
- tBodyAccJerk-std()-Z
- tBodyGyro-mean()-X
- tBodyGyro-mean()-Y
- tBodyGyro-mean()-Z
- tBodyGyro-std()-X
- tBodyGyro-std()-Y
- tBodyGyro-std()-Z
- tBodyGyroJerk-mean()-X
- tBodyGyroJerk-mean()-Y
- tBodyGyroJerk-mean()-Z
- tBodyGyroJerk-std()-X
- tBodyGyroJerk-std()-Y
- tBodyGyroJerk-std()-Z
- tBodyAccMag-mean()
- tBodyAccMag-std()
- tGravityAccMag-mean()
- tGravityAccMag-std()
- tBodyAccJerkMag-mean()
- tBodyAccJerkMag-std()
- tBodyGyroMag-mean()
- tBodyGyroMag-std()
- tBodyGyroJerkMag-mean()
- tBodyGyroJerkMag-std()
- fBodyAcc-mean()-X
- fBodyAcc-mean()-Y
- fBodyAcc-mean()-Z
- fBodyAcc-std()-X
- fBodyAcc-std()-Y
- fBodyAcc-std()-Z
- fBodyAccJerk-mean()-X
- fBodyAccJerk-mean()-Y
- fBodyAccJerk-mean()-Z
- fBodyAccJerk-std()-X
- fBodyAccJerk-std()-Y
- fBodyAccJerk-std()-Z
- fBodyGyro-mean()-X
- fBodyGyro-mean()-Y
- fBodyGyro-mean()-Z
- fBodyGyro-std()-X
- fBodyGyro-std()-Y
- fBodyGyro-std()-Z
- fBodyAccMag-mean()
- fBodyAccMag-std()
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-std()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-std()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-std()

(end of HAR_tidy)

## Output 2: ave_tidy. ##

Contents: 180 rows; 68 variables:

Variables/values:    

- Subject
	- 1-30  (Subject identifier)
 
- Activity
	- lying
	- sitting
	- standing
	- walking 
	- walking_downstairs
	- walking_upstairs

*Note: the following variables measure the mean of the corresponding variable in the HAR_tidy datset summarized by subject and by activity (i.e. for each subject there are 6 rows, 1 per activity).*

- tBodyAcc-mean()-X	
- tBodyAcc-mean()-Y	 
- tBodyAcc-mean()-Z	 
- tBodyAcc-std()-X	
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z
- tGravityAcc-mean()-X
- tGravityAcc-mean()-Y
- tGravityAcc-mean()-Z
- tGravityAcc-std()-X
- tGravityAcc-std()-Y
- tGravityAcc-std()-Z
- tBodyAccJerk-mean()-X
- tBodyAccJerk-mean()-Y
- tBodyAccJerk-mean()-Z
- tBodyAccJerk-std()-X
- tBodyAccJerk-std()-Y
- tBodyAccJerk-std()-Z
- tBodyGyro-mean()-X
- tBodyGyro-mean()-Y
- tBodyGyro-mean()-Z
- tBodyGyro-std()-X
- tBodyGyro-std()-Y
- tBodyGyro-std()-Z
- tBodyGyroJerk-mean()-X
- tBodyGyroJerk-mean()-Y
- tBodyGyroJerk-mean()-Z
- tBodyGyroJerk-std()-X
- tBodyGyroJerk-std()-Y
- tBodyGyroJerk-std()-Z
- tBodyAccMag-mean()
- tBodyAccMag-std()
- tGravityAccMag-mean()
- tGravityAccMag-std()
- tBodyAccJerkMag-mean()
- tBodyAccJerkMag-std()
- tBodyGyroMag-mean()
- tBodyGyroMag-std()
- tBodyGyroJerkMag-mean()
- tBodyGyroJerkMag-std()
- fBodyAcc-mean()-X
- fBodyAcc-mean()-Y
- fBodyAcc-mean()-Z
- fBodyAcc-std()-X
- fBodyAcc-std()-Y
- fBodyAcc-std()-Z
- fBodyAccJerk-mean()-X
- fBodyAccJerk-mean()-Y
- fBodyAccJerk-mean()-Z
- fBodyAccJerk-std()-X
- fBodyAccJerk-std()-Y
- fBodyAccJerk-std()-Z
- fBodyGyro-mean()-X
- fBodyGyro-mean()-Y
- fBodyGyro-mean()-Z
- fBodyGyro-std()-X
- fBodyGyro-std()-Y
- fBodyGyro-std()-Z
- fBodyAccMag-mean()
- fBodyAccMag-std()
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-std()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-std()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-std()

(End of ave_tidy)

End of CodeBook.
