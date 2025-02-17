# Associations between categorical variables

## Motivation and concepts

Household surveys often collect data on categorical variables, such as employment status, educational attainment, or access to services. Understanding whether two categorical variables are related, or *associated*, is an important aspect of survey analysis. For example, are employment status and access to the internet connected in a meaningful way? Categorical variables are those that divide the population into distinct groups or categories. For example:

- **Employment status** might have categories like "employed," "unemployed," and "not in the labor force";

- **Educational attainment** might include categories such as "primary," "secondary," and "tertiary."

This section introduces methods to describe and infer associations between pairs of categorical variables. When analyzing associations between two categorical variables, we are interested in whether the distribution of one variable depends on the categories of the other. To assess the relationship between two categorical variables, analysts examine how often different combinations of categories occur. For example, they might count how many individuals fall into each pairing of employment status and educational attainment. These counts are then used to calculate proportions, which describe the relative frequency of each pairing within the population.

Analyzing associations between categorical variables is useful in various contexts, such as policy development, where understanding the relationship between education and employment helps design effective workforce policies; program evaluation, where assessing whether access to healthcare varies by income level can inform targeted interventions; and social research, where studying connections between demographic factors and access to services provides insights into societal trends.

In practice, this analysis often starts with a **contingency table**, a grid that shows the counts or proportions of units in each combination of categories for the two variables. For example, one axis of the table might list employment statuses, while the other lists levels of educational attainment.

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

## Cross-tabulations

Cross-tabulations, also known as contingency tables, are a fundamental tool in survey analysis. They organize data into a table format, showing the frequency distribution of two or more categorical variables. By summarizing relationships between these variables, cross-tabulations help researchers identify patterns and associations that might otherwise go unnoticed. This type of analysis is widely used in research and policy decision-making, as it provides a straightforward way to explore how different variables interact. For example, a contingency table might examine how employment status varies by educational attainment, or how access to the internet differs between urban and rural households.

Procedures for assessing independence can be used to determine whether the cross-classified variables are related or independent. This type of analysis is important in many research and decision-making settings. In the specialized literature, cross-tabulations are also referred to as *contingency tables*. Here a table is a two-dimensional array with rows indexed by $r=1, \ldots, R$ and columns indexed by $c=1, \ldots, C$. Such tables are widely used in household survey analysis as they summarize the relationship between categorical variables in terms of frequency counts.

A contingency table aims to succinctly represent the association between different categorical variables. It is a grid with rows and columns that represent the categories of two variables. Each cell in the table contains the frequency or proportion of observations that fall into the corresponding combination of categories. The rows might represent categories of a domain defining variable such as "education level" (primary, secondary, tertiary). The columns might represent categories of another variable, such as "employment status" (employed, unemployed, not in the labor force). The table can also include **marginal totals**, which summarize the data for each row or column, and a **grand total**, representing the overall population.

In household surveys, frequencies in contingency tables are calculated using survey weights. These weights ensure that the estimates accurately reflect the entire population, accounting for the sampling design. For each cell, the weighted frequency represents the estimated number of individuals in the population with the corresponding combination of categories. For instance: we consider the case of a two-way contingency table. For most household sample surveys, a typical tabular output comprises the weighted frequencies that estimate the population frequencies, as follows:

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

Weighted frequencies can also be converted into **proportions**, which indicate the relative size of each group compared to the total population. Proportions are particularly useful when comparing groups of different sizes or when focusing on the relative distribution of categories. The estimated proportions from these weighted sample frequencies are obtained as follows:

$$
\widehat{p}_{rc} = \frac{\widehat{N}_{rc}}{\widehat{N}_{++}}
$$

$\widehat{p}_{r+} = \widehat{N}_{r+} / \widehat{N}_{++}$, and $\widehat{p}_{+c} = \widehat{N}_{+c} / \widehat{N}_{++}$.

Two-way tables can also display the estimates of population relative frequencies, as shown below:

|             |          | $y$      |          |           |
|:-----------:|:--------:|:--------:|:--------:|:---------:|
| $x$         | 1        | $\ldots$ | $C$      | row marg. | 
| 1           | $\widehat{p}_{11}$ | $\ldots$ | $\widehat{p}_{1C}$ | $\widehat{p}_{1+}$ |
| $\ldots$    | $\ldots$ | $\widehat{p}_{rc}$ | $\ldots$| $\ldots$ |
| $R$         | $\widehat{p}_{R1}$ |$\ldots$  | $\widehat{p}_{RC}$ | $\widehat{p}_{R+}$ |
| col. marg. | $\widehat{p}_{+1}$ | $\ldots$ | $\widehat{p}_{+C}$ | $1$ |

