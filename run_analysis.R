library(data.table)
library(reshape2)

# 1. load test and training sets and the activities
testData <- read.table("./test/X_test.txt",header=FALSE)
testDataAct  <- read.table("./test/y_test.txt",header=FALSE)
testDataSub <- read.table("./test/subject_test.txt",header=FALSE)
trainData <- read.table("./train/X_train.txt",header=FALSE)
trainDataAct <- read.table("./train/y_train.txt",header=FALSE)
trainDataSub <- read.table("./train/subject_train.txt",header=FALSE)

# 2. Uses descriptive activity names to name the activities in the data set
activities <- read.table("./activity_labels.txt",header=FALSE,colClasses="character")
testDataAct$V1 <- factor(testDataAct $V1,levels=activities$V1,labels=activities$V2)
trainDataAct$V1 <- factor(trainDataAct$V1,levels=activities$V1,labels=activities$V2)

# 3. Appropriately labels the data set with descriptive activity names
features <- read.table("./features.txt",header=FALSE,colClasses="character")
colnames(testData)<-features$V2
colnames(trainData)<-features$V2
colnames(testDataAct )<-c("Activity")
colnames(trainDataAct)<-c("Activity")
colnames(testDataSub)<-c("Subject")
colnames(trainDataSub)<-c("Subject")


# 4. extract only the measurements on the mean and standard deviation for each measurement
test_colnames <- grep(".*mean\\(\\)|.*std\\(\\)", colnames(testData))
testData<-testData[,test_colnames]

train_colnames <- grep(".*mean\\(\\)|.*std\\(\\)", colnames(trainData))
trainData<-trainData[,train_colnames]

# 5. merge test and training sets into one data set, including the activities

testData<-cbind(testData,testDataAct )
testData<-cbind(testData,testDataSub)
trainData<-cbind(trainData,trainDataAct)
trainData<-cbind(trainData,trainDataSub)

# 6 Adding rows of test and train
AllData<-rbind(testData,trainData)

# 7 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
id_vars = c("Activity", "Subject")
measure_vars = setdiff(colnames(AllData), id_vars)
melted_data <- melt(AllData, id=id_vars, measure.vars=measure_vars)
tidy_data<-dcast(melted_data, Activity + Subject ~ variable, mean)

# 8 Write tidy data set into a text file
    write.table(tidy_data, file="tidy.txt")
