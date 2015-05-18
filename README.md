# Get_and_CleanProject
Class project for the Getting and Cleaning Data course in the Coursera Data Scientist Specialization 

This project uses the Human Activity Recognition Using Smartphones Dataset
Version 1.0 which was dowloaded from this url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data and associated fles were downloaded on May 7, 2015 at 4:17pm EDT. 

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Some familiarty with the contents of that dataset is presumed in the description below.

There are 3 files asscoiated with this class project:

- readme.md  (this file)
- run_analysis.R
- CodeBook.md

run_analysis.R is a R script file that reads in the data from the following files in the Human Activity REcognition
Using Smartphones Dataset:

- 'features.txt': List of all features.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels
- 'test/subject_train.txt': Test group subjects who performed the activity for each window sample.
- 'train/subject_train.txt': Training group subjects who performed the activity for each window sample. 

These files must be present in the working directory for run_analysis.R to process correctly.

In addition, the contents of the dataset below are contained in the script file run_analysis.R:
- 'activity_labels.txt': Links the class labels with their activity name.
Since this data is built into the script, this file is not needed.

run_analysis.R combines subject and activity data with the frequency and time domain variables, but extracts only 66 of the original 561 vaiables. 
Only variables that measure mean or standard deviation are retained.
The tidy dataset containin this data is called:

HAR_tidy

The script also produces an addtional data table containing the means of each vaialbe by subject and activity.
This dataset is called:

ave_tidy

CodeBook.md is a codebook describing the data processed by run_analyis.R.