Getting and Cleaning Data usig R
=============================================================================================
This repo contains the analysis of the "Human Activity Recognition Using Smartphones" Dataset
The steps followed for collecteing this dataset are described below:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

This repo includes the following files:
=========================================

1. readme.md
2. finalData.csv- tidy data set csv
3. finalData.txt- tidy data set txt
4. codebook.pdf- explains all the variables ithe tidy data sets 
5. run_analysis.R- script for modifying the data

Description of the run_analysis.R script in this repo.
======================================================
The steps followed in run_analysis.R are described below:

1. The files that have been read into R are: X_test, y_test, subject_test, X_train, y_train, subject_train, features.
2. Converted y_test to 'readable' labels to get ytestf.
3. Merged X_test with ytestf using cbind and then merge with subjecttest.
4. Repeated steps 2 and 3 for trainig data.
5. Merged the training and test data together using rbind.
6. Used factor() on features.txt and modified the variable names.
7. Extracted columns (into a new data frame) that measure mean and standard deviation.
8. Took the average by subject and activity of this new data frame using aggregate().

Important points to note:
=========================

1. The finalData.txt and finalData.csv files have 180 rows and 81 columns.

2. After selecting values having only "mean" and "std" in their names I was left with 79 columns. I could have removed the thirteen columns having meanFreq() as variable names as these are not actual names. But, since they were not harming the final analysis in any way, I have let the total number of variables be 79. Two extra columns "subject" and "activity" have been added, thus making total columns 81.

3. I have left the names of the variables as they are in the features.txt document as I faced no problem using the names as they are.

4. The size of finalData.txt file is 263 kB.


