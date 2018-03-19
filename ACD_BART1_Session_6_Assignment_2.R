#1. Import the Titanic Dataset from the link Titanic Data Set. 
#Perform the following: 

library(titanic)
View(Titanic)
View(titanic_gender_class_model)
View(titanic_train)
#a. Is there any difference in fares by different class of tickets?  
#Note - Show a boxplot displaying the distribution of fares by class 

#use titanic_train dataset

boxplot(Fare~Pclass,data= titanic_train,
        main="Fares Versus Pclass",xlab="Fares",ylab="Class",col=topo.colors(3))




#b. Is there any association with Passenger class and gender? 
#Note - Show a stacked bar chart 


counts<-table(titanic_train$Sex,titanic_train$Pclass)
barplot(counts, main = "Distribution of Class by gender", xlab="Pclass", col=c("blue", "red"), legend = c("Female","Male"), names.arg = c("Pclass1st", "Pclass2nd","Pclass3rd"))

#or like this too

a1 <- titanic_train$Sex
a1
counts<-table(a1,titanic_train$Pclass)
barplot(counts, main = "Distribution of Class by gender", xlab="Pclass", col=c("blue", "red"), legend = c("Female","Male"), names.arg = c("Pclass1st", "Pclass2nd","Pclass3rd"))


#we can do chisq test also for checking association
chisq.test(titanic_train$Pclass ,titanic_train$Sex)

#ho:there is no association
#since p value is 0.0002064<0.05 
#we reject the null hypothesis and thus say there is association