While tables are a clear way to present data, visualizations such as stacked bar charts or heatmaps can enhance understanding by highlighting patterns and differences between categories. These visuals complement contingency tables, making it easier to communicate findings to a broad audience. More on this will be elaborated in section 9.7.

## Testing for independence

In household surveys, it is often important to determine whether two categorical variables are associated or independent (i.e., whether the distribution of one variable is unaffected by the categories of the other). For example, is there a relationship between "educational level" and "employment status"? To answer such questions, *independence tests* are used. These tests compare the observed data with what would be expected if the two variables were completely unrelated. 

To perform these tests, analysts rely on models that assume the data comes from a larger, hypothetical population (a *superpopulation*). The observed data from the survey is treated as a sample from this superpopulation, and the analysis aims to draw conclusions about the larger population. The starting point for testing independence is the **null hypothesis**, which assumes that the two variables are independent. This means the likelihood of being in any combination of categories is simply the product of their marginal probabilities.

To test this hypothesis, observed frequencies (or proportions) in a contingency table are compared with the expected frequencies under the null hypothesis. If the observed and expected values differ significantly, the null hypothesis of independence is rejected, suggesting an association between the variables. This way, it is possible to perform independence tests to verify whether $x$ and $y$ are associated. Following @Heeringa2017, the null hypothesis that $x$ and $y$ are independent is defined as:

$$
H_0) \ \ P_{rc}^0 = {P_{r+} \times P_{+c}} \ \ \forall \ r=1, \ldots, R \text{ and } c=1, \ldots, C.
$$

Hence, to test the independence hypothesis we compare the estimated proportions $\widehat{p}_{rc}$ with the estimated expected population proportions under the null $P_{rc}^0$. If there is a large difference between them, then the independence hypothesis would not be supported by the data. 

Testing for independence in survey data requires adjustments to account for the sampling design, which often includes stratification, clustering, and unequal probabilities of selection. The **Rao-Scott adjustment** modifies traditional chi-square tests to incorporate these design effects. The test statistic is adjusted for the survey design using a measure called the **generalized design effect (GDEFF)**, which accounts for the complexity of the sampling design. It follows a chi-square distribution under the null hypothesis. Therefore, the following Pearson Rao-Scott adjusted test statistic $X_{RS}^2$ [@Rao1984] is defined by:

$$
X_{RS}^2 =\ \frac {n_{++}} {GDEFF} \sum_r \sum_c \frac{\left(\widehat{p}_{rc} - \widehat P_{rc}^0 \right)^2}{\widehat P_{rc}^0}
$$

where $\widehat P_{rc}^0 = \widehat p_{r+} \times \widehat p_{+c}$ estimates the cell frequencies under the null hypothesis and $GDEFF$ is an estimate of the generalized design effect (@Heeringa2017 p. 177). Under the null hypothesis of independence, the large sample distribution of $X_{RS}^2$ is $\chi^2_{[(R-1) (C-1)]}$. 

When the sample size or degrees of freedom is small, adjustments to the $X_{RS}^2$ test statistic can improve accuracy. These adjustments use an **F-distribution** instead of the chi-square distribution, making the tests more robust for smaller datasets. As mentioned by @Heeringa2017, it was @Fay1979, along with @Fellegi1980, who began proposing corrections to Pearson's chi-square statistic based on a generalized design effect. @Rao1984 later expanded the theory of generalized design effect corrections for these statistical tests, as did @thomas1987small_sample. 

The Rao-Scott adjustment requires the calculation of generalized design effects, which are analytically more complex than Fellegi's approach. Nevertheless, Rao-Scott adjusted statistics are now the standard for analyzing categorical survey data in software systems such as R, Stata and SAS.

## Tests for group comparisons

Comparing group means is a common goal in household survey analysis. For example, researchers might ask: "Is there a significant difference in average income between male and female headed households?" To answer such questions, statistical tests are used, adapted to account for the complexities of survey data, such as stratification, clustering, and unequal selection probabilities. This section explains the methods for testing differences in means, adjusted for survey design, with examples to illustrate their application.

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

One of the two hypotheses will be considered true only if the statistical evidence, which is obtained from the sample, supports it. The decision about which hypothesis is true is based on the statistical evidence gathered from the data. This process is called **hypothesis testing**.

