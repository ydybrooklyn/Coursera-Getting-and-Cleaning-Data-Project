#1.Merges the training and the test sets to create one data set.

#(1) Read the data sets of train and test.
train_D <- read.table("C:/Users/Diana/Documents/R/UCI HAR Dataset/train/X_train.txt")
train_L <- read.table("C:/Users/Diana/Documents/R/UCI HAR Dataset/train/y_train.txt")
train_S <- read.table("C:/Users/Diana/Documents/R/UCI HAR Dataset/train/subject_train.txt")
test_D <- read.table("C:/Users/Diana/Documents/R/UCI HAR Dataset/test/X_test.txt")
test_L <- read.table("C:/Users/Diana/Documents/R/UCI HAR Dataset/test/y_test.txt")
test_S <- read.table("C:/Users/Diana/Documents/R/UCI HAR Dataset/test/subject_test.txt")

#(2) Merge the data sets into one.
train <- cbind(train_S, train_L, train_D)
test <- cbind(test_S, test_L, test_D)
train_test <- rbind(train, test)

#2.Extracts only the measurements on the mean and standard deviation for each measurement.

#(1) Read the data sets of activity_labels and features.
activity_Labels <- read.table("C:/Users/Diana/Documents/R/UCI HAR Dataset/activity_labels.txt")
features <- read.table("C:/Users/Diana/Documents/R/UCI HAR Dataset/features.txt")

#(2) Extract only the data on mean and standard deviation in features.
mean_std <- grep("mean\\(\\)|std\\(\\)", features[,2])
mean_std_labels <- features[mean_std,2]
mean_std_labels <- gsub('-mean', 'Mean', mean_std_labels)
mean_std_labels <- gsub('-std', 'Std', mean_std_labels)
mean_std_labels <- gsub('[-()]', '', mean_std_labels)

#3.Uses descriptive activity names to name the activities in the data set

#(1) Assign the labels on top of the columns in descriptive way.
colnames(train_test) <- c("subject_N", "activity_N", mean_std_labels)

#4.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
train_test_2nd <- aggregate(. ~subject_N + activity_N, train_test, mean)
train_test_2nd <- train_test_2nd[order(train_test_2nd$subject, train_test_2nd$activity),]

#5.create txt of the 2nd data set.
write.table(train_test_2nd, "train_test_2nd", row.name=FALSE)

