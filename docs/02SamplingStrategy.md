# Accounting for the Sampling Design

When analysing household survey data, ignoring the sampling design undermines the representativeness, accuracy, and credibility of survey-based findings, which can lead to incorrect decisions. This is why accounting for the sampling design is essential when analyzing household survey data to ensure valid and unbiased estimates. As seen in the previous chapters, regular household surveys have two major characteristics:

* They use *complex sampling designs* (e.g., stratification, clustering, and unequal probabilities of selection) to represent the population efficiently. Ignoring the design can lead to biased population-level inferences.

* They define *sampling weights* for each sampling unit (primary, and remaining ones) to properly represent the population.

To illustrate this fact, we provide a simple example. Suppose a country has two regions: Region A with 100 people, and Region B with 900 people. Wealthy people live in Region A, with an average income of \$10,000, less wealthy people live in Region B, with average income of \$2,000. The true population average income is \$2,800, because:

$$
\theta = \frac{(100 \times 10,000) + (900 \times 2,000)}{100 + 900} = 2,800.
$$

Suppose a survey is conducted where 50 people are sampled from each Region. After data collection, it was found that the sample mean for Region A was \$10,000, while the sample mean for Region B was \$2,000. If the sampling design is ignored, all units in the sample will receive equal weights, regardless of their corresponding population sizes. This way, the average income is estimated with severe bias as:

$$
\hat \theta = \frac{(50 \times 10,000) + (50 \times 2,000)}{100} = 6,000.
$$

despite the fact that both sample averages within regions are perfect estimates of the corresponding population averages.

When the sampling design is considered, weights are applied proportional to the population sizes of each region. This way, units in Region A would receive a weight of $\frac{100}{50} = 2$, while units in Region B would receive a weight of $\frac{900}{50} = 18$. In this escnario, the average income is unbiasedly estimated as:

$$
\hat \theta = \frac{(2 \times 50 \times 10,000) + (18 \times 50 \times 2,000)}{(2 \times 50) + (18 \times 50)} = 2,800.
$$

Ignoring the sampling design (and corresponding weights) causes that Region A (smaller but wealthier) dominates the estimate, even though its population represents only 10\% of the country's population. This creates a bias, making the average population income seem higher than it actually is. By considering the sampling design (the sample was stratified by region, with equal allocation), and using weights, the latest estimate correctly reflects the true contribution of each Region to the global average, thus avoiding bias.

Another crucial aspect to take into account is clustering. Most household sample surveys select an area sample, with clusters defined by census enumeration areas or similar groups of households. Then from within each sampled cluster, a sub-sample of households is selected for the survey. While such designs are cost efficient, they imply some loss in precision for the resulting estimates. 

Consider a toy example where clusters are city blocks, and a sample of 10 households is selected within each cluster to be surveyed. Suppose the target parameter is the proportion of households which have electricity provided from a city grid. Assuming that each cluster either is included or excluded from the grid, a sample of 1,000 households obtained from such a design would be as precise as sample of only 100 households, if they were sampled by simple random sampling. The reason is that after observing a single household in each cluster, the other 9 we sample there are not brining in any new information. Any analysis of the full sample of households would fool the user to believe that the estimates are as precise as having sampled 1,000 households at random from the population, which was not the case, and standard errors would be severely underestimated.

In real applications, to enable adequate analysis that accounts for the sampling design, survey datasets must contain identifiers for strata and primary sampling units (PSU), as well as weights for relevants units of analysis (households, individuals, etc.). Alternatively, when such information is not available, the dataset should at least contain replicate weights, and the user should have clear guidance on how to compute both point and variance estimates.

This section discusses how survey data from a sample can be used to draw conclusions about an entire population using a design-based approach. This approach assumes that the sample is selected through a well-defined probability sampling process, which ensures that every unit in the population has a known, non-zero chance of being sampled. Sampling weights, which reflect how much each sampled unit represents in the population, are essential tools in this approach. These weights allow users to make estimates that account for the sampling process and produce results that are representative of the population. A well-described survey design facilitates statistical analysis, supports effective data interpretation, and enables meaningful insights into complex phenomena. Not accounting for it may lead to biased estimates and misleading conclusions, as illustrated.

## Parameters and Estimators

