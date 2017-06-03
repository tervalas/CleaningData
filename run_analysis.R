run_analysis <- function() {

## run_analysis loads in various tables from the UCI HAR Datset, combines
## the activity, feature, test and training data into a single data
## frame, then tidys the data to provide the average of each measurement
## for each subject/activity pair

## load associated libraries
    library(dplyr)
    library(reshape2)

## load in tables to be used
    print("Reading in data files. This will take some time", quote=FALSE) 
    features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
    activities <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
    testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    testX <- read.table("./UCI HAR Dataset/test/X_test.txt")
    testY <- read.table("./UCI HAR Dataset/test/y_test.txt")
    trainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
    trainY <- read.table("./UCI HAR Dataset/train/y_train.txt")
    print("Data reading complete. Analysis in Progress", quote=FALSE)

 ## create data frame and populate it with test data
    testDF <- data.frame(matrix(ncol=length(features$V2), nrow=0))
    trainDF <- data.frame(matrix(ncol=length(features$V2), nrow=0))
    for(rowData in 1:nrow(testX)) {
        testDF <- rbind(testDF,testX[rowData,])
    }

## pull activity table for test data
    for(activity in 1:nrow(testY)) {
        testY[activity,1] = activities[testY[activity,1],2]
    }

## Rename column names to feature names
    testDF <- setNames(testDF,features$V2)

 ## merge test Subject and Activity tables to data frame   
    Activity <- testY[,1]
    Subject <- testSubjects[,1]
    testDF <- cbind(Subject, Activity, testDF)

## Repeat data frame creation for training tables
    for(rowData in 1:nrow(trainX)) {
        trainDF <- rbind(trainDF,trainX[rowData,])
    }
    for(activity in 1:nrow(trainY)) {
        trainY[activity,1] = activities[trainY[activity,1],2]
    }
    trainDF <- setNames(trainDF,features$V2)
    Subject <- trainSubjects[,1]
    Activity <- trainY[,1]
    trainDF <- cbind(Subject, Activity, trainDF)

## merge test and training tables, tidy data
    mergeDF <- rbind(testDF,trainDF)
    valid_column_names <- make.names(names=names(mergeDF), unique=TRUE, allow_=TRUE)
    names(mergeDF) <- valid_column_names

## Extract needed columns
    mergeDF <- select(mergeDF, Subject, Activity, matches("(mean|std)"))
    tidyNames <- gsub("\\.","",names(mergeDF))
    tidyNames <- gsub("mean","Mean",tidyNames)
    tidyNames <- gsub("std","Std",tidyNames)
    names(mergeDF) <- tidyNames

## more reshaping and tidying if mean and std columns
    mergeDF <- melt(mergeDF,id=c("Subject","Activity"), variable.name="Feature",value.name="Result")
    mergeDF <- arrange(mergeDF,Subject)

## find mean for each feature by subject and activity
    mergeDF <- group_by(mergeDF,Subject, Activity, Feature) %>% summarize(Mean=mean(Result))
    mergeDF <- as.data.frame(tbl_df(mergeDF))
    print("Analysis Complete. Results are stored in analysisData.txt", quote = FALSE)
    write.table(mergeDF, "./analysisData.txt", quote=FALSE, row.names=FALSE)
}