gettingandcleaningdata
======================

Repository for Coursera - Getting and Cleaning Data

Extract the file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to the working directory

UCI HAR Dataset folder will be created

The script will use the following files from the main directory
  features.txt - contains the detailed description of the variables used in the data
  activity_labels.txt - contains the description of the activity
and read from train directory
  X-train.txt - train data set
  y_train.txt - label of train data set
  subject_train.txt
and read from test directory
  X-test.txt - train data set
  y_testn.txt - label of train data set
  subject_test.txt

Step 
1 .Script will read first the feature file to be used as a column name, because of duplicates the "Featue_" is added as prefix plus the column number eg Feature_1_tBodyAcc-mean()-X"1

2. Read the activity Label and change column names to "activity_id" and "activity_name"

3. Read test data and test label

4. Change column name of test label to activity_id

5. Read test subject and change column name to subject_id

6. Change all the column names of the test data to the names derived from features.txt to give a descriptive variable name

7. select only measurement of the mean from test data
8. select only measurement of the std from test data
9. combined the mean and std data from step7 and step 8
10. link the activity name to the activity label data
11. combined the mean and std data (frm step 9) and the activity label y_test
12. combined the mean and std data, activity label (from step 11) to the subject data
13. Read train data and train label
14. Change column name of train label to activity_id
15. Read train subject and change column name to subject_id
16. Change all the column names of the train data to the names derived from features.txt to give a descriptive variable name
17. select only measurement of the mean from train data
18. select only measurement of the std from test data
19. combined the mean and std data from step17 and step 18
20. link the activity name to the activity label data
21. combined the mean and std data (frm step 19) and the activity label y_train
22. combined the mean and std data, activity label (from step 21) to the subject data
23. combined the test and train data frin step 19 and step 22
24. group data by subject, activity id and activity name
25. compute mean of each column of  group (froms step 24)
26. write resulting table