Two common goals when analyzing survey data are to estimate the value of a characteristic for the whole population, such as total income, and to estimate the average value of that characteristic, such as the average income per person. These are referred to as the *population total* and the *population mean*, respectively. The design-based approach incorporates the probability sampling design in the inferential process. 

Under probability sampling, every unit in the population has a known chance of being included in the sample. The *sample inclusion probabilities* are then used to calculate *basic sampling weights*. When the design is properly incorporated, estimates for population totals and means are unbiased. This means that, on average, the estimates will equal the true population values if the survey were to be repeated many times under the same conditions.

The estimators used to make inferences about the population parameters use the sampling weights to create weighted sums of the survey data, which serve as estimates for the population parameters. If the weights are appropriately applied, the resulting estimates are consistent with the true values in the population. 

As stated in Chapter 8, in some situations, the basic sampling weights need adjustments to improve the accuracy of survey estimates. Adjustments may account for survey non-response, where weights of responding units are corrected to account for units that were selected for the survey but did not participate. These adjusted weights help to minimize biases in the estimates and make the results more reliable. If calibration was performed, the weights are modified to ensure that the weighted sums align more closely with known population distributions, such as age or sex distributions. 

The *population total* $Y = \sum _{U} y_k$ and *mean* $\overline Y = \frac Y N$ of a survey variable $y$ can be estimated by weighted estimators given by $\widehat Y _{HT} = \sum _{s} d_k \ y_k$ and $\overline y_{H} = \frac {\widehat Y_{HT}} {\widehat N_{HT}} = \frac {\sum_{s} d_k \ y_k} {\sum_{s} d_k}$, respectively. The basic design weights $d_k = 1 / \pi_k$ are given by the reciprocals of the sample inclusion probabilities of the sampled units (denoted $\pi_k$), for all $k \in s$.

When the survey weights are calibrated and/or non-response adjusted, the above expressions may still be used, but with the calibrated or non-response adjusted weights, $w_k$ say, replacing the basic design weights $d_k$, for all $k \in s$. 

Here $s = \left\{ k_1, \ldots, k_n \right\} \subset U$ denotes the set of units in a sample selected from the population $U$ using a *probability sampling design* $p(s)$, that ensures strictly positive first order inclusion probabilities $\pi_k = Pr(k \in s), \, \forall \, k \in U$. These inclusion probabilities are assumed known $\forall \, k \in s$, at least to the data producers. 

An important part of survey analysis is understanding the level of uncertainty in the estimates. Since we are working with a sample and not the entire population, there will always be some variability in the estimates. This variability is measured using either the *sampling variance*, the *standard error*  or the *coefficient of variation* (*cv*) of the estimates. The latter two are functions of the first, and serve to indicate by how much the estimate might differ from the true population value in absolute (*se*) or relative (*cv*) terms. Under the design-based framework and assuming full response, $\widehat Y _{HT}$ is unbiased for $Y$ and its sampling variance can be estimated unbiasedly by

$$
\widehat {V_p} \left( \widehat{Y}_{HT} \right) = \sum_{k \in s} \sum_{j \in s} \left( d_k d_j - d_{kj} \right) y_k y_j
$$

Where $d_{kj} = 1 / \pi_{kj}$ and $\pi_{kj} = Pr(k,j \in s), \, \forall \, k,j \in U$. This result assumes that the sampling design $p(s)$ is such that $\pi_{kj} > 0 \,\, \forall \, k,j \in U$. Considering the sampling design is crucial for the computation of variance. For example, consider a population of size $N = 6$, and a sample of size $n = 3$. Let's assume that the following sample values were observed: $(y_1 = 10, y_2 = 14, y_3 = 18)$. If the sampling design is simple random sampling without replacement, the above formula becomes:

$$
\widehat {V_p} \left( \widehat{Y}_{HT} \right) = \frac{N^2}{n} \left( 1 - \frac{n}{N} \right) S^2_{y_s}
$$

Where $S^2_{y_s}$ is the sample variance. After a simple algebraic manipulation, the formula becomes $\widehat {V_p} \left( \widehat{Y}_{HT} \right) = \frac{36}{3} \cdot \left(1 - \frac{3}{6} \right) 16 = 96$. A naive analyst might incorrectly compute the variance using the following formula, which ignores the sampling design: $\frac{N^2}{n}S^2_{y_s} = 192$.

