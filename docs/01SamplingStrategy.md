# The golden pair: sample design and estimator

Defining the survey design is crucial for analyzing complex survey data. We must make sure that PSU, strata, and weights are available in the database. When not available, the database should contain replicate weights, or the researcher should have a valid expression to compute variance estimates. Defining the sample design is crucial for design-based inference and analysis, ensuring accuracy, precision, and consistency. A well-defined survey design facilitates statistical analysis, supports effective data interpretation, and enables meaningful insights into complex phenomena. 

## Parameters and estimators

Based on the design-based approach this section will discuss the basic principles of inductive inference and how, using the sampling weights (from chapter 8), we can get unbiased estimators for population parameters, with a special focus on totals and means. 

## Uncertainty in household surveys

As the sample is a small subset of the population, we show the importance of generating not only point estimates, but also related uncertainty measures. In this subsection we will present some approaches for variance estimation: exact and approximate formulas (ultimate cluster) for variances of totals; and Taylor linearization for means, ratios and other parameters. We also introduce replication methods and generalized variance functions, which are essential in the cases when PSU or strata are missing from the database.

## Using software to generate valid inferences

In this part, we advocate to using specialized statistical software to generate efficient estimation processes. Those packages support complex survey data analysis by specifying the survey design using appropriate commands or functions.




