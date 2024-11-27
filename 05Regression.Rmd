# Regression: modelling survey data

Regression modeling is a powerful tool for analyzing relationships between variables in survey data. It allows researchers to estimate how one or more independent variables (predictors) influence a dependent variable (outcome). For instance, consider a researcher who is modeling household income (dependent variable) as a function of education level and employment status (independent variables) using survey data.

Unlike standard regression analysis, household survey data often comes from complex sampling designs that include stratification, clustering, and unequal probabilities of selection. These features must be accounted for to ensure valid inferences. 

In this section, we explore how survey weights and sampling design features are incorporated into regression models. We also discuss a parsimonious solution to the challenges posed by weighting. Ignoring the sampling design can lead to:

- **Biased Estimates**: Unequal probabilities of selection mean some household/individuals represent more of the population than others. Without weights, the model may disproportionately reflect oversampled groups.
- **Underestimated Standard Errors**: Clustering and stratification affect the variability of estimates. Ignoring these features can result in overly narrow confidence intervals and inflated significance levels.

Modeling survey data requires careful consideration of the sampling design to ensure valid inferences. Incorporating survey weights and adjusting for clustering and stratification allows researchers to produce accurate, representative, and reliable results. 

## To weight or not to weight? 

When performing regression analysis on survey data, a key question arises: should we include survey weights in the estimation of regression parameters and their associated standard errors? This question has sparked debate among researchers (XXXXX citation needed), as there are trade-offs between accounting for the complex design features and simplifying the model for ease of interpretation and efficiency.

On the one hand, when including sampling features we are making sure to achieve  **Population Representativeness**, because survey weights ensure that the regression model reflects the true population distribution, correcting for oversampling or undersampling of certain groups. Also we will obtain **accurate Variance Estimates**, because we are adjusting for stratification, clustering, and unequal selection probabilities, providing valid standard errors and confidence intervals.

On the other hand, including sampling design features may yield to an **increasing of variance**, and can inflate the variance of parameter estimates, particularly if the weights vary widely. Also, extreme or highly variable weights can lead to unstable estimates, where certain observations disproportionately influence the model, making it unstable. For explanatory or analytical purposes (e.g., understanding relationships between variables), unweighted models can sometimes provide more efficient and stable estimates. 

To answer the question: when to Weight?, we can distinguish two scenarios:

- **Descriptive Inference**: Always weight. The primary goal is to reflect the population, and survey weights are essential for accuracy.
- **Analytical Inference**: Consider unweighted or adjusted-weight models. If the goal is to explore relationships or test hypotheses, weighting may not always be necessary, particularly if the model adjusts for key design variables (e.g., strata or clusters).

## Some inferential approaches to modelling data

When working with survey data, one of the key challenges is understanding and addressing the variability inherent in the data. This variability comes from two primary sources. The first source is the **sampling design**, which refers to the way the data was collected. The second source of variability arises from the **model itself**, which is used to analyze the data and make inferences about the population.

To combine these two sources of variability into a coherent framework, advanced inferential methods are required. These methods aim to respect the structure of the survey design while also accounting for the assumptions and uncertainties within the model. Two main approaches used for this purpose are **pseudo-likelihood** and **combined inference** (XXXXX citation neeeded).

The **pseudo-likelihood approach** modifies the traditional likelihood methods used in statistical modeling to account for the complexities of the survey design. In simpler terms, it adjusts the standard modeling techniques to ensure that they properly incorporate the way the sample was drawn. This adjustment is crucial because ignoring the sampling design can lead to biased estimates and incorrect conclusions about the population.

On the other hand, **combined inference** seeks to integrate the information from the survey design and the model in a unified way. This approach ensures that the uncertainties from both sources—sampling and model—are reflected in the final results. By blending these components, combined inference provides a more comprehensive view of the variability and helps produce more reliable estimates.

## Linear models

A regression model seeks to explain how changes in one or more independent variables affect a dependent variable. In its simplest form, linear regression examines the relationship between a single independent variable and a dependent variable. The dependent variable is the outcome of interest, while the independent variable represents factors that may influence it. The model also includes an error term, which captures unexplained variability in the data. 

### Basic Definitions

As noted by @Heeringa_West_Berglund_2017, the first authors to empirically discuss the impact of complex sampling designs on regression model inferences were @kish1974inference, who highlighted the challenges posed by complex sampling designs. Later, @fuller1975regression developed a variance estimator for regression model parameters based on Taylor linearization with unequal weighting of observations under stratified and two-stage sampling designs.

As is well known, the use of regression model theory requires certain statistical assumptions to be met, which can sometimes be challenging to verify in practice. In this regard, @shah1977inference discuss some aspects related to the violation of these assumptions and provide appropriate methods for making inferences about the estimated parameters of linear regression models using survey data.

Similarly, @binder1983variances obtained the sampling distributions of estimators for regression parameters in finite populations and related variance estimators in the context of complex samples. @skinner1989analysis studied the properties of variance estimators for regression coefficients under complex sample designs. Later, @fuller2002regression provided a summary of estimation methods for regression models containing information related to complex samples. Finally, @pfeffermann2011modelling discussed various approaches to fitting linear regression models to complex survey data, presenting empirical support for the use of the “*q-weighted*” method, which is recommended in this document.

A simple linear regression model is defined as $y=\beta_{0}+\beta_{1}x+\varepsilon$, where $y$ represents the dependent variable, $x$ is the independent variable, and $\beta_{0}$ and $\beta_{1}$ are the model parameters. The variable $\varepsilon$ is known as the random error of the model and is defined as $\varepsilon=y-\hat{y}=y-\beta_{0}+\beta_{1}x$.

For more complex situations, multiple linear regression models allow for the inclusion of several independent variables. This approach helps to account for the simultaneous effects of multiple factors on the outcome. In these models, each independent variable is associated with a coefficient, which indicates the strength and direction of its relationship with the dependent variable. Notice that, a positive coefficient suggests that as the independent variable increases, the dependent variable also increases. Generalizing the previous model, multiple linear regression models are defined by allowing the dependent variable to interact with more than two variables, as presented below:

$$
y  =  \boldsymbol{x}\boldsymbol{\beta}+\varepsilon
  =  \sum_{j=0}^{p}\beta_{j}x_{j}+\varepsilon
 =  \beta_{0}+\beta_{1}x_{1}+\cdots+\beta_{p}x_{p}+\varepsilon
$$

Another way to write the multiple regression model is:

$$
y_{i}  =  x_{i}\boldsymbol{\beta}+\varepsilon_{i}
$$

Where, $x_{i}=\left[1\,x_{1i}\,\ldots\,x_{pi}\right]$ and $\boldsymbol{\beta}^{T}=\left[\beta_{0}\,\,\beta_{1}\,\,\ldots\,\,\beta_{p}\right]$.

The subscript $i$ refers to the sample element or respondent in the dataset. Regression models are built on several assumptions about the data. @Heeringa_West_Berglund_2017 present some considerations for regression models, which are described below:

- $E\left(\varepsilon_{i}\mid x_{i}\right)=0$. That is, the average error for any given value of the independent variable is assumed to be zero, meaning that the model does not systematically over- or under-predict outcomes.
- $Var\left(\varepsilon_{i}\mid x_{i}\right)=\sigma_{y,x}^{2}$. That is, the variability of the errors should be consistent across all levels of the independent variables, a property known as homoscedasticity (homogeneity of variance). 
-   $\varepsilon_{i}\mid x_{i}\sim N\left(0,\,\sigma_{y,x}^{2}\right)$ (normality of errors), meaning that the residuals conditioned on the covariates follow a normal distribution. This property also extends to the response variable $y_{i}$.
-   $cov\left(\varepsilon_{i},\,\varepsilon_{j}\mid x_{i},x_{j}\right)$. That is, the errors for different observations should be independent, meaning that the outcome for one observation does not influence another. This way, the residuals in different observed units should not be correlated with the values given by their predictor variables.

When these assumptions are met, regression models can provide accurate and unbiased estimates of relationships between variables. The predicted values from the model represent the expected outcomes based on the observed values of the independent variables. This makes regression a useful tool for understanding patterns in data and making informed predictions.
Once the linear regression model and its assumptions are defined, it can be deduced that the best unbiased linear estimator is defined as the expected value of the dependent variable conditioned on the independent variables $x$, as:

$$
E\left(y\mid x\right)=\hat{\beta}_{0}+\hat{\beta_{1}}x_{1}+\hat{\beta}_{2}x_{2}+\cdots+\hat{\beta}_{p}x_{p}
$$

### Estimation of Parameters

