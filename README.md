# SmartphoneActivityRecogDataPreparation
Data Clean Up Coursera Exercise - Smartphone Human Activity Recognition 

This run_analysis.R script assumes that you have:

1) downloaded the data into your computer (if you need to download the data refer to http://archive.ics.uci.edu/ml/machine-learning-databases/00240/)

2) you have set up your environment to the top folder of the downloaded and unzip data folder. It is called "UC HAR Dataset".

To test that you are in the right directory try the following:

> getwd()

It should  return sothing like:
>"...your directory.../UCI HAR Dataset"

Once you have the data set unpacked and the script in the correct directory, you just need to run it.
You may want to view the final summary data set by typing the following:

> View(s_vargs)

> head(s_vargs)



    subject activityname           measure    average
      (int)       (fctr)             (chr)      (dbl)
        1       1       LAYING fBodyAcc-mean()-X -0.9390991
        2       1       LAYING fBodyAcc-mean()-Y -0.8670652
        3       1       LAYING fBodyAcc-mean()-Z -0.8826669
        4       1       LAYING  fBodyAcc-std()-X -0.9244374
        5       1       LAYING  fBodyAcc-std()-Y -0.8336256
        6       1       LAYING  fBodyAcc-std()-Z -0.8128916


The script run_analysis.R has embedded comments explaining every step, if you are interested in the details
please take a look at it. 

In brief, the script does the following:
- Reads the test and training data set files including subject, activity and measurements
- Combines the 2 data sets
- Subsets the mean and standard deviation measurements
- Summarizes the data to show the values organized by subject, activity, measurement type and average
 





