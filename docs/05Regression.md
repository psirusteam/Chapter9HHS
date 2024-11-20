# Regression: modelling survey data

Modelling survey data is a common task among researcher; some of them include the features of the sampling design in computing standard error of the estimated regression parameters. In this section we will deal with the problem of weighting in regression models and present a parsimonious solution. 

## To weight or not to weight? 

We present the pros and cons of including the complex design features in the estimation of regression parameters and their associated standard errors. We present some adjustment to the sampling weights to fit these kind of models (senate sampling weights, normalized sampling weights, Pfeffermann model weights).

## Some inferential approaches to modelling data

When modelling survey data, one should deal with two sources of variability: the one devoted to the complex sampling design and the one that comes from the very model. Combining these sources into a valid set up requires of some advanced methods. We will mention some of them: pseudo likelihood, combined inference.

## Linear models

### Basic Definitions

As noted by @Heeringa_West_Berglund_2017, the first authors to empirically discuss the impact of complex sampling designs on regression model inferences were @kish1974inference. Later, @fuller1975regression developed a variance estimator for regression model parameters based on Taylor linearization with unequal weighting of observations under stratified and two-stage sampling designs.

As is well known, the use of regression model theory requires certain statistical assumptions to be met, which can sometimes be challenging to verify in practice. In this regard, @shah1977inference discuss some aspects related to the violation of these assumptions and provide appropriate methods for making inferences about the estimated parameters of linear regression models using survey data.

Similarly, @binder1983variances obtained the sampling distributions of estimators for regression parameters in finite populations and related variance estimators in the context of complex samples. @skinner1989analysis studied the properties of variance estimators for regression coefficients under complex sample designs. Later, @fuller2002regression provided a summary of estimation methods for regression models containing information related to complex samples. Finally, @pfeffermann2011modelling discussed various approaches to fitting linear regression models to complex survey data, presenting empirical support for the use of the “*q-weighted*” method, which is recommended in this document.

A simple linear regression model is defined as $y=\beta_{0}+\beta_{1}x+\varepsilon$, where $y$ represents the dependent variable, $x$ is the independent variable, and $\beta_{0}$ and $\beta_{1}$ are the model parameters. The variable $\varepsilon$ is known as the random error of the model and is defined as $\varepsilon=y-\hat{y}=y-\beta_{0}+\beta_{1}x$.

Generalizing the previous model, multiple linear regression models are defined by allowing the dependent variable to interact with more than two variables, as presented below:

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

The subscript $i$ refers to the sample element or respondent in the dataset. @Heeringa_West_Berglund_2017 present some considerations for regression models, which are described below:

-   $E\left(\varepsilon_{i}\mid x_{i}\right)=0$, meaning that the expected value of the residuals conditioned on the covariates is zero.
-   $Var\left(\varepsilon_{i}\mid x_{i}\right)=\sigma_{y,x}^{2}$ (homogeneity of variance), meaning that the variance of the residuals conditioned on the covariates is constant.
-   $\varepsilon_{i}\mid x_{i}\sim N\left(0,\,\sigma_{y,x}^{2}\right)$ (normality of errors), meaning that the residuals conditioned on the covariates follow a normal distribution. This property also extends to the response variable $y_{i}$.
-   $cov\left(\varepsilon_{i},\,\varepsilon_{j}\mid x_{i},x_{j}\right)$ (independence of residuals), meaning that the residuals in different observed units are not correlated with the values given by their predictor variables.

Once the linear regression model and its assumptions are defined, it can be deduced that the best unbiased linear estimator is defined as the expected value of the dependent variable conditioned on the independent variables $x$, as:

$$
E\left(y\mid x\right)=\hat{\beta}_{0}+\hat{\beta_{1}}x_{1}+\hat{\beta}_{2}x_{2}+\cdots+\hat{\beta}_{p}x_{p}
$$

$$
\hat{y}  =  E\left(y\mid x\right)
 =  E\left(\boldsymbol{x}\boldsymbol{\beta}\right)+E\left(\varepsilon\right)
