## === Steps ==============
## 1. Install R or R-base
## 2, Install git
## 3. Install Emacs + ESS
## 4. Downlaod CDC COVID-19 Deaths by Age and Sex
## 5. Use sed and cut, grep to pull US and Ohio Data
## 6. Fire up eamcs in ess/R mode and install ggplot2
## 7. Install scales also.
##
install.packages("ggplot2")
## ggplit(df) + geom_lines(aes(x=date,y=deaths) + labs(title="",xlab="",ylab=") + geom_smooth(aes(x,y)
##
library(ggplot2)
library(scales)
US <- read.csv("./us_totals.csv",header=FALSE)
colnames(US) <- c("State","Sex","Ages","Deaths")
str(US)
## Pull "All_sexes"and plot
AS <- subset(US,Sex=="All_Sexes" & Ages !="All_Ages")
ggplot(AS) + geom_col(aes(x=Deaths,y=Ages))
## Plot Percentage by Age Group
ggplot(AS) + geom_col(aes(x=Ages,y=Deaths/sum(Deaths,na.rm=TRUE))) +
  theme(axis.text.x = element_text(angle = 90)) + 
  scale_y_continuous(labels=percent) +
    labs(title="Deaths by Age Group as Percentage",x="Age Group",y="% of Age") +
    coord_flip()
## Plot by Sex
## Plot Male
male <- subset(US,Sex=="Male" & Ages != "All_Ages")
ggplot(male) +geom_col(aes(x=Deaths,y=Ages)) +
    labs(title="US Male Deaths by Age)
## Plot of Percentage of Deaths by Male and  Age.
ggplot(male) + geom_col(aes(x=Ages,y=Deaths/sum(Deaths,na.rm=TRUE))) +
  theme(axis.text.x = element_text(angle = 45)) + 
  scale_y_continuous(labels=percent) +
    labs(title="US Male Deaths by Age Group as Percentage",x="Ages")+
coord_flip()
## For Female
female <- subset(US,Sex=="Female" & Ages != "All_Ages")
ggplot(female) +geom_col(aes(x=Deaths,y=Ages)) +
    labs(title="US Female Deaths by Age")
## Plot of Percentage of Deaths by Male and  Age.
ggplot(female) + geom_col(aes(x=Ages,y=Deaths/sum(Deaths,na.rm=TRUE))) +
  theme(axis.text.x = element_text(angle = 45)) + 
  scale_y_continuous(labels=percent) +
    labs(title="US Female Deaths by Age Group as Percentage",x="Ages")+
coord_flip()
