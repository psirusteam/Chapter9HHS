# Descriptive parameters

The most frequent analysis of complex household survey data consists in estimating some descriptive population parameters for a range of survey variables. Such *descriptive analysis* generally involve estimating frequencies, proportions, means, and totals. But other target parameters such as selected quantiles of numeric variables, poverty and inequality measures, and a range of indicators such as those required for monitoring the Sustainable Development Goals are becoming part of regular set of estimates needed from household sample surveys. 

## Frequencies

### Point Estimation

The accurate estimation of absolute sizes and proportions in household surveys is essential for obtaining representative data that reflects the demographic and socioeconomic reality of a population. These figures serve as the basis for public policy decision-making, resource allocation, and the design of social programs.

The ability to understand the distribution of specific categories, such as poverty status, employment status, education level, among others, provides valuable information to address inequalities and promote equitable development.

### Size Estimates

In this section, the processes for estimating categorical variables will be carried out. First, one of the most important parameters is the size of a population, which represents the cardinality of that set; in other words, the total number of individuals that comprise it. In terms of notation, the population size is estimated as follows:

$$
\widehat{N} = \sum_{h=1}^{H} \sum_{i \in s_{1h}} \sum_{k \in s_{hi}} w_{hik}
$$

where $s_{hi}$ is the sample of households or individuals in PSU $i$ of stratum $h$; $s_{1h}$ is the sample of PSUs within stratum $h$; and $w_{hik}$ is the weight (expansion factor) of unit $k$ within PSU $i$ in stratum $h$.

Similarly, the size estimate in a subpopulation, defined by a dichotomous variable $I(y_{hik} = d)$, which takes the value one if unit $k$ from PSU $i$ in stratum $h$ belongs to category $d$ in the discrete variable $y$, is given by the following expression:

$$
{\widehat{N}}_d = \sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}} w_{hik} \ I(y_{hik} = d)
$$

## Totals, means, proportions, and ratios

For single numeric survey variables, the simplest estimates are for totals and means. Ratios are often used to obtain summaries that relate two numeric variables. Estimates for such parameters can be obtained either for the entire population or disaggregated by domains of interest, depending on the research needs. 

As mentioned by @Heeringa_West_Berglund_2017, the estimation of population totals or averages for a variable of interest, along with the estimation of corresponding variances, has played a crucial role in the development of probability sampling theory. Estimators of population means, proportions and ratios are all dependent on estimating component population totals, as we show in the sequence.

### Estimating totals

Once the sampling design is defined, which was done in the previous section, the estimation process for the parameters of interest is carried out. For the estimation of totals with complex sampling designs that include stratification $\left(h=1,2,...,H\right)$ and subsampling in PSUs (assumed to be within stratum $h$) indexed by $i=1,2,...,m_h$, the estimator for the population total can be written as:

$$
\widehat{Y} = \sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}} w_{hik} \ y_{hik}
$$

Under full response, the Ultimate Cluster variance estimator for $\widehat{Y}$ was provided in section 9.1. Calculating the total estimate and its estimated variance is complex, but now these calculations can be easily performed using the `svytotal` function from the `survey` package in R. The confidence interval of level $1 - \alpha$ is given by the following expression:

$$
\widehat{Y} \pm z_{1 - \alpha/2} \times \sqrt{\widehat{V}_{UC} \left( \widehat{Y}\right)}
$$

with $z_{1 - \alpha/2}$ denoting the quantile of the Gaussian distribution leaving an area of ${\alpha/2}$ to its right.

### Estimating averages

The estimation of the population means or averages is a very important task in household surveys. According to @Gutierrez_2016, an estimator of the population mean can be written as the ratio of two estimated finite population totals, as follows:

$$
\widehat{\overline{Y}} = \frac{\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}} w_{hik}y_{hik}} {\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}} w_{hik}} = \frac{\widehat{Y}}{\widehat{N}}.
$$

