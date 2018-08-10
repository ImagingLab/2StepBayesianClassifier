# Data file headers:
# 'case','struct', 'class','V1','V2','V3','ASM','CONTRAST','ENTROPY','CORRELTN','HOMOG','VARIANCE','SUMMN','INERTIA','CLUSTSHADE','CLUSTTEND','MAXPROB','INVVAR','CORTICAL','GRADMAG' 
# 'case' : patient number, 'struct' : FreeSurfer label, 'class' : class label, 'V1'-'V3': vertices

SEL_DATA_ALL<-read.table("DATASET_TEST.txt",header=T) # TEST
SEL_DATA_ALL_1<-read.table("DATASET_TRAIN.txt",header=T) # TRAIN

DATA_COMB<-rbind(SEL_DATA_ALL,SEL_DATA_ALL_1)


#normalizations for selected feature values
# First 5 columns remain same (case,class,v1,v2,v3)
DATA_COMB_z<-DATA_COMB[,1:3]

# Use scale to compute zscores for remaining features
DATA_COMB_z$V1<-scale(DATA_COMB[,4],center=TRUE,scale=TRUE)
DATA_COMB_z$V2<-scale(DATA_COMB[,5],center=TRUE,scale=TRUE)
DATA_COMB_z$V3<-scale(DATA_COMB[,6],center=TRUE,scale=TRUE)
DATA_COMB_z$ASM<-scale(DATA_COMB[,7],center=TRUE,scale=TRUE)
DATA_COMB_z$CONTRAST<-scale(DATA_COMB[,8],center=TRUE,scale=TRUE)
DATA_COMB_z$ENTROPY<-scale(DATA_COMB[,9],center=TRUE,scale=TRUE)
DATA_COMB_z$CORRELTN<-scale(DATA_COMB[,10],center=TRUE,scale=TRUE)
DATA_COMB_z$HOMOG<-scale(DATA_COMB[,11],center=TRUE,scale=TRUE)
DATA_COMB_z$VARIANCE<-scale(DATA_COMB[,12],center=TRUE,scale=TRUE)
DATA_COMB_z$SUMMN<-scale(DATA_COMB[,13],center=TRUE,scale=TRUE)
DATA_COMB_z$INERTIA<-scale(DATA_COMB[,14],center=TRUE,scale=TRUE)
DATA_COMB_z$CLUSTSHADE<-scale(DATA_COMB[,15],center=TRUE,scale=TRUE)
DATA_COMB_z$CLUSTEND<-scale(DATA_COMB[,16],center=TRUE,scale=TRUE)
DATA_COMB_z$MAXPROB<-scale(DATA_COMB[,17],center=TRUE,scale=TRUE)
DATA_COMB_z$INVVAR<-scale(DATA_COMB[,18],center=TRUE,scale=TRUE)
DATA_COMB_z$CORTICAL<-scale(DATA_COMB[,19],center=TRUE,scale=TRUE)
DATA_COMB_z$GRADMAG<-scale(DATA_COMB[,20],center=TRUE,scale=TRUE)
head(DATA_COMB_z)


NORM_d<-DATA_COMB_z[1:dim(SEL_DATA_ALL)[1],]
NORM_d_1<-DATA_COMB_z[(dim(SEL_DATA_ALL)[1]+1):dim(DATA_COMB)[1],]


library(naivebayes)
library(class)
library(gmodels)


# Convert class label to factor
NORM_d$class<-factor(NORM_d$class)
NORM_d_1$class<-factor(NORM_d_1$class)

i=1
data_train<-NORM_d_1[SEL_DATA_ALL_1$case!=i,c(3,19:20)]
data_test<-NORM_d[SEL_DATA_ALL$case==i,c(19:20)]

train_labels<-NORM_d_1[SEL_DATA_ALL_1$case!=i,c(3)]
test_labels<-SEL_DATA_ALL[SEL_DATA_ALL$case==i,c(3)]
atree<-naive_bayes(class~.,data=data_train,prior=c(0.95,0.75))

PREDICTION<-predict(atree,newdata = data_test)	
#CrossTable(x=test_labels, y=PREDICTION,prop.chisq=FALSE)	
print(table(test_labels,PREDICTION))

# Select the newly identified points
selected<-NORM_d[SEL_DATA_ALL$case==i,]
selected$predicted<-PREDICTION

data_train<-NORM_d_1[SEL_DATA_ALL_1$case!=i,c(3,7:18)]
data_test<-selected[selected$predicted==1,c(7:18)]

train_labels<-NORM_d_1[SEL_DATA_ALL_1$case!=i,c(3)]
test_labels<-selected[selected$predicted==1,c(3)]

atree<-naive_bayes(class~.,data=data_train,prior=c(0.75,0.55))

PREDICTION_2<-predict(atree,newdata = data_test)
print(table(test_labels,PREDICTION_2))
PREDICTION[PREDICTION==1]<-PREDICTION_2
test_labels<-SEL_DATA_ALL[SEL_DATA_ALL$case==i,c(3)]
print(table(test_labels,PREDICTION))
end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken



x<-PREDICTION




for (i in c(2,3,4,5,7,8,9,10,11,12,13,16,17,18,19,20,21,22,23,24,26,27,29,31,32,33,35,36,38,39,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,61,62,63,65230,262,264,265,266,269,270,271,273,274,275,276,277)){
print(i)
data_train<-NORM_d_1[SEL_DATA_ALL_1$case!=i,c(3,19:20)]
data_test<-NORM_d[SEL_DATA_ALL$case==i,c(19:20)]

train_labels<-NORM_d_1[SEL_DATA_ALL_1$case!=i,c(3)]
test_labels<-SEL_DATA_ALL[SEL_DATA_ALL$case==i,c(3)]
atree<-naive_bayes(class~.,data=data_train,prior=c(0.95,0.75))

PREDICTION<-predict(atree,newdata = data_test)	
#CrossTable(x=test_labels, y=PREDICTION,prop.chisq=FALSE)	
#print(table(test_labels,PREDICTION))

# Select the newly identified points
selected<-NORM_d[SEL_DATA_ALL$case==i,]
selected$predicted<-PREDICTION

data_train<-NORM_d_1[SEL_DATA_ALL_1$case!=i,c(3,7:18)]
data_test<-selected[selected$predicted==1,c(7:18)]

train_labels<-NORM_d_1[SEL_DATA_ALL_1$case!=i,c(3)]
test_labels<-selected[selected$predicted==1,c(3)]

atree<-naive_bayes(class~.,data=data_train,prior=c(0.75,0.55))

PREDICTION_2<-predict(atree,newdata = data_test)
#print(table(test_labels,PREDICTION_2))
PREDICTION[PREDICTION==1]<-PREDICTION_2
test_labels<-SEL_DATA_ALL[SEL_DATA_ALL$case==i,c(3)]
print(table(test_labels,PREDICTION))

x<-append(x,PREDICTION)

}
end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken

write.csv(x, file = "NB_T1_2S.csv")