=  \boldsymbol{x}\boldsymbol{\beta}+0
  =  \beta_{0}+\beta_{1}x_{1}+\cdots+\beta_{p}x_{p}
$$

Additionally,

$$
var\left(y_{i}\mid x_{i}\right)  =  \sigma_{y,x}^{2}
$$

It is also established that:

$$
cov\left(y_{i},y_{j}\mid x_{i},x_{j}\right)  = 0
$$

Thus, the response variable has the following distribution:

$$
y_{i}  \sim  N\left(x_{i}\boldsymbol{\beta},\sigma_{y,x}^{2}\right)
$$

### Estimation of Parameters in a Regression Model with Complex Samples

Once the assumptions of the model and the distributional characteristics of the errors are established, the next step is the process of parameter estimation. As an illustrative and introductory example, if instead of observing a sample of size $n$ from the $N$ elements of the population, a complete census had been conducted, the finite population regression parameter $\beta_{1}$ could be calculated as follows:

$$
\beta_{1}  =  \frac{ \sum_{i=1}^{N}\left(X_{i}-\bar{X}\right)\left(Y_{i}-\bar{Y}\right)}{\sum_{i=1}^{N}\left(X_{i}-\bar{X}\right)^{2}}
$$


Now, when estimating the parameters of a linear regression model considering that the observed information comes from surveys with complex samples, the standard approach to estimating regression coefficients and their standard errors is altered. The main reason for this change is that data collected through a complex survey generally does not have an identical distribution, and the assumption of independence cannot be maintained since the sample design is constructed with dependencies (as most complex designs include stratification, clustering, unequal selection probabilities, etc.).

In this context, when fitting regression models with such datasets, using conventional estimators derived from traditional methods (such as maximum likelihood, for example) will induce bias because these methods assume the data are independently and identically distributed and come from a specific probability distribution (binomial, Poisson, exponential, normal, etc.). Instead, according to @Wolter_2007, robust non-parametric methods based on Taylor linearization or variance estimation methods using replication (Jackknife, bootstrapping, etc.) are used to eliminate bias by including the sampling design in the analyses.

For illustrative purposes, the estimation of the parameter $\beta_{1}$ and its variance for a simple linear regression will be shown. The extension to multiple regression parameter estimation is algebraically complex and beyond the scope of this book. Below is the estimation of the slope and its variance in a simple linear regression model:


$$
\hat{\beta_{1}} = \frac{\sum_{h}^{H}\sum_{\alpha}^{a_{h}}\sum_{i=1}^{n_{h\alpha}}\omega_{h\alpha i}\left(y_{h\alpha i}-\hat{\bar{y}}_{\omega}\right)\left(x_{h\alpha i}-\hat{\bar{x}}_{\omega}\right)}{\sum_{h}^{H}\sum_{\alpha}^{a_{h}}\sum_{i=1}^{n_{h\alpha}}\omega_{h\alpha i}\left(x_{h\alpha i}-\hat{\bar{x}}_{\omega}\right)^{2}}
$$


As it can be seen in the above equation, the parameter estimator is a ratio of totals; therefore, its variance is given by:

$$
var\left(\hat{\beta_{1}}\right)  =  \frac{var\left(\hat{t}_{xy}\right)+\hat{\beta}_{1}^{2}var\left(\hat{t}_{x^{2}}\right)-2\hat{\beta}_{1}cov\left(\hat{t}_{xy},\hat{t}_{x^{2}}\right)}{\left(\hat{t}_{x^{2}}\right)^{2}}
$$

As a generalization, according to @kish1974inference, the variance estimation of coefficients in a multiple linear regression model requires weighted totals for the squares and cross-products of all combinations of $y$ and $x = \{1, x_{1}, \ldots, x_{p}\}$. Below is the estimation of these variances:




