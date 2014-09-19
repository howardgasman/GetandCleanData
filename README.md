## Getting and Cleaning Data
## Instructions of code in run_analysis.R

The code has been been done in various steps, which are as per the course instructions, and are outlined here. <br/>
This has been done step-by-step, and a new dataframe has been created whenever a dataframe has been needed or dataframes have been merged. <br/>

Please note that the source files (header directory "getdata-projectfiles-UCI HAR Dataset" must be placed in your working directory, along with the run_analysis.R file. <br/>
I have not included the source files in this repository, as these have been made available to all students, and as such, should already been maintained on their pc.  <br/>

### PRE-CODE

1) First, the "plyr" library is initialised, as this will be used later in the code. <br/>

### STEP 1: Merge the training and tests datasets

1)  First read in the following source files into dataframes of the same name: <br/>
1.1) 	X_train <br/>
1.2) 	X_test <br/>
2)  These 2 dataframes are then merged into dataframe "X" using rbind. <br/>

### STEP 2: Extract the measurements for the mean and standard deviation for each measurement

1) The "features" source file is read into a dataset of the same name. <br/>
2) Dataset "X" is give column names as per the "features" dataset. <br/>
3) As we only want measurements that measure mean and standard deviation, we extract only column names in "X" that contain "mean()" or "std()". <br/>
3.1) 	Create and empty vector "y". <br/>
3.2) 	Create a loop from 1 to 561 (the number of columns in "X") that searches through the column names. <br/>
		If a column name contains the string "mean()" or "std()", the index of this column is added to vector "y". <br/>
3.3) A new dataframe "std_mean" is created from "X", containing only the column indices that were obtained in step 3.2. <br/>

### STEP 3: Use descriptive activity names to name the activities in the data set

1) Read in the following source files into dataframes of the same name: <br/>
1.1) y_train <br/>
1.2) y_test <br/>
1.3) activity_labels <br/>
2) dataframes "y_train" and "y_test" are then merged into dataframe "y_data" using rbind. <br/>
3) dataframes "y_data" and "activity_labels" are then merged into dataframe "y_activity", which extends the number of columns. <br/>
4) dataframes "y_activity" and "mean_std" are then merged into  dataframe "activity_var". <br/>

### STEP 4: Appropriately labels the data set with descriptive variable names. <br/> 
1) All column names, except Activity, have been relabelled in step 2.2, thus just relabel "Activity", which is the 2nd column. <br/>

### STEP 5: Appropriately labels the data set with descriptive variable names. <br/> 
1) Read in the subject source files ("subject_train" and "subject_test") into dataframes of the same name. <br/>
2) Merge these 2 datasets into a new dataset, called "subject_data". <br/>
3) Rename the first column of the "subject_data" to "Subject". <br/>
4) Merge the "subject_data" and "activity_var" dataframes into a new dataframe "predata". <br/>
5) Create a new dataframe "finaldataset", which calculates the mean of each column in the "predata" dataframe, by subject and activity. <br/>
6) Write the contents of the "finaldataset" dataframe to your working directory. The column names are excluded. <br/>

