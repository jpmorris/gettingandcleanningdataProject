# Instructions

The dataset is provided by the University of California Irvine.  You can obtain the dataset and more information here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Simply download and extract the zip file found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

as a subdirectory of this one, and run the run_analysis.R script to generate the tidy dataset.  

# Variables

subject - participating subject (1 to 6)
activity_name.y (last column).y description of activity ("laying", "sitting", etc.)
means of selected variables - A full list of variables in the orginal dataset are found in the features.txt file.  Only the means and standard deviations were selected for inclusion in this dataset.  And these standard deviations and means were themselves averaged across each subject for each activity.