$$
\text{var}\left(\hat{\beta}\right) = \hat{\Sigma}\left(\hat{\beta}\right) = 
\begin{bmatrix}
\text{var}\left(\hat{\beta}_{0}\right) & \text{cov}\left(\hat{\beta}_{0},\hat{\beta}_{1}\right) & \cdots & \text{cov}\left(\hat{\beta}_{0},\hat{\beta}_{p}\right) \\
\text{cov}\left(\hat{\beta}_{0},\hat{\beta}_{1}\right) & \text{var}\left(\hat{\beta}_{1}\right) & \cdots & \text{cov}\left(\hat{\beta}_{1},\hat{\beta}_{p}\right) \\
\vdots & \vdots & \ddots & \vdots \\
\text{cov}\left(\hat{\beta}_{0},\hat{\beta}_{p}\right) & \text{cov}\left(\hat{\beta}_{1},\hat{\beta}_{p}\right) & \cdots & \text{var}\left(\hat{\beta}_{p}\right)
\end{bmatrix}
$$

### The Pfeffermann Weighting Approach

@Heeringa_West_Berglund_2017 addresses the problem of how to correctly weight regression models and whether expansion factors should be used to estimate regression coefficients when working with complex survey data. In this context, it is essential to know that two primary paradigms exist in the specialized literature:

- **The design-based approach**, illustrated in this document, seeks to make inferences about the entire finite population, and the use of expansion factors ensures that regression parameter estimates are unbiased. However, using survey weights does not protect against model misspecification; if the researcher fits a poorly specified model using expansion factors, unbiased estimates of the regression parameters in a model that does not correctly describe the relationships in the finite population are being computed.
- **The population-based modeling approach**, which argues that the use of expansion factors in estimation should not be necessary if the model is correctly specified. Under this approach, including survey weights only serves to increase the variance of the estimators, inducing larger-than-necessary standard errors.

The choice between these two approaches should depend on the sensitivity of inferences to different estimation methods. It is often recommended to use statistical software to fit regression models with and without survey weights to evaluate the sensitivity of the results. If the use of weights produces substantially different estimates and conclusions, it suggests that the model may be misspecified, and weighted estimates should be preferred. However, if the use of weights does not significantly alter the regression parameter estimates and only considerably increases standard errors, it could indicate that the model is well-specified, and the use of weights may not be necessary.

An intermediate solution between these two approaches is given by @pfeffermann2011modelling, who proposed a variant (called the *q-weighted approach*) with a slightly different specification of the expansion factors, detailed as follows:

1. Fit a regression model to the final survey weights using the predictor variables in the regression model of interest.
2. Obtain the predicted survey weights for each case as a function of the predictor variables in the dataset.
3. Divide the survey expansion factors by the predicted values from the previous step.
4. Use the new weights obtained for fitting the regression models.

This method adjusts the survey weights based on the fitted model, balancing between design-based and model-based approaches to reduce variance while accounting for complex survey design.

### Model Diagnostics

When fitting statistical models to household survey data, it is essential to perform quality checks to ensure the validity of the conclusions drawn. Most academic texts provide a detailed overview of the assumptions and considerations necessary for a properly defined model. Below are some of the key aspects to consider:

- **Model fit**: It is important to determine whether the model provides an adequate fit to the data.
- **Distribution of errors**: Examine whether the errors are normally distributed.
- **Error variance**: Check whether the errors have constant variance.
- **Error independence**: Verify that the errors can be assumed to be uncorrelated.
- **Influential data points**: Identify if any data points have an unusually large influence on the estimated regression model.
- **Outliers**: Detect points that do not follow the general trend of the data, known as outliers.

#### Coefficient of Determination

The coefficient of determination, also known as the multiple correlation coefficient ($R^{2}$), is a common measure of goodness-of-fit in a regression model. This coefficient estimates the proportion of variance in the dependent variable explained by the model and ranges between 0 and 1. A value close to 1 indicates that the model explains a large proportion of the variability, while a value near 0 suggests the opposite.

The calculation of this coefficient for a population is done as follows:

$$
R^{2} =  1-\frac{SSE}{SST}
$$

Where:

