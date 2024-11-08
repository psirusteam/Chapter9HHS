# Data visualization

In this section we discuss how to present data and estimates resulting from household surveys using graphics. While standard plots can still be used to show distributions and associations from the raw (unweighted) sample data, these can be misleading for the corresponding population distributions and associations. Therefore it is recommended that modified plots that account for survey weights be used instead. In addition, regarding the display of survey estimates, which are subject to sampling error, it is important to convey this message by presenting not only point estimates, but also standard errors or confidence intervals.

Graphs are important for the exploratory analysis of the survey data, for the diagnostics of fitted models and for the presentation of results. However, often the sample data sets are very large. In addition, sampling units typically have different weights. These two difficulties may cause standard graphs to fail in facilitating the analysis or presentation.

## Graphs and sampling weights

When the survey units have different sampling weights, these should be taken into account when preparing graphs with their data. The main reason is that weights can be interpreted as the number of population units that each sample unit represents. Hence, it is evident that unequal weights need to be considered in the elaboration of graphs based on such sample data.

## Graphs for categorical data

When the data of interest are categorical, their descriptive analysis will be done using contingency tables. Then simple graphs like bar charts can be done using as input contingency tables produced with weighted counts. Ideally one should also aim to display error lines overlaying bars to indicate their respective confidence interval widths, thus conveying the uncertainty of the corresponding point estimates. Obtaining the weighted counts or proportions and their confidence intervals can be easily done using tools from several software packages, e.g. the `survey` package in R.

As an example, the bar chart presents a comparison of the number of individuals (`Nd`) between rural and urban zones, with error lines indicating the confidence intervals for each estimate. According to the values in the table, the urban zone shows a slightly higher `Nd` value than the rural zone, with 78,164 individuals in the urban area compared to 72,102 in the rural area. This difference suggests a higher concentration of people in the urban zone.

The confidence intervals allow us to assess the precision of these estimates. In the rural zone, the confidence interval ranges from 66,039 to 78,165 individuals, while in the urban zone, the confidence range goes from 72,526 to 83,802 individuals. This overlap between the intervals indicates that, although the urban zone has a higher number of individuals, the difference is not pronounced enough to be statistically significant.

Furthermore, the standard deviation of `Nd` is 3,062 for the rural zone and 2,847 for the urban zone, reflecting similar variability in both zones. This suggests that the estimates are consistent in terms of relative uncertainty, without major differences in data dispersion between the zones.

\begin{figure}
\includegraphics[width=33.33in]{www/05_graficas/03_bar_pers} \caption{Distribution of Population Income}(\#fig:barIncome)
\end{figure}

| Zone  | Number of Individuals (Nd) | Standard Error (Nd_se) | Lower Limit (Nd_low) | Upper Limit (Nd_upp) |
|--------------|----------------|--------------|--------------|--------------|
| Rural | 72,102                     | 3,062                  | 66,039               | 78,165               |
| Urban | 78,164                     | 2,847                  | 72,526               | 83,802               |

: Population distribution by area

## Histograms

Histograms serve to present the distribution of a single numeric (continuous) survey variable or response. If one had a census, then the histogram is a powerful tool to describe the underlying distribution, even for very large datasets. When displaying sample data, however, the sampling weights must be taken into account when estimating frequencies or relative frequencies of population units having values in the specified histogram bins. Modern survey analysis tools can easily provide weighted histograms where the sampling weights are incorporated.

Histograms are the precursors to density function estimates, and the later can be thought of as histograms with very large number of bins. The `survey` package in R provides functions that can plot smoothed density estimates obtained accounting for the sampling weights.

### Graphical Analysis with Survey Tools

Once the database containing the sample is available and the sampling design has been defined, initial visual analyses can be conducted. It is recommended to begin with graphical analyses that, thanks to the principle of representativeness, reflect the behavior of continuous variables not only in the obtained sample but also in the study population, using sampling weights for sample expansion.

A common example of visualization in this type of analysis is the use of histograms to represent the distribution of variables such as income. These charts allow us to observe the distribution of the variable of interest in the expanded population and to understand its shape, dispersion, and general trends.

It is also common to perform graphical analyses broken down by subgroups, such as geographic areas (urban and rural) or thematic characteristics like gender (male and female). This approach helps identify key differences among specific population subgroups, for instance, by examining income distribution in men and women over the age of 18. Such breakdowns help visualize and communicate potential gaps between subgroups of interest.

In this way, charts help to communicate results in an accessible manner, offering a clear and straightforward visual representation for audiences who may not be familiar with the technical details of estimation methods.

In \@ref(fig:histIncome) the horizontal axis (x) represents income levels, spanning from 0 to over 4000 monetary units, while the vertical axis (y) indicates frequency, meaning the number of individuals within each income range.

The distribution shows that most of the population is concentrated at lower income levels, with a particularly high frequency near 0. As income levels rise, frequency declines sharply, indicating a right-skewed (positively skewed) distribution with a smaller proportion of people at higher income levels. The light gray bars visually emphasize this concentration at lower incomes, highlighting a significant disparity in the population's income distribution.

\begin{figure}
\includegraphics[width=14.22in]{www/05_graficas/01_hist_ingreso} \caption{Distribution of Population Income}(\#fig:histIncome)
\end{figure}

As an example, Figure \@ref(fig:HistIncomeExpenditureSex) presents two histograms illustrating the distribution of income and expenditure by sex. In the histogram on the left, titled "Income Histograms by Sex," we observe the income distribution, where blue bars represent men and pink bars represent women. The majority of the population, both male and female, is concentrated in the lower income levels, showing a right-skewed distribution. In the lower income levels, there are more men than women, while at higher income levels, the difference is less pronounced.

In the histogram on the right, titled "Expenditure Histograms by Sex," the distribution of expenditure is shown, also broken down by sex. Similar to income, most of the population of both sexes is concentrated in the lower expenditure levels, with a right-skewed trend. There is also a higher proportion of men in the lower expenditure levels, while at higher levels, the representation between sexes is more balanced. These histograms exemplify the similarity in the income and expenditure distributions between men and women, although men appear to be slightly more represented in the lower levels of both variables.

\begin{figure}
\includegraphics[width=33.33in]{www/05_graficas/02_Hist_sex} \caption{Histograms of Income and Expenditure by Sex}(\#fig:HistIncomeExpenditureSex)
\end{figure}

## Box Plots

Box plots are often used to present the distribution of continuous variables. They can summarize large datasets by providing a visual display providing easy visual to identify location, range, variability and outliers. They are great also for enabling comparing distributions across specified grouping variables, such as strata, clusters, etc.

The key to producing such graphs from complex sample surveys is to account for the sampling weights when estimating the location measures that drive the plot, namely the quartiles. Once these have been estimated using the methods described earlier, the resulting box plots will be good depictions enabling analysis of the underlying population distributions.

## Scatter Plots

Scatter plots are the tool of choice to explore relationships between two continuous variables, potentially revealing patterns or trends in the data. These plots face the two challenges discussed above. First one needs to try and convey in the plot that the different sample observations carry different weights. For small to moderate sample sizes this can be done by plotting circles or dots of varying sizes where the symbol size represents the corresponding observation sampling weight. Plots like these can be obtained using standard bubble plot tools or the scatter plot available in the `survey` package in R.

The second challenge, present when there is a large dataset to be displayed, has motivated creation of some alternatives. Two ideas are worth noting. The first one is subsampling. One may choose to select a small to moderate subsample from the full dataset to display. Such a sample should be selected with replacement and with probabilities proportional to the observations sampling weights. Then the resulting smaller dataset can be used to produce a standard scatter plot. The subsample obtained in this way behaves approximately as a simple random sample from the survey population - see @Lumley2010 page 69.

The other alternative is to produce so-called *hexagonal binned scatter plots*. This involves dividing the plot surface into a grid of hexagons and combining all the points that fall into a grid cell into a single plotted hexagon whose shading or size indicates the number of points in the bin. With complex household survey data, the number of points in a hexagonal bin should be replaced by the sum of the weights for points in the bin - see @Lumley2010 page 70.

The third alternative is to avoid the display of the individual data points altogether, but instead produce *smoothed scatter plots*. One idea that can be useful would be to estimate specified quantiles (say the quartiles) of the y-axis (response) variable conditional on the values of the x-axis (predictor) variable, and smooth these across the range of the x-axis. Such plots can easily signal whether the y-variable has any relationship with the x-variable, and suggest the kind of curves that might be useful in summarising or modelling such a relationship - see @Lumley2010 page 71.

As an example in \@ref(fig:ScatterIncome), the following scatterplot is presented, showing the weighted relationship between income and expenditure in a population. In this plot, the size of the points represents the weight assigned to each observation. A high concentration of points is observed at lower income and expenditure levels, suggesting that most of the population has low income and low expenditure. Although there is an upward trend, indicating that income and expenditure tend to increase together, the dispersion of points reveals that higher expenditure is not always associated with proportionally higher income. Some larger points, corresponding to observations with greater weight, are distributed across different levels of income and expenditure without concentrating in a single area. Additionally, a few isolated points at high expenditure levels may represent outliers with considerably higher-than-average expenditure. Overall, this plot suggests a positive relationship between income and expenditure, accompanied by significant variability and some exceptional cases.

\begin{figure}
\includegraphics[width=33.33in]{www/05_graficas/02_scatterplot_ingreso_gasto} \caption{Weighted scatterplot between income and expenditure}(\#fig:ScatterIncome)
\end{figure}

## Maps

Maps are the display of choice to present the behavior of the interest variable across geographical domains. Maps that aim to present how a single response variable behaves can be easily obtained by plotting a summary of the response across the domains. Such a summary (say mean or median) should be an estimate for the corresponding population parameter btained accounting for the sample design and weights.

Secondary survey analysts will may find that the limits of what mapping they can do is the level of geographic detail provided with the survey microdata. Many household sample surveys are design to provide precise estimates at some broad geographic level, say the country or its first level geographic subdivisions, such as states or departments. Lower level geographies are seldom disseminated with the survey microdata due to confidentiality protection constraints imposed.

It is therefore important that statistical agencies conducting the household sample surveys and preparing the dissemination of the corresponding microdata consider carefully which level of geographic detail may be included with public use datasets.

One area which still needs further research is that of providing appropriate means to convey the uncertainty of underlying point estimates when mapping these.

## NSO -- Practical example

In this subsection we will include the experience of a NSO on displaying information through graphics.
