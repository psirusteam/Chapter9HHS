# Planning Analysis

Planning the analysis stage of a survey is an essential part of the overall survey planning process. Following the **Generic Statistical Business Process Model (GSBPM)** (<https://unece.org/statistics/documents/2019/01/standards/gsbpm-v51>), this step corresponds to the subprocess labeled as *2.1 - Design Outputs*. At this stage, it is important to distinguish between two groups of analysts: primary data producers and secondary data users.

Proper planning and understanding of the survey design are crucial for both primary data producers and secondary data users. For primary data producers, creating a comprehensive tabular plan ensures alignment with survey objectives. For secondary users, clear research questions and attention to survey metadata enable accurate and meaningful analyses. 

## Primary data producers

They are responsible for planning and executing the survey to collect the intended data. For them, planning the analysis typically involves preparing a *tabular plan* — a document specifying the core set of tables to be produced once the survey data becomes available. This plan helps to ensure that the survey results align with the stated needs and objectives of the survey (see chapter 2).

Preparing a *tabular plan* generally requires defining three sets of specifications:

1. **Filter Conditions**: These may be used to define subgroups of the population for which specific tables will be produced. For example, in a survey where questions regarding occupation are asked only from individuals aged 15 or older, a filter condition might be 'if age \> 14'. Such a condition means that only those in the relevant age group would be included in tables for the occupation related variables (status, type, income, etc.).
   
2. **Classification or Domain Variables**: These are variables used to subdivide the population into meaningful groups for analysis. For example, geographic areas (e.g., states or provinces), age groups, or sex might define rows in a table. These variables are often chosen to meet reporting requirements, such as providing estimates by province in national household surveys. A typical list of domain defining variables would include: geographic levels (provinces, etc.); type of region (urban x rural); sex; age groups; education; race / etchnicity; etc.
   
3. **Response or Survey Variables**: These are the variables being analyzed to understand how they vary across the defined domains. For instance, continuous survey variables (like income) might be used to create columns in a table, summarizing means, medians, or other statistics. These variables are all others that we do not use as classification ones. Categorical survey variables (like employment status) will generate a column for each category where the corresponding cross-classified frequencies will appear, with one row for each of the classes of the domain defining variables.

An important consideration when defining domains has to do with sample design, namely when defining strata and sample sizes. For most national household sample surveys, providing breakdown by province or state is required, and therefore stratification by provinces will be essential. Also, if precision requirements must be satisfied at the province level, then sample sizes that meet such requirements must be computed by province and then summed to obtain the country level sample size.

For domains defined by characteristics that are unavailable from the sampling frame, say age groups, for the case of household surveys that use area sampling, sample size calculations must take into account what the required total sample size must be such that estimates for the rarest group meet precision specifications. As an example, suppose that estimates are required by age groups such as young adults (18 to 29), adults (30 to 49), ageing adults (50 to 59) and elderly (60 and over). Assuming that the population distribution by these age groups is such that the ageing adults is the rarest group with 12.5% of the total population, and if a minimum sample size of 500 individuals in this group is required, then the total sample must be at least 500 / 0.125 = 4,000. That is, in order for the full sample to provide an expected sample of about 500 ageing adults we must sample at least 4,000 individuals for the survey.


## Secondary Data Users


Secondary data users are all those who will access and analyze the survey data after it has been released, typically with access to only the public datasets and documentation provided by the data producers. Their first task is to define clear research questions and locate the relevant survey data and documentation (metadata). Good survey metadata must describe the sampling design and estimation methods used (including details about stratification, clustering, and survey weights), both for descriptive parameters and for the corresponding measures of precision.

For example, based on the aforementioned, a well-defined research question posed by some secondary data user, can be such as **"Do rural households face digital exclusion compared to urban households?"**. Notice that it directs the analysis towards estimating relevant parameters and precision measures.

The question might involve testing whether the proportion of rural households with internet access is significantly lower than that of urban households. This clarity allows for more direct and accurate analyses. The null hypothesis behind this question is that $H_0) P_{Rural} = P_{Urban}$, which we wish to test against the alternative $H_A) P_{Rural} < P_{Urban}$, where $P$ denotes the proportion of households having internet access in the domain identified. 

A related but different set of hypothesis could be $H_0) C_{Rural} = C_{Urban}$ versus $H_A) C_{Rural} > C_{Urban}$ where $C$ denotes the average cost of connection for internet access in the specified domain. Listing the research questions in this way would enable the subsequent analysis to progress more directly towards the estimation of the relevant parameters from the survey data, and corresponding precision measures, both of which are required to compute test statistics that would provide the evidence required to answer them.

But in order for such estimation to take place, the secondary data user will first have to find out details about how the sampling and estimation were done for the particular survey at hand. As we will discuss in subsequent sections of this chapter, it is essential to account for the survey weights when computing point estimates of both descriptive or model parameters, and to account for structural components of the sampling design and estimation process (stratification, clustering, unequal inclusion probabilities, non-response adjustment and calibration of survey weights, if any) when estimating variances or other measures of precision of the point estimates.

Users that disregard such aspects of the sampling design do so at their peril, and may end up producing biased estimates that will lead to incorrect inferences and decisions. The recommended practice is for data producers to provide sufficient detail about such sampling aspects as part of the metadata released with survey microdata, in order to enable secondary data users to consider these aspects when conducting their analyses of interest.

### Quality Control for Secondary Analysts

A standard quality control step for secondary data analysts would consist of the following steps:

1. **Load the Data and Metadata**: Ensure that the survey microdata is properly linked to metadata describing the sampling design and estimation processes;

2. **Replicate Published Estimates**: Recreate some of the estimates provided by the survey producers, including measures of precision, to confirm that the data and design have been correctly interpreted and loaded;

3. **Compare Scenarios**: When the analyst is capable of replicating published estimates, she can then proceed towards the required new analysis for which no previous results are available. Repeat this analysis under two scenarios: ignoring and accounting for the sampling design. Compare the results and assess the impact of incorporating the sample design;

4. **Finalize the Analysis**: Use only the results that account for the sampling design in the final interpretation, ensuring that the design effects are appropriately incorporated.