Notice that the estimate for the population total is $\widehat{Y}_{HT} = 84$. The proper standard error is $\sqrt{\widehat {V_p} \left( \widehat{Y}_{HT} \right)} = \sqrt{96} \approx 9.80$. The 95% confidence interval is $84 \pm 19.25 = [64.75, 103.25]$. Using the naive variance, an incorrect 95% confidence interval is $[56.80, 111.20]$. The naive confidence interval is wider than the correct confidence interval, and it overestimates the uncertainty in the total. This example clearly demonstrates the importance of considering the sampling design when calculating variances and confidence intervals. Ignoring the sampling design can lead to incorrect inferences.

While the formula for variance estimation $\widehat {V_p}$ is general and covers the vast majority of sample designs used in the practice of household sample surveys, it is not used in practice because the second order inclusion probabilities $\pi_{kj}$ (and corresponding pairwise weights $d_{kj}$) are generally unknown to secondary survey data users. In fact, even data producers do not compute such pairwise weights, since there are more efficient methods for variance estimation that do not require having such weights. 

For this reason, simpler and more efficient methods are often used in practice, allowing users to quantify the uncertainty without requiring overly detailed information about the sampling design.

## Approaches to Variance Estimation

When working with household surveys, the sample is usually only a small subset of the entire population. Because of this, it is important to provide not only the main estimates of interest, such as totals or averages, but also the level of uncertainty in these estimates. 

Understanding and estimating uncertainty is a critical part of analyzing household survey data; by using proper methods, users can measure the reliability of their estimates. There are several methods to estimate the uncertainty in survey results.

* *Estimating Equations* [@Binder1983], which comprises a unifying idea of sampling theory, provides a flexible framework for estimating totals, means, ratios, and other parameters as well as their corresponding variances. 

* *Taylor Linearization* is an approach that relies on approximating complex non-linear statistics by linear ones, and then estimating the variance / se / cv of the linear approximating quantity.

* The *Ultimate Cluster* method is often used in surveys that collect data through stratified multi-stage sampling, and relies on computing the variance between quantities calculated at the level of the primary sampling units (PSU). It is often combined with *Taylor Linearization* for obtaining estimates of variances of non-linear statistics, such as means, ratios, etc.

* The *Bootstrap* and other replication methods rely on sampling repeatedly from the observed sample, computing estimates from each replica, and then using the variability between the estimates to estimate the variance / se / cv of the main estimate.

With the help of modern software, all of these approaches can be implemented efficiently, ensuring accurate and meaningful analysis of survey data.

### Estimating Equations

Many population parameters can be written/obtained as solutions of *population estimating equations*. Variance estimation for these sample-based methods follows a consistent framework. Although the details can be technical, the key idea is that the same principles used to estimate totals can be applied to estimate variances. This generality makes the method simple and versatile, allowing it to be well implemented in widely used software like the `R survey` package and the `Stata svy` functions. These tools automate much of the process, making it accessible for users to estimate both population parameters and their associated uncertainties.

A generic population *estimating equation* is given by $\sum_{i \in U} z_i (\theta) = 0 $, where $z_i(\bullet)$ is an *estimating function* evaluated for unit $i$ and $\theta$ is a population parameter of interest. These equations provide a general way to define and calculate many population parameters, such as totals, means, and ratios. The concept is straightforward: population parameters can be defined as solutions to specific equations that involve all the units in the population. This approach is flexible and can be adapted to calculate many different types of parameters.

* For the case of the population total, take $z_i(\theta) = y_i - \theta / N$. The corresponding population estimation equation is given by $\sum _{i \in U} (y_i - \theta / N) = 0$. Solving for $\theta$ gives the population total $\theta_U = \sum _{i \in U} y_i \ = \ Y$. 

* For ratios of population totals, taking $z_i(\theta) = y_i - \theta x_i$, the corresponding population estimating equation is given by $\sum _{i \in U} (y_i - \theta x_i) = 0$. Solving for $\theta$ gives the *population ratio* $\theta_U = \sum _{i \in U} y_i / \sum _{i \in U} x_i \ = \ R$.

* Similarly, for population means, take $z_i(\theta) = y_i - \theta$.

