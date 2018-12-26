library(plyr)
library(data.table)
setwd("UCI HAR Dataset")
##P1
#test
x_test<-read.table("test/X_test.txt",header = FALSE)
y_test<-read.table("test/y_test.txt",header = FALSE)
# View(x_test)
SubjectTest<-read.table("test/subject_test.txt")

#train
x_train<-read.table("train/X_train.txt",header = FALSE)
y_train<-read.table("train/y_train.txt",header = FALSE)
SubjectTrain<-read.table("train/subject_train.txt")



data_x<-rbind(x_train,x_test)
data_y<-rbind(y_train,y_test)
subject<-rbind(SubjectTest,SubjectTrain)

dim(data_x)
dim(data_y)
dim(subject)

##P2
features<-read.table("features.txt")
index<-grep("mean\\(\\)|std\\(\\)", features[,2])
data_x<-data_x[,index]
names(data_x) <- features[grep("-(mean|std)\\(\\)", features[, 2]), 2] 
dim(data_x)

##P3
data_y[, 1] <- read.table("activity_labels.txt")[data_y[, 1], 2]
names(data_y) <- "Activity"
View(data_y)

##P4
names(subject)<-"Subject"
summary(subject)
data_all<-cbind(data_x,data_y,subject)
# View(data_all)
names(data_all) <- make.names(names(data_all))
names(data_all) <- gsub('Acc',"Acceleration",names(data_all))
names(data_all) <- gsub('GyroJerk',"AngularAcceleration",names(data_all))
names(data_all) <- gsub('Gyro',"AngularSpeed",names(data_all))
names(data_all) <- gsub('Mag',"Magnitude",names(data_all))
names(data_all) <- gsub('^t',"TimeDomain.",names(data_all))
names(data_all) <- gsub('^f',"FrequencyDomain.",names(data_all))
names(data_all) <- gsub('\\.mean',".Mean",names(data_all))
names(data_all) <- gsub('\\.std',".StandardDeviation",names(data_all))
names(data_all) <- gsub('Freq\\.',"Frequency.",names(data_all))
names(data_all) <- gsub('Freq$',"Frequency",names(data_all))

##P5
tidy<-aggregate(.~ Subject + Activity, data_all, mean)
tidy<-tidy[order(tidy$Subject,tidy$Activity),]
write.table(tidy, file = "tidy.txt",row.name=FALSE)

dim(tidy)




