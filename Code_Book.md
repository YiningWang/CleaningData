# Code Book

This code book summarizes the resulting data fields in ```TidyDataSet.txt```.

### 1. Merging the training and the test sets to create one data set:

1.1 Creating corresponding dataset from each of the source file

* x_train 
* y_train 
* subject_train 
* x_test 
* y_test 
* subject_test 

1.2 Loading feature and activity labels.
Correct column names are extracted from features vectors and activitlabels will be appended to the final datasets

* Features  
* ActivityLabels  

1.3 Assigning column names to the full data loaded
* Subjects dataset will be assgined ```SubjectID```
* X_train/X_test dataset will be assigned ```features```
* Y_train/Y_test dataset will be assigned ```activityid```

1.4 Merging all data in one set using ```rbind```

### 2. Extracting only the measurements on the mean and standard deviation for each measurement:

2.1 Create vector for defining ID, mean and standard deviation and store the desired column names in ```mean_and_std```:

2.2 Extract only the data on mean and standard deviation using the vector defined above

### 3. Using descriptive activity names to name the activities in the data set:
3.1 Append activitiy labels to the sub-dataset of selected mean and standard fields

### 4. Appropriately labeling the data set with descriptive variable names:

* Correct '-mean'with 'Mean' 
* Correct '-std'with 'Std' 
* Correct '[-()]'with '' 

### 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject:

5.1 Create tidy data set 
Generate a new dataset with all the average measures for each subject and activity type

5.1 Writing tidy data set in txt file
Upload the tidy data set as a txt file created with write.table() using row.name=FALSE 

