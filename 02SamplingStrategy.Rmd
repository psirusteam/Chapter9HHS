# Accounting for the sampling design

When analysis household survey data, ignoring the sampling design undermines the representativeness, accuracy, and credibility of survey-based findings, which can lead to incorrect decisions. This is why accounting for the sampling design is essential when analyzing household survey data to ensure valid and unbiased estimates. As seen in the previous chapters, regular household surveys has two major characteristics:

* They use complex sampling designs (e.g., stratification, clustering, and unequal probabilities of selection) to represent the population efficiently. Ignoring the design can lead to biased population-level inferences.
* They define sampling weights for each sampling unit (primary, and remaining ones) to properly represent the population.

To illustrate this fact, we provide a simple example. Suppose a country has two regions: Region A with 100 people, and Region B with 900 people. Wealthy people lives in Region A, with an average income of \$10,000, less wealthy people lives in Region B, with average income of \$2,000. The true population mean income is \$2,800, because:

$$
\theta = \frac{(100 \times 10,000) + (900 \times 2,000)}{100 + 900} = 2,800.
$$

Suppose a survey is conducted where 50 people are sampled from each Region. After the collection of data, it was found that the sample mean for Region A was \$10,000, while the sample mean for Region B was \$2,000. If the sampling design is ignored, all units in the sample will receive equal weights, regardless of their population sizes. This way, the mean income is biasedly estimated by:

$$
\hat \theta = \frac{(50 \times 10,000) + (50 \times 2,000)}{100} = 6,000.
$$

When the sampling design is considered, weights are applied proportional to the population sizes of each neighborhood. This way, units in Region A will receive a weight of $\frac{100}{50} = 2$, while units in Region B will receive a weight of $\frac{900}{50} = 18$. In this escnario, the mean income is unbiasedly estimated by:

$$
\hat \theta = \frac{(2 \times 50 \times 10,000) + (18 \times 50 \times 2,000)}{(2 \times 50) + (18 \times 50)} = 2,800.
$$

Ignoring the sampling design causes that Region A (smaller but wealthier) dominates the estimate, even though it represents only 10\% of the country. This creates a bias, making the income seem higher than it actually is for the whole population. By considering the sampling design and using weights, and strata, the estimate correctly reflects the true contribution of each Region, avoiding bias.

In real applications, to account for the sampling design, we must ensure that primary sampling units (PSU), strata, and weights are available in the survey dataset to enable adequate analysis. Alternatively, when such information is not available, the dataset should at least contain replicate weights, or the analyst should have clear guidance on how to compute both point and variance estimates. 
This section discusses how survey data from a sample can be used to draw conclusions about an entire population using a design-based approach. This method assumes that the sample is selected through a well-defined probability sampling process, which ensures that every unit in the population has a known, non-zero chance of being included. Sampling weights, which reflect how much each sampled unit represents in the population, are essential tools in this approach. These weights allow analysts to make estimates that account for the sampling process and produce results that are representative of the population. A well-described survey design facilitates statistical analysis, supports effective data interpretation, and enables meaningful insights into complex phenomena. Not accounting for it may lead to biased estimates and misleading conclusions.

## Parameters and estimators

Two common goals when analyzing survey data are to estimate the total value of a characteristic for the population, such as total income, and to calculate the average value of that characteristic, such as the average income per person. These are referred to as the population total and the population mean, respectively. The design-based approach accounts for the inclusion of the probability sampling design in the inferential process. That is, it is assumed that every unit in the population has a known chance of being included in the sample. These probabilities are used to calculate the sampling weights. When the design is properly implemented, the estimates for the population totals and means are unbiased. This means that, on average, the estimates will equal the true population values if the survey were to be repeated many times under the same conditions.

Under this approach, the estimators used to make inferences about the parameters of the population use the sampling weights to create weighted sums of the survey data, which serve as estimates for these population values. If the weights are appropriately applied, the resulting estimates are consistent with the true values in the population. 

As stated in the previous chapter, in some situations, the original sampling weights need adjustments to improve their accuracy. Adjustment may accoutn for survey non-response, where weights are corrected to account for individuals who were selected for the survey but did not participate. These adjusted weights help to minimize biases in the estimates and make the results more reliable. If calibration was performed, the weights are modified to ensure that the weighted sums aligns more closely with known characteristics of the population, such as age or gender distributions. 

