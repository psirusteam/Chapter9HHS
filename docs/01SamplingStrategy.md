# The golden pair: sample design and estimator

Defining the survey design is crucial for analyzing complex survey data. We must make sure that PSU, strata, and weights are available in the database. When not available, the database should contain replicate weights, or the researcher should have a valid expression to compute variance estimates. Defining the sample design is crucial for design-based inference and analysis, ensuring accuracy, precision, and consistency. A well-defined survey design facilitates statistical analysis, supports effective data interpretation, and enables meaningful insights into complex phenomena.

Accounting for the sampling design is crucial for analyzing complex survey data. We must ensure that PSU, strata, and weights are available in the survey dataset. Alternatively, when not available, the dataset should at least contain replicate weights, or the analyst should have clear guidance on how to compute variance estimates. A well-described survey design facilitates statistical analysis, supports effective data interpretation, and enables meaningful insights into complex phenomena. Missing or incorrect design information may lead to biased estimates and misleading conclusions.

## Parameters and estimators

Based on the design-based approach this section will discuss the basic principles of inductive inference and how, using the sampling weights (from chapter 8), we can get unbiased estimators for population parameters, with a special focus on totals and means. 

Under a design-based approach this section presents the basic principles of inductive inference and how, using the *sampling weights* (from chapter 8), we can get unbiased (or at least consistent) estimators for population parameters, with a special focus on totals and means. 

Let $U = \left\{ 1, \ldots, N \right\}$ denote elementary units in our target population, and $y_i$ the value of a survey variable of interest observed for any unit $i$ in $U$. Let $Y = \sum _{i \in U} y_i$ and $\overline Y = \frac 1 N \sum _{i \in U} y_i = \frac Y N$ denote the *population total* and *mean* of the survey variable $y$.
 
A probability sample $s = \left\{ i_1, \ldots, i_n \right\} \subset U$ is selected from the population $U$ using a probability sampling design $p(s)$, that ensures strictly positive first order inclusion probabilities $\pi_i = Pr(i \in s), \, \forall \, i \in U$. These inclusion probabilities are assumed known, at least to the data producers. 

Under the design-based framework for inference, an unbiased estimator for the population total $Y$ is the Horvitz-Thompson estimator given by

$$
\widehat Y _{HT} = \sum _{i \in s} \frac {y_i} {\pi_i} =  \sum _{i \in s} d_i {y_i}
$$

where $d_i = 1 / \pi_i \, \forall \, i \in s$. 

The sampling variance of $\widehat Y _{HT}$ is given by:

$$
V_p \left( \widehat{Y}_{HT} \right) = \sum_{i \in U} \sum_{j \in U} \left( \frac {d_i d_j} {d_{ij}} - 1 \right) y_i y_j
$$

where $d_{ij} = 1 / \pi_{ij}$ and $\pi_{ij} = Pr(i,j \in s), \, \forall \, i,j \in U$. This result assumes that the sampling design $p(s)$ is such that $\pi_{ij} > 0 \,\, \forall \, i,j \in U$.

This variance can be estimated unbiasedly by

$$
\widehat {V_p} \left( \widehat{Y}_{HT} \right) = \sum_{i \in s} \sum_{j \in s} \left( d_i d_j - d_{ij} \right) y_i y_j
$$

When the population size $N$ is known, the population mean can be estimated unbiasedly using the Horvitz-Thompson estimator:

$$
\overline y_{HT} =  \frac 1 N \widehat Y _{HT} = \frac 1 N \sum_{i \in s} d_i y_i
$$

An alternative estimator, useful when $N$ is unknown, but also because it may have smaller variance, is the Hàjek estimator of the mean given by:

$$
\overline y_{H} =  \frac {\widehat Y _{HT}} {\widehat N _{HT}} = \frac {\sum_{i \in s} d_i y_i} {\sum_{i \in s} d_i}
$$

The variance of the Horvitz-Thompson estimator for the mean is given by:

$$
V_p \left( \overline y_{HT} \right) = \frac {1} {N^2} \sum_{i \in U} \sum_{j \in U} \left( \frac {d_i d_j} {d_{ij}} - 1 \right) y_i y_j
$$

and the corresponding estimator is

$$
\widehat {V_p} \left( \overline y_{HT}  \right) = \frac {1} {N^2} \sum_{i \in s} \sum_{j \in s} \left( d_i d_j - d_{ij} \right) y_i y_j
$$

A variância do estimador $\overline y_{H}$ pode ser estimada usando:

$$
\widehat {V_p} \left( \overline y_{H} \right) = \frac {1} {\widehat N^2 _{HT}} \sum_{i \in s} \sum_{j \in s} \left( d_i d_j - d_{ij} \right) (y_i - \overline y_{H}) (y_j - \overline y_{H})
$$

While the above formulae for variance estimation are general and cover the vast majority of sample designs used in the practice of household sample surveys, they are not used in practice because often the second order inclusion probabilities $\pi_{ij}$ (and corresponding pairwise weights $d_{ij}$) are unknown to survey data analysts. In fact, even data producers do not compute such weights, since there are more efficient methods for variance estimation that do not require having such weights.


