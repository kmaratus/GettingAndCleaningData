#Getting and Clearing Data Project
This repo contains run_analysis.R script which constructs tidy data from raw data.

##Raw data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##What the script does
The run_analysis.R script does the following:
1. Loads train and test data sets into R.
2. Merges train and test data sets into one data set.
3. Adds descriptive names to the variables.
4. Extracts variables related to the measurements of mean and standard deviation. NOTE: extracts mean() and std() not meanFreq() since mean() and std() are mean value and standard deviation, respectively, while meanFreq() is weighted average of the frequency components. 
5. Adds descriptive activity labels.
6. Constructs tidy data set. 

Assumptions to make script running:
1. The script and the data are in the same folder.
2. libraries 'reshape2' and 'readr' are installed.

##Tidy data
The tidy data consists of 180 rows and 68 columns. The first column is volunteer ID and variable is called as PersonID. There are 30 volunteers. The second column is activity the given volunteer was doing (called as Activity). Each volunteer did 6 different activities. In total we have 30 volunteers times 6 activities which equals to 180 (30x6=180) different combinations e.i. rows. And other columns are the mean data of different variables described in the CODEBOOK.md. So tidy data is constructed according to the principles of tidy data:
1. One variable per column
2. One observation per row

To open the tidy data file
'tidy<-read.table("tidyData.txt",header=TRUE)'
