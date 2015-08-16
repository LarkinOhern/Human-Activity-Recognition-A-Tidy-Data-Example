# Human-Activity-Recognition-A-Tidy-Data-Example
The repo takes data (for a Coursera Getting and Cleaning Data project) from the UCI HAR and return a tidy data set, hopefully....

You will need the plyr, reshap2, and dplyr libraries loaded. 

The first step is to get the UCI HAR data and save it in your working directory.
The data is avaiable here: http://archive.ics.uci.edu/ml/machine-learning-databases/00240/
Save the data in your working directory in a folder titled "UCI HAR Dataset"  

Once you have the data saved in your wd, we can read it into the analysis script.

Start with the test data. Read in three files using the read.table command:

1. subject_test.txt
2. X_test.txt
3. y_test.txt

Read in the feature names from features.txt and rename the X_test columns with the descriptive feature names.

Take a look at each file using the View() command.  Notice that each has 2948 rows.

Next,combine the three files using cbind() to create a single test dataset.

Do the same for the train data.

Next, use rbind() to merge the test and train data sets.
Give each variable a unique and valid name using make.names() 
Fild the variables of interest using grep to find only those including mean() and sd().  I chose to interpret that
requirment as excluding measure which included mean but then did something else with it.

Select those variable uing select() and remember to include the subject and activity columns as well.

Read in the activity names from the activity_labels.txt file and apply them the numerical identifiers in the activity 
column.

Use group_by to group by activity and subjct then melt the frame to go from wide to tall.  This is key to allow you to summarise in the next step without having to retype the command from the whole range of columns.

Use ddply and summarise togenerate a mean and sd for each subject/activity/measure group.

View() the results.

The outpt is tidy because each variable forms a column [test_subject ids paricipants, activity tells what they did, variable ids the measure of what they did, and mean and sd reqport stats on that measure], each observation forms a row with 1 subject 1 activity 1 measure and the mean and sd of that combo.  



