# Other modeling scenarios

In this section we indicate the literature and software supporting the fitting of some other models to complex household survey data, including:

## Multilevel models

Multilevel models, also known as mixed effects models or hierarchical models, are a statistical technique used in the analysis of household survey data to incorporate a hierarchical or multilevel structure. In these surveys, data are collected at the individual level (e.g., information about the age, gender, and education of each household member) and at the household level (e.g., household income, home ownership, and geographic location). Additionally, these models allow for the analysis of how household-level and individual-level factors influence responses to survey questions. For example, a multilevel model could be used to investigate how household income and the ages of household members influence the consumption of healthy foods.

In multilevel models, two types of effects are considered: fixed effects and random effects. Fixed effects represent the average relationships between variables, while random effects model the variation in these relationships across households. Thus, multilevel models account for heterogeneity in the population and provide more accurate estimates of the variables of interest. Therefore, multilevel models are a valuable tool in analyzing household survey data, as they allow for the examination of how both household-level and individual-level factors influence survey responses, while accounting for the hierarchical structure of the data.

Relevant references on the use of multilevel models in household surveys include @goldstein2011, a classic reference for multilevel data analysis that discusses the use of hierarchical models in various contexts, including household surveys; @gelmanhill2019, which offers an accessible introduction to the theory and practice of hierarchical models; @rabe2012multilevel, a practical guide for analyzing multilevel and longitudinal data using statistical software such as Stata; and @browne2006comparison, which compares Bayesian and frequentist approaches based on likelihood.

### Model with Random Intercept

In the analysis of multilevel models, two types of estimates are relevant. The first is associated with the regression coefficients, generally referred to as the fixed parameters of the model; the second pertains to the variance estimates, usually called the random parameters of the model. Any multilevel regression analysis should always begin with estimating the variance at both levels for the dependent variable.

The recommended first step in multilevel regression analysis involves decomposing the variance of the dependent variable across the different levels. For example, assuming that the variable of interest is individual income and that there is a hierarchical relationship between individuals and strata, the variance of income can be decomposed into two parts: the variance within strata and the variance between strata. These two components of variance can be obtained from a simple multilevel regression with a null model represented by the following expression:

$$
y_{ij} = \beta_{0j} + \epsilon_{ij}
$$

Here, $y_{ij}$ represents the income of individual $i$ in stratum $j$; $\beta_{0j}$ is the intercept in stratum $j$; $\epsilon_{ij}$ is the residual for individual $i$ in stratum $j$; $\gamma_{00}$ is the overall intercept, and $\tau_{0j}$ is the random effect for the intercept. For this model, it is assumed that:

$$
\tau_{0j} \sim N(0, \sigma_{\tau}^{2})
$$ 

Additionally,

$$
\epsilon_{ij} \sim N(0, \sigma_{\epsilon}^{2}).
$$ 

According to @cai2013investigation, there is sufficient evidence that sampling weights should be used in multilevel modeling to obtain unbiased estimates. Currently, different authors recommend various approaches on how to use sampling weights in hierarchical models. For instance, @pfeffermann1998weighting and @asparouhov2006general advise employing a pseudolikelihood approach to calculate estimates within and between different levels to achieve unbiased estimates.

An important concept in this type of analysis is the intra-class correlation (ICC), which refers to the proportion of the total variance of a variable that is explained by differences between groups or levels (strata) in the model. In other words, the ICC measures the similarity or correlation between observations within the same group or level compared to observations from different groups. This quantity is calculated as follows:

$$
\rho = \frac{\sigma_{\tau}^{2}}{\sigma_{\tau}^{2} + \sigma_{\epsilon}^{2}}
$$

A high ICC indicates that a large proportion of the total variation in the variable is due to differences between groups, suggesting that the groups are distinct from one another and that the group effects should be considered in the model. Conversely, a low ICC indicates that most of the variation in the variable occurs within groups, implying that the group effects are not as significant in explaining variability in the variable.

### Model with Random Slope

This type of model allows the relationship between the independent variable and the dependent variable to change according to some other explanatory variable. In other words, it permits the slope of the relationship between the variables to differ as groups or subsets of data are considered. In a simple linear regression model, the relationship is modeled as a straight line with a fixed slope. However, in a model with a random slope, the slope can vary according to another explanatory variable.

In these types of models, the relationship between the variables can imply a curve with different slopes for different subgroups. Random slope models are useful in situations where it is expected that the relationship between the variables changes in a nonlinear way or when differences in slope among subgroups need to be modeled. Consider the following model:

$$
Income_{ij} = \beta_{0} + \beta_{1j} Spending_{ij} + \epsilon_{ij}
$$

where $\beta_{1j}$ is given as

$$
\beta_{1j} = \gamma_{10} + \gamma_{11} Stratum_{j} + \tau_{1j}
$$

In this particular case, the slope varies according to the sampling strata, while the intercept remains fixed. This allows for a more accurate capture of how the relationship between spending and income may differ across different groups, providing a better understanding of the patterns in the data.


### Model with Random Intercept and Slope

