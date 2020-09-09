## === Steps ==============
## 1. Install R or R-base
## 2, Install git
## 3. Install Emacs + ESS
## 4. Downlaod CDC COVID-19 Deaths by Age and Sex
## 5. Use sed and cut, grep to pull US and Ohio Data
## 6. Fire up eamcs in ess/R mode and install ggplot2
## 7. Install scales also.
##
## install.packages("ggplot2")
## install.packages("scale")
## ggplit(df) + geom_lines(aes(x=date,y=deaths) + labs(title="",xlab="",ylab=") + geom_smooth(aes(x,y)
##
library(ggplot2)
library(scales)
US <- read.csv("./us_all.csv",header=FALSE)
colnames(US) <- c("State","Sex","Ages","Deaths")
str(US)
## Pull "All_sexes"and plot
AS <- subset(US,Sex=="All_Sexes" & Ages !="All_Ages")
x11()
ggplot(AS) + geom_col(aes(x=Deaths,y=Ages)) + labs(title="Death by Age Group")
## Plot Percentage by Age Group
x11()
ggplot(AS) + geom_col(aes(x=Ages,y=Deaths/sum(Deaths,na.rm=TRUE))) +
  theme(axis.text.x = element_text(angle = 90)) + 
  scale_y_continuous(labels=percent) +
    labs(title="Deaths by Age Group as Percentage",x="Age Group",y="% of Age") +
    coord_flip()
## Plot by Sex
## Plot Male
male <- subset(US,Sex=="Male" & Ages != "All_Ages")
x11()
ggplot(male) +geom_col(aes(x=Deaths,y=Ages)) +
    labs(title="US Male Deaths by Age")
## Plot of Percentage of Deaths by Male and  Age.
x11()
ggplot(male) + geom_col(aes(x=Ages,y=Deaths/sum(Deaths,na.rm=TRUE))) +
  theme(axis.text.x = element_text(angle = 45)) + 
  scale_y_continuous(labels=percent) +
    labs(title="US Male Deaths by Age Group as Percentage",x="Ages")+
coord_flip()
## For Female
female <- subset(US,Sex=="Female" & Ages != "All_Ages")
x11()
ggplot(female) +geom_col(aes(x=Deaths,y=Ages)) +
    labs(title="US Female Deaths by Age")
## Plot of Percentage of Deaths by Females and  Age.
x11()
ggplot(female) + geom_col(aes(x=Ages,y=Deaths/sum(Deaths,na.rm=TRUE))) +
  theme(axis.text.x = element_text(angle = 45)) + 
  scale_y_continuous(labels=percent) +
    labs(title="US Female Deaths by Age Group as Percentage",x="Ages")+
    coord_flip()
##
## Plots of Ohio Deaths by Sex and Age
buckeye <- read.csv("./buckeye.csv",header=FALSE)
female <- subset(buckeye,Sex=="Female" & Ages != "All_Ages")
x11()
ggplot(female) +geom_col(aes(x=Deaths,y=Ages)) +
    labs(title=" Ohio Female Deaths by Age")
female <- subset(,Sex=="Female" & Ages != "All_Ages")
x11()
##
## Plot of Percentage of Deaths by Females and  Age.
x11()
ggplot(female) + geom_col(aes(x=Ages,y=Deaths/sum(Deaths,na.rm=TRUE))) +
  theme(axis.text.x = element_text(angle = 45)) + 
  scale_y_continuous(labels=percent) +
    labs(title="Ohio Female Deaths by Age Group as Percentage",x="Ages")+
    coord_flip()
