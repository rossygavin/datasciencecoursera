# This R script contains code to extract, merge and clean up the data for my Getting and Cleaning data 
# project with John Hopkins University through Coursera

library(plyr)

  #Read training and test data
  training_x <- read.table("data/UCI HAR Dataset/train/X_train.txt")
  training_y <- read.table("data/UCI HAR Dataset/train/y_train.txt")
  training_subject <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
  test_x <- read.table("data/UCI HAR Dataset/test/X_test.txt")
  test_y <- read.table("data/UCI HAR Dataset/test/y_test.txt")
  test_subject <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
  
  #Merge data
  x_merged <- rbind(training_x, test_x)
  y_merged <- rbind(training_y, test_y)
  subject_merged <- rbind(training_subject, test_subject)

  #Find mean and standard deviation for activities and add them to the new dataset
  features <- read.table("data/UCI HAR Dataset/features.txt")
  mean <- sapply(features[,2], function(x) grepl("mean()", x, fixed=T))
  std <- sapply(features[,2], function(x) grepl("std()", x, fixed=T))
  x_merged <- x_merged[, (mean | std)]

  #Add relevant column names to dataset
  colnames(x_merged) <- features[(mean | std), 2]

  # Add new column name "activity" to the dataset
  colnames(y_merged) <- "activity"

  # Add descriptive names for activities to the dataset
  y_merged$activity[y_merged$activity == 1] = "WALKING"
  y_merged$activity[y_merged$activity == 2] = "WALKING_UPSTAIRS"
  y_merged$activity[y_merged$activity == 3] = "WALKING_DOWNSTAIRS"
  y_merged$activity[y_merged$activity == 4] = "SITTING"
  y_merged$activity[y_merged$activity == 5] = "STANDING"
  y_merged$activity[y_merged$activity == 6] = "LAYING"

  #Adda column name "subject" to the dataset.
  colnames(subject_merged) <- c("subject")

  #Combine the three datasets to create a new clean dataset.
  combined_datasets <- cbind(x_merged, y_merged, subject_merged)

  # Create new tidied dataset
  tidy_dataset <- ddply(combined_datasets, .(subject, activity), function(x) colMeans(x[,1:60]))

  # Write dataset to file
  write.csv(tidy_dataset, "UCI_HAR_Tidy_Dataset.csv", row.names=FALSE)