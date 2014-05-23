#step0 download zip file
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"./q.zip")
unzip("q.zip")#Extract the zip and check the files
setwd("./UCI HAR Dataset")#set new workspace

#step1 read files, bind train and test files
activity_labels<-read.table("./activity_labels.txt",
                            head=FALSE,sep="",
                            col.names=c("activity.id",
                                        "activity.name"))##6 kinds of activities
features<-read.table("./features.txt",head=FALSE,sep="",
                     col.names=c("features.id","feature.name"))#561 features
#read train files
X_train<-read.table("./train/X_train.txt",
                   head=FALSE,sep="")
y_train<-read.table("./train/y_train.txt",
                   head=FALSE,sep="")
subject_train<-read.table("./train/subject_train.txt",
                   head=FALSE,sep="")
##cbind the X_train,yt_rain and subject_train as one and re-name variables
train<-cbind(subject_train,y_train,X_train)
names(train)<-make.names(c("subject","activity.id",as.vector(features[[2]])))

##read test files
X_test<-read.table("./test/X_test.txt",
                   head=FALSE,sep="")
y_test<-read.table("./test/y_test.txt",
                   head=FALSE,sep="")
subject_test<-read.table("./test/subject_test.txt",
                          head=FALSE,sep="")
test<-cbind(subject_test,y_test,X_test)
names(test)<-make.names(c("subject","activity.id",as.vector(features[[2]])))

#rbind test and train
data<-rbind(train,test)


#step2 extracts only the measurements on the mean and standard deviation for each measurement
findname<-grep("([mM][eE][aA][nN])|([sS][tT][dD])",names(data),perl=TRUE)
subset_data<-data[c(1:2,findname)]

#step3&4 re-name activities
subset_data_des<-merge(activity_labels,subset_data,by="activity.id")
subset_data_des$comname<-with(subset_data_des,
                              paste(subject,activity.name,sep="."))#combine variables' names


#step5 bulid tidy files
sub_data<-subset_data_des
sub_data$"activity.id"<-NULL
sub_data$"activity.name"<-NULL
sub_data$"subject"<-NULL
sub_data$"comname"<-NULL
##Form column means
g <- subset_data_des$comname
l<-split(sub_data,g)
ll<-lapply(l,colMeans)
##Convert the list to a matrix
tidy<-data.frame(t(data.frame(ll)))
tidy$comname<-sub("X","",rownames(tidy))


##output the tidy file
write.table(tidy, file="tidy.txt", quote=FALSE, sep="|", row.names=FALSE)