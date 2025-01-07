# Descriptive parameters

Descriptive parameters are the most commonly analyzed outputs from household survey data. These analyses focus on summarizing key characteristics of the population by estimating values for a variety of survey variables. The goal is to provide clear and meaningful insights into the population using data collected from a representative sample.

The most basic and frequently estimated parameters include **frequencies**, **proportions**, **means**, and **totals**. Means and totals provide average and cumulative values, respectively, which are useful for understanding population-level behaviors and trends. Frequencies can show the number of households/people in a specific category (e.g. number of poor people), while proportions can represent the share of households/people meeting a particular condition (e.g. poverty rate). 

In recent years, the scope of descriptive analysis has expanded beyond these basic parameters. Analysts now estimate more complex metrics, such as **quantiles** of numeric variables, which help describe the distribution of values (e.g., the median income of households). There are also metrics for particular types of analysis, such as poverty (FGT indices), inequality (Gini, Theil, Atkinson), polarization (Wolfson, DER), etc. - see @Jacob2024.

## Frequencies and proportions

One of the most fundamental tasks in household survey analysis is estimating the size of subpopulations, namely the number of people or households in specific categories, as well as the proportions they represent within the population. These estimates are crucial because they provide a snapshot of the demographic and socioeconomic profile of a population. Policymakers and planners use this information to make decisions about resource allocation, public policy design, and the development of social programs.

For example, understanding how many people live below the poverty line, how many are unemployed, or how many have completed a certain level of education provides valuable insights. These insights help address inequalities, support the design of targeted interventions, and promote equitable development across communities. The ability to understand the distribution across categories provides valuable information to address inequalities and promote equitable development.

To estimate the size of a population or subpopulation, analysts focus on categorical variables, which divide the population into distinct groups. For example, categories could represent different income quintiles, employment statuses, or education levels. The size of a population refers to the total number of individuals or households in the survey data who fall into a specific category. Population size estimates are calculated by combining the information collected from survey samples with *sampling weights*. These weights indicate how many people or households each surveyed unit represents in the broader population. A sampling estimator of a population size is given by the following expression:

$$
\widehat{N} = \sum_{h=1}^{H} \sum_{i \in s_{1h}} \sum_{k \in s_{hi}} w_{hik}
$$

where $s_{hi}$ is the sample of households or individuals in PSU $i$ of stratum $h$; $s_{1h}$ is the sample of PSUs within stratum $h$; and $w_{hik}$ is the weight (expansion factor) of unit $k$ within PSU $i$ in stratum $h$.

Subpopulation size estimates work similarly but focus on a subset of the population defined by a specific characteristic. For example, if we want to estimate the number of people in a particular category, we would identify the relevant group in the survey data and sum up their weights. This approach allows analysts to estimate not only the total population size but also the size of specific groups of interest. This way, a binary variable should be defined, $I(y_{hik} = d)$. It will take the value one if unit $k$ from PSU $i$ in stratum $h$ belongs to category $d$ in the discrete variable $y$. A sampling estimator for this parameter is given by the following expression:

$$
{\widehat{N}}_d = \sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}} w_{hik} \ I(y_{hik} = d)
$$


Proportions describe the relative size of specific groups within the population. For instance, the proportion of households living below the poverty line is a critical measure for understanding socioeconomic disparities. To estimate a proportion, analysts calculate the weighted average of the binary variable. This approach ensures that the estimate accurately reflects the population distribution. As mentioned by @Heeringa2017, by recoding the original response categories into simple indicator variables $y$ with possible values of 1 and 0 (e.g., 1=Yes, 0=No), the estimator for a proportion is defined as follows:

$$
\widehat{p}_d = \frac{\widehat{N}_d}{\widehat{N}} = \frac{\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}} w_{hik}\ I(y_{hik} = d)} {\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}} w_{hik}}
$$

As this defines a nonlinear estimator, we can apply Taylor linearization to obtain the approximate variance of the above estimator by defining the corresponding estimating function as $z_{hik} = I(y_{hik} = d) - \widehat{p}_d$. Many statistical packages provide proportion estimates and standard errors on a percentage scale.

When the target proportions are close to 0 or 1, special methods are used to ensure confidence intervals remain meaningful; notice that the limits of the traditional symmetric normal confidence intervals may fall outside the permissible range for proportions. This would have no interpretation due to the nature of the parameter. To address this issue, alternative confidence interval estimates, as proposed by @Rust2007ConfidenceIF and @DeanPagano2015 are available. One alternative based on using the logit transformation of the estimated proportion is:

$$
CI \left( \widehat{p}_d \ ; \ 1 - \alpha \right) = \frac {exp \left[ ln \left( \frac{\widehat{p}_d} {1 - \widehat{p}_d} \right) \pm \frac{t_{1-\alpha/2 , \, df} \times se \left( \widehat{p}_d \right)} {\widehat{p}_d \left( 1 - \widehat{p}_d \right) } \right]} {1 + exp \left[ ln \left( \frac{\widehat{p}_d} {1 - \widehat{p}_d} \right) \pm \frac{t_{1-\alpha/2, \, df} \times se \left( \widehat{p}_d \right)} {\widehat{p}_d \left( 1 - \widehat{p}_d \right)}\right]}
$$


