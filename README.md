# ESG ANOVA & Hypothesis Testing

## 🌍 Overview
This repository contains a collection of R scripts demonstrating advanced hypothesis testing and Analysis of Variance (ANOVA). The projects highlight the ability to handle categorical explanatory variables, test for significant differences across multiple groups, manage interaction terms, and correct residual variance issues using mathematical transformations.

## 📂 Case Studies & Scripts

### 1. Water Quality Monitoring: Plynlimon Catchment
* **Context:** Analysing instream nitrate ($NO_3$) concentrations across different monitoring sites and seasons in mid-Wales.
* **Key Statistical Methods:** Ordinal factor transformation, Two-way ANOVA, identifying the Minimum Sufficient Model (MSM) by removing non-significant interaction terms, Logarithmic transformations to correct heteroscedasticity, and Tukey HSD.

### 2. Environmental Monitoring: Air Pollution
* **Context:** Comparing atmospheric sulphur dioxide ($SO_2$) concentrations across global cities.
* **Key Statistical Methods:** Data stacking, One-way ANOVA, Square-root transformation to correct heteroscedasticity, and Tukey HSD post-hoc testing.

### 3. Environmental Monitoring: Avian Biodiversity
* **Context:** Evaluating the variance in avian biomass across distinct coastal habitats and species groups.
* **Key Statistical Methods:** Two-way ANOVA, interaction testing, stepwise reduction to isolate the Minimum Sufficient Model (MSM), Square-root transformation to correct heteroscedasticity, and Tukey HSD.

### 4. Environmental Toxicology: Pesticide Poisoning
* **Context:** Assessing the variance in pesticide poisoning incidents across different animal groups in Scotland[cite: 39].
* **Key Statistical Methods:** One-way ANOVA, Residual Diagnostics, Square-root transformation, and visualising Tukey HSD confidence intervals[cite: 39].

### 5. Anthropological Data: Human Skull Shape
* **Context:** Analysing skull width variance based on population demographics and gender.
* **Key Statistical Methods:** Two-way ANOVA, interaction terms (`*` operator), and complex post-hoc pairwise comparisons.

### 6. Biological Indicators: Ground Squirrels
* **Context:** Evaluating average birth weights across different genders.
* **Key Statistical Methods:** Simple One-way ANOVA and base R visualisations (boxplots).

### 7. Public Health: Drug-Related Deaths
* **Context:** Evaluating class A drug-related mortality rates in England and Wales based on age demographics and gender.
* **Key Statistical Methods:** Ordinal data sorting, Two-way ANOVA with interaction terms (`*` operator), Log transformation, and extensive post-hoc pairwise comparisons.

### 8. Corporate Social Responsibility (CSR): Public Health Metrics
* **Context:** Assessing physical health and wellness metrics (exercise hours) across distinct demographic groups (male, female, non-binary).
* **Key Statistical Methods:** One-way ANOVA, residual variance checks, comparative data transformations (Logarithmic and Square-root) to normalise distributions, and Tukey HSD post-hoc analysis.
