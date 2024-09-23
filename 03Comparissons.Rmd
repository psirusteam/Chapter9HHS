# Comparisons and association

Elaborate analyses of household survey data must be adjusted for the complex survey design to account for clustering, stratification, and weighting. This section will introduce the reader on the main methods currently used to compare subgroups and make conclusions based on a valid inferential context.

## Cross-tabulations

Contingency tables and tests of independence are essential tools in household survey analysis, as they help explore relationships between categorical variables. These tables organize population estimates based on two or more characteristics, revealing patterns and associations. Independence tests evaluate whether the variables are related or independent. This analysis is crucial in research and decision-making, as it provides insights into the dependence between factors, influencing strategies based on accurate estimates.

### Contingency Tables

In specialized literature, contingency tables are also referred to as cross-tabulations. Generally, a table is assumed to be a two-dimensional array with $r=1,\ldots,R$ rows and $c=1,\ldots,C$ columns. These tables are widely used in household survey analysis as they summarize the relationship between categorical variables in terms of frequency counts. A contingency table aims to succinctly represent the association between different categorical variables.

For an unexpanded sample, these tables are defined using unweighted frequencies as shown below:

| **Variable 2**      | **Variable 1** |          |                  |
|---------------------|----------------|----------|------------------|
|                     | 0              | 1        | **Row Marginal** |
| 0                   | $n^{00}$       | $n^{01}$ | $n^{0+}$         |
| 1                   | $n^{10}$       | $n^{11}$ | $n^{1+}$         |
| **Column Marginal** | $n^{+0}$       | $n^{+1}$ | $n^{++}$         |

For weighted analyses based on an expanded sample, the two-way table presents the population estimate of the frequencies as follows:

| **Variable 2**      | **Variable 1**          |                         |                         |
|-------------------|------------------|------------------|------------------|
|                     | 0                       | 1                       | **Row Marginal**        |
| 0                   | $\hat{N}^{00}_{\omega}$ | $\hat{N}^{01}_{\omega}$ | $\hat{N}^{0+}_{\omega}$ |
| 1                   | $\hat{N}^{10}_{\omega}$ | $\hat{N}^{11}_{\omega}$ | $\hat{N}^{1+}_{\omega}$ |
| **Column Marginal** | $\hat{N}^{+0}_{\omega}$ | $\hat{N}^{+1}_{\omega}$ | $\hat{N}_{\omega}$      |

Thus, considering the subscript $i\in\left(r,c\right)$ represents the individuals classified in cell ($r, c$), the estimator for the frequency in this cell is given by the following expression:

$$
\hat{N}^{rc}_{\omega} = \sum_{h=1}^{H}\sum_{\alpha=1}^{a_{h}}\sum_{i\in\left(r,c\right)}^{n_{h\alpha}}\omega_{h\alpha i}
$$

The estimators for the other frequencies in the table, including row and column marginals, are defined similarly. The estimated proportions from these weighted sample frequencies are obtained as follows:

$$
\hat{p}_{\omega}^{rc} = \frac{\hat{N}^{rc}_{\omega}}{\hat{N}_{\omega}}
$$

On the other hand, it is also possible to create tables that report estimates of relative frequencies, or percentages, in the population. This analysis is, of course, conducted using weighted data based on the expanded sample. The two-way table with the population estimate of proportions is presented below:

| **Variable 2**      | **Variable 1**          |                         |                         |
|-------------------|------------------|------------------|------------------|
|                     | 0                       | 1                       | **Row Marginal**        |
| 0                   | $\hat{p}^{00}_{\omega}$ | $\hat{p}^{01}_{\omega}$ | $\hat{p}^{0+}_{\omega}$ |
| 1                   | $\hat{p}^{10}_{\omega}$ | $\hat{p}^{11}_{\omega}$ | $\hat{p}^{1+}_{\omega}$ |
| **Column Marginal** | $\hat{p}^{+0}_{\omega}$ | $\hat{p}^{+1}_{\omega}$ | $\hat{p}_{\omega}$      |

