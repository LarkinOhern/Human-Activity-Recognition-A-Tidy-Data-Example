# Human-Activity-Recognition-A-Tidy-Data-Example
The repo takes data (for a Coursera Getting and Cleaning Data project) from the UCI HAR and return a tidy data set, hopefully....

The first step is to get the UCI HAR data and save it in your working directory.
The data is avaiable here: http://archive.ics.uci.edu/ml/machine-learning-databases/00240/
Save the data in your working directory in a folder titled "UCI HAR Dataset"  

Once you have the data saved in your wd, we can read it into the analysis script.

Start with the test data. Read in three files using the read.table command:
1. subject_test.txt
2. X_test.txt
3. y_test.txt

Take a look at each file using the View() command.  Notice that each has 2948 rows.

Next,combine the three files using cbind() to create a single test dataset.