- $SST= \sum_{i=1}^N (y_i - \bar{y})^2$: This is the total sum of squares, representing the total variability in the dependent variable.
- $SSE= \sum_{i=1}^N (y_i - x_i \beta)^2$: This is the sum of squared errors, representing the variability not explained by the regression model.

For surveys with complex sampling designs, the weighted estimator of $R^{2}$ is given by:

$$
\widehat{R}_{\omega}^{2} = 1-\frac{\widehat{SSE}_{\omega}}{\widehat{SST}_{\omega}}
$$

Where $\widehat{SSE}_{\omega}$ is the weighted sum of squared errors, defined as:

$$
\widehat{SSE}_{\omega}  =  \sum_{h}^{H}\sum_{\alpha}^{a_{h}}\sum_{i=1}^{n_{h\alpha}}\omega_{h\alpha i}\left(y_{h\alpha i}-x_{h\alpha i}\hat{\beta}\right)^{2}
$$

This estimator adjusts the $R^{2}$ calculation to reflect the characteristics of the sampling design, such as stratification and unequal selection probabilities, ensuring that survey weights are considered when evaluating the goodness-of-fit of the model.



#### Standardized Residuals

In model diagnostics, analyzing residuals is crucial. These analyses provide, under the assumption that the fitted model is adequate, an estimate of the errors. Therefore, a careful study of the residuals should help the researcher conclude whether the fitting process has not violated the assumptions or if, on the contrary, one or more assumptions are not met, requiring a review of the fitting procedure.

To analyze the residuals, Pearson residuals [@Heeringa_West_Berglund_2017] are defined as follows:

$$
r_{p_{i}}  =  \left(y_{i}-\mu_{i}\left(\hat{\beta}_{\omega}\right)\right)\sqrt{\frac{\omega_{i}}{V\left(\hat{\mu}_{i}\right)}}
$$

Where $\mu_{i}$ is the expected value of $y_{i}$, and $\omega_{i}$ is the survey weight for the i-th individual in the complex sample design. Finally, $V(\mu_{i})$ is the variance function of the outcome. These residuals are used to perform normality and constant variance analyses.

If the assumption of constant variance is not met, the estimators remain unbiased and consistent, but they are no longer efficient. That is, they are no longer the best in the sense that they no longer have the smallest variance among all unbiased estimators. One way to analyze the assumption of constant variance in the errors is through graphical analysis. This is done by plotting the model residuals against $\hat{y}$ or the model residuals against $X_{i}$. If these plots reveal any pattern other than a constant cloud of points, it can be concluded that the error variance is not constant.

#### Influential Observations

Another set of techniques used for model analysis involves examining influential observations. An observation is deemed influential if, when removed from the data set, it causes a significant change in the model fit. It is important to note that an influential point may or may not be an outlier. To detect influential observations, it is essential to clarify what type of influence is being sought. For instance, an observation may be influential for parameter estimation but not for error variance estimation. Below are some statistical techniques for detecting influential data points:

1. **Cook's Distance**: This diagnostic measures whether the i-th observation is influential in the model estimation by being far from the data's center of mass. Various authors consider an observation influential when this value exceeds 2 or 3.
2. **$D_fBeta_{(i)}$ Statistic**: This statistic measures the change in the estimated regression coefficient vector when the observation is removed. The i-th observation is considered influential for $B_j$ if $\mid D_{f}Betas_{\left(i\right)j}\mid \geq \frac{z}{\sqrt{n}}$ with $z = 2$. Alternatively, $t_{0.025,n-p}/\sqrt{n}$ can be used, where $t_{0.025,n-p}$ is the 97.5th percentile.
3. **$D_{f}Fits_{\left(i\right)}$ Statistic**: This statistic measures the change in the model fit when a particular observation is removed. In this case, the i-th observation is considered influential in the model fit if $\mid DfFits\left(i\right)\mid \geq z\sqrt{\frac{p}{n}}$ with $z = 2$.


#### Inference on Model Parameters

