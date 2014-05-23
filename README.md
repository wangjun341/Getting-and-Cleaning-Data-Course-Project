This script is for the course project of Getting and Cleaning Data on the website of coursera.org. The script is set to fulfill these 5 targets:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive activity names. 
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

At the beginning of the script, a paragraph of code is added to download the original data zip file from the website provided, the unzip the raw data in the workspace and set a new workspace.
The raw data contains following information:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment. 

To obtain the desired tidy dataset, one should run the script as a whole.