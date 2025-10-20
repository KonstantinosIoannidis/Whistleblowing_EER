## Description

This repository includes the data and the Stata code used in Ioannidis K. (2025). Whistleblowing and competition: A replication and extension of Butler et al. (2020).

### Abstract

We replicate and extend the whistleblowing game of Butler et al. (2020). Our conceptual replication reproduces the main qualitative result: roughly one quarter of employees blow the whistle, while most remain silent. We extend the design with a Competition treatment to test whether market pressure affects ethical behaviour. Across two independent participant pools (the Universities of Birmingham and Cambridge), competition slightly reduces whistleblowing and marginally increases lawbreaking, but these effects are small and statistically weak. However, competition affects behaviour differently across the two participant pools, underscoring the importance of replication for assessing the generalisability of experimental findings and for identifying when, if at all, competition influences whistleblowing.
### Software

The analysis was conducted using ```Stata 18```.

### Files

The files are stored in two folders: Data, which contains data from the experiment, and Stata, which contains the Stata code to produce every result in the paper.

1. Data
   * Experimental Data.csv (*The raw data from the experiment in csv format*)
   * Experimental Codebook.md (*Codebook for ```Experimental Data.csv```*)
2. Stata
   * Data Analysis.do (*Calls and executes all other files*)
   * Prepare Data.do (*Cleans raw experimental data and prepares it for analysis*)
   * Treatment Effects.do (*Produces Result 1-3 in Section 3*)
   * Appendix Results.do (*Produces results in Subsection A.2*)
   * Additional Treatments.do (*Produces results in Subsection A.3*)

### Instructions
To run the code, you only need to run **Data Analysis.do**.

## Contributing

**[Konstantinos Ioannidis](https://konstantinosioannidis.github.io/)** 
For any questions, please email me here **ioannidis.a.konstantinos@gmail.com**.
