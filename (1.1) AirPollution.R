# ==============================================================================
# Project: ESG & Environmental Data (Air Pollution ANOVA)
# Description: One-way ANOVA, residual diagnostics, data transformation, 
#              and Tukey HSD post-hoc testing on SO2 concentrations.
# ==============================================================================

options(scipen = 9999)

# 1. Setup and Data Import
ap <- read.csv("AirPollution.csv", stringsAsFactors = TRUE)

# Stack data to create categorical groupings for ANOVA
ap.s <- stack(ap)
names(ap.s) <- c("SO2", "City")

# 2. Exploratory Data Analysis
par(mfrow = c(1, 1))
boxplot(SO2 ~ City, data = ap.s, col = rainbow(4), main = "SO2 Levels by City")
tapply(ap.s$SO2, ap.s$City, sd)
summary(ap.s)

# 3. ANOVA Modelling
ap.m1 <- aov(SO2 ~ City, data = ap.s)
summary(ap.m1)

# Check residuals (variance issues expected)
par(mfrow = c(2, 2))
plot(ap.m1)

# 4. Model Improvement (Square-Root Transformation)
ap.m2 <- aov(sqrt(SO2) ~ City, data = ap.s)
summary(ap.m2)

# Re-check improved residuals
plot(ap.m2)

# 5. Post-Hoc Analysis
summary.lm(ap.m2)
ap.mT <- TukeyHSD(ap.m2)
print(ap.mT)

# Plot significant differences
par(mar = c(5, 10, 3, 2), mfrow = c(1, 1))
plot(ap.mT, las = 1)
