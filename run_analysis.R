getwd()

## download zip file from the Internet

fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists("courseraData")) {dir.create("courseraData")}
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile="./courseraData/HAR.zip")

file<-"./courseraData/getdata_projectfiles_UCI HAR Dataset.zip"

## read general information
features<-read.table(unzip(file,"UCI HAR Dataset/features.txt"))
features$chooseVar<-grepl("mean",features$V2) | grepl("std",features$V2) ## variables measuring mean and std
sum(features$chooseVar) ## number of variables that will be kept

actLabels<-read.table(unzip(file,"UCI HAR Dataset/activity_labels.txt"))

rowsRead<--1
## I use this variable to control how many rows to be read in.
## First a small number is assigned for the purpose of code testing.
## Eventually it is given a value of -1 to read in all data.

## read test data
testData<-read.table(unzip(file,"UCI HAR Dataset/test/X_test.txt"), nrows=rowsRead)
    
  colnames(testData)<-features$V2 ## renaming variables
  testData<-testData[,features$chooseVar] ## keep only wanted variables
  
  testAct<-read.table(unzip(file,"UCI HAR Dataset/test/y_test.txt"),col.names="activity",nrows=rowsRead)
  testSub<-read.table(unzip(file,"UCI HAR Dataset/test/subject_test.txt"),col.names="subject",nrows=rowsRead)
  
  ## combine subject ID, activity label and measurements into one data set
  testData<-cbind(type="test",testSub, testAct, testData)

## read train data
trainData<-read.table(unzip(file,"UCI HAR Dataset/train/X_train.txt"), nrows=rowsRead)
  
  colnames(trainData)<-features$V2 ## renaming variables  
  trainData<-trainData[,features$chooseVar] ## keep only wanted variables
  
  trainAct<-read.table(unzip(file,"UCI HAR Dataset/train/y_train.txt"),col.names="activity", nrows=rowsRead)
  trainSub<-read.table(unzip(file,"UCI HAR Dataset/train/subject_train.txt"),col.names="subject",nrows=rowsRead)
  
  ## combine subject ID, activity label and measurements into one data set
  trainData<-cbind(type="train",trainSub, trainAct, trainData)

## combine test data and train data
allData<-rbind(testData,trainData)

## give activity meaningful labels
allData$activity<-factor(allData$activity, levels=actLabels$V1, labels=actLabels$V2)


## summarize data 
library(dplyr)

summaryData<-
  allData %>%
  group_by(subject, activity) %>%
  summarise_each(funs(mean)) ## summarize_each is not a valid name

  summaryData<-select(summaryData, -type) ## drop the "type" variable 

## write summaryData to a text file
write.table(summaryData, "./summaryData.txt",row.names=FALSE)
