## CodeBook

The original data set comes from the UCI machine learning repository. This data set collects smartphone measurement data, which is used to predict human activity. 

UCI machine learning repository:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Data can be downloaded from:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Quoted from the UCI webpage: 

    For each record in the dataset it is provided: 
    - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body    acceleration. 
    - Triaxial Angular velocity from the gyroscope. 
    - A 561-feature vector with time and frequency domain variables. 
    - Its activity label. 
    - An identifier of the subject who carried out the experiment.
    
After downloading the .zip file, the relevant files are read in:

First, the features (variable names) and activity label files are read in. The chooseVar is a logical variable indicating which measurements to select.

Second, test data is read in.Test data variable names are renamed using the features file.Also, only mean and standard deviation measurements (a total of 79) are kept using the chooseVar variable. The other measurements are dropped. 

Then, the activity and subject ID files are read in for the test data set. Measurements, activity type and subject ID are then combined into one data set.

Third, Train data set is read in following the same process. Then, train data set and test data set are combined together. Activity is labeled with meaningful activity names. 

In the end, summary functions are used to calculate the average of each variable for each subject/activity combination. Final tidy data is written to summaryData.txt.

After data cleaning, the final data summaryData.txt given by the run_analysis.R code only has the measurements on the mean and standard deviation for each measurement (79 variables) plus two additional variables, coding the subject ID and activity type, respectively. In addition, the average of each variable for each subject/activity combination is calculated and presented. 
