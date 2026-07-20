# ==============================================================================
# Project: Corporate Social Responsibility (CSR) & Public Health
# Description: One-way ANOVA and post-hoc evaluation of physical health metrics 
#              across distinct demographic groups, utilizing logarithmic 
#              transformations to normalize variance.
# ==============================================================================

options(scipen = 999)

# 1. Setup and Data Import -----------------------------------------------------
ee <- read.csv("demographic_health_wellness_metrics.csv", stringsAsFactors = TRUE)
View(ee)
str(ee)
summary(ee$exercise)

# 2. Exploratory Data Analysis -------------------------------------------------
par(mfrow = c(1, 1))
plot(ee$exercise ~ ee$gender, col = cm.colors(3), 
     main = "Exercise Hours by Demographic", xlab = "Gender", ylab = "Hours")

# 3. ANOVA Modelling & Diagnostics ---------------------------------------------
ee.m1 <- aov(ee$exercise ~ ee$gender)
summary(ee.m1)

# Check residuals for constant variance
par(mfrow = c(2, 2))
plot(ee.m1)

# 4. Data Transformation -------------------------------------------------------
# Residuals breached assumptions; applying square-root transformation
ee.m2 <- aov(sqrt(ee$exercise) ~ ee$gender)
summary(ee.m2)
plot(ee.m2)

# Applying logarithmic transformation for comparison
ee.m3 <- aov(log(ee$exercise) ~ ee$gender)
summary.lm(ee.m1)
summary.lm(ee.m2)

# 5. Post-Hoc Analysis ---------------------------------------------------------
# Run Tukey HSD to identify specific pairwise differences between demographics
TukeyHSD(ee.m1)
TukeyHSD(ee.m2)
