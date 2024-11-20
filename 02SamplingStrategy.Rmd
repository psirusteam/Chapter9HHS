# The golden pair: sample design and estimator

Accounting for the sampling design is crucial for analyzing complex survey data. We must ensure that primary sampling units (PSU), strata, and weights are available in the survey dataset to enable adequate analysis. Alternatively, when such information is not available, the dataset should at least contain replicate weights, or the analyst should have clear guidance on how to compute both point and variance estimates. 
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

There are several methods to estimate the uncertainty in survey results. One common approach is based on approximate formulas like Taylor linearization, which simplifies complex relationships between variables into linear ones. Another approach known as the ultimate cluster method, is used in surveys that collect data through multi-stage sampling, where groups of people (clusters) are selected at different stages, exactly as household survey data is collected. 

Another helpful tool is the use of generalized variance functions [@Binder1983], which comprises a unifying idea of sampling theory. Many population parameters can be written/obtained as solutions for *population estimating equations*. Variance estimation for these sample-based methods follows a consistent framework. Although the details can be technical, the key idea is that the same principles used to estimate totals can be applied to calculate variances. This generality makes the method simple and versatile, allowing it to be implemented in widely used software like the `R survey` package and the `Stata svy` functions. These tools automate much of the process, making it accessible for analysts to estimate both population parameters and their associated uncertainties.

A generic population estimating equation is given by $\sum_{i \in U} z_i (\theta) = 0 $, where $z_i(\bullet)$ is an *estimating function* evaluated for unit $i$ and $\theta$ is a population parameter of interest. These equations provide a general way to describe and calculate many population parameters, such as totals, means, and ratios. The concept is straightforward: population parameters can be defined as solutions to specific equations that involve all the units in the population. This approach is flexible and can be adapted to calculate many different types of parameters.

For the case of the population total, take $z_i(\theta) = y_i - \theta / N$. The corresponding population estimation equation is given by $\sum _{i \in U} (y_i - \theta / N) = 0$, and solving for $\theta$ gives the population total $\theta_U = \sum _{i \in U} y_i \ = \ Y$. 

Similarly, means and ratios can be derived by modifying these equations to account for averaging or proportional relationships. For instance, take $z_i(\theta) = y_i - \theta$ for the population mean. As a final example, consider the ratio of population totals. Taking $z_i(\theta) = y_i - \theta x_i$, the corresponding population estimation equation is given by $\sum _{i \in U} (y_i - \theta x_i) = 0$. Solving for $\theta$ gives the *population ratio* $\theta_U = \sum _{i \in U} y_i / \sum _{i \in U} x_i \ = \ R$.

The idea of defining population parameters as solutions to population estimating equations allows defining a general method for obtaining corresponding sample estimators. It is a matter of using the *sample estimating equations* $\sum _{k \in s} d_k \, z_k (\theta) = 0$. Under *probability sampling*, full response and with $d_k = 1 / \pi_k$, the sample sum in the left hand side is unbiased towards the population sum in the corresponding population estimating equation. Solving the sample estimating equation yields consistent estimators for the corresponding population parameters.

The case of the population mean yields the sample estimating equation $\sum _{k \in s} d_k (y_k - \theta) = 0$, and by solving on $\theta$, we recover the Hàjek estimator $\widehat \theta = \sum _{k \in s} d_k \, y_k \, / \sum _{k \in s} d_k = \overline y_H$. In the case of the population ratio, solving $\sum _{k \in s} d_k (y_k - \theta x_k) = 0$ on $\theta$, yields the well-known estimator $\widehat \theta = \sum _{k \in s} d_k \, y_k \, / \sum _{k \in s} d_k \, x_k = \widehat R$.

A consistent estimator for the variance of estimators obtained as solutions of sample estimating equations can be obtained as:

$$
\widehat V_p (\widehat \theta) = \left[ \widehat J ( \widehat \theta) \right] ^{-1} \widehat V_p \left[ \sum _{k \in s} d_k \, z_k (\widehat \theta)\right] \left[ \widehat J ( \widehat \theta) \right] ^{-1}
$$

Where $\widehat J (\widehat \theta) = \sum _{k \in s} d_i \, \left[ \partial{z_k ( \theta)} / \partial \theta \right]_{\theta = \widehat \theta}$.

This approach implies that by one is able to estimate many population parameters and corresponding variances using essentially well known methods for estimating totals. Its simplicity and generality have enabled the development of software such as the `R survey` package, the `Stata svy` functions and others. 

## Ultimate Cluster Method

The central idea of the *Ultimate Cluster* method for variance estimation for estimators of totals in multi-stage cluster sampling designs, proposed by [@Hansen1953], is to consider only the variation between information available in the level of PSUs, and assume that these would have been selected with replacement from the PSU population. This idea is simple, but quite powerful, because it allows to accommodate a variety of sampling designs, involving stratification and selection with unequal probabilities (with or without replacement) of both PSUs as well as lower level sampling units. The requirements for the application of this method are that one has unbiased estimators of totals for the variable of interest for each sampled PSU, and that data are available for at least two sampled PSUs in each stratum (if the sample is stratified in the first stage).

