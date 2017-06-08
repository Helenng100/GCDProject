# GCDProject

##Description of variables

     meanstd.features where we save the mean & standard deviation for the features

##Description of data 
First step we create a data table for each file: 

     act.labels has the  file activity_labels.txt that contains labels, 
     features has the features.txt that contains clasification features 
     X_test has the X_test.txt data
     y_test has the y_test.txt data 
     subject_test has the subject_test.txt data
     X_train has the X_train.txt 
     y_train has the y_train.txt
     subject_train has the subject_train.txt data 
     act.labels has the activity_labels.txt
     features  has the features.txt

##Transformations of data
First we put the names to data sets, from features to x_test & x_train.
Then we add the subject_id labels
Then we add the mean & the sandar to both tables 

Then we merge the data of subjects, y & x data  for both test & train

Then we combine both data: test & train to have a full data set

Then we add the labels of subject, activity id & activity label and "melt" to 
the full data set.

FInally we create the tidy data and calculate the mean for each subject_id & activity label. 
