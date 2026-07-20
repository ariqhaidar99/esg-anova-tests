# ==============================================================================
# Project: ESG & Public Health (Drug-Related Mortality)
# Description: Two-way ANOVA modelling evaluating class A drug-related mortality 
#              rates across age demographics and gender. Includes ordinal factor 
#              sorting, interaction testing, residual diagnostics, and 
#              demographic summary statistics.
# ==============================================================================

# 1. Setup and Data Import -----------------------------------------------------
# Import and Inspection of dataset
drug <- read.csv("DrugDeaths.csv", stringsAsFactors = TRUE)
str(drug)
table(drug)
# Convert 'agegrp' to an ordered ordinal factor for logical demographic progression
drug$age <- ordered(drug$agegrp, levels = 
                  c("U20", "U30", "U40", "U50", "U70", "U100"))

# 2. Exploratory Data Analysis -------------------------------------------------
# Plotting deaths by age and sex separately
par(mfrow=c(2,1))
boxplot(drug$deaths~drug$age, col=rainbow(7), xlab="Age Group",
        ylab="Number of Deaths")
boxplot(drug$deaths~drug$sex, col=rainbow(7), xlab="Sex",
        ylab="Number of Deaths")
# Plotting deaths by age and sex in one comparative graph
par(mfrow=c(1,1))
boxplot(drug$deaths~drug$age+drug$sex, col=rainbow(7), xlab="Age Group & Sex",
        ylab="Number of Deaths", las=2)
# Basic statistics test
tapply(drug$deaths,list(drug$age,drug$sex), median)
tapply(drug$deaths,list(drug$age,drug$sex), mean)
tapply(drug$deaths,list(drug$age,drug$sex), IQR)

# 3. Two-Way ANOVA Modelling ---------------------------------------------------
# Maximal Model: Evaluating the interaction between Age and Sex on Mortality
drug.m1 <- aov(drug$deaths~drug$age*drug$sex)
summary(drug.m1)

# 4. Model Diagnostics & Post-Hoc Analysis -------------------------------------
# Check residuals for normality and constant variance
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
