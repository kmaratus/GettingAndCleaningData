##load features and activities into R
dirname<-"./UCI HAR Dataset"

featuresPath<-paste(dirname,"/features.txt",sep="")
features<-read.table(featuresPath,sep=" ")
numOfFeatures<-dim(features)[1]

activitiesPath<-paste(dirname,"/activity_labels.txt",sep="")
activities<-read.table(activitiesPath,sep=" ")

##load train data into R
## readr library has been used to parse the data sets using fixed width file function (read_fwf()).
## It is much faster comparing to standard read.fwf() funcion
library(readr)
trainPathX<-paste(dirname,"/train/X_train.txt",sep="")
trainXdf<-read_fwf(trainPathX,fwf_widths(rep(c(16),numOfFeatures)),col_types=rep(list(c("d")),numOfFeatures))

trainPathy<-paste(dirname,"/train/y_train.txt",sep="")
trainydf<-read.table(trainPathy)

trainPersonPath<-paste(dirname,"/train/subject_train.txt",sep="")
trainPersondf<-read.table(trainPersonPath)

##load test data into R
testPathX<-paste(dirname,"/test/X_test.txt",sep="")
testXdf<-read_fwf(testPathX,fwf_widths(rep(c(16),numOfFeatures)),col_types=rep(list(c("d")),numOfFeatures))

testPathy<-paste(dirname,"/test/y_test.txt",sep="")
testydf<-read.table(testPathy)

testPersonPath<-paste(dirname,"/test/subject_test.txt",sep="")
testPersondf<-read.table(testPersonPath)

##merging train and test data sets

##train and test data sets preparation
trainData<-cbind(trainPersondf,trainydf,trainXdf)
testData<-cbind(testPersondf,testydf,testXdf)

##train and test data sets merging
mergedData<-rbind(trainData,testData)

##adding desctriptive labels to the variables
names(mergedData)<-c("PersonID","Activity",as.character(features[,2]))

##Extract measurements related to the mean and standard deviation
mergedData<-mergedData[,c(1,2,grep("mean|std",names(mergedData)))]

##adding descriptive activity labels to the mergedData
mergedData[,"Activity"]<-sapply(mergedData[,"Activity"],function(x) activities[x,2])

##making tidy data
library(reshape2)
meltedData<-melt(mergedData,id=c("PersonID","Activity"))
tidyData<-dcast(meltedData,PersonID+Activity ~ variable,mean)


