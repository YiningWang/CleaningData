# 1. Merging the training and the test sets to create one data set:

# Load the datasets
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Load feature and activity labels:
features <- read.table('./UCI HAR Dataset/features.txt')
activityLabels = read.table('./UCI HAR Dataset/activity_labels.txt')

# Assigning column names to the data loaded:
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
colnames(activityLabels) <- c('activityId','activityType')

# Merging all data in one set:
merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
all_data <- rbind(mrg_train, mrg_test)

# 2. Extracting only the measurements on the mean and standard deviation for each measurement

# Create vector for defining ID, mean and standard deviation:
mean_and_std <- grep(".*mean.*|.*std.*", features[,2])

# Extract only the data on mean and standard deviation
setForMeanAndStd <- all_data[ , mean_and_std == TRUE]

# 3. Using descriptive activity names to name the activities in the data set:
setWithActivityNames <- merge(setForMeanAndStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)

# 4. Appropriately labeling the data set with descriptive variable names.
mean_and_std.names <- features[mean_and_std,2]
mean_and_std.names = gsub('-mean', 'Mean', mean_and_std.names)
mean_and_std.names = gsub('-std', 'Std', mean_and_std.names)
mean_and_std.names <- gsub('[-()]', '', mean_and_std.names)


# 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject:

# Create tidy data set 
secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]

# Writing tidy data set in txt file
write.table(secTidySet, "TidyDataSet.txt", row.name=FALSE)

