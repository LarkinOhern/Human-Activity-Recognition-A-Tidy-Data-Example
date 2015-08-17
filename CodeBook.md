*This CodeBook describes the data and variables in the Tidy Data version of the UCI Human Activity Report Data.  
It begns with the data provided by UCI and proceeds through the final tidy data set.*

UCI Data:
The UCI data came already divided to test set (30%) and a train set (70%) each with three key files plus inertial signals data which was extraneous to this project. Each file is described below.  The files do not all display well in Windows Notepad.  I used Notepad++.

subject_test.txt : This file contained 2948 observations specfyng which of the 30 test sujects (identified numerically 1-30) produced the data in the corresponding activity (y_test) and measurement (x_test) files.  

y_test.txt: This file contained 2948 observations specifying the activity (identified numerically 1-6) performed in each observation.

X_test.txt: This file contained 2948 observations of 562 variables capturng movement data from the accelerometer and gyroscope of a 
Samsung smart phone worn by each participant during each activity. The raw inertial data were processed, filtered, and transformed
to provide the measures in X_test.  For more info on these features refer to the UCI Data features.txt and feature_info.txt.

The train set included three fles with the same characteristics representing the 7353 observations used as the training set.
The files for the train set are:

subject_train.txt
y_train.txt
X_train.txt

Internal Variables data sets:

xvarnames: This variable holds the names of the feature from the features.txt file and was used to apply descriptive names
to the columns in the X_test and X_train files.

test_subject: I re-named the subject_test/subject_train column test_subject to indicate that its numbers ID participants 
activity: I renamed the y_train/y_test column activity to indicate that is numbers ID the 6 activties performed 

I renamed all of the measurements by applying the xvarnames variable to the column names of the X_test/X_train data sets to
give descriptive names to the measurment variables.

testdata: A data frame created by column binding the three test frames. Later made into a dply data table.
traindata: A data frame created by column binding the three train frames. Later made into a dply data table.

totaldata: A data table created by row binding the testdata and traindata frames 

goodnames: a variable containing unique and valid column names used to replace the feature names.

keyvars: a variable containing the column names of measures containing mean() and std() which were the columns of interest.

keystats: a data table containing only the ID variables subject/activity and the columns in keyvars.

activity lables: a data table with the descriptive names for the 6 activties from activity_lables.txt

activitynames: a variable of lower case descriptive names of activities applied to the numbers in the activity column.

groupedstats: a data table with variables of interest(keyvars) grouped by the ID variables test_subject and activity.

meltedstats: a reshaped version of groupedstats with the keyvars collapsed into a variable column and and a value columnwith each measure as an 
observation for each test_subject/activity pair.

variable: a new column in meltedstats with each measurement for each subject/activity observation.

value: a new column in meltedstats with the data from each measurement foreach subject/activity observation.

sumstats: a tidy dataset in which the value column was replaced by two columns mean and std.  These represent the mean
and standard deviation of each measure for each subject/activity pair.  


