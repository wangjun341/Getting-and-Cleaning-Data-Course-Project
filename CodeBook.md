###Cleaning up the data
1. Using the download.file() to download the zip file,and using function unzip() to unzip the zip package,then entering into the workspace directory with setwd().
2. Reading the files,using the read.table() function,including activity_labels.txt, features.txt, train/X_train.txt, train/y_train.txt, train/subject_train.txt, test/X_test.txt, test/y_test.txt, test/subject_test.txt.
	- Then combine the "subject_train/test" with "y_train/test" and "X_train/test" to form a "train/test" with function cbind(). Since names of "train/test" had "(_" etc, rename the "train", using function make.names().
3. Unifying the "train" with "test" to form one "data", using function rbind()
4. Extracting only the measurements on the mean and standard deviation for each measurement:
	- 1)Find out name of columns  which have the word "mean" or "std", using function grep()(open the regular expression).
	- 2)Extract the measurements on the mean and standard deviation into "subset_data".
5. Usng descriptive activity names to name the activities in the data set:
	- 1)Combine the "activity lables" with "subset_data" to form a "subset_data_des", with "activity.id" as the key word with the function merge().
	- 2)Combine the column "subject" with "activity.name", adding a new variable "comname" into the "subset_data_des".
6. Creating a "tidy.txt" with the average of each variable for each activity and each subject:
	- 1)Extract the data into "sub_data", except for variables "subject", "activity.name", "activity.id" and "comname".
	- 2)Extract the "comname" of "subset_data_des" into "g".
	- 3)Divide the "subset_data_des" into the groups defined by "g", using function split(). Store results as a list "l".
	- 4)Form column means for the list "l" with function lapply() and colMeans(), storing results as "ll".
	- 5)Convert the "ll" list into a data frame "tidy", with function data.frame() and t().
	- 6)Add the variable "comname", which is rows' name, to the list with function sub().
7. Output the "tidy" into working directory in the name "tidy.txt" by function write.table(). Values in each row of "tidy" are separated by "|".

###Raw dataset includes following files
1. 'features.txt': List of all features incluing 561 features.
2. 'activity_labels.txt': Links the class labels with their activity names, including the 6 kinds of activities.
3. 'train/X_train.txt': Training set.
4. 'train/y_train.txt': Training labels, only one column, including the 6 kinds of activities of the subjucts.
5. 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
6. 'test/X_test.txt': Testing set.
7. 'test/y_test.txt': Testing labels, only one column, including the 6 kinds of activities of subjucts.
8. 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample, including 2,4,9,10,12,13,18,20,24.

###Variables of the "tidy" dataset
1. "comname":
	- 1) Before the dot,the number ranging from 1 to 30, means the subject who performed the activity for each window sample.
	- 2) After the dot, the word means activity name, including WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.

2. These signals were used to estimate variables of the feature vector for each pattern. '-XYZ' is used to denote 3-axial signals in the X, Y and Z dimensions:
	- tBodyAcc-XYZ
	- tGravityAcc-XYZ
	- tBodyAccJerk-XYZ
	- tBodyGyro-XYZ
	- tBodyGyroJerk-XYZ
	- tBodyAccMag
	- tGravityAccMag
	- tBodyAccJerkMag
	- tBodyGyroMag
	- tBodyGyroJerkMag
	- fBodyAcc-XYZ
	- fBodyAccJerk-XYZ
	- fBodyGyro-XYZ
	- fBodyAccMag
	- fBodyAccJerkMag
	- fBodyGyroMag
	- fBodyGyroJerkMag

3. The set of variables that were estimated from these signals are: 
	- mean(): Mean value
	- std(): Standard deviation

4. Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
	- gravityMean
	- tBodyAccMean
	- tBodyAccJerkMean
	- tBodyGyroMean
	- tBodyGyroJerkMean

5. Data of "tidy" dataset
	- The average of each variable for each activity and each subject. 