The idea of defining population parameters as solutions to population estimating equations allows defining a general method for obtaining corresponding sample estimators. It is a matter of using the *sample estimating equations* $\sum _{k \in s} d_k \, z_k (\theta) = 0$. Under *probability sampling*, full response and with $d_k = 1 / \pi_k$, the sample sum in the left hand side is unbiased towards the population sum in the corresponding population estimating equation. Solving the sample estimating equation yields consistent estimators for the corresponding population parameters.

A consistent estimator for the variance of non-linear estimators obtained as solutions of sample estimating equations, derived using *Taylor Linearization*, is given by:

$$
\widehat V_{TL} (\widehat \theta) = \left[ \widehat J ( \widehat \theta) \right] ^{-1} \widehat V_p \left[ \sum _{k \in s} d_k \, z_k (\widehat \theta)\right] \left[ \widehat J ( \widehat \theta) \right] ^{-1}
$$

Where $\widehat J (\widehat \theta) = \sum _{k \in s} d_k \, \left[ \partial{z_k ( \theta)} / \partial \theta \right]_{\theta = \widehat \theta}$.

This approach implies that one is able to estimate many population parameters and corresponding variances using essentially well known methods for estimating totals and their variances. Its simplicity and generality have enabled the development of software such as the `R survey` package, the `Stata svy` functions and others. 

### Ultimate Cluster

The *Ultimate Cluster* is a straightforward and powerful approach for estimating the variance of totals in surveys that use stratified multi-stage cluster sampling designs. This method, proposed by @Hansen1953, simplifies the complex nature of multi-stage designs by focusing only on the variation between the largest groups, known as Primary Sampling Units (PSUs). It assumes that, within each sampling stratum, PSUs were sampled independently with replacement (potentially with unequal probabilities), even if they were actually selected without replacement in the actual sampling process. 

The method considers only the variation between statistics computed at the level of PSUs. This method allows for a simpler variance estimation, while still providing reliable variance estimates. This idea is simple, but quite powerful, because it allows to accommodate a variety of sampling designs, involving stratification and selection with unequal probabilities (with or without replacement) of both PSUs as well as lower level sampling units (households and individuals). The requirements for the application of this method are the following:

* Unbiased estimates of totals for the variable(s) of interest are available for each sampled PSU;

* Data are available for at least two sampled PSUs in each stratum (if the sample is stratified in the first stage);

* The survey dataset contains all the information regarding PSUs, strata and weights.

Consider a multi-stage sampling design, in which $m_{h}$ PSUs are selected in stratum $h,$ $h=1,\ldots ,H$. Let $\pi_{hi}$ be the inclusion probability of PSU $i$ in stratum $h$, and by $\widehat{Y}_{hi}$ an unbiased estimator of the total $Y_{hi}$ of the survey variable $y$ for the $i$-th PSU in stratum $h$. Hence an unbiased estimator of the population total $Y = \sum_{h=1}^{H} \sum_{i \in U_{1h}} Y_{hi}$ is given by $\widehat{Y}_{UC} = \sum_{h=1}^{H} \sum_{i \in s_{1h}} d_{hi} \widehat{Y}_{hi}$. The *Ultimate Cluster* estimator of the corresponding variance is given by:

$$
\widehat{V}_{UC} \left( \widehat{Y}_{UC}\right) = \sum_{h=1}^{H} \frac{m_{h}}
{m_{h}-1} \sum_{i \in s_{1h}} \left( d_{hi} \widehat{Y}_{hi} - \frac{\widehat{Y}_{h}}{m_{h}} \right) ^{2}
$$

where $U_{1h}$ and $s_{1h}$ are the population and sample sets of PSUs in stratum $h$, $d_{hi} = 1 / \pi_{hi}$, $\widehat{Y}_{h} = \sum_{i \in s_{1h}} d_{hi} \widehat{Y}_{hi}$ for $h=1,\ldots ,H$. (See for example, [@Shah1993], p. 4).

Although the method was originally proposed for estimation of variances of estimated totals, it can also be applied in combination with *Taylor Linearization* and *Estimating Equations* approaches to obtain variance estimates for estimators of many other population quantities that can be obtained as solutions to sample estimating equations. This makes the method versatile and useful for a wide range of applications in survey analysis.