When working with survey data, the goal of regression analysis is to estimate the relationships between variables. If a complete census were available, the calculation of regression parameters would be straightforward because we would have all the data. However, in practice, we work with survey samples, which introduce additional complexities, particularly when these samples are drawn using complex designs. When estimating the parameters of a linear regression model considering that the observed information comes from surveys with complex samples, the standard approach to estimating regression coefficients and their standard errors is altered. The main reason for this change is that data collected through a complex survey generally does not have an identical distribution, and the assumption of independence cannot be maintained since the sample design is constructed with dependencies (as most complex designs include stratification, clustering, unequal selection probabilities, etc.).

In this context, when fitting regression models with such datasets, using conventional estimators derived from traditional methods (such as maximum likelihood, for example) will induce bias because these methods assume the data are independently and identically distributed and come from a specific probability distribution (binomial, Poisson, exponential, normal, etc.). Instead, according to @Wolter_2007, robust non-parametric methods based on Taylor linearization or variance estimation methods using replication are used to eliminate bias by including the sampling design in the analyses.

For illustrative purposes, the estimation of the parameter $\beta_{1}$ and its variance for a simple linear regression will be shown. The extension to multiple regression parameter estimation is algebraically complex and beyond the scope of this book. Below is the estimation of the slope and its variance in a simple linear regression model:


$$
\hat{\beta_{1}} = \frac{\sum_{h}^{H}\sum_{\alpha}^{a_{h}}\sum_{i=1}^{n_{h\alpha}}\omega_{h\alpha i}\left(y_{h\alpha i}-\hat{\bar{y}}_{\omega}\right)\left(x_{h\alpha i}-\hat{\bar{x}}_{\omega}\right)}{\sum_{h}^{H}\sum_{\alpha}^{a_{h}}\sum_{i=1}^{n_{h\alpha}}\omega_{h\alpha i}\left(x_{h\alpha i}-\hat{\bar{x}}_{\omega}\right)^{2}}
$$

Understanding the uncertainty in the estimated parameters is essential for making valid inferences. In regression analysis with complex samples, variance estimation involves calculating measures that reflect the variability introduced by the sampling design. These calculations often rely on weighted sums and include adjustments for dependencies in the data.

For multiple regression, the variance of each coefficient is computed while considering its relationship with other coefficients. This results in a variance-covariance matrix, which summarizes the variability and relationships between all the estimated coefficients. The matrix provides a comprehensive view of the precision of the estimates and is a key tool for interpreting regression results. As a generalization, according to @kish1974inference, the variance estimation of coefficients in a multiple linear regression model requires weighted totals for the squares and cross-products of all combinations of $y$ and $x = \{1, x_{1}, \ldots, x_{p}\}$.

## Working with weights

When analyzing data from complex surveys, a critical question arises: how should survey weights be used in regression models? @Heeringa_West_Berglund_2017 addresses the problem of how to correctly weight regression models and whether expansion factors should be used to estimate regression coefficients when working with complex survey data. In this context, two main approaches exist for incorporating weights into regression models when working with complex survey data:

First, the **design-based approach** focuses on making inferences about the entire population. Here, survey weights are essential to ensure unbiased estimates of the regression coefficients. These weights account for the survey design, including unequal probabilities of selection. However, this approach has a limitation: it does not protect against model misspecification. If the model does not correctly describe the relationships in the population, the estimates will still be unbiased for the specified model but not necessarily meaningful for the population. If the researcher fits a poorly specified model, unbiased estimates of the regression parameters would be obtained in a model that does not correctly describe the relationships in the finite population.

- In contrast, the **population-based modeling approach** argues that weights are unnecessary if the model is correctly specified. This approach assumes that the relationships between the variables are well-represented by the model, regardless of the sampling design. Using weights in this case can increase the variability of the estimates, leading to unnecessarily larger standard errors.

The choice between these two approaches depends on the context and the sensitivity of the inferences to the inclusion of weights. A practical recommendation is to fit regression models both with and without weights using statistical software and compare the results. If including weights leads to significant changes in the regression coefficients or conclusions, it indicates that the model may not be correctly specified, and weighted estimates should be preferred. On the other hand, if weights only increase the standard errors without altering the coefficients meaningfully, the model is likely well-specified, and weights may not be necessary.

To address the challenges of using raw sampling weights, several adjustments have been proposed to balance accuracy and efficiency. Some are listed below:

