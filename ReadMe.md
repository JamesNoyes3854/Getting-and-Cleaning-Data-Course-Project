

# ReadMe File For *Getting and Cleaning Data Course Project*


### This repository was created to finish the Peer Review assignment for the 4^th^ week of Coursera Getting and Cleaning Data
+ First, ensure the Tidyverse package is loaded into R
+ Second, download and unzip the data file into your working directory
+ Third, run the analysing code from **"run_analysis.R"** on the downloaded data
+ Finaly, up load the files to this repository 

### Data Descripton
        +The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording. Pleas see the Code Book.
  
### Code Explaination
        +The code combined training and test data sets, and extracted partial variables to create another data set with the averages of each variable for each activity.

### New Data Set
        +The new generated dataset contained variables calculated based on the mean and standard deviation.

### The code was written based on the instruction of this assignment

Read training and test dataset into R environment. Read variable names into R envrionment. Read subject index into R environment.
    
        1.Merges the training and the test sets to create one data set.
        2.Extracts only the measurements on the mean and standard deviation for each measurement. 
        3.Uses descriptive activity names to name the activities in the data set
        4.Appropriately labels the data set with descriptive variable names. 
        5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable              for each activity and each subject.