In the same way as for absolute frequencies, considering that the subscript $i\in\left(r,c\right)$ represents the individuals classified in cell ($r, c$), the estimator for the proportion associated with this cell is given by the following expression:

$$
\hat{p}^{rc}_{\omega}=\frac{\hat{N}^{rc}_{\omega}}{\hat{N}_{\omega}}=
\frac{\sum_{h=1}^{H}\sum_{\alpha=1}^{a_{h}}\sum_{i\in\left(r,c\right)}^{n_{h\alpha}}\omega_{h\alpha i}}{\sum_{h=1}^{H}\sum_{\alpha=1}^{a_{h}}\sum_{i=1}^{n_{h\alpha}}\omega_{h\alpha i}}
$$

## Tests for group comparisons

To determine whether the means of two groups are significantly different we will introduce t-test and contrasts adjusted for the sampling design.

### Hypothesis Test for the Difference of Means

A hypothesis test is a statistical procedure used to evaluate evidence in favor of or against a statement or assumption about a population. In this process, a null hypothesis ($H_0$) is proposed, representing the initial statement that needs to be tested, and an alternative hypothesis ($H_1$), which is the statement opposing the null hypothesis. This statement may be based on some belief or past experience and will be tested using the evidence gathered from the sample data. If it is suspected that the parameter $\theta$ is equal to a particular value $\theta_{0}$, the possible combinations of hypotheses that can be tested are:

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

In general, some important parameters can be expressed as a linear combination of measures of interest. The most common cases are differences in means, weighted sums of means used to construct economic indices, etc. Thus, consider a function that is a linear combination of $j$ descriptive statistics, as shown below:

```{=tex}
\begin{eqnarray*}
f\left(\theta_{1},\theta_{2},...,\theta_{j}\right) & = & \sum_{j=1}^{J}a_{j}\theta_{j}
\end{eqnarray*}
```
In this case, $a_{j}$ are known constants. An estimator of this function is given by:

```{=tex}
\begin{eqnarray}
\hat{f}_{\omega}\left(\hat{\theta}_{1},\hat{\theta}_{2},...,\hat{\theta}_{j}\right) & = & \sum_{j=1}^{J}a_{j}\hat{\theta}_{j}
\end{eqnarray}
```
And its variance is calculated as follows:

```{=tex}
\begin{eqnarray}
var\left(\sum_{j=1}^{J}a_{j}\hat{\theta}_{j}\right) & = & \sum_{j=1}^{J}a_{j}^{2}var\left(\hat{\theta}_{j}\right)+2\times\sum_{j=1}^{J-1}\sum_{k>j}^{J}a_{j}a_{k}\,cov\left(\hat{\theta}_{j},\hat{\theta}_{k}\right)
\end{eqnarray}
```
As seen in the variance equation of the estimator, it incorporates the variances of the individual components' estimates, as well as the covariances of the estimated pairs.

Of particular interest is analyzing the difference in population means, which can be written as follows:

$$
\bar{y}^{1}-\bar{y}^{2}
$$

Where $\bar{y}_{1}$ is the mean of the first population, for example, the average household income obtained by fathers, and $\bar{y}_{2}$ is the mean of the second population, which in this example could be the average income of mothers in a household. This parameter can be unbiasedly estimated by:

$$
\hat{\bar{y}}_{\omega}^{1}-\hat{\bar{y}}_{\omega}^{2}
$$

Where $\hat{\bar{y}}_{\omega}^{i}$ is the sample estimator of $\bar{y}^{i}$ ($i = 1, 2$). Considering the parameter of interest in this section, the hypotheses to be tested are as follows:

```{=tex}
\begin{eqnarray*}
\begin{cases}
H_{0}:\bar{y}_{1}-\bar{y}_{2}=0\\
H_{1}:\bar{y}_{1}-\bar{y}_{2}\neq0
\end{cases} & \begin{cases}
H_{0}:\bar{y}_{1}-\bar{y}_{2}=0\\
H_{1}:\bar{y}_{1}-\bar{y}_{2}>0
\end{cases} & \begin{cases}
H_{0}:\bar{y}_{1}-\bar{y}_{2}=0\\
H_{1}:\bar{y}_{1}-\bar{y}_{2}<0
\end{cases}
\end{eqnarray*}
```
To test these hypotheses, the following test statistic is used, which follows a t-student distribution with $df$ degrees of freedom, calculated as the difference between the number of PSUs (Primary Sampling Units) and the number of strata.