## Totals, means and ratios

In household surveys, analyzing numerical data often involves estimating key descriptive measures such as means, totals, and ratios. These measures summarize important characteristics of the population and provide valuable insights for decision-making. The estimation process can be applied to the entire population or specific subgroups, depending on the research objectives. As mentioned by @Heeringa_West_Berglund_2017, the estimation of population totals or averages for a variable of interest, along with the estimation of corresponding variances, has played a crucial role in the development of probability sampling theory. 

The estimation of population totals is a fundamental task in survey analysis. Note that population means, proportions and ratios are all dependent on population totals. A total represents the sum of a specific variable (e.g., total income or total expenditure) across the entire population. For example, if the goal is to estimate the total income of all households in a country, we combine data from the sample using weights that account for the survey design and ensure representativeness. For single numeric survey variables, the simplest estimates are for totals and means. Ratios are often used to obtain summaries that relate two numeric variables. Estimates for such parameters can be obtained either for the entire population or disaggregated by domains of interest, depending on the research needs. 

Once the sampling design is defined, which was done in the previous section, the estimation process for the parameters of interest is carried out. For the estimation of totals with complex sampling designs that include stratification $\left(h=1,2,...,H\right)$ and subsampling in PSUs (assumed to be within stratum $h$) indexed by $i=1,2,...,m_h$, the estimator for the population total can be written as:

$$
\widehat{Y} = \sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}} w_{hik} \ y_{hik}
$$

Under full response, the Ultimate Cluster variance estimator for $\widehat{Y}$ was provided in section 9.2. Modern statistical tools, such as the `survey` package in R, make it straightforward to calculate totals and their associated uncertainties.

The confidence interval of level $1 - \alpha$ for the population total $Y$ is given by:

$$
\widehat{Y} \pm z_{1 - \alpha/2} \times \sqrt{\widehat{V}_{UC} \left( \widehat{Y}\right)}
$$

with $z_{1 - \alpha/2}$ denoting the quantile of the Gaussian distribution leaving an area of ${\alpha/2}$ to its right.

Population means, or averages, are also very important and provide an understanding of the central tendency of a variable. For instance, the average income of households can indicate the general economic well-being of a population. A mean is calculated as the total of a variable divided by the population size. Since estimating a mean involves both totals and population sizes, the accuracy of a mean estimate depends on the accurate estimation of both components. Specialized techniques, such as resampling methods or Taylor linearization, are used to estimate the uncertainty associated with means. The estimation of the population means is a very important task in household surveys. An estimator of the population mean can be written as the ratio of two estimated population totals, as follows:

$$
\widehat{\overline{Y}} = \frac{\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}} w_{hik} \ y_{hik}} {\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}} w_{hik}} = \frac{\widehat{Y}}{\widehat{N}}.
$$

Since $\widehat{\overline{Y}}$ is a nonlinear estimator, there is no closed-form formula for exact the variance of this estimator. For this reason, either resampling methods or Taylor series approximations must be used. The latter may be achieved remembering that for the survey mean the sampling estimating equation requires defining $\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}} w_{hik} (y_{hik} - \theta) = 0$, therefore we can apply the variance estimator given in section 9.2 with $z_{hik} = y_{hik} - \widehat{\overline{Y}}$.

Ratios provide insights into the relationship between two variables. For example, the ratio of household expenditures to income can reveal patterns in spending behavior. A ratio is calculated by dividing one total by another, such as total expenditures by total income. The accuracy of a ratio depends on the precise estimation of both totals. Ratios are particularly useful for creating indicators that help compare groups or track progress over time. As another example, SDG indicator N.2.1.1 is defined as the prevalence of undernourishment. This indicator can be estimated using a ratio of two continuous variables: food consumption (measured in calories or energy intake) and dietary energy requirements (calculated based on factors like age, sex, and physical activity level). 

Since a ratio is the quotient of two estimators of totals, both the numerator and the denominator are unknown quantities and thus need to be estimated. The point estimator for a ratio in complex surveys is the quotient of the estimators for the totals, as defined by:

$$
\widehat{R} = \frac{\widehat{Y}}{\widehat{X}}
= \frac{\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}}  w_{hik} \ y_{hik}}{\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}}  w_{hik} \ x_{hik}}
$$

For variance estimation, all you need to do is specify the estimating function as $z_{hik} = y_{hik} - \widehat{R} \ x_{hik}$, when $y$ and $x$ are the numerator and denominator variables, respectively, and apply the variace estimator given in section 9.2.

## Correlations

