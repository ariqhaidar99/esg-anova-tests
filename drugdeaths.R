# Import dataset
drug <- read.csv("DrugDeaths.csv", stringsAsFactors = TRUE)
str(drug)
table(drug)
# Sort to ordinal data
drug$age <- ordered(drug$agegrp, levels = 
                  c("U20", "U30", "U40", "U50", "U70", "U100"))
# Plotting deaths by age and sex separately
par(mfrow=c(2,1))
boxplot(drug$deaths~drug$age, col=rainbow(7), xlab="Age Group",
        ylab="Number of Deaths")
boxplot(drug$deaths~drug$sex, col=rainbow(7), xlab="Sex",
        ylab="Number of Deaths")
# Plotting deaths by age and sex in one graph
par(mfrow=c(1,1))
boxplot(drug$deaths~drug$age+drug$sex, col=rainbow(7), xlab="Age Group & Sex",
        ylab="Number of Deaths", las=2)
# Basic statistics test
tapply(drug$deaths,list(drug$age,drug$sex), median)
tapply(drug$deaths,list(drug$age,drug$sex), mean)
tapply(drug$deaths,list(drug$age,drug$sex), IQR)
# Min-Max models
drug.m1 <- aov(drug$deaths~drug$age*drug$sex)
summary(drug.m1)
# Residual check
par(mfrow=c(2,2))
plot(drug.m1)
# Applying log transform to the first model
drug.m2 <- aov(log(drug$deaths)~drug$age*drug$sex)
summary(drug.m2)
# Residual check v2
par(mfrow=c(2,2))
plot(drug.m2)
# Checking explanatory power of the model
summary.lm(drug.m2)
# TukeyHSD (Honest Significant Difference) test
TukeyHSD(drug.m2)
