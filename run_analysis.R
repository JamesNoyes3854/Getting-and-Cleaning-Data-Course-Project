# Initialize some initial values
targete_folder <- "./UCI HAR Dataset"
file_name <- "./getdata_dataset.zip"

# Check if the user has already unzipped the file
if(!file.exists(targete_folder)){
    # Does the user have at least the zip file?
    if(!file.exists(file_name)){
        # User doesn't have the zip file, so download it
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                      file_name)
    }
    # Now unzip  the file
    unzip(file_name)
}

# Read in activity and features labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") #V2 contains label
features <- read.table("./UCI HAR Dataset/features.txt")

# Read in test data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Read in train data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Combine subjects, activity labels, and features into test and train sets
test  <- cbind(subject_test, y_test, X_test)
train <- cbind(subject_train, y_train, X_train)

# Combine test and train sets into full data set
fullSet <- rbind(test, train)

# Subset,keeping mean, std columns; also keep subject, activity columns
allNames <- c("subject", "activity", as.character(features$V2))
meanStdColumns <- grep("subject|activity|[Mm]ean|std", allNames, value = FALSE)
reducedSet <- fullSet[ ,meanStdColumns]

# Use indexing to apply activity names to corresponding activity number
names(activity_labels) <- c("activityNumber", "activityName")
reducedSet$V1.1 <- activity_labels$activityName[reducedSet$V1.1]

# Use a series of substitutions to rename varibles
reducedNames <- allNames[meanStdColumns]    # Names after subsetting
reducedNames <- gsub("mean", "Mean", reducedNames)
reducedNames <- gsub("std", "Std", reducedNames)
reducedNames <- gsub("gravity", "Gravity", reducedNames)
reducedNames <- gsub("[[:punct:]]", "", reducedNames)
reducedNames <- gsub("^t", "time", reducedNames)
reducedNames <- gsub("^f", "frequency", reducedNames)
reducedNames <- gsub("^anglet", "angleTime", reducedNames)
names(reducedSet) <- reducedNames   # Apply new names to data frame

tidyDataset <- reducedSet %>% group_by(activity, subject) %>%
    summarise_all(mean)
# summairse_all(list(~mean))
# Wtite tidy data to output file
write.table(tidyDataset, file = "tidyDataset.txt", row.names = FALSE)

# Call to read in tidy data set produced and validate steps
validate <- read.table("tidyDataset.txt")
View(validate)
