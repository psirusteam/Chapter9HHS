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

Here, \(y_{ij}\) represents the income of individual \(i\) in stratum \(j\); \(\beta_{0j}\) is the intercept in stratum \(j\); \(\epsilon_{ij}\) is the residual for individual \(i\) in stratum \(j\); \(\gamma_{00}\) is the overall intercept, and \(\tau_{0j}\) is the random effect for the intercept. For this model, it is assumed that:

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