Correlation analysis is a useful method for understanding the relationship between two numeric variables in survey data. For example, you might be interested in knowing whether household income and expenditure are related, and if so, how strongly. The Pearson correlation coefficient is commonly used to measure this relationship as it quantifies the strength and direction of a linear relationship between two variables. Its value ranges from -1 to 1:

- A **positive value** indicates that as one variable increases, the other also tends to increase;

- A **negative value** indicates that as one variable increases, the other tends to decrease;

- A value close to **zero** suggests little to no linear relationship between the variables.

When analyzing survey data, the correlation is estimated using the survey weights. These weights ensure that the estimated correlation reflects the relationships in the entire population, not just the sample. Weighted correlations adjust for the complex survey design, accounting for stratification, clustering, and unequal probabilities of selection. To compute the correlation coefficient, we look at how the variables vary together (their covariance) and normalize this by their individual variations. This normalized measure ensures the correlation is unaffected by the units of measurement of the variables, making it easier to interpret.

The Pearson correlation coefficient between two numeric survey variables, say $x$ and $y$, can be estimated using

$$
\widehat{\rho}_{xy} = \frac {\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}}  w_{hik} \ \left( y_{hik} - \widehat{\overline{Y}} \right) \left( x_{hik} - \widehat{\overline{X}} \right)} {\sqrt{\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}}  w_{hik} \ \left( y_{hik} - \widehat{\overline{Y}} \right)^2} \sqrt{\sum_{h=1}^{H}\sum_{i \in s_{1h}} \sum_{ k \in s_{hi}}  w_{hik} \ \left( x_{hik} - \widehat{\overline{X}} \right)^2}}
$$

Modern statistical software, such as R, provides functions to calculate weighted Pearson correlation coefficients directly. Tools like the `survey` package ensure that the correlations are estimated correctly, accounting for the survey design. This allows analysts to obtain accurate and meaningful measures of association.

## Percentiles and inequality measures

Percentiles and quantiles are useful tools for analyzing the distribution of data beyond just the average. These measures divide data into segments to show how values are spread. For example, the 10th percentile indicates the value below which 10% of the data falls, while the median (50th percentile) divides the data into two equal halves. These measures help describe not only central tendencies but also the spread and variation within a dataset. For instance, identifying the top 10% of income earners might guide tax policy, while finding the bottom 15% could inform subsidy programs. The estimation of percentiles relies on the cumulative distribution function (CDF), which represents the proportion of the population with values less than or equal to a given number. Once the CDF is calculated using survey data and weights, percentiles and quantiles can be derived. The CDF for a variable $y$ in a finite population of size $N$ is defined as follows:

$$
F(t) = \frac{1}{N}\sum_{h=1}^{H}\sum_{i \in U_{1h}} \sum_{ k \in U_{hi}}  I(y_{hik} \leq t) 
$$

Where $I(y_{hik} \leq x)$ is an indicator variable taking the value 1 if $y_{hik}$ is less than or equal to a specific value $t$, and 0 otherwise. An estimator of the CDF in a complex sampling design is given by:

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

Quantiles are inherently nonlinear measures, making their variance estimation more complex. @kovar1988bootstrap present results from a simulation study where they recommend using the *Balanced Repeated Replication* (BRR) technique.

Economic inequality is a critical area of focus for governments and international organizations. The **Gini coefficient** is a widely used measure to quantify inequality in income or wealth distributions. It is derived by comparing the income distribution of a target population to a perfectly equal distribution. In household surveys, it is calculated using weights that account for the survey design, ensuring representativeness. A normalized version of these weights is often used to simplify the calculations. The Gini coefficient ranges from 0 to 1, where 0 indicates perfect equality (everyone has the same income) and values closer to 1 indicate greater inequality. The Gini coefficient is critical for tracking changes in income distribution over time and comparing inequality levels across regions or countries.

Following the estimating equation proposed by @binder1995estimating, the estimator for the Gini coefficient is given by:

$$
\widehat{G} = \frac {2 \times \sum_{h=1}^{H} \sum_{i \in s_{1h}} \sum_{k \in s_{hi}}  w_{hik}^{*} \widehat{F}_{hik} \ y_{hik} - 1} {\widehat{\overline{Y}}}
$$

where $w_{hik}^{*}$ is a normalized sampling weight, defined as

$$
w_{hik}^{*} = \frac{w_{hik}} {\sum_{h=1}^{H} \sum_{i \in s_{1h}}  \sum_{k \in s_{hi}} w_{hik}}
$$

and $\widehat{F}_{hik}$ represents the estimated CDF for individual $k$ in cluster $i$ of stratum $h$. @osier2009variance and @Langel_Tille_2013 provide important computational details for estimating the variance of this complex estimator.

## NSO – Practical example

In this subsection a NSO will share how they do disseminate its results on basic descriptive statistics, how they publish the resulting tables and how do they deal with the suppression of estimates that do not reach expected quality. 