In many cases, important parameters of interest, such as differences in means or weighted sums of means, can be expressed as a linear combination of various descriptive statistics. These combinations are often used in constructing economic indices or comparing population means. The variance of these combinations is important for understanding the precision of the estimate. That is, parameters can be expressed as a linear combination of measures of interest. The most common cases are differences in means, weighted sums of means used to construct economic indices, etc. Thus, consider a function that is a linear combination of $J$ descriptive statistics, as shown below:

$$
f \left( \theta_{1}, \ldots,\theta_{J}\right) = \sum_{j=1}^{J}a_{j}\theta_{j}
$$

where the $a_{j}$ are *known* constants. An estimator of this function is given by:

$$
\widehat{f} \left( \widehat{\theta}_{1}, \ldots, \widehat{\theta}_{J} \right) = \sum_{j=1}^{J} a_{j} \widehat{\theta}_{j}
$$

And its variance is calculated as follows:

$$
Var \left( \sum_{j=1}^{J} a_{j} \widehat{\theta}_{j} \right) = \sum_{j=1}^{J} a_{j}^{2} \ Var\left( \widehat{\theta}_{j} \right) + 2 \times \sum_{j=1}^{J-1} \sum_{k>j}^{J} a_{j} a_{k} \, Cov \left( \widehat{\theta}_{j} , \widehat{\theta}_{k} \right)
$$

As seen in the variance expression for the estimator, it requires the variances of the individual estimators, as well as the covariances of pairs of estimators. 

In the context of comparing means between two populations, there are several potential hypotheses that can be tested. On the one hand, the null hypothesis may state that the means of two populations are equal. On the other, the alternative hypothesis could suggest that the means are different, or that one is greater than or less than the other.

Of particular interest is analyzing the difference in population means. In order to formulate the hypothesis tests for this case, we need to consider a *superpopulation model*. We assume that $y_{hik}$ correspond to observations from identically distributed random variables $Y$ having means $\mu_{y,j}$ if unit $k$ belongs to domain $j$, with $j = 1, 2$. Then we can define the difference in population means between domains 1 and 2 as $\mu_{y,1} - \mu_{y,2}$. As an example, consider that $\mu_{y,1}$ is the average household income for households with male heads of household, and $\mu_{y,2}$ is the average household income for households with female heads.

This difference in means can be consistently estimated by:

$$
\widehat{\overline{Y}}_{1} - \widehat{\overline{Y}}_{2}
$$

where $\widehat{\overline{Y}}_{j}$ is the sample estimator of $\mu_{y,j}$ ($j = 1, 2$).

Considering the parameter of interest in this section, the hypotheses to test are typically:

- Null hypothesis: There is no difference between the means.
- Alternative hypothesis: There is a difference, which could be in either direction (greater or less). 

To test one of these hypothesis, the following test statistic is used, which follows a t-student distribution with $df$ degrees of freedom, calculated as the difference between the number of PSUs $m$ in the sample and the number of strata $H$.

$$
t = \frac{\widehat{\overline{Y}}_{1} - \widehat{\overline{Y}}_{2}} {se\left(\widehat{\overline{Y}}_{1} - \widehat{\overline{Y}}_{2}\right)} \sim t_{[df]}
$$

Where:

$$
\widehat{se} \left( \widehat{\overline{Y}}_{1} - \widehat{\overline{Y}}_{2} \right) = \sqrt{\widehat{Var}\left(\widehat{\overline{Y}}_{1}\right) + \widehat{Var}\left(\widehat{\overline{Y}}_{2}\right) - 2 \  \widehat{Cov}\left(\widehat{\overline{Y}}_{1} \ ; \widehat{\overline{Y}}_{2} \right)}
$$

If a confidence interval is needed for the difference in means, it is constructed using the estimated difference and the standard error, along with the appropriate critical value from the t-distribution. This interval provides a range of plausible values for the true difference in means, offering a more complete understanding of the data. It would be constructed as follows:

$$
\widehat{\overline{Y}}_{1} - \widehat{\overline{Y}}_{2} \ \pm \ t_{[df]} \ \widehat{se}\left( \widehat{\overline{Y}}_{1} - \widehat{\overline{Y}}_{2} \right)
$$

## NSO -- Practical example

In this part an NSO will share its experiences on dealing with statistical comparisons among groups and how do they present the results in tables.

