# getting-and-cleaning-data-course-project
The objective of the Project is to retrieve raw data and convert into Tidy Data.
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

Data is collected from Accelerometers and Gyrometers attached to the Samsung Galaxy S Smartphones attached to the subjects
who volunteered from the experiments.

Background of Source Data and Experiment
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 
50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% 
of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 
sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a 
Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore 
a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time 
and frequency domain.

Training and test data were first merged together to create one data set.
Out of the 561 attributes of the observation record Only those measurements were considered which captured mean and standard deviation of the observations 
for a given subject and and an activity. The attribute names  were cleaned up and  were made user friendly.
 
The measurements were averaged for each subject and activity and the final tidy dataset was used to generate a txt file.

Libraries used are dplyr and data.table

Tidy Data Set was created using run_analysis.R and the file name generated was tidyDataSet.txt