Since $\widehat{\overline{Y}}$ is a nonlinear statistic, there is no closed-form formula for exact the variance of this estimator. For this reason, either resampling methods or Taylor series approximations must be used. The latter may be achieved remembering that for the survey mean the sampling estimating equation requires defining $\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}} w_{hik} (y_{hik} - \theta) = 0$, therefore we can apply the variance estimator given in section 9.1 with $z_{hik} = y_{hik} - \widehat{\overline{Y}}$.

### Estimating proportions

When $y$ is a binary variable, the weighted mean estimates the population proportion. As mentioned by @Heeringa2017, by recoding the original response categories into simple indicator variables $y$ with possible values of 1 and 0 (e.g., 1=Yes, 0=No), the estimator for a proportion is defined as follows:

$$
\widehat{p}_d = \frac{\widehat{N}_d}{\widehat{N}} = \frac{\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}} w_{hik}\ I(y_{hik} = d)} {\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}} w_{hik}}
$$

We can apply Taylor linearization to obtain the approximate variance of the above estimator by defining the estimating function as $z_{hik} = I(y_{hik} = d) - \widehat{p}_d$.

Many statistical packages provide proportion estimates and standard errors on a percentage scale. As is well known in the specialized literature, when the estimated proportion of interest is close to zero or to one, the limits of the traditional symmetric normal confidence intervals may fall outside the permissible range for proportions. This would have no interpretation due to the nature of the parameter.

To address this issue, alternative confidence interval estimates, as proposed by @Rust2007ConfidenceIF and @DeanPagano2015 are available. One alternative based on using the logit transformation of the estimated proportion is:

$$
CI \left( \widehat{p}_d \ ; \ 1 - \alpha \right) = \frac {exp \left[ ln \left( \frac{\widehat{p}_d} {1 - \widehat{p}_d} \right) \pm \frac{t_{1-\alpha/2 , \, df} \times se \left( \widehat{p}_d \right)} {\widehat{p}_d \left( 1 - \widehat{p}_d \right) } \right]} {1 + exp \left[ ln \left( \frac{\widehat{p}_d} {1 - \widehat{p}_d} \right) \pm \frac{t_{1-\alpha/2, \, df} \times se \left( \widehat{p}_d \right)} {\widehat{p}_d \left( 1 - \widehat{p}_d \right)}\right]}
$$

### Estimating ratios

In many household survey analyses, it is not sufficient to examine individual variables in isolation. For example, ODS indicator N.17.6.1 is defined as the ratio of the number of broadband subscriptions per 100 inhabitants in a country or region. Ratio estimators are obtained simply by the ratio of the corresponding estimators of totals (or means) in the numerator and denominator. Another example is estimating the ratio of expenditures to income or the ratio of a particular type of expenditure (say food) over total expenditures in a household budget survey.

Since the ratio is the quotient of two totals, both the numerator and the denominator are unknown quantities and thus need to be estimated. The point estimator for a ratio in complex surveys is the quotient of the estimators for the totals, as defined by:

$$
\widehat{R} = \frac{\widehat{Y}}{\widehat{X}}
= \frac{\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}}  w_{hik} \ y_{hik}}{\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}}  w_{hik} \ x_{hik}}
$$

For variance estimation, all you need to do is specify the estimating function as $z_{hik} = y_{hik} - \widehat{R} \ x_{hik}$, when $y$ and $x$ are the numerator and denominator variables, respectively.

## Variances and standard deviations

Sometimes the interest lies in estimating the variance or standard deviation of a numeric survey variable $y$. This can be accomplished using the following estimators:

$$
\widehat{S_y^2} = \frac{1}{\widehat{N}-1}
{\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}}  w_{hik} \ \left( y_{hik} - \widehat{\overline{Y}} \right)^2}
$$

and $\widehat{S_y} = \sqrt{\widehat{S_y^2}}$ for the standard deviation.

## Correlations

Pearson correlation coefficients are useful for assessing the relationship between two numeric survey variables, say $x$ and $y$. These can be estimated using

