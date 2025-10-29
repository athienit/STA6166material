# STA6166 Material - R Code Organization

This directory contains R code organized by statistical topic. All code has been organized into the following categories:

## Directory Structure

### 1. hypothesis_testing/ (10 files)
Parametric hypothesis tests and confidence interval methods.
- **2t_test.R** - Two-sample t-tests with equal and unequal variances
- **anova1.R** - One-way ANOVA with visualizations and post-hoc comparisons
- **anova_drug.R** - ANOVA example with drug data
- **vartest.R** - Variance (F) test for comparing variances
- **var_ratio.R** - Variance ratio test
- **t_paired.R** - Paired t-test
- **levene.R** - Levene's test for homogeneity of variance
- **Bonf.R** - Bonferroni adjustment for multiple comparisons
- **allpairCI.R** - All pairwise confidence intervals
- **rankTukey.R** - Tukey HSD test for rank comparisons

### 2. regression/ (7 files)
Linear regression, model selection, and related analyses.
- **reg.R** - Basic linear regression with visualization
- **safe_reg.R** - Safe/robust regression methods
- **reg_ex.R** - Regression examples
- **reg_transpred.R** - Regression with transformations and predictions
- **stepT.R** - Step-wise model selection
- **rank_regression.R** - Rank-based regression
- **cruise_model_selection.R** - Model selection example with cruise data

### 3. categorical_data/ (2 files)
Analysis of categorical and contingency table data.
- **contingency.R** - Contingency table analysis and chi-square tests
- **corrs.R** - Correlation analysis

### 4. nonparametric/ (7 files)
Non-parametric hypothesis tests for rank-based analyses.
- **kruskal_wallis.R** - Kruskal-Wallis test (non-parametric ANOVA)
- **wilcox_1.R** - Wilcoxon signed-rank test
- **wilcox_1sample.R** - Wilcoxon one-sample test
- **wilcox_2.R** - Wilcoxon two-sample test
- **friedman.R** - Friedman test for repeated measures
- **friedman.test2.R** - Alternative Friedman test implementation
- **rank_r.R** - Rank correlation

### 5. model_diagnostics/ (4 files)
Model assumption checking and diagnostic plots.
- **check.R** - Comprehensive function for checking regression model assumptions (normality, homogeneity, independence)
- **QQ.R** - Q-Q plots and normality assessment using base R and ggplot2
- **boxcox.R** - Box-Cox power transformation for variance stabilization
- **RBD.R** - Randomized block design diagnostics

### 6. resampling/ (2 files)
Bootstrap and permutation-based inference methods.
- **bootstrap.R** - Bootstrap confidence intervals for regression parameters
- **sign_pvalue.R** - Permutation test p-values using sign test

### 7. visualization/ (4 files)
Data visualization and plotting techniques.
- **hist1_boxplot1.R** - Histograms and boxplots
- **scatterplot.R** - Scatterplot examples
- **pie.R** - Pie chart examples
- **color.R** - Color palette and color manipulation

### 8. descriptive_stats/ (4 files)
Descriptive statistics and fundamental statistical concepts.
- **CLT_illustration.R** - Central Limit Theorem illustration with sample means
- **CI_multiple samples.R** - Confidence interval illustrations across multiple samples
- **loc_stats.R** - Location and scale statistics
- **overview.R** - Overview of basic statistical concepts

### 9. utilities/ (6 files)
Data files, helper utilities, and example datasets.
- **copier.R** - Copier data analysis example
- **cerebral.R** - Cerebral data example
- **esteem.R** - Self-esteem data example
- **linthurst.R** - Linthurst data example
- **rating.R** - Rating data example
- **hmwk12_13.R** - Homework examples and exercises

## Summary Statistics

- **Total R files:** 46
- **Categories:** 9
- **Largest category:** hypothesis_testing (10 files)
- **Smallest categories:** categorical_data, resampling (2 files each)

## Usage

To use any of these files:
1. Navigate to the appropriate category folder
2. Open the R file in your R or RStudio environment
3. Run the code to see examples and analyses

## Note on File Integrity

All code has been organized by category without any modifications to the original code. The organization is purely structural and preserves all functionality.
