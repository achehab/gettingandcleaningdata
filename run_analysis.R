# run_analysis.R
# November 19, 2014
# This will read the training and the test sets to create one data set
# Only the measurements on the mean and standard deviation for each measurement will be included
# Descriptive activity names will be used
# Descriptive variable names will be used

#load dplyr library
library(dplyr)
 
# read features data
featuredata <-read.table("./UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)

#create a vector for descriptive unique variable name for each feature eg Feature_1_tBodyAcc-mean()-X
variableNames <- mutate(featuredata,col_name1=paste("Feature_",(paste(V1,V2,sep="_")),sep=""))

#read activity labels
activity_label <-read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors = FALSE)

#change the column name from V1 = "activity_id" and V2 ="activity name"
colnames(activity_label) <- c("activity_id","activity_name")

# read the test data set
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt",stringsAsFactors = FALSE)

#read the test labels
test_label <- read.table("./UCI HAR Dataset/test/Y_test.txt",stringsAsFactors = FALSE)

#change the variable/column name from V1 to activity_id
colnames(test_label) <- c("activity_id")

#read the test subject
test_subject <-read.table("./UCI HAR Dataset/test/subject_test.txt",stringsAsFactors = FALSE)

#change the column name to subject_id
colnames(test_subject) <- c("subject_id")

#change the column name of test data to the unique descriptive variable Name created in the new column 
colnames(test_data) <- variableNames[,3]

#select only the measurement of mean from test data
test_mean <- select(test_data, contains("mean"))

#select only the measurement of std from test data
test_std <- select(test_data, contains("std"))

#combined the mean and std data
test_new <- cbind(test_mean,test_std)

#link the activity name to the class label
ac_label <- merge(activity_label,test_label,by.x="activity_id",by.y = "activity_id",all=TRUE)

#combined the class label data and activity name to the test data
test_new <- cbind(ac_label,test_new)

#combined the test subject data to the test mean data
test_new <- cbind(test_subject,test_new)

#process the train data set
# read the test data set
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt",stringsAsFactors = FALSE)

#read the test labels
train_label <- read.table("./UCI HAR Dataset/train/Y_train.txt",stringsAsFactors = FALSE)

#change the variable/column name from V1 to activity_id
colnames(train_label) <- c("activity_id")

#read the test subject
train_subject <-read.table("./UCI HAR Dataset/train/subject_train.txt",stringsAsFactors = FALSE)

#change the column name to subject_id
colnames(train_subject) <- c("subject_id")

#change the column name of test data to the unique descriptive variable Name created in the new column 
colnames(train_data) <- variableNames[,3]

#select only the measurement of mean from test data
train_mean <- select(train_data, contains("mean"))

#select only the measurement of std from test data
train_std <- select(train_data, contains("std"))

#combined the mean and std data
train_new <- cbind(train_mean,train_std)

#link the activity name to the class label
ac_train_label <- merge(activity_label,train_label,by.x="activity_id",by.y = "activity_id",all=TRUE)

#combined the class label data and activity name to the test data
train_new <- cbind(ac_train_label,train_new)

#combined the train subject data to the train mean data
train_new <- cbind(train_subject,train_new)

#combined the test and train data
data_complete < rbind(test_new,train_new)


#write the new tabel to a new file
write.table(data_complete,file ="data_complete.txt",row.name=FALSE)

