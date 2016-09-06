#Create dir and unzip the files
if(!file.exists("./ucidata")){dir.create("./ucidata")}
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileUrl,destfile="./ucidata/Dataset.zip")
unzip(zipfile="./ucidata/Dataset.zip",exdir="./ucidata")

#Read train data
x_train <- read.table("./ucidata/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./ucidata/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./ucidata/UCI HAR Dataset/train/subject_train.txt")

#Read test data
x_test <- read.table("./ucidata/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./ucidata/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./ucidata/UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector:
features <- read.table('./ucidata/UCI HAR Dataset/features.txt')

# Read activity labels
activityLabels = read.table('./ucidata/UCI HAR Dataset/activity_labels.txt')

#Assign column names
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

#Merges the training and the test sets to create one data set.
mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
mrg_all <- rbind(mrg_train, mrg_test)

#Extracts only the measurements on the mean and standard deviation for each measurement
colNames <- colnames(mrg_all)

 #Vector for standard dev, mean and Id column names
meanstd <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)
 #Merge column names with data
MeanStdAll <- mrg_all[ , meanstd == TRUE]

 #Uses descriptive activity names to name the activities in the data set
setWithActivityLabels <- merge(MeanStdAll, activityLabels,
                              by='activityId',
                              all.x=TRUE)

#creates a second, independent tidy data set with the average of each variable for each activity and each subject
TidySet <- aggregate(. ~subjectId + activityId + activityType, setWithActivityLabels, mean)
TidySet <- TidySet[order(TidySet$subjectId, TidySet$activityId),]

#Write the data to a text file
write.table(TidySet, "TidySet.txt", row.name=FALSE)