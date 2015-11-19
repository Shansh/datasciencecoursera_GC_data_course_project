## README: Getting and Cleaning Data Course Project

######The purpose of this project is to demonstrate our ability to collect, work with, and clean a data set. 
######The goal is to prepare tidy data that can be used for later analysis.

######In this repository you will find [run_analysis.R] (https://github.com/Shansh/datasciencecoursera_GC_data_course_project/blob/master/run_analysis.R) script, which does  the following:

 - download and extract [zip file] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
 - read **training** measurements data, set column names and binding volunteer and activity columns to it  
 - read **test** measurements data, set column names and 
 - binding **volunteer** and **activity** columns to it 
 - merge training and test data sets
 - rename activity numbers with actual *activity labels*
 - extract only columns which contain **'mean'** or **'std'** in name and preserve first two columns subsequently named 'Volunteer' and 'Activity'
 - set the *meaningful pattern* of measurements' column names
 - set the **average** of **each variable** for **each activity** and **each volunteer**
 - save as a text file: [TidyData.txt] (https://github.com/Shansh/datasciencecoursera_GC_data_course_project/blob/master/TidyData.txt)
    
######The script 'run_analysis.R' has been written with the intention to meet the demands of Coursera Getting and Cleaning Data Course Project, which were:

 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names.
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
