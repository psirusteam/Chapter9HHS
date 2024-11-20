# Introduction {-}

A key concern for every agency that produces statistical information is ensuring the *correct* use of the data it provides. This concern is enshrined in the United Nations *Fundamental Principles of Official Statistics*, particularly in the following principles:

- **Principle 3:** To facilitate a correct interpretation of the data, statistical agencies must present information according to scientific standards, including details on the sources, methods, and procedures used.
- **Principle 4:** Statistical agencies are entitled to comment on erroneous interpretation and misuse of statistics.

This chapter emphasizes empowering users to analyze household survey data accurately. The advent of the computer revolution, coupled with greater access to computational tools, has led to increased use of statistical data, including household survey data. Sometimes this data is used for purely descriptive purposes. Other times, however, its use is made for analytical purposes, involving the testing of hypothesis or the construction of models, when the objective is to draw conclusions that are also applicable to populations other than the one from which the sample was extracted. IHowever, when using standard statistical software for such analyses, results can be biased or misleading if the complex survey design is not properly accounted for.

The primary focus of this chapter is to present relevant models, methods, and software that enable users to incorporate complex survey designs into their analyses effectively. What makes such data special for those who intend to use them for analytical purposes? Household survey data present unique challenges for analytical purposes because they are collected through complex sampling methods that often involve:

- **Stratification**: Dividing the population into comprehensive distinct subgroups before sampling.
- **Clustering**: Grouping sampling units to simplify data collection.
- **Unequal probabilities of selection**: Giving some sampling units a higher chance of being selected than others.
- **Weighting adjustments**: Correcting for non-response and/or improving precision.

Standard data analysis methods and software ignore these features, leading to biased estimates of both the target parameters and their associated variances. In this chapter we analyze the impact of simplifications made when using standard data analysis methods and software, and present the necessary adjustments to these procedures in order to appropriately incorporate the aspects highlighted here into the analysis. 

In section 9.1, a short discussion on the fundamental principles of the design-based inference is presented, emphasizing that conclusions taken from probability sample surveys should be based on a pair: the point estimate and it associated margin of error (or any related measure). In section 9.2, we begin the journey with simple descriptive statistics: means, ratios, proportions and other typical descriptive parameters. Section 9.3 is devoted to more complex parameters that allow comparisons of the phenomenon of interest between subgroups for continuous and discrete variables. In this section we present standard tests to compare means and measure the degree of association between variables, and also consider the problem of correlation and association. Section 9.4 focuses on modelling survey outcomes. We first involve the reader in an discussion on the role of weighting when estimating regression coefficients. Then, we introduce some proper approaches to estimate complex parameters in linear and logistic regression models. Finally, section 9.5 presents a summary of ideas and tools for survey data visualization showing the best practices for creating graphics and maps in a context where uncertainty measures of estimates are important. 

The primary purpose of this chapter is to define and explain the fundamental concepts of the design-based paradigm in household surveys and demonstrate how to analyze complex household survey data. Throughout the chapter, national experiences are highlighted to illustrate how National Statistics Offices (NSOs) manage different stages of household survey data analysis. These practical examples provide a useful guide for applying the concepts and methods discussed in real-world contexts.

By the end of the chapter, readers will be equipped with the knowledge and tools needed to analyze household survey data effectively while accounting for the complexities of survey design.
