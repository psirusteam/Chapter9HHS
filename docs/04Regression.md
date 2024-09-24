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
\hat{\beta_{1}}  =  \frac{{\sum_{h}^{H}\sum_{\alpha}^{a_{h}}\sum_{i=1}^{n_{h\alpha}}\omega_{h\alpha i}\left(y_{h\alpha i}-\hat{\bar{y}}_{\omega}\right)\left(x_{h\alpha i}-\hat{\bar{x}}_{\omega}\right)}}{{ \sum_{h}^{H}\sum_{\alpha}^{a_{h}}\sum_{i=1}^{n_{h\alpha}}\omega_{h\alpha i}\left(x_{h\alpha i}-\hat{\bar{x}}_{\omega}\right)^{2}}}
$$

As can be seen in the above equation, the parameter estimator is a ratio of totals; therefore, its variance is given by:
