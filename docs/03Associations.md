# Associations between categorical variables

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