Models with random intercepts and slopes are a type of statistical model that allows for modeling the relationship between a response variable and one or more predictor variables, considering both fixed and random effects. In these models, the regression coefficients (i.e., the slope and intercept) are treated as random rather than fixed, meaning these coefficients can vary across units of analysis, which may be individuals, groups, geographical regions, etc. These variations are modeled as random effects incorporated into the regression equation.

Continuing with the context of a household survey, consider the following model:

$$
Income_{ij} = \beta_{0j} + \beta_{1j} Spending_{ij} + \epsilon_{ij}
$$

where the intercept and slope are modeled as:

$$
\beta_{0j} = \gamma_{00} + \gamma_{01} Stratum_{j} + \tau_{0j}
$$

and 

$$
\beta_{1j} = \gamma_{10} + \gamma_{11} Stratum_{j} + \tau_{1j}
$$

In this model, $\beta_{0j}$ and $\beta_{1j}$ depend on the stratum variable, allowing both the intercept and slope to change according to the group of interest. This provides greater flexibility and better captures the heterogeneity in the data, reflecting how relationships between the variables may differ across subgroups.



## Survival models

## Loglinear models for contingency tables

When analyzing the relationships between variables that generate estimated totals in a contingency table (a rectangular arrangement that organizes data based on two or more categorical variables, showing the frequency or proportion of cases falling into each combination of categories), it is possible to use a log-linear model. This type of model is used to study the association between categorical variables while controlling for or considering potential effects of other covariates. Additionally, it allows for adjusting the observed associations in the contingency table and assessing whether these associations are statistically significant.

Log-linear models in contingency tables can be used to determine whether there is a significant association between categorical variables; adjust the association between variables of interest by accounting for other variables that may influence the relationship; evaluate how the probability of a category in one categorical variable changes given a change in another categorical variable; and estimate the probability of a case falling into a specific category of a categorical variable given the information from other variables.

The term log-linear essentially describes the role of the link function used in generalized linear models. In the simplest case, with two categorical variables inducing data from counts or proportions in contingency tables, the following statistical model can be formulated:

$$
\ln(\pi_{ijk}) = \mu + \lambda_i^X + \lambda_j^Y + \lambda_{ij}^{XY},   
$$

where $\pi_{ijk}$ is the conditional probability of occurrence for the combination of categories $i$ and $j$ in the categorical variables $X$ and $Y$, respectively; $\mu$ is the intercept representing the logarithm of the reference probability; $\lambda_i^X$ and $\lambda_j^Y$ are the main effects associated with categories $i$ and $j$ in the variables $X$ and $Y$, respectively; and finally, $\lambda_{ij}^{XY}$ is the interaction effect between categories $i$ and $j$ in the categorical variables. The natural logarithm function is commonly used in these models to transform conditional probabilities and allow for interpretation in terms of log-odds. In summary, the model describes how the conditional probabilities of categorical events are related to each other and how these relationships can be influenced by main and interaction effects in the categorical variables $X$ and $Y$.

This statistic is applied after a statistical model has been chosen (such as simple linear regression, logistic regression, among others). The Wald chi-squared test statistic for the null hypothesis of independence between rows and columns in a contingency table is defined as follows:

$$
Q_{wald} = \hat{\boldsymbol{Y}}^{t} \left(\boldsymbol{H} \hat{\boldsymbol{V}} \left(\hat{\boldsymbol{N}}\right) \boldsymbol{H}^{t}\right)^{-1} \hat{\boldsymbol{Y}}
$$

where 

$$
\hat{\boldsymbol{Y}} = \left(\hat{N} - E\right)
$$

is a vector of $R \times C$ differences between observed and expected cell counts, that is, $\hat{N}_{rc} - E_{rc}$. The matrix $\boldsymbol{H} \hat{\boldsymbol{V}} \left(\hat{\boldsymbol{N}}\right) \boldsymbol{H}^{t}$ represents the estimated variance-covariance matrix for the difference vector. In the case of a complex survey design, the variance-covariance matrix of the weighted frequency counts, $\hat{V} \left(\hat{N}\right)$, is estimated using resampling methods or Taylor approximation. The matrix $\boldsymbol{H}$ is the inverse of the matrix $\boldsymbol{J}$ given by:

$$
\boldsymbol{J} = -\left[\frac{\delta^{2} \ln PL\left(\boldsymbol{B}\right)}{\delta^{2} \boldsymbol{B}}\right] \bigg|_{\boldsymbol{B} = \hat{\boldsymbol{B}}}
$$

Under the null hypothesis of independence, the Wald statistic follows a chi-squared distribution with $(R-1) \times (C-1)$ degrees of freedom:

$$
Q_{wald} \sim \chi^{2}_{(R-1)(C-1)}
$$

The F transformation of the Wald statistic is:

$$
F_{wald} = Q_{wald} \times \frac{df - (R-1)(C-1) + 1}{(R-1)(C-1) df} \sim F_{(R-1)(C-1), df - (R-1)(C-1) + 1}
$$
