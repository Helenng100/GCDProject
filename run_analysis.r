install.packages("data.table")
install.packages("reshape2")

require("data.table")
require("reshape2")


setwd("C:/_Proyectos/Coursera/R/3 Getting and Cleaning Data/week 4/Project")

#Reading files
act.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
meanstd.features <- grepl("mean|std", features)
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# ejecutado hasta aquí

#Appling names, labels and subseting
names(X_test) = features
names(X_train) = features

names(subject_test) = "subject_id"
names(subject_train) = "subject_id"

X_test = X_test[,meanstd.features]
X_train = X_train[,meanstd.features]

y_test[,2] = act.labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")

y_train[,2] = act.labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")

# Merge data
test_data <- cbind(subject_test, y_test, X_test)
train_data <- cbind(subject_train, y_train, X_train)

fulldata = rbind(test_data, train_data)

id_labels = c("subject_id", "Activity_ID", "Activity_Label")
fulldata_labels = setdiff(colnames(fulldata), id_labels)
melt_fulldata = melt(fulldata, id = id_labels, measure.vars = fulldata_labels)

# Mean
tidy_data   = dcast(melt_fulldata, subject_id + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt")