$$
\widehat{\rho}_{xy} = \frac {\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}}  w_{hik} \ \left( y_{hik} - \widehat{\overline{Y}} \right) \left( x_{hik} - \widehat{\overline{X}} \right)} {\sqrt{\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}}  w_{hik} \ \left( y_{hik} - \widehat{\overline{Y}} \right)^2} \sqrt{\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}}  w_{hik} \ \left( x_{hik} - \widehat{\overline{X}} \right)^2}}
$$

## Percentiles and inequality measures

Non-central location measures are helpful to determine location and spread of the data distribution beyond central values. Key non-central location measures include the quartiles and other quantiles or percentiles. As an example, the estimation of income percentiles in a given country may help define the onset of public policy. For example, a tax could be imposed on individuals in the top 10% of the income distribution, or transport subsidies could be provided to those in the bottom 15% of the income distribution.

Quantile estimation is based on results related to weighted total estimators, by first estimating the population cumulative distribution function (CDF). The CDF for a variable $y$ in a finite population of size $N$ is defined as follows:

$$
F(t) = \frac{1}{N}\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}}  I(y_{hik} \leq t) 
$$

Where $I(y_k \leq x)$  is an indicator variable that takes the value 1 if $y_{hik}$ is less than or equal to a specific value $t$, and 0 otherwise. An estimator of the CDF in a complex sampling design is given by:

$$
\widehat{F}(t) = \frac{\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}} w_{hik} I(y_{hik}\leq t)}{\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}} w_{hik}}
$$

Once the CDF is estimated using the survey design weights, the $q$-th quantile of a variable $y$ is the smallest value of $y$ such that the CDF is greater than or equal to $q$. As is well known, the median is the value where the CDF is greater than or equal to $1/2$. Thus, the estimated median is the smallest value where the estimated CDF is greater than or equal to $1/2$. Following @Heeringa2017, to estimate quantiles, one first considers the order statistics denoted as $y_{(1)}, \ldots, y_{(n)}$ and finds the value of $j$ $(j=1, \ldots, n)$ such that:


$$
\widehat{F}(y_{(j)}) \leq q\leq\widehat{F}(y_{(j+1)})
$$

Hence, the estimator of the $q$-th quantile $y_{(q)}$ is given by:

$$
\widehat{y}_{(q)} = y_{(j)} + \frac{q - \widehat{F}(y_{(j)})}{\widehat{F}(y_{(j+1)}) - \widehat{F}(y_{(j)})} (y_{(j+1)} - y_{(j)})
$$

For the variance estimation and confidence intervals of quantiles, @kovar1988bootstrap present results from a simulation study where they recommend using the *Balanced Repeated Replication* (BRR) technique.

### Estimating the Gini coefficient

Economic inequality is a common issue worldwide, with particular focus from international institutions. Measuring economic inequality among households is of great interest, and the Gini coefficient ($G$) is the most commonly used indicator for this purpose. The Gini coefficient ranges from 0 to 1, where $G = 0$ indicates perfect equality in wealth distribution, and higher values reflect increasing inequality.

Following the estimation equation proposed by @binder1995estimating, the estimator for the Gini coefficient is given by:

$$
\widehat{G} = \frac {2 \times \sum_{h=1}^{H} \sum_{i \in s_{1h}} \sum_{k \in s_{hi}}  w_{hik}^{*} \widehat{F}_{hik} \ y_{hik} - 1} {\widehat{\overline{Y}}}
$$

where $w_{hik}^{*}$ is a normalized sampling weight, defined as

$$
w_{hik}^{*} = \frac{w_{hik}} {\sum_{h=1}^{H} \sum_{i \in s_{1h}}  \sum_{k \in s_{hi}} w_{hik}}
$$

and $\widehat{F}_{hik}$ represents the estimated CDF for individual $k$ in cluster $i$ of stratum $h$.

@osier2009variance and @Langel_Tille_2013 provide important computational details for estimating the variance of this complex estimator.

## NSO – Practical example

In this subsection a NSO will share how they do disseminate its results on basic descriptive statistics, how they publish the resulting tables and how do they deal with the suppression of estimates that do not reach expected quality. 

