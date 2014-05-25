

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", dest="wearabledata.zip", method="curl")

setwd("/home/jmorris/workspace/learnR/gettingAndCleaning/UCI HAR Dataset")



You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.

```{r}
# test set
test_subjects <- read.table("test/subject_test.txt")
colnames(test_subjects) = c("subject")
test_vars <- read.table("test/X_test.txt")
vars_names <- read.table("features.txt")
colnames(test_vars) <- vars_names$V2
test_labels <- read.table("test/y_test.txt")
label_names <- read.table("activity_labels.txt")
colnames(test_labels) <- c("activity_label")
colnames(label_names) <- c("activity_label", "activity_name")
test_label_frame <- merge(test_labels, label_names, by = "activity_label")
activity_test <-cbind(test_subjects, test_vars, test_label_frame)
# training set
train_subjects <- read.table("train/subject_train.txt")
colnames(train_subjects) = c("subject")
train_vars <- read.table("train/X_train.txt")
vars_names <- read.table("features.txt")
colnames(train_vars) <- vars_names$V2
train_labels <- read.table("train/y_train.txt")
label_names <- read.table("activity_labels.txt")
colnames(train_labels) <- c("activity_label")
colnames(label_names) <- c("activity_label", "activity_name")
train_label_frame <- merge(train_labels, label_names, by = "activity_label")
activity_train <-cbind(train_subjects, train_vars, train_label_frame)
#combine
activity <- rbind(activity_test, activity_train)


```

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

```{r}
means_and_sds <- activity[,grep("std|mean|activity_label|activity_name|subject", colnames(activity), ignore.case=TRUE)]
```

3. Uses descriptive activity names to name the activities in the data set

> completed in step 1


4. Appropriately labels the data set with descriptive activity names. 

> completed in step 1

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

```{r}
tidy <- aggregate(. ~ subject + activity_label, data = activity, FUN = "mean")
```
