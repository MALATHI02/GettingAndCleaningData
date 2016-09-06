---
title: "run_analaysis.R R script for tidy and analysis"
output: github_document
---

## Project Description

The run_analysis.R script reads data from the "Human Activity Recognition Using Smartphones Dataset Version 1.0" and produces a new - tidy - dataset which may be used for further analysis.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## Data files
The original data set included the following files
- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'test/subject_test.txt': ID's of subjects in the training data


## Script Overview
The run_analysis.R script merges data from number of text(.txt) files and created a tidy set
* Create a dir(ucidata) and download the files

*Read test , train , feature and label data

*Assign descriptive column names

*Merge the train and test sets

*Grep function extracts mean and std columns with activityId and subjectId to create a new data frame.

*"merge" function merges the labels with the data sets

* Use the aggregate to group by subjectId and activityId

*Write the data to TidySet.txt


