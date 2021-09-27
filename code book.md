Getting and Cleaning Data Course Project-Code Book
1. The files:
train_D - X_train.txt
train_L - y_train.txt
train_S - subject_train.txt
test_D - X_test.txt
test_L - y_test.txt
test_S - subject_test.txt
activity_Labels - activity_Labels.txt
features - features.txt
2. The data sets merged
train: consisted of train_S, train_L and train_D (by column)
test:consisted of test_S, test_L, test_D (by column)
train_test: train+test (by row)
3. mean_std - the mean and standard deviation.
 mean_std_labels - replace the "mean", "std" with "Mean" and "Std" respectively, and remove the parentheses and hyphens.
4. train_test_2nd: a second, independent tidy data set with the average of each variable for each activity and each subject.