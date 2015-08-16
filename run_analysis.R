###this script reads in data from the UCI HAR data set and outputs a tidy version of the data

library(plyr)
library (reshape2)
library (dplyr)
###start by reading in the relevant files for the test set 
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")

subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")

xvarnames<-read.table("UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)

###name the vars so you can tell the apart once you combine them (all three i each set have a V1)
colnames(subject_test)[1]<-"test_subject"
colnames(y_test)[1]<-"activity"
colnames(X_test)[1:561]<-xvarnames$V2[1:561]

colnames(subject_train)[1]<-"test_subject"
colnames(y_train)[1]<-"activity"
colnames(X_train)[1:561]<-xvarnames$V2[1:561]


###combine the three test and the tree train files to make a single testdata set and the three train files into a traindata set
testdata<-cbind(subject_test,y_test,X_test)

traindata<-cbind(subject_train,y_train,X_train)

###convert to dplyr table for easy manipulation
testdata<-tbl_df(testdata)
traindata<-tbl_df(traindata)

###create a single table using rbind()
totaldata<-rbind(testdata,traindata)

###rename variables with valid/unique names
goodnames<-make.names(colnames(totaldata),unique = TRUE)
colnames(totaldata)<-goodnames

### truncate the table to inclue only the mean and standard deviation vars
keyvars<-grep("std()|mean()",colnames(totaldata))
keystats<-select(totaldata,test_subject, activity, keyvars[1:79])

###match the activity labels given in file activity_labels.txt to the observation in the activity column
###hat tip to Gregory D. Horne for demo-ing a quick way to do this in the course forum 
activitylabels<-read.table("UCI HAR Dataset/activity_labels.txt")
activity.names<-activitylabels$V2
activity.names<-tolower(activity.names)
activity.names[keystats$activity]
keystats$activity<-activity.names[keystats$activity]

###reshape the data for grouping and summarizing
groupedstats<-group_by(keystats, test_subject, activity)
meltedstats<-melt(groupedstats, id.vars=c("test_subject","activity"))

###use ddply to generate a mean and standard deviation for each measure by subject and activity
sumstats<-ddply(meltedstats, c("test_subject","activity","variable"),summarise, mean=mean(value), sd=sd(value))

View(sumstats)
