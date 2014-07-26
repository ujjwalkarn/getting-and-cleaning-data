This readme is a description og the run_analysis.R script in this repo.

Tidy Data: finalData.csv, finalData.txt

The steps followed in run_analysis.R are described below:

1. The files that have been read into R are: X_test, y_test, subject_test, X_train, y_train, subject_train, features.
2. Converted y_test to 'readable' labels to get ytestf.
3. Merged X_test with ytestf using cbind and then merge with subjecttest.
4. Repeated steps 2 and 3 for trainig data.
5. Merged the training and test data together using rbind.
6. Used factor() on features.txt and modified the variable names.
7. Extracted columns (into a new data frame) that measure mean and standard deviation.
8. Took the average by subject and activity of this new data frame using aggregate().

Note:

1. The finalData.txt and finalData.csv files have 180 rows and 81 columns.

2. After selecting values having only "mean" and "std" in their names I was left with 79 columns. I could have removed the     thirteen columns having meanFreq() as variable names as these are not actual names. But, since they were not harming the    final analysis in any way, I have let the total number of variables be 79. Two extra columns "subject" and "activity"       have been added, thus making total columns 81.

3. I have left the names of the variables as they are in the features.txt document as I faced no problem using the names as    they are.

4. The size of finalData.txt file is 263 kB.