1. **Senate Sampling Weights**: This approach scales weights so that the sum of the weights equals the sample size rather than the population size. The goal is to retain representativeness while reducing the variability of weights. This adjustment is particularly useful in large samples where the raw weights are excessively variable. This approach preserves relative differences in weights.
$$
w^{\text{Senate}}_i = w_i \times \frac{n}{\sum w_i}
$$
2. **Normalized Weights**: these weights are used to rescale the raw weights to sum to 1. This adjustment ensures that the overall weight does not inflate variances unnecessarily. This approach is useful when comparing models with different subsets of data or when variance inflation is a concern.
$$
w^{\text{Normalized}}_i = \frac{w_i}{\sum w_i}
$$
3. **Pfeffermann Model Weights**: this approach incorporates weights into the likelihood function of the regression model, allowing the model to use weights adaptively. This method combines the benefits of weighting and model-based inference. This approach also adjusts for the variability introduced by weights while retaining design-based properties. It is ideal for models requiring both descriptive and analytical inference.

The third solution (called the *q-weighted approach*) was proposed by @pfeffermann2011modelling who suggested a slightly different specification of the weights. This adjustment modifies the original weights to reflect the relationships in the data more accurately, reducing variability while still accounting for the complex survey design. It also balance the benefits of both design- and population-based approaches. The steps in this approach are as follows:

1. A regression model is fitted to the original survey weights, using the predictor variables in the primary regression model of interest.
2. Predicted survey weights are obtained for each case based on the predictor variables.
3. The original survey weights are divided by these predicted values, creating adjusted weights.
4. These adjusted weights are then used in the final regression model.

The q-weighted approach provides a middle ground. It retains the benefits of the design-based approach by incorporating survey weights but reduces the variance typically associated with their use. At the same time, it considers the relationships captured by the model, aligning more closely with the population-based modeling perspective. This makes it particularly useful for situations where the choice between the two paradigms is unclear or when both perspectives have merit.

## Model Diagnostics

When using statistical models with household survey data, it is essential to evaluate the quality of the models to ensure the validity of the conclusions. This involves a series of checks and analyses that focus on the assumptions and performance of the model. These checks help confirm whether the model adequately describes the data and whether the results can be trusted. Model diagnostics begin with evaluating whether the model fits the data well. This involves analyzing several aspects:

- **Model fit**: It is important to determine whether the model provides an adequate fit to the data.
- **Distribution of errors**: Examine whether the errors are normally distributed.
- **Error variance**: Check whether the errors have constant variance.
- **Error independence**: Verify that the errors can be assumed to be uncorrelated.
- **Influential data points**: Identify if any data points have an unusually large influence on the estimated regression model.
- **Outliers**: Detect points that do not follow the general trend of the data, known as outliers.

### Coefficient of determination

The coefficient of determination, also known as the multiple correlation coefficient ($R^{2}$), is a common measure of goodness-of-fit in a regression model. This coefficient estimates the proportion of variance in the dependent variable explained by the model and ranges between 0 and 1. A value close to 1 indicates that the model explains a large proportion of the variability, while a value near 0 suggests the opposite. For surveys with complex sampling designs, the weighted estimator of $R^{2}$ is given by:

$$
\widehat{R}_{\omega}^{2} = 1-\frac{\widehat{SSE}_{\omega}}{\widehat{SST}_{\omega}}
$$

Where $\widehat{SSE}_{\omega}$ is the weighted sum of squared errors, defined as:

$$
\widehat{SSE}_{\omega}  =  \sum_{h}^{H}\sum_{\alpha}^{a_{h}}\sum_{i=1}^{n_{h\alpha}}\omega_{h\alpha i}\left(y_{h\alpha i}-x_{h\alpha i}\hat{\beta}\right)^{2}
$$

This estimator adjusts the $R^{2}$ calculation to reflect the characteristics of the sampling design, such as stratification and unequal selection probabilities, ensuring that survey weights are considered when evaluating the goodness-of-fit of the model.

### Standardized Residuals

Residuals are the differences between observed and predicted values. Analyzing residuals is critical for diagnosing whether the model violates key assumptions. For example:

- Residuals should show no specific pattern when plotted against predicted values or independent variables.
- If the residuals exhibit a pattern, this could indicate non-constant variance (heteroscedasticity).
- Graphical analysis is often used to detect issues, with plots of residuals against predicted values serving as a common diagnostic tool.

