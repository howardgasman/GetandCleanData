## Getting and Cleaning Data
## Instructions of code in run_analysis.R

The code has been been done in various steps, which are as per the course instructions, and are outlines here.

### PRE-CODE

1) First, the "plyr" library is initialised, as this will be used later in the code

### STEP 1: Merge the training and tests datasets

*1) First read in the following source files into dataframes of the same name:
*	1.1) X_train
*	1.2) X_test
*2) These 2 dataframes are then merged into dataframe "X" using rbind.

### STEP 2: Extract the measurements for the mean and standard deviation for each measurement

1) The "features" source file is read into a dataset of the same name.
2) Dataset "X" is give column names as per the "features" dataset
3) As we only want measurements that measure mean and standard deviation, we extract only column names in "X" that contain "mean()" or "std()"
	3.1) Create and empty vector "y"
	3.2) Create a loop from 1 to 561 (the number of columns in "X") that searches through the column names.
		 If a column name contains the string "mean()" or "std()", the index of this column is added to vector "y"
	3.3) A new dataframe "std_mean" is created from "X", containing only the column indices that were obtained in step 3.2.

### STEP 3: Use descriptive activity names to name the activities in the data set

1) Read in the following source files into dataframes of the same name:
	1.1) y_train
	1.2) y_test
	1.3) activity_labels
2) dataframes "y_train" and "y_test" are then merged into dataframe "y_data" using rbind.
3) dataframes "y_data" and "activity_labels" are then merged into dataframe "y_activity", which extends the number of columns.
4) dataframes "y_activity" and "mean_std" are then merged into  dataframe "activity_var"

### STEP 4: Appropriately labels the data set with descriptive variable names. 