The *population total* $Y = \sum _{U} y_k$ and *mean* $\overline Y = \frac Y N$ of a survey variable $y$ can be estimated by weighted estimators given by $\widehat Y _{HT} = \sum _{s} d_k \ y_k$ and $\overline y_{H} = \frac {\widehat Y_{HT}} {\widehat N_{HT}} = \frac {\sum_{s} d_k \ y_k} {\sum_{s} d_k}$, respectively. When the survey weights are calibrated and/or non-response adjusted, the above expressions may still be used, but with the calibrated or non-response adjusted weights, $w_k$ say, replacing the design weights $d_k$, for all $k \in s$. 

Here $s = \left\{ k_1, \ldots, k_n \right\} \subset U$ denotes the set of units in a sample selected from the population $U$ using a *probability sampling design* $p(s)$, that ensures strictly positive first order inclusion probabilities $\pi_k = Pr(k \in s), \, \forall \, k \in U$. These inclusion probabilities are assumed known $\forall \, k \in s$, at least to the data producers. 

An important part of survey analysis is understanding the level of uncertainty in the estimates. Since we are working with a sample and not the entire population, there will always be some variability in the results. This variability is measured using the sampling variance, which indicates how much the estimate might differ from the true population value in repeated samples. While there are theoretical formulas to calculate this variance, these can be complex and rely on information that is not always available to analysts. Under the design-based framework and assuming full response, $\widehat Y _{HT}$ is unbiased for $Y$ and its sampling variance can be estimated unbiasedly by

$$
\widehat {V_p} \left( \widehat{Y}_{HT} \right) = \sum_{k \in s} \sum_{j \in s} \left( d_k d_j - d_{kj} \right) y_k y_j
$$

Where $d_{kj} = 1 / \pi_{kj}$ and $\pi_{kj} = Pr(k,j \in s), \, \forall \, k,j \in U$. This result assumes that the sampling design $p(s)$ is such that $\pi_{kj} > 0 \,\, \forall \, k,j \in U$. While the above formula for variance estimation is general and covers the vast majority of sample designs used in the practice of household sample surveys, it is not used in practice because the second order inclusion probabilities $\pi_{kj}$ (and corresponding pairwise weights $d_{kj}$) are generally unknown to survey data analysts. In fact, even data producers do not compute such pairwise weights, since there are more efficient methods for variance estimation that do not require having such weights.

For this reason, simpler and more efficient methods are often used in practice, allowing analysts to quantify the uncertainty without requiring overly detailed information about the sampling design.

## Approaches to Variance Estimation

When working with household surveys, the sample is usually only a small subset of the entire population. Because of this, it is important to measure not only the main estimates of interest, such as totals or averages, but also the level of uncertainty in these estimates. This uncertainty is often expressed as measures of variance or confidence intervals, which help us understand how much the estimates might differ if the survey were repeated.

Understanding and estimating uncertainty is a critical part of analyzing household survey data; by using proper methods, analysts can measure the reliability of their estimates. There are several methods to estimate the uncertainty in survey results: 

* One common approach is based on approximate formulas like Taylor linearization, which simplifies complex relationships between variables into linear ones. 
* The ultimate cluster method, is used in surveys that collect data through multi-stage sampling, where groups of people (clusters) are selected at different stages, exactly as household survey data is collected. 
* Generalized variance functions [@Binder1983], which comprises a unifying idea of sampling theory.
* Estimating equations provides a flexible framework for calculating totals, means, ratios, and other parameters from both the population and the sample. 

### Estimating equations

With the help of modern software, these methods can be implemented efficiently, ensuring accurate and meaningful analysis of survey data. Many population parameters can be written/obtained as solutions for *population estimating equations*. Variance estimation for these sample-based methods follows a consistent framework. Although the details can be technical, the key idea is that the same principles used to estimate totals can be applied to calculate variances. This generality makes the method simple and versatile, allowing it to be implemented in widely used software like the `R survey` package and the `Stata svy` functions. These tools automate much of the process, making it accessible for analysts to estimate both population parameters and their associated uncertainties.

A generic population estimating equation is given by $\sum_{i \in U} z_i (\theta) = 0 $, where $z_i(\bullet)$ is an *estimating function* evaluated for unit $i$ and $\theta$ is a population parameter of interest. These equations provide a general way to describe and calculate many population parameters, such as totals, means, and ratios. The concept is straightforward: population parameters can be defined as solutions to specific equations that involve all the units in the population. This approach is flexible and can be adapted to calculate many different types of parameters.