## Uncertainty in household surveys

As the sample is a small subset of the population, we show the importance of generating not only point estimates, but also related uncertainty measures. In this subsection we will present some approaches for variance estimation: exact and approximate formulas (ultimate cluster) for variances of totals; and Taylor linearization for means, ratios and other parameters. We also introduce replication methods and generalized variance functions, which are essential in the cases when PSU or strata are missing from the database.

As the sample is typically a small subset of the population, we show the importance of generating not only point estimates, but also related uncertainty measures. In this subsection we will present some approaches for variance estimation: exact and approximate formulas (ultimate cluster) for variances of totals; and Taylor linearization for means, ratios and other parameters. We also introduce replication methods and generalized variance functions, which are essential in the cases when PSU or strata are missing from the database.

A unifying idea of sampling theory is that of estimating equations [@Binder1983]. Many population parameters can be written/obtained as solutions of *population estimator equations*.

A generic population estimator equation is given by:

$$
\sum _{i \in U} z_i (\theta) = 0
$$

where $z(\bullet)$ is an estimator function* and $\theta$ is a population parameter of interest.

Consider the case of the population total. Take $z_i(\theta) = y_i - \theta/N$. Therefore, the corresponding population estimation equation is given by:

$$
\sum _{i \in U} (y_i - \theta / N) = 0
$$

Solving for $\theta$ gives the *population total*:

$$
\theta_U = \sum _{i \in U} y_i \ = \ Y
$$

Consider the case of the population mean. Take $z_i(\theta) = y_i - \theta$. In this case, the corresponding population estimation equation is given by:

$$
\sum _{i \in U} (y_i - \theta) = 0
$$

Solving for $\theta$ gives the *population mean*:

$$
\theta_U = \sum _{i \in U} y_i / N \ = \ \overline Y
$$

As a final example, consider the ratio of population totals. Taking $z_i(\theta) = y_i - \theta x_i$, the corresponding population estimation equation is given by:

$$
\sum _{i \in U} (y_i - \theta x_i) = 0
$$

Solving for $\theta$ gives the *population ratio*:

$$
\theta_U = \sum _{i \in U} y_i / \sum _{i \in U} x_i \ = \ R
$$

The idea of defining population parameters as solutions to population estimating equations allows defining a general method for obtaining corresponding sample estimators. It is a matter of using the *sample estimating equations*:

$$
\sum _{i \in s} d_i \, z_i (\theta) = 0
$$

where $d_i$ is the sampling weight of the unit $i$. 

Under *probability sampling* and with $d_i = 1 / \pi_i$, the sample sum in the sample estimating equation is unbiased towards the population sum in the corresponding population estimating equation.

Solving the sample estimating equation yields unbiased or at least consistent estimators for the corresponding population parameters.

In the case of the population mean:

$$
\sum _{i \in s} d_i (y_i - \theta) = 0
$$

yields, by solving on $\theta$, the Hàjek estimator:

$$
\widehat \theta = \sum _{i \in s} d_i \, y_i \, / \sum _{i \in s} d_i = \overline y_H
$$

In the case of the population ratio, solving

$$
\sum _{i \in s} d_i (y_i - \theta x_i) = 0
$$

on $\theta$, yields the well-known estimator:

$$
\widehat \theta = \sum _{i \in s} d_i \, y_i \, / \sum _{i \in s} d_i \, x_i= \widehat R
$$

The variance of estimators obtained as solutions of sample estimating equations can be obtained as:

$$
V_p (\widehat \theta) \doteq \left[ J (\theta_U) \right] ^{-1} V_p \left[ \sum _{i \in s} d_i \, z_i (\theta_U) \right] \left[ J (\theta_U) \right] ^{-1}
$$

where $J (\theta_U) = \sum _{i \in U} \left[ \partial{z_i (\theta)} / \partial \theta \right]_{\theta = \theta_U}$, and $\theta_U$ is the solution of the corresponding population estimating equation.

A consistent estimator of this variance is given by:

$$
\widehat V_p (\widehat \theta) = \left[ \widehat J ( \widehat \theta) \right] ^{-1} \widehat V_p \left[ \sum _{i \in s} d_i \, z_i (\widehat \theta)\right] \left[ \widehat J ( \widehat \theta) \right] ^{-1}
$$

where $\widehat J (\widehat \theta) = \sum _{i \in s} d_i \, \left[ \partial{z_i ( \theta)} / \partial \theta \right]_{\theta = \widehat \theta}$.

This overall result allowed the development of software such as the `R survey` package, the `Stata svy` functions and others.

Most of the estimators and corresponding estimates of variance available result from the implementation of this approach.

In some cases, sample replication methods (*bootstrap*, *jackknife*) can also be used to estimate variances, as we will see later.


## Using software to generate valid inferences

In this part, we advocate to using specialized statistical software to generate efficient estimation processes. Those packages support complex survey data analysis by specifying the survey design using appropriate commands or functions.