$$
t = \frac{\hat{\bar{y}}_{\omega}^{1}-\hat{\bar{y}}_{\omega}^{2}}{se\left(\bar{y}_{1}-\bar{y}_{2}\right)} \sim t_{df}
$$

Where:

$$
\widehat{se}\left(\hat{\bar{y}}_{\omega}^{1}-\hat{\bar{y}}_{\omega}^{2}\right) = \sqrt{\widehat{var}\left(\hat{\bar{y}}_{\omega}^{1}\right) + \widehat{var}\left(\hat{\bar{y}}_{\omega}^{2}\right) - 2 \  \widehat{cov}\left(\hat{\bar{y}}_{\omega}^{1},\hat{\bar{y}}_{\omega}^{2}\right)}
$$

If a confidence interval for the difference in means is desired, it would be constructed as follows:

$$
\hat{\bar{y}}_{\omega}^{1}-\hat{\bar{y}}_{\omega}^{2} \pm t_{df}\ \widehat{se}\left(\hat{\bar{y}}_{\omega}^{1}-\hat{\bar{y}}_{\omega}^{2}\right)
$$

### Contrasts

In many cases, it is necessary to compare more than two populations at the same time. For example, comparing the average household incomes across three regions to identify which regions experienced a greater impact on households. In such cases, the difference of means we studied in previous chapters is not sufficient, as it only allows for pairwise comparisons of populations. Therefore, using contrasts becomes a good alternative to address these types of problems.

Based on the definitions discussed in this chapter, a contrast is a linear combination of parameters in the form:

```{=tex}
\begin{eqnarray*}
f = A * \theta = f\left(\theta^{1},\theta^{2},...,\theta^{j}\right) & = & \sum_{j=1}^{J}a_{j}\theta^{j}
\end{eqnarray*}
```
Where $A$ is a matrix or vector of constants, and $\theta$ is a matrix or vector of parameters.

Next, we will perform the calculation of a hypothesis contrast. Suppose we have the estimates shown in the table, where the goal is to compare the average income by region. As a first example, we will compare two populations: the North and South regions. Specifically, we are interested in the income difference ($f = \bar{y}^{North} - \bar{y}^{South}$). Since the population is divided into five regions and the contrast will only be constructed for two of them (North and South), it is defined as follows:

$$
f = A * \theta = 1 \times \bar{y}^{North} + (-1) \times \bar{y}^{South} + 0 \times \bar{y}^{Center} + 0 \times \bar{y}^{West} + 0 \times \bar{y}^{East}
$$

As can be observed, in this case, the contrast vector is $A = \left[1, -1, 0, 0, 0\right]$. Mathematically, the estimator for this specific contrast is defined as:

$$
\hat{f}_{\omega} = A \times \hat{\theta} = \left[1, -1, 0, 0, 0\right] \times \left[
\begin{array}{c}
\hat{\bar{y}}^{North}_{\omega} \\
\hat{\bar{y}}^{South}_{\omega} \\
\hat{\bar{y}}^{Center}_{\omega} \\
\hat{\bar{y}}^{West}_{\omega} \\
\hat{\bar{y}}^{East}_{\omega}
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
se(\hat{f}_{\omega}) = se\left(\hat{\bar{y}}^{North}_{\omega} - \hat{\bar{y}}^{South}_{\omega}\right) = \sqrt{var\left(\hat{\bar{y}}^{North}_{\omega}\right) + var\left(\hat{\bar{y}}^{South}_{\omega}\right) - 2 \, cov\left(\hat{\bar{y}}^{North}_{\omega}, \hat{\bar{y}}^{South}_{\omega}\right)}
$$

Therefore, the estimated standard error for this contrast is:

$$
se(\hat{f}_{\omega}) = \sqrt{3064.715 + 3894.476 - 2 \times 0} = \sqrt{6959.191}
$$

## Tests of Independence

Based on the estimated tables, it is possible to perform independence tests to verify whether there is an association between two categorical variables. Two variables are independent if the structural behavior of one variable does not depend on the other, and vice versa. @Heeringa_West_Berglund_2017 state that, under simple random sampling, two categorical variables are independent if the expected proportion in row $r$ and column $c$, denoted as $\pi^{rc}$, follows the relationship:

$$
\pi^{rc} = \frac{n^{r+} \times n^{+c}}{(n^{++})^2}
$$

Thus, one way to verify if there is independence between the variables of interest is to directly compare the estimated proportions $\hat{p}^{rc}_{\omega}$ with the expected proportions $\pi^{rc}$. If there is a large difference between them, then the independence hypothesis would not be supported by the collected data. Therefore, the following Rao-Scott $\chi^{2}_{RS}$ statistic [@rao1984adjusted], which follows a chi-square distribution with $(R-1) \times (C-1)$ degrees of freedom, is defined:

```{=tex}
\begin{eqnarray}
\chi^{2}_{RS}  =  \frac{\chi^{2}_{Pearson}}{GDEFF}
\end{eqnarray}
```
Where:

$$
\chi^{2}_{Pearson} = n^{++} \left( \sum_r \sum_c \frac{(\hat{p}^{rc}_{\omega} - \pi^{rc})^2}{\pi^{rc}} \right)
$$

Additionally, $GDEFF$ is an estimate of the generalized design effect by Rao--Scott, defined as:

$$
GDEFF = \frac{\sum_{r}\sum_{c}\left(1-p_{rc}\right)d^{2}\left(p_{rc}\right)-\sum_{r}\left(1-p_{r+}\right)d^{2}\left(p_{r+}\right)-\sum_{c}\left(1-p_{+c}\right)d^{2}\left(p_{+c}\right)}{\left(R-1\right)\left(C-1\right)}
$$

As mentioned by @Heeringa_West_Berglund_2017, it was @fay1979adjusting, along with @fellegi1980approximate, who began proposing corrections to Pearson's chi-square statistic based on a generalized design effect. @rao1984chi_squared later expanded the theory of generalized design effect corrections for these statistical tests, as did @thomas1987small_sample. The Rao-Scott method requires the calculation of generalized design effects, which are analytically more complex than Fellegi's approach. Rao-Scott corrections are now the standard for analyzing categorical survey data in software systems such as Stata and SAS.

Additionally, Fisher's F-test for independence allows the analysis of whether two dichotomous variables are associated when the observed sample is too small, and the conditions for applying Pearson's $\chi^{2}$ test are not met. To use this technique, consider the expressions for the estimated probability and Pearson's $\chi^{2}$ statistic. Based on these, the likelihood ratio statistic is defined as:

$$
G^{2} = 2 \times n_{++} \times \sum_{r} \sum_{c} p_{rc} \times \ln \left( \frac{p_{rc}}{\hat{\pi}_{rc}} \right)
$$

where $r$ is the number of rows, and $c$ represents the number of columns, and the test has $(R-1) \times (C-1)$ degrees of freedom. Applying a correction for the generalized design effect, the likelihood ratio statistic is calculated as:

$$
G^2_{(R-S)} = \frac{G^2}{GDEFF}
$$

Thus, the F-statistic for independence based on Pearson's chi-square test is calculated as follows:

$$
F_{R-S,Pearson} = \frac{\chi^{2}_{R-S}}{\left[(R-1)(C-1)\right]} \sim F_{\left(R-1\right)\left(C-1\right),df}
$$

And, the F-statistic for independence based on the likelihood ratio is calculated as:

$$
F_{R-S,LRT} = \frac{G^{2}_{R-S}}{(C-1)} \sim F_{\left(C-1\right),df}
$$

where $C$ is the number of columns in the cross-tabulation.

## Correlation

To conclude on the degree of association between variables, we show the proper approach to include sampling weights and complex sampling design.

## NSO -- Practical example

In this part an NSO will share its experiences on dealing with statistical comparisons among groups and how do they present the results in tables.