One key assumption of the method is that, within strata, the PSUs were selected independently and with replacement. In reality, most surveys select PSUs without replacement, which provides for more efficient designs. However, the variance estimates produced by the *Ultimate Cluster* method are generally close enough to be useful, even under these conditions, provided the sampling fraction of PSUs is small.

The *Ultimate Cluster* method is particularly attractive because of its simplicity. Survey practitioners often prefer it over more complex approaches that account for all stages of the sampling design. Although these detailed methods may provide slightly more accurate variance estimates, they are harder to implement and require more detailed information about the sampling process. In contrast, this method offers a reasonable approximation that works well for most practical purposes, especially for estimating totals or averages. A discussion about Quality of this approximation and alternatives can be found in [@SSW92], p. 153.

### Bootstrap

Replication methods for variance estimation are based on the idea of re-sampling from the available sample, computing the estimates from each replica, and then using the variability between the estimates across replicas to estimate the variance. They are particularly useful when the user does not have access to information on stratum and/or PSUs identifiers in the database, since the *Ultimate Cluster* method cannot be used in such cases. 

The *bootstrap* method comprises a powerful and flexible approach for estimating variances in surveys and many other contexts. Originally proposed by @Efron1979, the version commonly used for household surveys is called the Rao-Wu-Yue Rescaling Bootstrap [@Rao1992]. This method is well-suited for stratified multi-stage sampling designs and has become widely used for variance estimation with complex survey data.

Conceptually, the *bootstrap* method relies on creating many new "replicated" datasets, which are slightly different versions of the original sample. These replicated datasets mimic the process of repeatedly drawing samples from the population. By analyzing the variation in results across these datasets, we can estimate how much uncertainty there is in our estimates from the original sample. In practice, the method can be applied by creating multiple columns of weights in the original sample data set, with weights modified to mimic the process of re-sampling from the available sample. The method is implemented by the steps that follow.

1. First, we create a new sample for each stratum by randomly selecting primary sampling units (PSUs) from the original sample, allowing PSUs to be selected more than once (with replacement). Each selected PSU is included in the new dataset along with all its associated data and lower level units. The size of this random sample with replacement is of $m_h - 1$ PSUs in each of the $H$ design strata. 

2. This process of creating new samples is repeated many times, usually hundreds or thousands, to produce multiple "replicated" datasets. That is, repeat Step 1 $R$ times, and denote by $m_{hi}(r)$ the number of times that the PSU $i$ of stratum $h$ was selected for the sample in replicate $r$.

3. For each replicate $r$, *bootstrap* weights are calculated for each unit. These weights account for how often each PSU appears in the replicate and ensure that the replicated datasets remain representative for the population. The *bootstrap* weight for unit $k$ within PSU $i$ of stratum $h$ in replica $r$ is $w_{hik}(r) = w_{hik} \times \frac {m_h}{m_h - 1} \times m_{hi}(r)$.

4. The parameter of interest, such as a total or mean, is estimated for each replica using the *bootstrap* weights for that replica. That is, for each replica $r$, calculate an estimate $\widehat \theta_{(r)}$ of the target parameter $theta$ using the *bootstrap* weights $w_{hik}(r)$ instead of the original weights $w_{hik}$. 

5. Finally, the variability of the results across all replicas is used to estimate the variance. The idea is that the variation in these replicate estimates reflects the uncertainty in the original estimate. This estimate of the variance takes the following form:

$$
\widehat V_{B} \left( \widehat \theta \right) = \frac {1} {R} \sum_{r=1}^R \left( \widehat \theta_{(r)} - \tilde \theta \right)^2
$$

where $\tilde \theta = \frac 1 R \sum_{r=1}^R \widehat \theta_{(r)}$ is the average of the replica estimates.

Whenever the original sampling weights $w_{hik}$ receive non-response adjustments or are calibrated, the corresponding non-response adjustments and/or calibration of the basic weights must be repeated for each replica, so that the variance estimates adequately reflect the effects of the calibration and non-response adjustments on the uncertainty of the point estimates. This ensures that the variance estimates accurately reflect the additional uncertainty introduced by these adjustments.

The bootstrap method has several advantages. It works well for complex survey designs and can handle a wide range of parameters, including those that are difficult to estimate using traditional methods, such as medians or other nonlinear statistics. It also provides a way to estimate variances when other methods are not available or practical to use. The method is particularly helpful for survey users who may not have access to specialized software for calculating variances.