* For the case of the population total, take $z_i(\theta) = y_i - \theta / N$. The corresponding population estimation equation is given by $\sum _{i \in U} (y_i - \theta / N) = 0$, and solving for $\theta$ gives the population total $\theta_U = \sum _{i \in U} y_i \ = \ Y$. 
* For ratios of population totals, taking $z_i(\theta) = y_i - \theta x_i$, the corresponding population estimation equation is given by $\sum _{i \in U} (y_i - \theta x_i) = 0$. Solving for $\theta$ gives the *population ratio* $\theta_U = \sum _{i \in U} y_i / \sum _{i \in U} x_i \ = \ R$.
* Similarly, for means, take $z_i(\theta) = y_i - \theta$.

The idea of defining population parameters as solutions to population estimating equations allows defining a general method for obtaining corresponding sample estimators. It is a matter of using the *sample estimating equations* $\sum _{k \in s} d_k \, z_k (\theta) = 0$. Under *probability sampling*, full response and with $d_k = 1 / \pi_k$, the sample sum in the left hand side is unbiased towards the population sum in the corresponding population estimating equation. Solving the sample estimating equation yields consistent estimators for the corresponding population parameters.

A consistent estimator for the variance of estimators obtained as solutions of sample estimating equations can be obtained as:

$$
\widehat V_p (\widehat \theta) = \left[ \widehat J ( \widehat \theta) \right] ^{-1} \widehat V_p \left[ \sum _{k \in s} d_k \, z_k (\widehat \theta)\right] \left[ \widehat J ( \widehat \theta) \right] ^{-1}
$$

Where $\widehat J (\widehat \theta) = \sum _{k \in s} d_i \, \left[ \partial{z_k ( \theta)} / \partial \theta \right]_{\theta = \widehat \theta}$.

This approach implies that by one is able to estimate many population parameters and corresponding variances using essentially well known methods for estimating totals. Its simplicity and generality have enabled the development of software such as the `R survey` package, the `Stata svy` functions and others. 

### Ultimate Cluster Method

The *Ultimate Cluster* method is a straightforward and powerful approach for estimating the uncertainty (variance) of totals in surveys that use multi-stage cluster sampling designs. This method, proposed by @Hansen1953, and simplifies the complex nature of multi-stage designs by focusing only on the variation between the largest groups, known as Primary Sampling Units (PSUs). It assumes that the PSUs were selected randomly and independently, even if they were not actually chosen this way in the sampling process. This assumption allows for a simpler analysis while still providing reliable variance estimates.

The method considers only the variation between information available in the level of PSUs, and assumes that these would have been selected with replacement from the PSU population. This idea is simple, but quite powerful, because it allows to accommodate a variety of sampling designs, involving stratification and selection with unequal probabilities (with or without replacement) of both PSUs as well as lower level sampling units (households and individuals). The requirements for the application of this method are:

* One has unbiased estimators of totals for the variable of interest for each sampled PSU.
* Data are available for at least two sampled PSUs in each stratum (if the sample is stratified in the first stage).
* The survey database contains all the information regarding PSUs, strata and weights.

Consider a multi-stage sampling design, in which $m_{h}$ PSUs are selected in stratum $h,$ $h=1,\ldots ,H$. Let $\pi_{hi}$ be the inclusion probability of PSU $i$ stratum $h$, and by $\widehat{Y}_{hi}$ an unbiased estimator of the total $Y_{hi}$ of the survey variable $y$ for the $i$-th PSU in stratum $h$, $h=1,\ldots ,H$. Hence an unbiased estimator of the population total $Y = \sum_{h=1}^{H} \sum_{i \in U_{1h}} Y_{hi}$ is given by $\widehat{Y}_{UC} = \sum_{h=1}^{H} \sum_{i \in s_{1h}} d_{hi} \widehat{Y}_{hi}$, and the *ultimate cluster* estimator of the corresponding variance is given by:

$$
\widehat{V}_{UC} \left( \widehat{Y}_{UC}\right) = \sum_{h=1}^{H} \frac{m_{h}}
{m_{h}-1} \sum_{i=1}^{n_{h}} \left( d_{hi} \widehat{Y}_{hi} - \frac{\widehat{Y}_{h}}{m_{h}} \right) ^{2}
$$

