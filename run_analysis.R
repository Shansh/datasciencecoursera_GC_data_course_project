library(dplyr)

# download and extract zip file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp_zip <- tempfile()
download.file(fileUrl, temp_zip, method = "libcurl")
unzip(temp_zip, exdir = "./data")

# read training measurements data, set column names and 
# binding volunteer and activity columns to it  
train_set <- read.table("./data/UCI\ HAR\ Dataset/train/X_train.txt")
col_labels <- read.table("./data/UCI\ HAR\ Dataset/features.txt")
colnames(train_set) <- col_labels[, 2]
train_ac <- read.table("./data/UCI\ HAR\ Dataset/train/y_train.txt")
train_vol <- read.table("./data/UCI\ HAR\ Dataset/train/subject_train.txt")
train_set <- cbind(train_vol, train_ac, train_set)

# read test measurements data, set column names and 
# binding volunteer and activity columns to it 
test_set <- read.table("./data/UCI\ HAR\ Dataset/test/X_test.txt")
colnames(test_set) <- col_labels[, 2]
test_ac <- read.table("./data/UCI\ HAR\ Dataset/test/y_test.txt")
test_vol <- read.table("./data/UCI\ HAR\ Dataset/test/subject_test.txt")
test_set <- cbind(test_vol, test_ac, test_set)

# merge training and test data sets
merged_set <- rbind(train_set, test_set)

# rename activity numbers with actual activity labels
act_labels <- read.table("./data/UCI\ HAR\ Dataset/activity_labels.txt", stringsAsFactors = F)[, 2]
merged_set[, 2] <- act_labels[merged_set[, 2]]

# extract only columns which contain 'mean' or 'std' in name
# and preserve first two columns subsequently named 'Volunteer' and 'Activity'
criteria <- grep("(mean|std)\\(\\)", names(merged_set))
select_set <- merged_set[, c(1:2, criteria)]
colnames(select_set)[1:2] <- c("Volunteer", "Activity")

# set the meaningful pattern of measurements' column names
names(select_set) <- gsub("-" , "", names(select_set))
names(select_set) <- gsub("^t", "Time", names(select_set))
names(select_set) <- gsub("^f", "Freq", names(select_set))
names(select_set) <- gsub("\\(\\)" , "", names(select_set))
names(select_set) <- gsub("mean" , "Mean", names(select_set))
names(select_set) <- gsub("std" , "StdDev", names(select_set))
names(select_set) <- gsub("BodyBody" , "Body", names(select_set))

# set the average of each variable for each activity and each volunteer
tidy <- select_set %>% group_by(Volunteer, Activity) %>%
        summarise_each(funs(mean), 3:68)

# save as a text file
write.table(tidy, file="./data/UCI\ HAR\ Dataset/TidyData.txt", sep="\t", row.names=FALSE)