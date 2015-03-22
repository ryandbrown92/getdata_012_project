#************
#Section 1: load data
#************

#load the test files
X_test <- read.table("./Data/test/X_test.txt", header = FALSE)
y_test <- read.table("./Data/test/y_test.txt", header = FALSE)
subject_test <- read.table("./Data/test/subject_test.txt", header = FALSE)

#load the train files
X_train <- read.table("./Data/train/X_train.txt", header = FALSE)
y_train <- read.table("./Data/train/y_train.txt", header = FALSE)
subject_train <- read.table("./Data/train/subject_train.txt", header = FALSE)

#load the column labels and activity index
features <- read.table("./Data/features.txt", header = FALSE)
activity_labels <- read.table("./Data/activity_labels.txt", header = FALSE)

col_labels <- sapply(features[[2]], as.character)

#************
#Section 2: data formatting
#************

# rename column names of test set
names(X_test) <- col_labels
names(y_test) <- c("activityLabel")
names(subject_test) <- c("subjectID")

# rename column names of train set
names(X_train) <- col_labels
names(y_train) <- c("activityLabel")
names(subject_train) <- c("subjectID")

# change activity indicator into the text value it indicates
index_to_name <- function(x) activity_labels[as.integer(x),2]
y_test <- sapply(y_test, index_to_name)
y_train <- sapply(y_train, index_to_name)

#************
#Section 3: generate full table
#************


#join columns together for test and train set
testSet <- cbind(subject_test,y_test, X_test)
trainSet <- cbind(subject_train, y_train, X_train)

#merge test and train set into one data set
fullSet <- rbind(testSet, trainSet)

#get column indices of std() and mean() columns
std_ind <- grep("std()",names(fullSet))
mean_ind <- grep("mean()",names(fullSet))
ind_to_extract <- c(1,2, sort(c(std_ind, mean_ind))) #extract subject ID, activity ID, and std() and mean() values

#extract values
tidySet <- fullSet[ind_to_extract]

#remove all other values from workspace
rm(list=setdiff(ls(),"tidySet"))

#************
#Section 4: summarize data set
#************


#load dplyr for summarizing tidySet
library("dplyr")

# create group IDs
tidySet <- mutate(tidySet, IDbyactivity = paste(as.character(subjectID),as.character(activityLabel), sep=":"))
tidySet$IDbyactivity <- as.factor(tidySet$IDbyactivity)

# group by group ID IDbyactivity, drop id and activity columns as they cannot be meaningfully summarized
summarySet <- aggregate(tidySet, by = tidySet["IDbyactivity"], FUN = mean)
summarySet$subjectID <- NULL
summarySet$activityLabel <- NULL

# output summarySet data for uploading
write.table(summarySet, file = "step5.txt", row.name=FALSE)