Many modern statistical software tools, including the `survey` package in R, support bootstrap replication and variance estimation, making it accessible to a wide range of users. While the bootstrap method is computationally intensive, requiring many replicas to be created and processed, it is highly effective. It provides robust variance estimates even for complex parameters and remains one of the most flexible tools for analyzing survey data.

## The Design Effect





## Using Software to Generate Valid Inferences

The design and analysis of household surveys must include extensive use of existing computational tools. This section reviews in detail the computational approaches of the statistical software used for each of the statistical processes required to publish official figures with high levels of accuracy and reliability. Specifically, for the following processes:

* Sample selection according to the defined sampling design;
* Calculation of sampling weights for each individual and household;
* Modeling of nonresponse and statistical imputation;
* Calibration of sampling weights and adjustments for nonresponse;
* Estimation of standard errors for each indicator of interest to be included in the production tables;
* Analysis of multivariate relationships between survey variables.

@United_Nations_2005[Section 7.8] highlights the importance of including the structure of complex survey designs in the inference process for estimating official statistics from household surveys. It warns, with an empirical example, that failing to do so may result in biased estimates and underestimated sampling errors. Below are some key features that statistical software packages incorporate when managing data from complex survey designs, such as those found in household surveys. A more detailed review, including syntax and computational code, can be found in @Heeringa_West_Berglund_2017[Appendix A].

In general, these computational tools are designed to enhance the efficiency of variance approximation methods for complex samples, as well as replication techniques to estimate design-based variances [@Westat_2007]. Some of these software packages are free to use, although most are licensed products requiring paid licenses. These products, in addition to providing descriptive statistics (such as means, totals, proportions, percentiles, and ratios), allow for fitting linear and logistic regression models. All resulting statistics are based on the survey design.

*R*

R is a free software increasingly used in social research, as it is likely to host the latest scientific findings implemented in this software [@R_2024]. Being open-source, researchers can upload their own collections of computational functions to the official repository (`CRAN`) and make them available to the community. The `samplesize4surveys` package [@ss4s] determines the sample size for individuals and households in repeated, panel, and rotational household surveys. The `sampling` [@Yves] and `TeachingSampling` [@TS] packages enable the selection of probabilistic samples from sampling frames under a wide variety of designs and algorithms. The `survey` package [@TL], once the survey design is predefined using the `svydesign()` function, allows for analyzing household survey data and obtaining appropriate standard error estimates.

*STATA*

The `svy` environment provides tools for appropriate inference from household surveys [@STATA_2017]. The `svyset` command specifies variables identifying survey design features, such as sampling weights, clusters, and strata. The `svydescribe` command produces tables describing strata and sampling units at a given survey stage. Once survey design definitions are loaded, any model can be estimated, and the resulting statistics will be survey-design-based. The `svy` environment also supports predictive commands.

*SPSS*

The `complex samples` module in `SPSS` [@IBM_2017] supports the selection of complex samples through user-defined sampling schemes. Next, an analysis plan must be created by assigning design variables, estimation methods, and sample unit sizes. Once the sampling plan is defined, the module enables the estimation of counts, descriptive statistics, and crosstabulations. It is also possible to estimate ratios and regression coefficients in linear models, along with corresponding hypothesis test statistics. Finally, the module allows for estimating nonlinear models, such as logistic regressions, ordinal regressions, or Cox regressions.

*SAS*

This statistical software includes a procedure for selecting probabilistic samples called `SURVEYSELECT`, which integrates common selection methods such as simple random sampling, systematic sampling, probability proportional to size sampling, and stratified allocation tools. To analyze data from complex samples, specific procedures have been programmed [@SAS_2017]: 

- `SURVEYMEANS`: Estimates totals, means, proportions, and percentiles, along with their respective standard errors, confidence intervals, and hypothesis tests;
- `SURVEYFREQ`: Estimates descriptive statistics (e.g., totals and proportions) in one- and two-way tables, provides sampling error estimates, and analyzes goodness-of-fit, independence, risks, and odds ratios;
- `SURVEYREG` and `SURVEYLOGISTIC`: Fit linear and logistic regression models, respectively, estimating regression coefficients with associated errors and providing an exhaustive analysis of model properties;
- `SURVEYPHREG`: Fits survival models using pseudo-maximum likelihood techniques.