where $U_{1h}$ and $s_{1h}$ are the population and sample sets of PSUs in stratum $h$, $d_{hi} = 1 / \pi_{hi}$, $\widehat{Y}_{h} = \sum_{i=1}^{n_{h}} d_{hi} \widehat{Y}_{hi}$ for $h=1,\ldots ,H$. (See for example, [@Shah1993], p. 4).

Although the method was originally proposed for estimation of variances of estimated totals, it can also be applied in combination with estimating equations to obtain variance estimates for estimators of other population quantities that can be obtained as solutions to sample estimating equations. This makes the method versatile and useful for a wide range of applications in survey analysis. One key assumption of the method is that the PSUs were selected independently and with replacement. In reality, many surveys select PSUs without replacement, which is a more efficient design. However, the variance estimates produced by the *Ultimate Cluster* method are generally close enough to be useful, even under these conditions. This practical simplicity is why the method is widely used in survey analysis.

The *Ultimate Cluster* method is particularly attractive because of its simplicity. Survey practitioners often prefer it over more complex approaches that account for all stages of the sampling design. Although these detailed methods may provide slightly more accurate variance estimates, they are significantly harder to implement and require more detailed information about the sampling process. In contrast, this method offers a reasonable approximation that works well for most practical purposes, especially for estimating totals or averages. A discussion about Quality of this approximation and alternatives can be found in [@SSW92], p. 153.

### Bootstrap Method

When the user does not have access to information of PSUs or strata in the database, the *Ultimate Cluster* method cannot be used, and some other methods should be considered. Among them, we have replication-based methods; in particular, the *bootstrap* method, which comprises a powerful and flexible approach for estimating variances in surveys, particularly when dealing with complex survey designs that involve multiple stages or stratification. Originally proposed by @Efron1979, the version commonly used for household surveys is called the Rao-Wu-Yue Rescaling Bootstrap [@Rao1992] (XXXX reference). This method is well-suited for stratified multi-stage sampling designs and has become a widely used tool for analyzing complex survey data.

The *bootstrap* method relies on creating many new "replicated" datasets, which are slightly different versions of the original sample. These replicated datasets mimic the process of repeatedly drawing samples from the population. By analyzing the variation in results across these datasets, we can estimate how much uncertainty there is in our estimates from the original sample.

1. First, we create a new sample for each stratum by randomly selecting primary sampling units (PSUs) from the original sample, allowing PSUs to be selected more than once (with replacement). Each selected PSU is included in the new dataset along with all its associated data. The size of this random sample with replacement is of $m_h - 1$ PSUs in each of the $H$ design strata. 

2. This process of creating new samples is repeated many times, usually hundreds or thousands, to produce multiple "replicated" datasets. That is, repeat Step 1 $R$ times, and denote by $m_{hi}(r)$ the number of times the PSU $i$ of stratum $h$ was selected for the sample in replicate $r$.


3. For each replicate, *bootstrap* weights are calculated for each unit. These weights account for how often each PSU appears in the replicate and ensure that the replicated datasets remain representative of the population. The *bootstrap* weight of unit $k$ within PSU $i$ of stratum $h$ is $w_{hik} (r) = w_{hik} \times \frac {m_h}{m_h - 1} \times m_{hi}(r)$.

4. The parameter of interest, such as a total or mean, is estimated for each replicated dataset using the *bootstrap* weights. That is, for each replica $r$, calculate an estimate $\widehat \theta_{(r)}$ of the target parameter $theta$ using the *bootstrap* weights $w_{hik} (r)$. 

5. Finally, the variability of the results across all replicated datasets is used to estimate the variance. The idea is that the variation in these replicate estimates reflects the uncertainty in the original estimate. This estimate of the variance takes the following form:
$$
\widehat V_{B} \left( \widehat \theta \right) = \frac {1} {R} \sum_{r=1}^R \left( \widehat \theta_{(r)} - \tilde \theta \right)^2
$$

where $\tilde \theta = \frac 1 R \sum_{r=1}^R \widehat \theta_{(r)}$ is the average of the replica estimates.

Whenever the original sampling weights $w_{hik}$ receive non-response adjustments or are calibrated, the corresponding non-response adjustments and/or calibration of the basic weights must be repeated for each replica, so that the variance estimates adequately reflect the effects of the calibration and non-response adjusments on the uncertainty of the point estimates. This ensures that the variance estimates accurately reflect the additional uncertainty introduced by these adjustments.

