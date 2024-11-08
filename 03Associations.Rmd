# Associations between variables

Household sample surveys often collect data on categorical variables, and assessing whether pairs of these variables are associated becomes of interest. This section will introduce the reader on the main methods currently used to describe and infer associations for pairs of categorical variables.

We start by defining some notation. Let $x$ and $y$ denote two categorical variables, having $R$ and $C$ classes respectively. In order to formulate hypothesis tests for the independence between $x$ and $y$, we need to consider a *superpopulation model*. We assume that the pairs $(x_{hik} , y_{hik})$ correspond to observations from identically distributed random vectors $(X ; Y)$, that have joint distribution specified by

$$
P_{rc} = Pr \left( X = r \ ; \ Y = c \right) \quad \text{for } r=1,...,R \text{ and } c=1,...,C
$$

with $\sum_r \sum_c P_{rc} = 1$.

If a census could be carried out to collect data on $x$ and $y$ from every unit in the population, we could calculate the population counts of units having classes $(r,c)$ for $(x,y)$ given by:

$$
N_{rc} = \sum_{h=1}^H \sum_{i \in U_{1h}} \sum_{k \in U_{hi}} I \left( x_{hik} = r \ ; \ y_{hik} = c \right)
$$

and the corresponding population proportions as $p_{rc} = N_{rc} / N_{++}$, where $N_{++} = \sum_r \sum_c N_{rc}$ denotes the total number of units in the population.

Under the superpopulation model, the population proportions $p_{rc}$ could be used to estimate (or approximate) the unknown probabilities $P_{rc}$. Since in most instances we will have samples, not censuses, the population proportions $p_{rc}$ must be estimated using weighted estimators provided in the previous sections.

## Cross-tabulations and contingency tables

Cross-tabulations organize population frequency distribution estimates for two or more categorical variables to help explore relationships between them. Tests of independence can be used to assess whether the cross-classified variables are related or independent. This type of analysis is important in many research and decision-making settings.

In the specialized literature, cross-tabulations are also referred to as contingency tables. Here a table is a two-dimensional array with rows indexed by $r=1,\ldots,R$ and columns indexed by $c=1,\ldots,C$. Such tables are widely used in household survey analysis as they summarize the relationship between categorical variables in terms of frequency counts. A contingency table aims to succinctly represent the association between different categorical variables.

First we consider the case of a two-way contingency table. For most household sample surveys, a typical tabular output comprises the weighted frequencies that estimate the population frequencies, as follows:

|             |          | $y$      |          |           |
|:-----------:|:--------:|:--------:|:--------:|:---------:|
| $x$         | 1        | $\ldots$ | $C$      | row marg. | 
| 1           | $\widehat{N}_{11}$ | $\ldots$ | $\widehat{N}_{1C}$ | $\widehat{N}_{1+}$ |
| $\ldots$    | $\ldots$ | $\widehat{N}_{rc}$ | $\ldots$ | $\ldots$  |
| $R$         | $\widehat{N}_{R1}$ | $\ldots$ | $\widehat{N}_{RC}$ | $\widehat{N}_{R+}$ |
| col. marg.  | $\widehat{N}_{+1}$ | $\ldots$ | $\widehat{N}_{+C}$ | $\widehat{N}$|

where the estimated frequency in cell $(r,c)$ is obtained as

$$
\widehat{N}_{rc} = \sum_{h=1}^H \sum_{i \in s_{1h}} \sum_{k \in s_{hi}} w_{hik} \ I \left( x_{hik} = r \ ; \ y_{hik} = c \right)
$$

and $\widehat{N}_{r+} = \sum_c \widehat{N}_{rc}$, $\widehat{N}_{+c} = \sum_r \widehat{N}_{rc}$ and $\widehat{N}_{++} = \sum_r \sum_c \widehat{N}_{rc}$.

The estimated proportions from these weighted sample frequencies are obtained as follows:

$$
\widehat{p}_{rc} = \frac{\widehat{N}_{rc}}{\widehat{N}_{++}}
$$

$\widehat{p}_{r+} = \sum_c \widehat{N}_{r+} / \widehat{N}_{++}$, and $\widehat{p}_{+c} = \sum_r \widehat{N}_{rc} / \widehat{N}_{++}$.

Two-way tables can also display the estimates of population relative frequencies, as shown below:

|             |          | $y$      |          |           |
|:-----------:|:--------:|:--------:|:--------:|:---------:|
| $x$         | 1        | $\ldots$ | $C$      | row marg. | 
| 1           | $\widehat{p}_{11}$ | $\ldots$ | $\widehat{p}_{1C}$ | $\widehat{p}_{1+}$ |
| $\ldots$    | $\ldots$ | $\widehat{p}_{rc}$ | $\ldots$| $\ldots$ |
| $R$         | $\widehat{p}_{R1}$ |$\ldots$  | $\widehat{p}_{RC}$ | $\widehat{p}_{R+}$ |
| col. marg. | $\widehat{p}_{+1}$ | $\ldots$ | $\widehat{p}_{+C}$ | $1$ |

## Testing for independence

Using the estimated contingency tables, it is possible to perform independence tests to verify whether $x$ and $y$ are associated. Following @Heeringa2017, the null hypothesis that $x$ and $y$ are independent is defined as:

$$
H_0) \ \ P_{rc}^0 = {P_{r+} \times P_{+c}} \ \ \forall \ r=1, \ldots, R \text{ and } c=1, \ldots, C.
$$

Hence, to test the independence hypothesis we compare the estimated proportions $\widehat{p}_{rc}$ with the estimated expected population proportions under the null $P_{rc}^0$. If there is a large difference between them, then the independence hypothesis would not be supported by the data. Therefore, the following Pearson Rao-Scott adjusted test statistic $X_{RS}^2$ [@Rao1984] is defined:

$$
X_{RS}^2 =\ \frac {n_{++}} {GDEFF} \sum_r \sum_c \frac{\left(\widehat{p}_{rc} - \widehat P_{rc}^0 \right)^2}{\widehat P_{rc}^0}
$$

where $\widehat P_{rc}^0 = \widehat p_{r+} \times \widehat p_{+c}$ estimates the cell frequencies under the null hypothesis and $GDEFF$ is an estimate of the generalized design effect given by

$$
GDEFF = \frac{\sum_{r}\sum_{c}\left(1 - \widehat p_{rc}\right) d^{2}\left(\widehat p_{rc}\right) - \sum_{r} \left(1 - \widehat p_{r+} \right) d^{2}\left(\widehat p_{r+}\right) - \sum_{c} \left( 1 - \widehat p_{+c} \right) d^{2} \left( \widehat p_{+c} \right)} {\left(R-1\right)\left(C-1\right)}
$$

where $d^2 \left({\widehat \theta}\right)$ denotes the estimated design effect for the estimator ${\widehat \theta}$.

Under the null hypothesis of independence, the large sample distribution of $X_{RS}^2$ is $\chi^2_{[(R-1) (C-1)]}$.

As mentioned by @Heeringa2017, it was @Fay1979, along with @Fellegi1980, who began proposing corrections to Pearson's chi-square statistic based on a generalized design effect. @Rao1984 later expanded the theory of generalized design effect corrections for these statistical tests, as did @thomas1987small_sample. The Rao-Scott adjustment requires the calculation of generalized design effects, which are analytically more complex than Fellegi's approach. Nevertheless, Rao-Scott adjusted statistics are now the standard for analyzing categorical survey data in software systems such as R, Stata and SAS.

The Rao-Scott adjusted Likelihood Ratio statistic is defined as:

$$
G_{RS}^{2} = 2 \times \frac {n_{++}} {GDEFF} \times \sum_{r} \sum_{c} \widehat p_{rc} \times \ln \left( \frac{\widehat p_{rc}}{p_{rc}^0} \right)
$$

Under the null hypothesis of independence, the large sample distribution of this test statistic is also $\chi^2_{[(R-1) (C-1)]}$. 

When the number of degrees of freedom for the sample is not very large, two adjusted versions of the above test statistics might be preferable, since they enable taking this into account. The F-adjusted test statistic for independence based on Pearson's $X_{RS}^2$ is calculated as follows:

$$
F_{Pearson} = \frac{X^{2}_{R-S}}{(R-1)(C-1)} \sim F_{\left(R-1\right)\left(C-1\right) \ , \ df}
$$

where $df = \sum_{h} n_h - H$ denotes the degrees of freedom in the design.

The F-adjusted teststatistic for independence based on the Rao-Scott adjusted Likelihood Ratio statistic $G_{RS}^{2}$ is calculated as:

$$
F_{LR} = \frac{G^{2}_{R-S}}{C-1} \sim F_{\left(C-1\right) \ , \ df}
$$

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

## NSO -- Practical example

In this part an NSO will share its experiences on dealing with statistical comparisons among groups and how do they present the results in tables.