Once the proper fit of the model has been evaluated using the methodologies discussed above, and the distributional properties of the errors—and consequently the response variable $y$—have been verified, the next step is to assess whether the estimated parameters are significant. This involves determining whether the covariates used to fit the model add value in explaining and/or predicting the study variable and the phenomenon of interest.

Given the distributional properties of the regression coefficient estimators, a natural test statistic for evaluating the significance of these parameters is based on the t-distribution and is described as follows:

$$
t = \frac{\hat{\beta}_{k}-\beta_{k}}{se\left(\hat{\beta}_{k}\right)}\sim t_{n-p}
$$

Where $p$ is the number of model parameters and $n$ is the sample size of the survey. The test statistic above evaluates the hypotheses $H_{0}:\beta_{k}=0$ versus the alternative $H_{1}:\beta_{k}\neq0$. Similarly, a confidence interval of $(1-\alpha)\times100\%$ for $\beta_{k}$ can be constructed, as follows:

$$
\hat{\beta}_{k}\pm t_{1-\frac{\alpha}{2},\,df}\,se\left(\hat{\beta}_{k}\right)
$$

Where the degrees of freedom ($df$) for the interval in a household survey (complex samples) is given by the number of final stage clusters minus the number of primary stage strata $\left(df=\sum_{h}a_{h}-H\right)$.

#### Estimation and Prediction

According to @neter1996applied, linear regression models are essentially used for two purposes. One is to explain the variable of interest in terms of covariates that may be found in surveys, administrative records, censuses, etc. Additionally, they are also used to predict values of the variable under study, either within the range of values collected in the sample or outside of it. The first purpose has been addressed throughout this chapter, and the second is achieved as follows:

$$
\hat{E}(y_{i}\mid\boldsymbol{x}_{obs,i})=\boldsymbol{x}_{obs,i}\hat{\boldsymbol{\beta}}
$$

Explicitly, in the model exemplified in this chapter, the expression for predictions would be:

$$
\hat{E}(y_{i}\mid\boldsymbol{x}_{obs,i})=\hat{\beta}_{0}+\hat{\beta}_{1}x_{1i}
$$

The variance of the estimation is calculated as follows:

$$
var\left(\hat{E}\left(y_{i}\mid x_{obs,i}\right)\right) 
=  x'_{obs,i}cov\left(\hat{\beta}\right)x{}_{obs,i}
$$


## Logistic models

To model the probability of discrete variables, we apply the principles of design-based inference.

### Logistic Regression Model for Proportions

Logistic regression is a regression method that allows the estimation of the probability of success for a binary qualitative variable based on other continuous or discrete covariates. The variable of interest is binary or dichotomous, meaning it takes a value of one (1) if the condition being observed is met and zero (0) otherwise. In this way, the observations are separated into groups according to the value taken by the predictor variable.

If a categorical variable with two possible levels is coded as ones (1) and zeros (0), it is mathematically possible to fit a linear regression model $\beta_0 + \beta_1 x$ using estimation techniques such as least squares. However, a problem arises with this approach: since the model is a straight line, it can produce estimated values that are less than zero or greater than one, which contradicts the theory requiring probabilities to always fall within the [0,1] range.

The objective of logistic regression is to model the logarithm of the probability of belonging to each group. As a result, assignment is ultimately made based on the obtained probabilities. Logistic regression is ideal for modeling the probability of an event occurring as a function of various factors. Therefore, the approximate probability of the event is represented by a logistic function of the form:

$$
\pi(\textbf{x})= Pr(y = 1 | \textbf{x}) = \frac{\exp\{\textbf{x}'\boldsymbol{\beta}\}}{1+\exp\{\textbf{x}'\boldsymbol{\beta}\}}
$$

It is important to note that linear regression should not be used when the dependent variable is binary, as it cannot directly estimate the probability of the studied event. Instead, logistic regression is used, where a transformation (logit) is applied to obtain the probability estimates of the studied event. Applying the logit function to both sides yields an expression similar to that of linear regression:

$$
g(\textbf{x})=logit(\pi(\textbf{x}))=ln \left\{ \frac{\pi(\textbf{x})}{1-\pi(\textbf{x})} \right \}= \textbf{x}'\boldsymbol{\beta}
$$

Thus, a linear relationship is assumed between each of the explanatory variables and the logit of the response variable. There are at least three major differences between logistic regression and linear regression. First, in logistic regression, there is no requirement for a linear relationship between the explanatory variables and the variable of interest; second, the residuals of the model do not need to follow a normal distribution; and third, the residuals do not need to have constant variance (homoscedasticity).

Using appropriate techniques that include complex sampling designs in inference, the estimated probability that the variable of interest takes a value of one, which is also the expected value of the variable of interest in a logistic regression model, is:

$$
\hat{\pi}(\textbf{x})= \frac{\exp\{\textbf{x}'\hat{\boldsymbol{\beta}}\}}{1+\exp\{\textbf{x}'\hat{\boldsymbol{\beta}\}}}
$$

The variance of the estimated parameters is calculated using the following expression:

$$
var\left(\boldsymbol{\hat{B}}\right)=\boldsymbol{J}^{-1}var\left(S\left(\hat{\boldsymbol{B}}\right)\right)\boldsymbol{J}^{-1}
$$

Where:

$$
S\left(B\right)=\sum_{h}\sum_{a}\sum_{i}w_{hai}\boldsymbol{D}_{hai}^{t}\left[\left(\pi_{hai}\left(\boldsymbol{B}\right)\right)\left(1-\pi_{hai}\left(\boldsymbol{B}\right)\right)\right]^{-1}\left(y_{hai}-\pi_{hai}\left(\boldsymbol{B}\right)\right)=0
$$

and,

$$
D_{hai} = \frac{\delta\left(\pi_{hai}\left(\boldsymbol{B}\right)\right)}{\delta B_{j}}
$$

Where $j=0,\dots,p$. Since the model uses a logarithmic link, confidence intervals are constructed by applying the exponential function to each parameter:

$$
\hat{\psi}=\exp\left(\hat{B}_{1}\right)
$$

Therefore, the confidence interval is given by the following expression:

$$
CI\left(\psi\right)=\exp\left(\hat{B}_{j}\pm t_{df,1-\frac{\alpha}{2}}se\left(\hat{B}_{j}\right)\right)
$$

It is important to note that interpreting logistic regression coefficients can be challenging due to its non-linear nature. To facilitate interpretation, similarities and key differences with classic linear regression are highlighted. One similarity is that the sign of the estimated equation can be interpreted in the same way in both cases. A positive sign accompanying a covariate indicates an increase in the probability of the event occurring, while a negative sign indicates a decrease. As in linear regression, the intercept can only be interpreted assuming zero values for the other predictors.

However, the interpretation of regression coefficients between logistic and linear models differs significantly. The estimated coefficients in logistic regression correspond to a logarithm of odds, requiring the previously mentioned transformation. According to @gelmanhill2019, the exponentiated logistic regression coefficients can be interpreted as odds ratios. If two outcomes present probabilities of $(\pi,1-\pi)$, then $\pi/(1-\pi)$ is called the odds. For example, an odds ratio of 1 corresponds to a probability of 0.5, indicating equally likely outcomes. Doubling the odds further increases the probability to 8/9, and so on.

To determine whether a variable is significant in the model, it is common to use the Wald statistic, which is based on the likelihood ratio. In this case, the full model (with all parameters) is compared to the reduced model (with fewer parameters). The test statistic is given by:

$$
G=-2\ln\left[\frac{L\left(\hat{\boldsymbol{\beta}}\right)_{reduced}}{L\left(\hat{\boldsymbol{\beta}}\right)_{full}}\right]
$$

This statistic evaluates the difference in fit between the two models, allowing for the assessment of the significance of the parameters included in the full model.

## NSO – Practical example

In this subsection, we will share the experience of an NSO in applying models to household survey data, and the results they present in terms of significance of models and relations among variables. 



