# CodeBook

## Overview

The original data set comes from the UCI machine learning repository. This data set collects smartphone measurement data, which is used to predict human activity. 

UCI machine learning repository:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data can be downloaded from:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

More information can be found in the UCI webpage. Here is an excerpt from the UCI webpage: 

    For each record in the dataset it is provided: 
    - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
    - Triaxial Angular velocity from the gyroscope. 
    - A 561-feature vector with time and frequency domain variables. 
    - Its activity label. 
    - An identifier of the subject who carried out the experiment.
    
## Steps Explained

All analysis is done with RStudio 3.1.2 on Windows 7.

First, the .zip file containing all the data is downloaded and relevent files are read in. The features.txt file (variable names) and activity_labels.txt files are read in first. A chooseVar variable is created in the features file as a logical variable indicating which measurements to select afterwards.

Second, test data is read in.Test data variable names are renamed accordinng to the features file.Also, only mean and standard deviation measurements (a total of 79) are kept using the chooseVar variable. The other measurements are dropped. Next, the activity and subject ID files are read in for the test data set. Measurements, activity type and subject ID are then combined into one data set.

Third, Train data set is read in following the same process. After that, train data set and test data set are combined together. Activity is labeled with meaningful activity names using the information from the activity_labels.txt file.

In the end, summary functions are used to calculate the average of each variable for each subject/activity combination. Final tidy data is written to summaryData.txt.

## Variables in the resulting data file

After data cleaning, the final data summaryData.txt given by the run_analysis.R code only has the measurements on the mean and standard deviation for each measurement (79 variables) plus two additional variables, coding the subject ID and activity type, respectively. In addition, the average of each variable for each subject/activity combination is calculated and presented.

* __subject__: an identification number for the volunteer subject in the experiment.
* **activity**: type of activity the subject is performing. It has 6 values: walking, walking_downstairs, walking_upstairs, laying, sitting, and standing. 
* **the rest 79 variables**: average value of measurement for each subject/activity combination.
