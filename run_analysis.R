xtrain<-read.table("C:/Users/ujjwal.karn/Desktop/Repos/GCD/UCI HAR Dataset/train/X_train.txt")
xtest<-read.table("C:/Users/ujjwal.karn/Desktop/Repos/GCD/UCI HAR Dataset/test/X_test.txt")

ytrain<-read.table("C:/Users/ujjwal.karn/Desktop/Repos/GCD/UCI HAR Dataset/train/y_train.txt")
ytest<-read.table("C:/Users/ujjwal.karn/Desktop/Repos/GCD/UCI HAR Dataset/test/y_test.txt")

strain<-read.table("C:/Users/ujjwal.karn/Desktop/Repos/GCD/UCI HAR Dataset/train/subject_train.txt")
stest<-read.table("C:/Users/ujjwal.karn/Desktop/Repos/GCD/UCI HAR Dataset/test/subject_test.txt")
colnames(strain)[1]<-"subject"
colnames(stest)[1]<-"subject"


features<-read.table("C:/Users/ujjwal.karn/Desktop/Repos/GCD/UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)

N1<-2947
ytestf<-data.frame(activity=numeric(N1))
ytestf[[1]] <- factor(ytest[[1]], labels = c("WALKING", "WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
xytest<-cbind(xtest,ytestf)
xystest<-cbind(xytest,stest)


N2<-7352
ytrainf<-data.frame(activity=numeric(N2))
ytrainf[[1]] <- factor(ytrain[[1]], labels = c("WALKING", "WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
xytrain<-cbind(xtrain,ytrainf)
xystrain<-cbind(xytrain,strain)



xystt<-rbind(xystrain,xystest)


b<-features[-1]

c<-as.list(b)
newlist<-c$V2

last<-as.list(c("activity","subject"))
newlist2<-append(newlist,last)

names(xystt)<-newlist2

m<-xystt[,grep("mean", names(xystt), value=TRUE)]

s<-xystt[,grep("std", names(xystt), value=TRUE)]

s1<-xystt[562]
s2<-xystt[563]

tidy<-cbind(m,s,s1,s2)

final <-aggregate(tidy[1:79], by=list(tidy$subject,tidy$activity),FUN=mean, na.rm=TRUE)



write.csv(final, file = "finalData.csv")
write.table(final, file = "finalData.txt")