The bootstrap method has several advantages. It works well for complex survey designs and can handle a wide range of parameters, including those that are difficult to estimate using traditional methods, such as medians or other nonlinear statistics. It also provides a way to estimate variances when other methods are not available or practical to use. The method is particularly helpful for survey analysts who may not have access to specialized software for calculating variances. Many modern statistical software tools, including the `survey` package in R, support bootstrap replication and variance estimation, making it accessible to a wide range of users. While the bootstrap method is computationally intensive, requiring many replicated datasets to be created and analyzed, it is highly effective. It provides robust variance estimates even for complex parameters and remains one of the most flexible tools for analyzing survey data.


## Using software to generate valid inferences

The design and analysis of information from household surveys must include extensive use of existing computational tools. This section reviews in detail the computational approaches of the statistical software used for each of the statistical processes required to publish official figures with high levels of accuracy and reliability. Specifically, for the following processes:

* Sample selection according to the defined sampling design.
* Generation of sampling weights for each individual and household.
* Modeling of nonresponse and statistical imputation.
* Calibration of sampling weights and adjustments for nonresponse.
* Estimation of sampling errors for each indicator of interest in the statistical production tables.
* Analysis of multivariate relationships between survey variables.

@United_Nations_2005[Section 7.8] highlights the importance of including the structure of complex survey designs in the inference process for estimating official statistics from household surveys. It warns, with an empirical example, that failing to do so may result in biased estimates and underestimated sampling errors. Below are some key features that statistical software packages incorporate when managing data from complex survey designs, such as those found in household surveys. A more detailed review, including syntax and computational code, can be found in @Heeringa_West_Berglund_2017[Appendix A].

In general, these computational tools are designed to enhance the efficiency of variance approximation methods for complex samples, as well as replication techniques to estimate design-based variances [@Westat_2007]. Some of these software packages are free to use, although most are licensed products requiring paid licenses. These products, in addition to providing descriptive statistics (such as means, totals, proportions, percentiles, and ratios), allow for fitting linear and logistic regression models. All resulting statistics are based on the survey design.

*R*

R is a free software increasingly used in social research, as it is likely to host the latest scientific findings implemented in this software [@R_2024]. Being open-source, researchers can upload their own collections of computational functions to the official repository (`CRAN`) and make them available to the community. The `samplesize4surveys` package [@ss4s] determines the sample size for individuals and households in repeated, panel, and rotational household surveys. The `sampling` [@Yves] and `TeachingSampling` [@TS] packages enable the selection of probabilistic samples from sampling frames under a wide variety of designs and algorithms. The `survey` package [@TL], once the survey design is predefined using the `svydesign()` function, allows for analyzing household survey data and obtaining appropriate standard error estimates.

*STATA*

The `svy` environment provides tools for appropriate inference of official statistics from household surveys [@STATA_2017]. The `svyset` command specifies variables identifying survey design features, such as sampling weights, clusters, and strata. The `svydescribe` command produces tables describing strata and sampling units at a given survey stage. Once survey design definitions are loaded, any model can be estimated, and the resulting statistics will be survey-design-based. The `svy` environment also supports predictive commands.

*SPSS*

The `complex samples` module in `SPSS` [@IBM_2017] supports the selection of complex samples through user-defined sampling schemes. Next, an analysis plan must be created by assigning design variables, estimation methods, and sample unit sizes. Once the sampling plan is defined, the module enables the estimation of counts, descriptive statistics, and crosstabulations. It is also possible to estimate ratios and regression coefficients in linear models, along with corresponding hypothesis test statistics. Finally, the module allows for estimating nonlinear models, such as logistic regressions, ordinal regressions, or Cox regressions.

*SAS*

This statistical software includes a procedure for selecting probabilistic samples called `SURVEYSELECT`, which integrates common selection methods such as simple random sampling, systematic sampling, probability proportional to size sampling, and stratified allocation tools. To analyze data from complex samples, specific procedures have been programmed [@SAS_2017]: 

- `SURVEYMEANS`: Estimates totals, means, proportions, and percentiles, along with their respective standard errors, confidence intervals, and hypothesis tests.
- `SURVEYFREQ`: Estimates descriptive statistics (e.g., totals and proportions) in one- and two-way tables, provides sampling error estimates, and analyzes goodness-of-fit, independence, risks, and odds ratios.
- `SURVEYREG` and `SURVEYLOGISTIC`: Fit linear and logistic regression models, respectively, estimating regression coefficients with associated errors and providing an exhaustive analysis of model properties.
- `SURVEYPHREG`: Fits survival models using pseudo-maximum likelihood techniques.