Although the method was originally proposed for estimation of variances of estimated totals, it can also be applied in combination with Taylor linearization to obtain variance estimates for estimators of other population quantities that can be obtained as solutions to sample estimating equations. 

Consider a multi-stage sampling design, in which $m_{h}$ PSUs are selected in stratum $h,$ $h=1,\ldots ,H$. Let $\pi_{hi}$ be the inclusion probability of PSU $i$ stratum $h$, and by $\widehat{Y}_{hi}$ an unbiased estimator of the total $Y_{hi}$ of the survey variable $y$ for the $i$-th PSU in stratum $h$, $h=1,\ldots ,H$. Hence an unbiased estimator of the population total $Y = \sum_{h=1}^{H} \sum_{i \in U_{1h}} Y_{hi}$ is given by $\widehat{Y}_{UC} = \sum_{h=1}^{H} \sum_{i \in s_{1h}} d_{hi} \widehat{Y}_{hi}$, and the *ultimate cluster* estimator of the corresponding variance is given by:

$$
\widehat{V}_{UC} \left( \widehat{Y}_{UC}\right) = \sum_{h=1}^{H} \frac{m_{h}}
{m_{h}-1} \sum_{i=1}^{n_{h}} \left( d_{hi} \widehat{Y}_{hi} - \frac{\widehat{Y}_{h}}{m_{h}} \right) ^{2}
$$

where $U_{1h}$ and $s_{1h}$ are the population and sample sets of PSUs in stratum $h$, $d_{hi} = 1 / \pi_{hi}$, $\widehat{Y}_{h} = \sum_{i=1}^{n_{h}} d_{hi} \widehat{Y}_{hi}$ for $h=1,\ldots ,H$. (See for example, [@Shah1993], p. 4).

Although often the selection of primary units can have Primary Cluster estimator presented here may provide a reasonable approximation of the corresponding variance of randomization. This is because sampling plans without replacement are generally more efficient than plans with replacement of equal size. Such an approximation is widely used by sampling practitioners to estimate variances of usual descriptive quantities such as totals and medium (with due adaptation) due to their simplicity, compared to the much greater complexity involved with the employment of variance estimators that attempt to incorporate all steps of plans sampling in several stages. A discussion about Quality of this approximation and alternatives can be found in [@SSW92], p. 153.

In some cases, sample replication methods (*bootstrap*, *jackknife*) can also be used to estimate variances, as we will see later.

## Bootstrap Method

The method was proposed by @Efron1979, but the version we consider here is the so-called Rao-Wu-Yue Rescaling Bootstrap, which is adequate for stratified multi-stage sampling designs commonly used in household surveys - see @Rao1992. This method is now widely used for variance estimation with complex survey data. To implement this method, you need to follow the sequence of steps outlined below.

Step 1. Select a simple random sample with replacement of size $m_h - 1$ of PSUs in each of the $H$ design strata. Each selected PSU takes with it all the subordinate sampling units and their data. 

Step 2. Repeat Step 1 $R$ times, and denote by $m_{hi}(r)$ the number of times the PSU $i$ of stratum $h$ was selected for the sample in replicate $r$.

Step 3. Calculate the *bootstrap* weight of unit $k$ within PSU $i$ of stratum $h$ as $w_{hik} (r) = w_{hik} \times \frac {m_h}{m_h - 1} \times m_{hi}(r)$.

Step 4. For each replica $r$, calculate an estimate $\widehat \theta_{(r)}$ of the target parameter $theta$ using the *bootstrap* weights $w_{hik} (r)$. 

Step 5. Estimate the variance using:

$$
\widehat V_{B} \left( \widehat \theta \right) = \frac {1} {R} \sum_{r=1}^R \left( \widehat \theta_{(r)} - \tilde \theta \right)^2
$$

where $\tilde \theta = \frac 1 R \sum_{r=1}^R \widehat \theta_{(r)}$ is the average of the replica estimates.

Whenever the original sampling weights $w_{hik}$ receive non-response adjustments or are calibrated, the corresponding non-response adjustments and/or calibration of the basic weights must be repeated for each replica, so that the variance estimates adequately reflect the effects of the calibration and non-response adjusments on the uncertainty of the point estimates.

This method is more computationally costly, but provides good estimates of variance, including for quantiles and other parameters of complex nonlinear forms. It also makes it easier for users who do not have access to software capable of calculating complex variance expressions based on Taylor linearization, etc. The survey package allows you to generate *bootstrap* replicas and also estimate variances using this method.

## Using software to generate valid inferences

In this part, we advocate to using specialized statistical software to generate efficient estimation processes. Those packages support complex survey data analysis by specifying the survey design using appropriate commands or functions.