A careful study of the residuals should help the researcher conclude whether the fitting process has not violated the assumptions or if, on the contrary, one or more assumptions are not met, requiring a review of the fitting procedure. To analyze the residuals, Pearson residuals [@Heeringa_West_Berglund_2017] are defined as follows:

$$
r_{p_{i}}  =  \left(y_{i}-\mu_{i}\left(\hat{\beta}_{\omega}\right)\right)\sqrt{\frac{\omega_{i}}{V\left(\hat{\mu}_{i}\right)}}
$$

Where $\mu_{i}$ is the expected value of $y_{i}$, and $\omega_{i}$ is the survey weight for the i-th individual in the complex sample design. Finally, $V(\mu_{i})$ is the variance function of the outcome. These residuals are used to perform normality and constant variance analyses.

If the assumption of constant variance is not met, the estimators remain unbiased and consistent, but they are no longer efficient. That is, they are no longer the best in the sense that they no longer have the smallest variance among all unbiased estimators. One way to analyze the assumption of constant variance in the errors is through graphical analysis. This is done by plotting the model residuals against $\hat{y}$ or the model residuals against $X_{i}$. If these plots reveal any pattern other than a constant cloud of points, it can be concluded that the error variance is not constant.

### Influential Observations

Another set of techniques used for model analysis involves examining influential observations. Certain data points can have a disproportionately large impact on the model. These influential points may not necessarily be outliers but could still affect model parameters significantly. An observation is deemed influential if, when removed from the data set, it causes a significant change in the model fit. It is important to note that an influential point may or may not be an outlier. To detect influential observations, it is essential to clarify what type of influence is being sought. For instance, an observation may be influential for parameter estimation but not for error variance estimation. Common techniques for identifying influential observations include:

1. **Cook's Distance**: Measures the impact of removing a data point on the overall model fit.
2. **$D_fBeta_{(i)}$ Statistic**: This statistic assesses the effect of removing a data point on individual regression coefficients, and measures the change in the estimated regression coefficient vector when the observation is removed.
3. **$D_{f}Fits_{\left(i\right)}$ Statistic**: it evaluates the influence of a data point on the overall model fit, and measures the change in the model fit when a particular observation is removed. 


## Inference on Model Parameters

After confirming that the model fits well and satisfies its assumptions, the next step is to assess whether the independent variables significantly contribute to explaining the dependent variable. This is done by testing the significance of the regression coefficients. If a coefficient is statistically significant, it suggests that the associated variable has a meaningful relationship with the dependent variable.

Given the distributional properties of the regression coefficient estimators, a natural test statistic for evaluating the significance of these parameters is based on the t-distribution and is described as follows:

$$
t = \frac{\hat{\beta}_{k}-\beta_{k}}{se\left(\hat{\beta}_{k}\right)}\sim t_{n-p}
$$

Where $p$ is the number of model parameters and $n$ is the sample size of the survey. The test statistic above evaluates the hypotheses $H_{0}:\beta_{k}=0$ versus the alternative $H_{1}:\beta_{k}\neq0$. Similarly, a confidence interval of $(1-\alpha)\times100\%$ for $\beta_{k}$ can be constructed, as follows:

$$
\hat{\beta}_{k}\pm t_{1-\frac{\alpha}{2},\,df}\,se\left(\hat{\beta}_{k}\right)
$$

Where the degrees of freedom ($df$) for the interval in a household survey (complex samples) is given by the number of final stage clusters minus the number of primary stage strata $\left(df=\sum_{h}a_{h}-H\right)$.

### Estimation and Prediction

According to @neter1996applied, linear regression models are essentially used for two purposes. One is to explain the variable of interest in terms of covariates that may be found in surveys, administrative records, censuses, etc. Additionally, they are also used to predict values of the variable under study, either within the range of values collected in the sample or outside of it. The first purpose has been addressed throughout this chapter, and the second is achieved as follows:

$$
\hat{E}(y_{i}\mid\boldsymbol{x}_{obs,i})=\boldsymbol{x}_{obs,i}\hat{\boldsymbol{\beta}}
$$

The variance of the estimation is calculated as follows:

$$
var\left(\hat{E}\left(y_{i}\mid x_{obs,i}\right)\right) 
=  x'_{obs,i}cov\left(\hat{\beta}\right)x{}_{obs,i}
$$


