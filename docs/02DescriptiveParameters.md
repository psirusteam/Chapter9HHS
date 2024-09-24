# Descriptive parameters

When analyzing complex survey data, several descriptive parameters are meaningful and important. For example: poverty and unemployment rates are simple parameters that allow decision-making for governments; also, income distribution can be used to monitor inequality along time. 

## Frequencies

### Point Estimation

The accurate estimation of absolute sizes and proportions in household surveys is essential for obtaining representative data that reflects the demographic and socioeconomic reality of a population. These figures serve as the basis for public policy decision-making, resource allocation, and the design of social programs.

The ability to understand the distribution of specific categories, such as poverty status, employment status, education level, among others, provides valuable information to address inequalities and promote equitable development.

#### Size Estimates

In this section, the processes for estimating categorical variables will be carried out. First, one of the most important parameters is the size of a population, which represents the cardinality of that set; in other words, the total number of individuals that comprise it. In terms of notation, the population size is estimated as follows:

$$
\hat{N}_{\omega} = \sum_{h=1}^{H}\sum_{\alpha=1}^{a_{h}}\sum_{i=1}^{n_{h\alpha}}\omega_{h\alpha i}
$$

Similarly, the size estimate in a subpopulation, defined by a dichotomous variable $I(y_i = d)$, which takes the value of one if individual $i$ belongs to category $d$ in the discrete variable, is given by the following expression:

$$
\hat{N}^d_{\omega} = \sum_{h=1}^{H}\sum_{\alpha=1}^{a_{h}}\sum_{i=1}^{n_{h\alpha}}\omega_{h\alpha i}I(y_i = d)
$$

## Means, proportions, and ratios


After conducting the graphical analysis of trends in the continuous survey variables, it is necessary to obtain point estimates of the measured parameters. These estimates can be obtained either generally for the entire population or disaggregated by domains of interest, depending on the research needs. In the context of household surveys, point estimates refer to the estimation of totals, averages, ratios, means, etc. As mentioned by @Heeringa_West_Berglund_2017, the estimation of totals or averages for a variable of interest in the population, along with the estimation of its variance, has played a crucial role in the development of probability sampling theory. These estimates allow for unbiased and accurate results, providing valuable insights into what is happening in the studied households and enabling informed public policy decision-making.

### Total Estimates

Once the sampling design is defined, which was done in the previous section, the estimation processes for the parameters of interest are carried out. For the estimation of totals with complex sampling designs that include stratification $\left(h=1,2,...,H\right)$ and subsampling in PSUs (assumed to be within stratum $h$) indexed by $\alpha=1,2,...,a_{h}$, the estimator for the total can be written as:

$$
\hat{y}_{\omega} = \sum_{h=1}^{H}\sum_{\alpha=1}^{a_{h}}\sum_{i=1}^{n_{h\alpha}}\omega_{h\alpha i}y_{h\alpha i}
$$

Where $n_{h\alpha}$ is the sample size of households or individuals in PSU $\alpha$ of stratum $h$; $a_{h}$ is the sample size of PSUs within stratum $h$; $H$ is the total number of strata in the sampling design. Finally, $y_{h\alpha i}$ and $\omega_{h\alpha i}$ correspond respectively to the observation of the variable of interest and the weight (expansion factor) of element $i$ associated with PSU $\alpha$ within stratum $h$. The unbiased variance estimator for this total estimator $\hat{y}_{\omega}$ is:

$$
\widehat{var}\left(\hat{y}_{\omega}\right) = \sum_{h=1}^{H}\frac{a_{h}}{\left(a_{h}-1\right)}\left[\sum_{\alpha=1}^{a_{h}}\left(\sum_{i=1}^{n_{h\alpha}}\omega_{h\alpha i}y_{h\alpha i}\right)^{2}-\frac{\left({ \sum_{\alpha=1}^{a_{h}}}\omega_{h\alpha i}y_{h\alpha i}\right)^{2}}{a_{h}}\right]
$$

As can be seen, calculating the total estimate and its estimated variance is complex. However, these calculations can be performed in `R` using the `svytotal` function. The confidence interval is given by the following expression:

$$
\hat{y}_{\omega} \pm 1.96 \times \sqrt{\widehat{var}\left(\hat{y}_{\omega}\right)}
$$


### Estimation of Averages

The estimation of the population mean or average is a very important parameter in household surveys. According to @Gutierrez_2016, an estimator of the population mean can be written as a nonlinear ratio of two estimated finite population totals, as follows:

$$
\hat{\bar{y}}_{\omega} = \frac{\sum_{h=1}^{H}\sum_{\alpha=1}^{a_{h}}\sum_{i=1}^{n_{h\alpha}}\omega_{h\alpha i}y_{h\alpha i}}{\sum_{h=1}^{H}\sum_{\alpha=1}^{a_{h}}\sum_{i=1}^{n_{h\alpha}}\omega_{h\alpha i}} = \frac{\hat{y}_{\omega}}{\hat{N}_{\omega}}.
$$

It should be noted that if $y$ is a binary variable, the weighted mean estimates the population proportion. On the other hand, since $\hat{\bar{y}}_{\omega}$ is not a linear statistic, there is no closed-form formula for the variance of this estimator. For this reason, resampling methods or Taylor series expansions must be used. In this particular case, using Taylor series, the variance of the estimator is as follows:

$$
var\left(\hat{\bar{y}}_{\omega}\right) \dot{=} \frac{var\left(\hat{y}_{\omega}\right)+\hat{\bar{y}}_{\omega}^{2}\times var\left(\hat{N}_{\omega}\right)-2\times\hat{\bar{y}}_{\omega}\times cov\left(\hat{y}_{\omega},\hat{N}_{\omega}\right)}{\hat{N}_{\omega}^{2}}.
$$

As can be observed, calculating the variance estimation involves complex components to compute analytically, such as the covariance between the estimated total and the estimated population size.

