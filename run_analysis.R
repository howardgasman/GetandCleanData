#a = read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")
#b = read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features_info.txt", sep="\n")
#c = read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

#d = read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
#e = read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")

#f = read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
#g = read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")


#f[,"angle(Z,gravityMean)"]

#Working directory must be set to directory that contains the unzipped directory, 
#called 'getdata-projectfiles-UCI HAR Dataset' used for this project 

#include necessary libraries

library(plyr)
############################################################################
#STEP 1: Merge the training and tests datasets
############################################################################

#Read the training dataset to variable X_train
X_train = read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")

#Read the tests dataset to variable X_test
X_test = read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")

#Merge the datasets to variable X, using rbind
X <- rbind(X_train, X_test)

############################################################################
#STEP 2: Extract the measurements on the mean and standard deviation for each measurement
############################################################################

#Read the "features" file which gives information on the column headers of the X data set.
features = read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")

#Give column headers to dataset "X", as per the "features" dataset
colnames(X) <- features$V2

#Get the indices of the columns that contain strings "mean()" OR "std()" into variable "y"
y <- vector() #Create empty vector
hg <- vector()
for(x in (1:561)) { # dataset "X" has 561 columns
if (grepl("mean()", colnames(X[x]), fixed=TRUE) | grepl("std()", colnames(X[x]), fixed=TRUE)) 
        {                
                hg <- c(y, colnames(X[x]))
                y <- c(y,x)
        }
                }

#Create dataset with only mean() and std()
mean_std <- X[,y]

############################################################################
#STEP 3: Use descriptive activity names to name the activities in the data set
############################################################################

#read y_train dataset
y_train = read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")

#read y_test dataset
y_test = read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")

#merge the y_train and y_test datasets
y_data <- rbind(y_train, y_test)

#read the activity_labels dataset
activity_labels = read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

#merge y_train and activity_labels.
y_activity <- join(y_data, activity_labels)


#join mean_std and y_activity
activity_var <- cbind(y_activity, mean_std)

#step 4
#all column names, except Activity have been appropriately labelled, so just label Activity
colnames(activity_var)[2] <- "Activity"


#step 5: Get Subject data
subject_train = read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
subject_test = read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

subject_data <- rbind(subject_train, subject_test)

colnames(subject_data)[1] <- "Subject"

#merge activity_var and subject_data
predata <- cbind(subject_data, activity_var)

#aggregate
finaldataset <- aggregate(. ~ Subject + V1 + Activity, predata, mean)

write.table("finaldataset", finaldataset, row.name=FALSE)

