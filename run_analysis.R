## Load the  dplyr package
library(dplyr)
library(data.table)

## Step1 Download the data set file and unzip it
dataSetDirName<- "UCI HAR Dataset";
if(!file.exists(dataSetDirName)){
   dir.create(dataSetDirName)
}
zipFile <-  paste("./",dataSetDirName,"/",dataSetDirName,".zip",sep="")
outputFile <-  paste("./",dataSetDirName,"/","tidyDataSet.txt",sep="")

zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists(zipFile)){
  download.file(zipUrl, zipFile, mode = "wb")
  unzip(zipFile)
}


## Step 2 is to load the data set (Raw data ) subject, X,Y, Activity Labels, Features data into the datatables from the file System .

## 2.a First load the activity data set into a data frame.

activitiesDataFrame<-read.table(file.path(dataSetDirName,"activity_labels.txt"))

## 2.b Secondly load the features data set into the data frame.
featuresDataFrame <- read.table(file.path(dataSetDirName, "features.txt"), as.is = TRUE)

## 2.c Load the train data (measure(X),subject and activity(Y) )
## measure(X) is the 561 observations on different functions eg: mean(),std() on the x,y,z acceleration/gyro signals.
measureTrainDataFrame<-read.table(file.path(dataSetDirName, "train","X_train.txt"))


subjectTrainDataFrame<-read.table(file.path(dataSetDirName, "train","subject_train.txt"))
subjectTrainActivityDataFrame<-read.table(file.path(dataSetDirName, "train","y_train.txt"))

## 2.d Load the test data (measure(X),subject and activity(Y) )

measureTestDataFrame<-read.table(file.path(dataSetDirName, "test","X_test.txt"))
subjectTestDataFrame<-read.table(file.path(dataSetDirName, "test","subject_test.txt"))
subjectTestActivityDataFrame<-read.table(file.path(dataSetDirName, "test","y_test.txt"))
##3  Merge the train data frames by adding columns

mergedTrainDataFrame<-cbind(subjectTrainDataFrame,subjectTrainActivityDataFrame,measureTrainDataFrame)
mergedTestDataFrame<-cbind(subjectTestDataFrame,subjectTestActivityDataFrame,measureTestDataFrame)

mergedAllDataFrame<-rbind(mergedTrainDataFrame,mergedTestDataFrame)
##4 Pull the feature Names from the feature data frames and store it in the Vector.
featuresVector <- featuresDataFrame[,2]

##5 Generate the column header for the merged data frame.
colnames(mergedAllDataFrame)<-c("subject","activity",featuresVector)
## Filter only the mean/Mean and std related columns
mergedAllDataFrame <- mergedAllDataFrame[ , grepl( "subject|activity|[M|m]ean|std" , colnames( mergedAllDataFrame ) )]
##6 Rename the activity id to the activity Labels for the activity column values
mergedAllDataFrame$activity<- factor(mergedAllDataFrame$activity, levels = activitiesDataFrame[, 1], labels = activitiesDataFrame[, 2])



## 7 Clean up Column Names
# 7.a remove special characters
colnames(mergedAllDataFrame) <- gsub("[\\(\\)-]", "", colnames(mergedAllDataFrame))

## 7.b Clean Up Names
colnames(mergedAllDataFrame) <- gsub("^f", "frequency", colnames(mergedAllDataFrame))
colnames(mergedAllDataFrame) <- gsub("^t", "time", colnames(mergedAllDataFrame))
colnames(mergedAllDataFrame) <- gsub("Acc", "Accelerometer", colnames(mergedAllDataFrame))
colnames(mergedAllDataFrame) <- gsub("Gyro", "Gyroscope", colnames(mergedAllDataFrame))
colnames(mergedAllDataFrame) <- gsub("Mag", "Magnitude", colnames(mergedAllDataFrame))
colnames(mergedAllDataFrame) <- gsub("Freq", "Frequency", colnames(mergedAllDataFrame))
colnames(mergedAllDataFrame) <- gsub("std", "StandardDeviation", colnames(mergedAllDataFrame))
colnames(mergedAllDataFrame) <- gsub("mean", "Mean", colnames(mergedAllDataFrame))

## 8. Apply grouping on subject and activity and find the mean of all the feature vectors for that group
tidyMergedAllDataFrame <- mergedAllDataFrame %>% group_by(subject, activity) %>% summarise_all("mean")
##9 Write the table to the tidy data tab delimited text file
write.table(tidyMergedAllDataFrame, outputFile, row.names = FALSE)
##fwrite(tidyMergedAllDataFrame,outputFile,sep="\t")



