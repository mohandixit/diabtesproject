df<- read.csv("diabetes.csv",sep = ',')
#print(head(df))
#print(summary(df))
library(caTools)
#set.seed(101)
split<-sample.split(df,SplitRatio = 0.8)

training <- subset(df,split=='TRUE')
testing <- subset(df,split=='FALSE')

#model <- glm(Outcome~. ,training, family = "binomial")

#print(summary(model))
#model <- glm(Outcome~. - SkinThickness ,training, family = "binomial")
#print(summary(model))

#model <- glm(Outcome~. - Insulin ,training, family = "binomial")
#print(summary(model)) # this will increase the value of aic and residual deviance
# so this will not taken account

#model <- glm(Outcome~. - Age ,training, family = "binomial")
#print(summary(model))
#this will also not work

#model <- glm(Outcome~. - SkinThickness ,training, family = "binomial")
#print(summary(model))

model <- glm(Outcome~. - SkinThickness -Insulin,training, family = "binomial")
#print(summary(model))

predit <- predict(model,testing,type = "response")

#print(predit)
table.create <- table(testing$Outcome,predictedvalues = predit >0.3)

print(table.create)
library(ggplot2)
#library(ROCR)
#ROCRpred = prediction(predit,training$Outcome)
#ROCRprf <- performance(ROCRpred,"tpr","tfr")

#plot(ROCRprf,colorize=TRUE,print.cutoffs.at=seq(0.1,by=0.1))

