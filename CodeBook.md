Code book for Coursera Getting and Cleaning Data course project

Raw Data
Source of Raw Data for this project is  data collected from Accelerometers and Gyrometers attached to the Samsung Galaxy S Smartphones

The data file location is at  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The details of the Raw Data is provided at the following location:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The Raw Data Signal includes the TriAxial accelerations received from the Accelerometer and TriAxial Angular Velocity from gyrometers.
Tri Axial Features vector derived from the tri axial data and captured in X file

Each Row of  X file represents the observations for a given subject.
Each Row  of y file represents the activity corresponding to Each Row of X
Each Row of   subject file represents the subject on which the Experiment was performed and observations taken.

The data of interest is the features data derived from raw data.

The features.txt file provides the details of the features (561 attributes) for each record of observation.

activity_labels.txt file provides the details of the activities description and the corresponding activityCode.


Data Transformation and Load:

Test and Train Data is loaded from the file system into R environment.
Data loaded is subject,features and activity.
Test and Train Data is merged into the data tables.

Each row of the merged data represents the subject,activity and the features that compute the mean and standard deviations on the raw data.
Transformation includes the following tasks:

a. Extract only the measurements on the mean and standard deviation for each measurement.
   Filters the column header using grepl command 
b. Use descriptive activity names to name the activities in the data set
c. Appropriately label the data set with descriptive variable names.
d. Use the dplyr package to group the merged data from data.table based on subject and activity and compute the mean for each feature in the group.




 



