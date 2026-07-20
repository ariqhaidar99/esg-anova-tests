# ==============================================================================
# Project: Anthropological Data (Human Skull Shape)
# Description: Two-way ANOVA with interaction terms to assess skull width 
#              variance across different populations and genders.
# ==============================================================================

# 1. Setup and Data Import
options(scipen = 999)
hs <- read.csv("HumanSkullShape.csv", stringsAsFactors = TRUE)

# 2. Exploratory Data Analysis
par(mfrow = c(1, 1))
boxplot(skullwidth ~ population, data = hs, col = rainbow(3), main = "Skull Width by Population")
boxplot(skullwidth ~ population + sex, data = hs, col = rainbow(3), main = "Skull Width by Population & Sex")

# 3. One-Way ANOVA Modelling
hs.mod1 <- aov(hs$skullwidth~hs$population)
summary(hs.mod1)
hs.mod2 <- aov(hs$skullwidth~hs$sex)
summary(hs.mod2)

# 4. Two-Way ANOVA Modelling
# Model with independent variables
hs.mod3 <- aov(hs$skullwidth~hs$population+hs$sex)
summary(hs.mod3)
hs.mod4 <- aov(hs$skullwidth~hs$population*hs$sex)
summary(hs.mod4)
# Maximal Model: Including interaction terms between population and sex
hs.mod4 <- aov(skullwidth ~ population * sex, data = hs)
summary(hs.mod4)

# 5. Model Diagnostics & Post-Hoc
par(mfrow = c(2, 2))
plot(hs.mod4)

summary.lm(hs.mod4)
TukeyHSD(hs.mod4)
