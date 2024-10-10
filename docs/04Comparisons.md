## Tests for group comparisons

To determine whether the means of two groups are significantly different we will introduce t-test and contrasts adjusted for the sampling design.

### Hypothesis Test for the Difference of Means

A hypothesis test is a statistical procedure used to evaluate evidence in favor of or against a statement or assumption about a population. In this process, a null hypothesis ($H_0$) is proposed, representing the initial statement that needs to be tested, and an alternative hypothesis ($H_1$), which is the statement opposing the null hypothesis. These statements may be based on some belief or past experience and will be tested using the evidence gathered from the survey data. If it is suspected that the parameter $\theta$ is equal to a particular value $\theta_{0}$, the possible combinations of hypotheses that can be tested are:

```{=tex}
\begin{eqnarray*}
\begin{cases}
H_{0}: & \theta=\theta_{0}\\
H_{1}: & \theta\neq\theta_{0}
\end{cases}\,\,\,\,\,\,\,\,\,   
\begin{cases}
H_{0}: & \theta=\theta_{0}\\
H_{1}: & \theta>\theta_{0}
\end{cases}\,\,\,\,\,\,\,\,\,   
\begin{cases}
H_{0}: & \theta=\theta_{0}\\
H_{1}: & \theta<\theta_{0}
\end{cases}
\end{eqnarray*}
```

One of the two hypotheses will be considered true only if the statistical evidence, which is obtained from the sample, supports it. The process of selecting one of the two hypotheses is called a Hypothesis Test.

In general, some important parameters can be expressed as a linear combination of measures of interest. The most common cases are differences in means, weighted sums of means used to construct economic indices, etc. Thus, consider a function that is a linear combination of $J$ descriptive statistics, as shown below:

$$
f \left( \theta_{1}, \ldots,\theta_{J}\right) = \sum_{j=1}^{J}a_{j}\theta_{j}
$$

where the $a_{j}$ are known constants. An estimator of this function is given by:

$$
\widehat{f} \left( \widehat{\theta}_{1}, \ldots, \widehat{\theta}_{J} \right) = \sum_{j=1}^{J} a_{j} \widehat{\theta}_{j}
$$

And its variance is calculated as follows:

$$
Var \left( \sum_{j=1}^{J} a_{j} \widehat{\theta}_{j} \right) = \sum_{j=1}^{J} a_{j}^{2} \ Var\left( \widehat{\theta}_{j} \right) + 2 \times \sum_{j=1}^{J-1} \sum_{k>j}^{J} a_{j} a_{k} \, Cov \left( \widehat{\theta}_{j} , \widehat{\theta}_{k} \right)
$$

As seen in the variance expression for the estimator, it requires the variances of the individual estimators, as well as the covariances of pairs of estimators. 

Of particular interest is analyzing the difference in population means. In order to formulate the hypothesis tests for this case, we need to consider a *superpopulation model*. We assume that $y_{hik}$ correspond to observations from identically distributed random variables $Y$ having means $\mu_{y,j}$ if unit $k$ belongs to domain $j$, with $j = 1, 2$. Then we can define the difference in population means between domains 1 and 2 as $\mu_{y,1} - \mu_{y,2}$. As an example, consider that $\mu_{y,1}$ is the average household income for households with male heads of household, and $\mu_{y,2}$ is the average household income for households with female heads.

This difference in means can be unbiasedly estimated by:

$$
\widehat{\overline{Y}}_{1} - \widehat{\overline{Y}}_{2}
$$

where $\widehat{\overline{Y}}_{j}$ is the sample estimator of $\mu_{y,j}$ ($j = 1, 2$). Considering the parameter of interest in this section, the hypotheses to be tested are as follows:

$$
\begin{cases}
H_0: \mu_{y,1} - \mu_{y,2} = 0 \\
H_1: \mu_{y,1} - \mu_{y,2} \neq 0
\end{cases} 
$$

$$
\begin{cases}
H_0: \mu_{y,1} - \mu_{y,2} = 0 \\
H_1: \mu_{y,1} - \mu_{y,2} > 0
\end{cases}
$$

$$
\begin{cases}
H_0: \mu_{y,1} - \mu_{y,2} = 0 \\
H_1: \mu_{y,1} - \mu_{y,2} < 0
\end{cases}
$$

To test one of these hypothesis, the following test statistic is used, which follows a t-student distribution with $df$ degrees of freedom, calculated as the difference between the number of PSUs (Primary Sampling Units) and the number of strata.

$$
t = \frac{\widehat{\overline{Y}}_{1} - \widehat{\overline{Y}}_{2}} {se\left(\widehat{\overline{Y}}_{1} - \widehat{\overline{Y}}_{2}\right)} \sim t_{[df]}
$$

Where:

$$
\widehat{se} \left( \widehat{\overline{Y}}_{1} - \widehat{\overline{Y}}_{2} \right) = \sqrt{\widehat{Var}\left(\widehat{\overline{Y}}_{1}\right) + \widehat{Var}\left(\widehat{\overline{Y}}_{2}\right) - 2 \  \widehat{Cov}\left(\widehat{\overline{Y}}_{1} \ ; \widehat{\overline{Y}}_{2} \right)}
$$

If a confidence interval for the difference in means is desired, it would be constructed as follows:

$$
\widehat{\overline{Y}}_{1} - \widehat{\overline{Y}}_{2} \ \pm \ t_{[df]} \ \widehat{se}\left( \widehat{\overline{Y}}_{1} - \widehat{\overline{Y}}_{2} \right)
$$

### Contrasts

In many cases, it is necessary to compare more than two population means at the same time. For example, comparing the average household incomes across three regions to identify which regions experienced a greater impact of some shock or policy on households. In such cases, the difference of means we studied before is not sufficient, as it only allows for pairwise comparisons of population means. Using contrasts enables one to address these types of problems.

Based on the definitions discussed in this chapter, a contrast is a linear combination of parameters in the form:

$$
f \left( \theta_{1}, \ldots, \theta_{J} \right) = A * {\theta} = \sum_{j=1}^{J} a_{j} \theta_{j}
$$

Where $A$ is a matrix or vector of known constants, and $\theta$ is a vector of parameters.

XXX
The example below is not well chosen, since in the end it simply compares two means again - reconsider the example or remove it altogether.

Alternatively, present the theory above already in terms of contrasts, and then the two-populations case is a simple yet good example.
XXX

Next, we will perform the calculation of a hypothesis contrast. Suppose we have the estimates shown in the table, where the goal is to compare the average income by region. As a first example, we will compare two populations: the North and South regions. Specifically, we are interested in the income difference ($f = \bar{y}^{North} - \bar{y}^{South}$). Since the population is divided into five regions and the contrast will only be constructed for two of them (North and South), it is defined as follows:

$$
f = A * \theta = 1 \times \bar{y}^{North} + (-1) \times \bar{y}^{South} + 0 \times \bar{y}^{Center} + 0 \times \bar{y}^{West} + 0 \times \bar{y}^{East}
$$

As can be observed, in this case, the contrast vector is $A = \left[1, -1, 0, 0, 0\right]$. Mathematically, the estimator for this specific contrast is defined as:

$$
\widehat{f} = A \times \widehat{\theta} = \left[1, -1, 0, 0, 0\right] \times \left[
\begin{array}{c}
\widehat{\bar{y}}^{North} \\
\widehat{\bar{y}}^{South} \\
\widehat{\bar{y}}^{Center} \\
\widehat{\bar{y}}^{West} \\
\widehat{\bar{y}}^{East}
\end{array}
\right]
$$

| Region | Income   | Standard error (se) | Lower bound (ci_l) | Upper bound (ci_u) |
|---------------|---------------|---------------|---------------|---------------|
| North  | 552.3637 | 55.35987            | 443.8603           | 660.8670           |
| South  | 625.7740 | 62.40574            | 503.4610           | 748.0870           |
| Center | 650.7820 | 61.46886            | 530.3053           | 771.2588           |
| West   | 517.0071 | 46.22077            | 426.4161           | 607.5982           |
| East   | 541.7543 | 71.66487            | 401.2938           | 682.2149           |

: Estimation table for regions.

To continue with the example, we take the estimated mean incomes for the North and South regions and calculate the difference:

$$
f = A \times \theta = 552.4 - 625.8 = -73.4
$$

The next step is to calculate the variance-covariance matrix and extract the variances for the North and South regions:

|            | North    | South    | Center   | West     | East     |
|------------|----------|----------|----------|----------|----------|
| North  | 3064.715 | 0.000    | 0.000    | 0.000    | 0.000    |
| South  | 0.000    | 3894.476 | 0.000    | 0.000    | 0.000    |
| Center | 0.000    | 0.000    | 3778.420 | 0.000    | 0.000    |
| West   | 0.000    | 0.000    | 0.000    | 2136.359 | 0.000    |
| East   | 0.000    | 0.000    | 0.000    | 0.000    | 5135.854 |

Since the sampling is independent in each region, the covariances in the matrix are zero. To calculate the standard error of the difference (contrast), we will use the properties of variance, as follows:

$$
se(\widehat{f}) = se\left(\widehat{\bar{y}}^{North} - \widehat{\bar{y}}^{South}\right) = \sqrt{var\left(\widehat{\bar{y}}^{North}\right) + var\left(\widehat{\bar{y}}^{South}\right) - 2 \, cov\left(\widehat{\bar{y}}^{North}, \widehat{\bar{y}}^{South}\right)}
$$

Therefore, the estimated standard error for this contrast is:

$$
se(\widehat{f}) = \sqrt{3064.715 + 3894.476 - 2 \times 0} = \sqrt{6959.191}
$$

## NSO -- Practical example

In this part an NSO will share its experiences on dealing with statistical comparisons among groups and how do they present the results in tables.

