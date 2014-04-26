1) download data
Download zip file getdata-projectfiles-UCI HAR Dataset.zip into local machine.
unzip the file. it will extract to a folder "UCI HAR Dataset". Subfolders will have 
Measurements are present in X_<dataset>.txt file
Subject information is present in subject_<dataset>.txt file
Activity codes are present in y_<dataset>.txt file
All activity codes and their labels are in a file named activity_labels.txt.
Names of all measurements taken are present in file features.txt ordered and indexed as they appear in the X_<dataset>.txt files.
All columns representing means contain ...mean() in them.
All columns representing standard deviations contain ...std() in them.

2) Data Preparation Steps

For each of the test datasets,
Read the all("X_"dataset".txt) file
Read features.txt file for column names of dataset.
Assign column names by manipulating the measurement names in features.txt.
Take a subset of the columns representing only the mean and standard deviation values. Subsetting is done early on to conserve memory.
Read activity file (y_"dataset".txt) file for 'Activity'
Read subject file (subject_"dataset".txt) file 'Subject'
Read activity lable file (activity_lable.txt) file 'activity name'
Associate additional columns to represent activity, and subject IDs read from y_<dataset>.txt and subject_<dataset>.txt, activity_lable files respectively.

repeat the above steps for Train datasets.

Merge the training and the test sets, read as in step 1 to create one data set.

Melt the dataset by specifying activity, name and subject as the only ID variables.
Re cast the melted dataset with activity name and subject as the only IDs and mean as the aggregator function.
Save the resultin re-casted dataset as tidy.txt

3)Running script
copy run_analysis.R in to "UCI HAR Dataset"
set your working directory to "UCI HAR Dataset"
install packages(data.table,reshape2)
Run Rscript <path to>/run_analysis.R
The tidy dataset should get created in the current directory as tidy.txt

