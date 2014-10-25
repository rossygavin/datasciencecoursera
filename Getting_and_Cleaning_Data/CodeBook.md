## This is a code book that describes the variables, the data, and transformations/work that have been performed to clean up the data.

# The run_analysis.R script:

The run_analysis.R script does the following 6 things: 
1.Merges the training and the test sets.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Adds descriptive activity names to name the activities in the data set.
4.Adds appropriate labels to the data set with descriptive variable names. 
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6.Writes this new clean dataset to a csv file. 

# Information on the dataset used
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six 
activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows 
of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, 
was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency 
components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables 
from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


# Explanation of variables in the new data set "UCI_HAR_Tidy_Dataset.csv" and processes to transform it

561 features are taken from the dataset. This contains 560 measurements and a subject identifier.
We extract the mean and standard deviation features. This leaves us with 33 mean and 33 standard
deviations features.

We add an extra column to the table which is an activity label to effectively describe each activity.
We then add activity labels with descriptive activity names.

In the final part a new tidy dataset is created. This contains the average of each variable for
each activity and each subject.
 
10299 instances are split into 180 groups. This is made up of 30 subjects and 6 activities along with 66 mean and standard deviation features being
averaged for each group. The final table has 180 rows and 66 columns.

The new dataset is then exported to "UCI_HAR_Tidy_Dataset.csv".

