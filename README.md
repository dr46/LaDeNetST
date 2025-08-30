'LaDeNetST: Language Development Networks and Screen Time'
================

## Introduction

This the README file for the project *LaDeNetST: Language Development Networks and Screen Time* which was created to document the paper entitled **"Dense Connectivity in Networks of Red-Flag Language Milestones Among High Screen-Time Children"**. The manuscript was prepared for submission and subsequently submitted to [*Child Development*](https://srcd.onlinelibrary.wiley.com/journal/14678624) journal in September 2025.

This project has been produced to allow reproducibility and validation [(Berg, 2018)](https://doi.org/10.1126/science.aat8121). The project was also designed to promote reusability and recyclability. As shown below, we provide the R source code, figures, tables, and the necessary meta-information to enable replication and verification of our analysis. To support reproducibility when using randomly generated data or models, we have set random seeds. All the information presented here is also available in the file [README.pdf](README.pdf) and [README.html](README.html). This project is distributed under the terms of the [GNU General Public License (GPL) 3.0](LICENSE).


Please note that this project will be uploaded and regularly updated across three different platforms: the [Open Science Framework (OSF)](https://osf.io/), [GitHub](https://github.com/) and [Zenodo](https://zenodo.org/). The following identifiers can be used to locate the project information on the aforementioned platforms:

-   OSF: <https://osf.io/7jyd6/?view_only=3d246e5cd90749b9bdf6db1bf69e33f7>. The link provided is a blind link intended to support anonymous peer review. It will be replaced with a public link upon acceptance or publication of the project. A DOI will be generated once the project is made publicly available.
-   GitHub: *The repository on that platform will remain private until the project is accepted or published, in order to preserve the integrity of the blind peer-review process.*
-   Zenodo: *The repository on that platform will remain private until the project is accepted or published, in order to preserve the integrity of the blind peer-review process.*

**Warning!** The file links are configured to function correctly within the GitHub repository environment or after downloading the entire project and opening it locally. Consequently, none of the links will work within the [README.pdf](README.pdf) or [README.html](README.html) when open in the OSF website.

### Project structure overview

There are four key files in this project: a) the [README](README.md) file (this file, as said before, comes in two different formats -- [.pdf](README.pdf), and [.html](README.html)), b) the [nsch23.rds](dat/nsch23.rds) file, which contains the raw data, c) the [STnets_vmap.xlsx](dat/STnets_vmap.xlsx) file which contains the variable dictionary to correctly interpret the processed data, and d) the [workflow_LaDeNetST.R](workflow_LaDeNetST.R) which is considered the R master file of the project. The file [workflow_LaDeNetST.R](workflow_LaDeNetST.R) serves as the main entry point for executing all R source code files included in the project. Accordingly, it is considered the trigger for the statistical analysis workflow, generating figures, tables, and intermediate datasets.

The project is organized into five folders (or directories). The **root** directory (*LaDeNetST*) contains the entire project structure and serves as the central location for all files and subdirectories. Below is a brief description of the contents of each folder in the project:

-   The **dat** folder contains the main raw data file [nsch23.rds](dat/nsch23.rds). This directory also serves as the destination for intermediate datasets to be analyzed throughout the workflow.
-   The **stx** folder contains all R source code files. As an exception, the master file (the [workflow_LaDeNetST.R](workflow_LaDeNetST.R) file) is not contained into this folder but in the root directory of the project. As can be observed, the file names in this directory reflect the sequence of the workflow, indicating their role in the overall analysis process [(van Vliet, 2019)](https://doi.org/10.48550/arXiv.1904.06163).
-   The **fig** folder contains figures.
-   The **tab** folder contains results tables.
-   The **fun** This folder contains functions specifically designed to perform individual analyses within the project.

Below is a brief description of each individual file included in the project. Files are categorized based on the type of information they contain, in accordance with the folder structure outlined above. Additionally, a complete list of all project files is available in the file [Folders and Files Map](Folders_Files_Map.md). To gain a clearer understanding of the workflow, it is recommended to consult the [Scripts Table](scripts_table.md). This file is also available in HTML format: [scripts_table.html](scripts_table.html).

Since the raw data were divided into two subsamples to separately analyze children aged 1–2 and children aged 3–5, a consistent naming convention was applied to certain files (e.g., intermediate datasets, tables, and figures). Specifically, the string '*12*' refers to files related to children aged 1–2, while '*35*' refers to those related to children aged 3–5.

### R packages needed to run source code

Several R packages are used to perform the data analysis. These packages are loaded within the script files listed below and are *detached* by restarting the R session after each file is processed. Below is the list (by alphabetical order) of packages required to run this project in R:

-   bootnet ([Epskamp et al., 2018](https://doi.org/10.3758/s13428-017-0862-1))
-   dplyr ([Wickham et al., 2023](https://CRAN.R-project.org/package=dplyr))
-   ggplot2 ([Wickham, 2016](https://doi.org/10.1007/978-3-319-24277-4))
-   gt ([Iannone et al., 2025](https://CRAN.R-project.org/package=gt))
-   gtsummary ([Sjoberg et al., 2021](https://doi.org/10.32614/RJ-2021-053))
-   igraph ([Kolaczyk & Csárdi, 2020](https://doi.org/10.1007/978-3-030-44129-6))
-   labelled ([Larmarange, 2025](https://CRAN.R-project.org/package=labelled))
-   MASS ([Venables & Ripley, 2002](https://doi.org/10.1007/978-0-387-21706-2))
-   patchwork ([Pedersen, 2025](https://CRAN.R-project.org/package=patchwork))
-   powerly ([Constantin et al., 2023](https://doi.org/10.1037/met0000555))
-   purrr ([Wickham & Henry (2025)](https://CRAN.R-project.org/package=purrr))
-   qgraph ([Epskamp et al., 2012](https://doi.org/10.18637/jss.v048.i04))
-   rstatix ([Kassambara, 2023](https://CRAN.R-project.org/package=rstatix))
-   stringr ([Wickham, 2023](https://CRAN.R-project.org/package=stringr))
-   tibble ([Müller & Wickham, 2023)](https://CRAN.R-project.org/package=tibble)
-   tidyr ([Wickham et al., 2024](https://CRAN.R-project.org/package=tidyr))

[R version 4.4.2](https://cran.r-project.org/bin/windows/base/old/4.4.2/) (2024-10-31 ucrt, "Pile of Leaves") was used in this project. The required packages are loaded at the beginning of each source code file and detached at the end by restarting the R session. To understand the specific role each package plays within the workflow, it is recommended to consult the file [Scripts Table](scripts_table.md). This project also includes an HTML version of the corresponding file ([scripts_table.html](scripts_table.html)).

## Data Files

### Language Development variables 
[a12.rds](dat/a12.rds) and [a35.rds](dat/a35.rds)

These files include an identification column (*id*) along with the language variables analyzed for children aged 1–2 ([a12.rds](dat/a12.rds)) and 3–5 ([a35.rds](dat/a35.rds)). Binary variables are coded to indicate whether a child experiences difficulty (value = 1) in achieving the linguistic milestone represented by the item. Ordinal variables are coded to reflect the degree of difficulty a child faces in reaching the milestone, with higher values indicating greater challenges. Further details about the coding scheme can be found in the file [STnets_vmap.xlsx](dat/STnets_vmap.xlsx).


### Standardized Language Assessment Items 
[a12_c.rds](dat/a12_c.rds) and [a35_c.rds](dat/a35_c.rds)

These files contain standardized language assessment items, stratified by age, sex, and caregivers' education level. File [a12_c.rds](dat/a12_c.rds) corresponds to children aged 1–2, while file [a35_c.rds](dat/a35_c.rds) corresponds to children aged 3–5. Each file also includes a unique child identifier (*id* column) and a classification variable (*c12* column) that groups children based on the degree of screen time reported.


### Initial Bootstrapped Networks 
[boots.12.RData](dat/boots.12.RData) and [boots.35.RData](dat/boots.35.RData)

These files contain the bootstrapped initial network estimates for children aged 1–2 ([boots.12.RData](dat/boots.12.RData)) and children aged 3–5 ([boots.35.RData](dat/boots.35.RData)). File [boots.12.RData](dat/boots.12.RData) contains a two-element list named *boot12*, and file [boots.35.RData](dat/boots.35.RData) contains a similar list named *boot35*. Each list contains the bootstrapped network estimates for the corresponding age group, further partitioned by screen time. A total of 1,000 repetitions were performed in each bootstrap simulation.

### Sample Partition Files 
[c12.rds](dat/c12.rds) and [c35.rds](dat/c35.rds)

These files are two-column data frames containing:

- *id*: A unique identifier for each child in the sample.
- *group*: A categorical variable indicating the sample partition based on age and screen time.

The partitions are defined as follows:

- Children aged 1 to 2 years ([c12.rds](dat/c12.rds)).
- Children aged 3 to 5 years ([c35.rds](dat/c35.rds)).

Each age group is further divided according to screen time exposure, allowing for stratified analyses in the research paper.

### Centrality Stability Analysis 
[CS-data.RData](dat/CS-data.RData)

This file contains an R environment with results from the centrality stability analysis. It includes six lists:

- *cs12* and *cs35*: Each is a two-element list corresponding to the two networks estimated for the low and high screen time partitions in the 1–2 years and 3–5 years age groups, respectively.

  - Each network is represented by a ten-element list containing bootstrapped correlations for centrality statistics:
      - Strength.
      - Closeness.
      - Betweenness.
      - Expected Influence.
      
    These correlations compare the full-sample network with networks estimated from 1,000 resampled datasets, each with a different proportion of randomly removed cases: 95%, 87.2%, 79.5%, 71.7%, 63.9%, 56.1%, 48.3%, 40.5%, 32.8%, and 25%. 

- *cs12Sum* and *cs35Sum*: Summary lists for *cs12* and *cs35*, respectively. For each centrality statistic, they provide:

  - Mean correlation
  - 95% confidence interval across the different proportions of case deletion.
  
- *cs.coef.t12* and *cs.coef.t35*: These lists contain the centrality stability coefficients, *CS*(cor = 0.7), for each network as defined by [Epskamp et al., (2018)](https://doi.org/10.3758/s13428-017-0862-1).

### Preliminary Network Estimations 
[Nets12.RData](dat/Nets12.RData) and [Nets35.RData](dat/Nets35.RData)

These files contain preliminary network estimations and node feature summaries for children segmented by age group and screen time exposure.

#### Contents:

- *nets.12* (in [Nets12.RData](dat/Nets12.RData)) and *nets.35* (in [Nets35.RData](dat/Nets35.RData)): Each is a two-element list containing networks estimated using the estimateNetwork() function from the bootnet R package ([Epskamp et al., 2018](https://doi.org/10.3758/s13428-017-0862-1)).

  - *nets.12*: Networks for children aged 1–2 years, segmented by low and high screen time.
  - *nets.35*: Networks for children aged 3–5 years, segmented similarly.
These networks are considered preliminary because the estimation algorithm flagged them as dense regularized networks, indicating potential overfitting or instability.

- *nf.12* (in [Nets12.RData](dat/Nets12.RData)) and *nf.35* (in [Nets35.RData](dat/Nets35.RData)): Each is a two-element list summarizing node characteristics used for network visualization. Each element is a data frame with the following columns:

  - *nl12* / *nl35*: Node label (i.e., item name).
  - *cp12* / *cp3*5: Indicates whether the item assesses productive or receptive language skills.
  - *ufc12* / *ufc35*: Classification of each item according to the use, form, and content dimensions of language assessment [(Bloom & Lahey, 1978)](https://doi.org/10.7916/D8QZ2GQ5).
  - *ld12* / *ld35*: Fine-grained classification of language dimensions—discourse, lexicon, phonology, pragmatics, and semantics—based on [Conti-Ramsden & Durkin (2012)](https://doi.org/10.1007/s11065-012-9208-z).


### Node Feature Tables
[nf12.csv](dat/nf12.csv) and [nf35.csv](dat/nf35.csv)

These files contain tabular data specifying the language dimension associated with each item (node) in the networks.

- *nf12.csv*: Corresponds to networks estimated for children aged 1–2 years.
- *nf35.csv*: Corresponds to networks estimated for children aged 3–5 years.

Each file includes the following columns:

- *nl12* / *nl35*: Node label (i.e., item name).
- *cp12* / *cp35*: Indicates whether the item assesses productive or receptive language skills.
- *ufc12* / *ufc35*: Classification of each item according to the use, form, and content dimensions of language assessment [(Bloom & Lahey, 1978)](https://doi.org/10.7916/D8QZ2GQ5).
- *ld12* / *ld35*: Fine-grained classification of language dimensions—discourse, lexicon, phonology, pragmatics, and semantics—based on [Conti-Ramsden & Durkin (2012)](https://doi.org/10.1007/s11065-012-9208-z).


### Raw Data File
[nsch23.rds](dat/nsch23.rds)

This file contains the main raw dataset used in the project:

- Sample size: 55,162 observations
- Number of variables: 456

The file includes a single R object named *nsch23*, which was imported from the [SAS Topical Data and Input Files](https://www.census.gov/programs-surveys/nsch/data/datasets.html) files provided by the [United States Census Bureau](https://www.census.gov/en.html). It contains data collected during the 2023 wave of the [National Survey of Children's Health (NSCH)](https://www.census.gov/nsch).

This dataset serves as the foundation for all subsequent analyses and network estimations in the project.


### Final Analytical Dataset
[rt1.csv](dat/rt1.csv), [rt1.rds](dat/rt1.rds), and [rt1_2.csv](dat/rt1_2.csv)

These files contain the final dataset analyzed in this study:

- Sample size: 16,914 observations
- Number of variables: 38
The dataset was derived from the T1 form (designed for children aged 0–5 years) within the [nsch23.rds](dat/nsch23.rds)s file. However, children aged 0 years were excluded to focus on the target age range.

To facilitate data sharing and visualization on platforms like OSF, the dataset is provided in three formats:

- [rt1.csv](dat/rt1.csv): Comma-separated values (standard CSV format)
- [rt1_2.csv](dat/rt1_2.csv): Semicolon-separated values (for compatibility with certain regional settings)
- [rt1.rds](dat/rt1.rds): R-native serialized format
The dataset includes variables related to language development and socio-demographic characteristics. Socio-demographic variables have been recoded to align with observed data patterns and established coding schemes in the scientific literature on child development.

**Note**: Detailed information about the recoding process is available in the accompanying file [STnets_vmap.xlsx](dat/STnets_vmap.xlsx).


### Intermediate Dataset
[rt1_var.csv](dat/rt1_var.csv) and [rt1_var.rds](dat/rt1_var.rds)

These files contain an intermediate dataset used to generate the final analytical dataset:

- Sample size: 16,914 observations
- Number of variables: 35
The variables were selected from the raw dataset ([nsch23.rds](dat/nsch23.rds)) and represent the key constructs analyzed in this research. This intermediate dataset serves as the basis for creating the final dataset files ([rt1.csv](dat/rt1.csv), [rt1_2.csv](dat/rt1_2.csv), and [rt1.rds](dat/rt1.rds)).

To support data sharing and compatibility, the dataset is provided in two formats:

- [rt1_var.csv](dat/rt1_var.csv): Comma-separated values.
- [rt1_var.rds](dat/rt1_var.rds): R-native serialized format.

### Significant Networks
[sigNets12.RData](dat/sigNets12.RData) and  [sigNets35.RData](dat/sigNets35.RData)

These files contain the significant networks identified in the study—i.e., connected networks whose edge weights are significantly different from zero based on bootstrap confidence intervals.

Each file includes four lists, and each list is a two-element list corresponding to:

- Low screen time group
- High screen time group

The suffix "12" refers to children aged 1–2 years, and "35" refers to children aged 3–5 years.

Contents:
- *am12* / *am35*: Adjacency matrices for each significant network.

- *bs12* / *bs35*: Bootstrap summaries computed from the preliminary network estimations (see [boots.12.RData](dat/boots.12.RData) and [boots.35.RData](dat/boots.35.RData)).

- *nod12* / *nod35*: Character vectors listing the node names retained in each network after removing edges that were not statistically significant.

- *se12* / *se35*: Lists of significant edge weights, defined as those whose 95% non-parametric bootstrap confidence intervals do not include zero.

These files represent the final network structures used in the analysis and visualization of language development patterns across screen time exposure groups.


### Variable Coding File
[STnets_vmap.xlsx](dat/STnets_vmap.xlsx)

This Microsoft Excel file contains the codebook for the variables used in this project. The codebook is located in the worksheet named *VariablesMap*.

The table in this worksheet consists of 11 columns and 36 rows, with the first row reserved for column headers. Each column provides specific metadata or coding information about the variables included in the analytical dataset.

-   *Variable numeric code*: An arbitrarily assigned numeric label used to uniquely identify each variable within the study. This code facilitates referencing and organizing variables across different files and analyses.

-   *Original variable name*: The name of the variable as it appears in the original dataset ([nsch23.rds](dat/nsch23.rds)), directly imported from the National Survey of Children's Health (NSCH) 2023 wave. This helps trace each variable back to its source in the raw data.

-   *Recoded variable name*: A shortened and standardized name assigned to each variable for use within this project. These names are designed to improve readability, facilitate coding, and ensure consistency across scripts and documentation.

-   *Item*: The original item statement presented to parents during the survey. These statements reflect the exact wording used in the 2023 NSCH data collection wave. For more detailed information, refer to the [official NSCH 2023 codebook](https://www.census.gov/data-tools/demo/uccb/nschdict?s_year=2023).

-   *Original alternatives*: Lists the original response options provided for each item in the NSCH 2023 survey. These alternatives reflect the exact wording and structure used in the official questionnaire. For further details, consult the [NSCH 2023 codebook](https://www.census.gov/data-tools/demo/uccb/nschdict?s_year=2023).

-   *Recoded alternatives*: Indicates how the original response options were transformed for use in this project.
     - For language development items, alternatives were recoded to reflect whether children had not yet achieved specific developmental milestones.
      - For socio-demographic items, recoding was performed to ensure consistency with established coding schemes in the scientific literature on child development.

    This column helps clarify the logic behind variable transformation and supports reproducibility of the analytical process.

-   *Topic*: Indicates the general dimension or thematic category of each item as defined in the 2023 NSCH survey. This helps contextualize the variable within the broader structure of the original questionnaire.

-   *Language skills*: Indicates whether the item assesses productive (expressive) or comprehensive (receptive) language abilities. This classification helps distinguish between different aspects of language development evaluated in the survey.

-   *Bloom & Lahey (1978)*: Indicates whether each language-related item corresponds to one of the three core dimensions of language assessment proposed by [Bloom & Lahey (1978)](https://doi.org/10.7916/D8QZ2GQ5):
      - Content.
      - Form.
      - Use.
      
    This classification provides a theoretical framework for interpreting language development variables within the study.

-   *Conti-Ramsden & Durkin (2012)*: Indicates the language assessment dimension associated with each item, based on the framework proposed by [Conti-Ramsden & Durkin (2012)](https://doi.org/10.1007/s11065-012-9208-z). This classification supports a deeper understanding of how language development is conceptualized in relation to cognitive and social factors.



-   *Universe*: Specifies the target population for each item—i.e., who was eligible to respond based on the child’s age. Three possible values apply:
    -   *All*: All participants in the 2023 NSCH survey.
    -   *\>=1*: Parents of children aged 1 year or older.
    -   *\>=3*: Parents of children aged 3 years or older.
    
    This column helps clarify the applicability of each item within the survey sample.

### T1 Form Subset with Study ID
[t1.rds](dat/t1.rds)

This file contains observations from the T1 form of the NSCH 2023 dataset, specifically targeting children aged 0–5 years:

- Sample size: 19,311 observations.
- Number of variables: 457

In addition to the original survey variables, this file includes a study-specific identification code (*id*) assigned to each case. This ID facilitates tracking and linking cases across different stages of data processing and analysis within the project.


### Centrality Stability Test Folders 

**cs12/** and **cs35/**

These folders contain manually generated files used to test centrality stability in network models for children aged 1–2 years (cs12) and 3–5 years (cs35).

#### Contents:

- Each folder includes 10 .rds files, created using the custom CS.adj() function defined in the [fc_CS.adj.R](fun/fc_CS.adj.R) script.

- Each .rds file contains 100 lists of bootstrapped results, representing centrality correlations under different case deletion scenarios.

- File names follow a structured format:
    - Prefix: "cs12_" or "cs35_" indicates the age group.
    - Suffix: Encodes the date and time of file creation (day, month, hour, minute, and second in Central European Summer Time).

##### Files in folder cs12

  - [cs12_150825135812.rds](dat/cs12/cs12_150825135812.rds)
  - [cs12_150825152647.rds](dat/cs12/cs12_150825152647.rds)
  - [cs12_150825211327.rds](dat/cs12/cs12_150825211327.rds)
  - [cs12_160825104333.rds](dat/cs12/cs12_160825104333.rds)
  - [cs12_160825122719.rds](dat/cs12/cs12_160825122719.rds)
  - [cs12_160825142123.rds](dat/cs12/cs12_160825142123.rds)
  - [cs12_160825161011.rds](dat/cs12/cs12_160825161011.rds)
  - [cs12_160825185349.rds](dat/cs12/cs12_160825185349.rds)
  - [cs12_160825203745.rds](dat/cs12/cs12_160825203745.rds)
  - [cs12_170825103952.rds](dat/cs12/cs12_170825103952.rds)

##### Files in folder cs35

  - [cs35_150825142601.rds](dat/cs35/cs35_150825142601.rds)
  - [cs35_150825160159.rds](dat/cs35/cs35_150825160159.rds)
  - [cs35_150825213719.rds](dat/cs35/cs35_150825213719.rds)
  - [cs35_160825112038.rds](dat/cs35/cs35_160825112038.rds)
  - [cs35_160825125814.rds](dat/cs35/cs35_160825125814.rds)
  - [cs35_160825145722.rds](dat/cs35/cs35_160825145722.rds)
  - [cs35_160825164839.rds](dat/cs35/cs35_160825164839.rds)
  - [cs35_160825193429.rds](dat/cs35/cs35_160825193429.rds)
  - [cs35_160825211513.rds](dat/cs35/cs35_160825211513.rds)
  - [cs35_170825111033.rds](dat/cs35/cs35_170825111033.rds)


#### Structure of Each File:

- Each file contains a two-element list:
    - First element: Results for the low screen time group.
    - Second element: Results for the high screen time group.

- Each element is a ten-element list, representing bootstrapped correlations between centrality statistics (e.g., strength, closeness, betweenness, expected influence) computed from:
    - The full sample network.
    - Networks with varying proportions of randomly deleted cases.

These files are later merged into the cs12 and cs35 objects stored in the [CS-data.RData](dat/CS-data.RData) file.

For more details on the logic and implementation of these tests, refer to the source code file [13_CS.R](stx/13_CS.R).


## Source Code Files

### Sample Size Estimation
#### [01_SampleSize.R](stx/01_SampleSize.R)

This script estimates the required sample size for conducting network analyses using the powerly R package [(Constantin et al., 2023)](https://doi.org/10.1037/met0000555). It generates the output file [sampleSize.pdf](fig/sampleSize.pdf), which includes visualizations of sample size estimations for two distinct age groups:

- Page 1: Children aged 1 to 2 years
- Page 2: Children aged 3 to 5 years

These plots support the determination of adequate sample sizes for robust statistical inference in age-specific network models.

### Data Selection and Preprocessing
#### [02_variables.R](stx/02_variables.R)

This script performs case and variable selection from the raw dataset [nsch23.rds](dat/nsch23.rds). The preprocessing steps include:

- Adding a unique identification variable (*id*) to the full dataset.
- Filtering observations to include only those derived from the T1 form.
- Selecting language-related variables for network visualization, along with socio-demographic variables relevant to the research topic and sample description.

Language assessment items were recoded to reflect difficulties in achieving developmental language milestones:

- Binary variables were coded as 1 when a child exhibited difficulties with a specific language skill.
- Ordinal variables were recoded such that higher values indicate greater difficulty in achieving the corresponding milestone.

The script also generates datasets free of missing values, which are subsequently used for network estimation. For a comprehensive overview of the output files, refer to the [Scripts Table](scripts_table.md).

### Variable Recoding and Labeling
#### [03_recode.R](stx/03_recode.R)

This script standardizes and labels the levels of socio-demographic variables in accordance with conventions found in the relevant literature. Specifically:

- Socio-demographic variables are converted into R factors.
- Each factor is assigned descriptive labels that enhance interpretability and align with established research practices.

The resulting datasets are more suitable for statistical modeling and visualization. For a detailed overview of the output files generated by this script, please refer to the [Scripts Table](scripts_table.md).


### Screen Time Group Classification
#### [04_STgroups.R](stx/04_STgroups.R)

This script assigns each observation to one of two screen time groups based on the guidelines provided by the [World Health Organization (WHO, 2019)](https://www.who.int/publications/i/item/9789241550536):

- High screen time: Children exceeding the recommended daily screen usage.
- Low screen time: Children whose screen usage aligns with WHO recommendations.

The script produces and saves two intermediate datasets, which are used in subsequent analyses. For a detailed overview of the generated files, please refer to the Scripts Table.

### Variable Standardization for Network Estimation
#### [05_tipify.R](stx/05_tipify.R)

This script standardizes the variables used in network estimation by mean-centering and scaling to unit variance. The standardization is performed conditionally, taking into account the following covariates:

- Sex.
- Age.
- Caregiver's education level.

This approach ensures that the variables are appropriately adjusted for key demographic factors, enhancing the comparability and interpretability of the resulting networks. For a detailed overview of the output files, please refer to the [Scripts Table](scripts_table.md).

### Preliminary Network Estimation
#### [06_PreNetEst.R](stx/06_PreNetEst.R)

This script estimates preliminary network models using the estimateNetwork() function from the bootnet package [(Epskamp et al., 2018)](https://doi.org/10.3758/s13428-017-0862-1). Networks are estimated separately for each combination of screen time group and age group, resulting in four distinct networks:

- Children aged 1–2 years:
  - High screen time.
  - Low screen time.
- Children aged 3–5 years:
  - High screen time.
  - Low screen time.

The resulting networks are visualized and saved using the qgraph package [(Epskamp et al., 2012)](https://doi.org/10.18637/jss.v048.i04). These preliminary models provide an initial overview of the network structure across different developmental and behavioral profiles.

For a detailed summary of the output files, please refer to the [Scripts Table](scripts_table.md).


### Bootstrap Analysis of Preliminary Networks
#### [07_bootNets.R](stx/07_bootNets.R)

This script performs bootstrap resampling (1,000 iterations per network) on the preliminary networks estimated in [06_PreNetEst.R](stx/06_PreNetEst.R). The goal is to assess the stability and accuracy of the network parameters.

Bootstrap results are saved in the following files:

- [boots.12.RData](dat/boots.12.RData): Bootstrap results for children aged 1–2 years (high and low screen time groups)
- [boots.35.RData](dat/boots.35.RData): Bootstrap results for children aged 3–5 years (high and low screen time groups)

These outputs are used in subsequent analyses to evaluate the robustness of the estimated network structures. For a detailed overview of the generated files, please refer to the [Scripts Table](scripts_table.md).

### Selection of Statistically Significant Network
#### [08_clinNets.R](stx/08_clinNets.R)

This script processes the bootstrap results stored in [boots.12.RData](dat/boots.12.RData) and [boots.35.RData](dat/boots.35.RData) (produced by [07_bootNets.R](stx/07_bootNets.R)) to identify statistically significant edges in the estimated networks. Specifically, it generates adjacency matrices that include only those nodes and edges whose weights are significantly different from zero, based on the bootstrap confidence intervals.

The script produces two R environment files:

- [sigNets12.RData](dat/sigNets12.RData): Contains selected networks for children aged 1–2 years (high and low screen time groups).
- [sigNets35.RData](dat/sigNets35.RData): Contains selected networks for children aged 3–5 years (high and low screen time groups).

These environments include all relevant objects for exploring, analyzing, describing, and visualizing the statistically robust network structures. For a detailed overview of the output files, please refer to the [Scripts Table](scripts_table.md).


### Visualization of Statistically Significant Networks
#### [09_PlotSigNets.R](stx/09_PlotSigNets.R)

This script uses the igraph package [(Kolaczyk & Csárdi, 2020)](https://doi.org/10.1007/978-3-030-44129-6) to visualize the networks containing statistically significant edges, as identified in the previous analysis ([08_clinNets.R](stx/08_clinNets.R)). The resulting plots facilitate the interpretation of network structures across different age and screen time groups.

For a detailed overview of the files produced by this script, please refer to the [Scripts Table](scripts_table.md).

### Descriptive Visualization of Network Properties
#### [10_Fig_desc_Nets.R](stx/10_Fig_desc_Nets.R)

This script generates visual summaries for each statistically significant network. Specifically, it produces figures that illustrate key network metrics, including:

- Clustering statistics.
- Centrality measures.

These visualizations support the interpretation of structural differences across networks and provide insights into the relative importance and connectivity of nodes. For a detailed overview of the output files, please refer to the [Scripts Table](scripts_table.md).


### Tabular Summary of Network Properties
#### [11_Tab_desc_Nets.R](stx/11_Tab_desc_Nets.R)

This script produces tables summarizing key properties of each statistically significant network. The tables include:

- Clustering statistics.
- Centrality measures.

These tabular outputs complement the visualizations generated in [10_Fig_desc_Nets.R](stx/10_Fig_desc_Nets.R), providing a structured overview of network characteristics across age and screen time groups. For a detailed overview of the files produced by this script, please refer to the [Scripts Table](scripts_table.md).


### Confidence Interval Visualization for Network Edges
#### [12_edgeCI.R](stx/12_edgeCI.R)

This script generates figures that display confidence intervals for edge weights in the statistically significant networks. It uses the results from previous bootstrap analyses to produce the following documents:

- [edgeCI_12.pdf](fig/edgeCI_12.pdf): Confidence interval plots for networks of children aged 1–2 years
- [edgeCI_35.pdf](fig/edgeCI_35.pdf): Confidence interval plots for networks of children aged 3–5 years

These visualizations support the interpretation of edge reliability and statistical significance.

### Centrality Stability Analysis
#### [13_CS.R](stx/13_CS.R)

This script performs centrality stability (CS) tests on the selected networks using the custom [CS.adj()](fun/fc_CS.adj.R) function. Several auxiliary functions were developed to support this analysis (see the script or refer to the Scripts Table for details).

Due to the computational intensity of the [CS.adj()](fun/fc_CS.adj.R) function, which can take over ten hours for 1,000 bootstrap iterations, the full simulation code was omitted from the script and replaced with the following placeholder:

``` r
##************************************************************
# 
# Omitted code. See README file for details and explanations
# 
##************************************************************
```

Instead, the CS analysis was conducted manually using smaller iteration counts and then aggregating the results. The following code blocks were used to generate the output files:

#### Children aged 1–2 years


``` r
##************************************************************
# 
cs12 <- list()

key <- format(Sys.time(), "%d%m%y%H%M%S")

for (i in 1:length(am12)){
  cs12[[i]] <- CS.adj(am12[[i]], ss12[[i]], n_iter = 100)
}

saveRDS(cs12, paste0("dat/cs12/cs12_", key, ".rds"))
# 
##************************************************************
```

#### Children aged 3–5 years

``` r
##************************************************************
# 
cs35 <- list()

key <- format(Sys.time(), "%d%m%y%H%M%S")

for (i in 1:length(am35)){
  cs35[[i]] <- CS.adj(am35[[i]], ss35[[i]], n_iter = 100)
}

saveRDS(cs35, paste0("dat/cs35/cs35_", key, ".rds"))
# 
##************************************************************
```

These scripts generate output files with names that include a prefix (cs12_ or cs35_) and a timestamp suffix indicating the date and time of creation. The resulting .rds files contain centrality stability results for further analysis.


### Sample Description Tables
#### [14_sampDesc.R](stx/14_sampDesc.R)

This script generates descriptive tables summarizing the characteristics of the sample used in the study. These tables provide an overview of key demographic and behavioral variables, supporting the interpretation and contextualization of the network analyses.

For a detailed overview of the output files, please refer to the [Scripts Table](scripts_table.md).

### Descriptive Tables for Observed Groups
#### [15_GrupDesc.R](stx/15_GrupDesc.R)

This script generates descriptive tables summarizing the characteristics of the groups of children observed in the study. These tables provide detailed information on variables relevant to the classification of children into screen time and age groups, supporting group-level comparisons and contextual interpretation of the network analyses.

For a detailed overview of the output files, please refer to the [Scripts Table](scripts_table.md).

### Supplementary Analyses Aligned with Article Narrative
#### [16_narrative.R](stx/16_narrative.R)

This script includes additional analyses that were conducted during the writing of the article’s Results section. These analyses were specifically designed and coded to align with the narrative flow of the manuscript, providing side-by-side statistical support for the reported findings.

The script complements the core analytical pipeline by integrating exploratory or confirmatory procedures that emerged during the interpretation and presentation of results. For details on the specific outputs generated, please refer to the [Scripts Table](scripts_table.md).





## Figure Files

### Network Plot Figures

This set of PDF files contains visualizations of network models estimated in the study. The figures are divided into two categories:

#### Preliminary Networks

[all.pdf](fig/all.pdf), [g12.pdf](fig/g12.pdf), and [g35.pdf](fig/g35.pdf),  

These files display preliminary networks estimated using the estimateNetwork() function from the bootnet R package ([Epskamp et al., 2017](https://doi.org/10.3758/s13428-017-0862-1)).

- [g12.pdf](fig/g12.pdf): Networks for children aged 1–2 years.
- [g35.pdf](fig/g35.pdf): Networks for children aged 3–5 years.
- [g12.pdf](fig/g12.pdf): Combined visualization of both age groups.


#### Final Networks Plots

[Bg.all.pdf](fig/Bg.all.pdf), [Bg12.pdf](fig/Bg12.pdf), [Bg35.pdf](fig/Bg35.pdf), and [nets.png](fig/nets.png)
  
These files present the final selected networks, plotted using the igraph R package ([Kolaczyk & Csárdi, 2020](https://doi.org/10.1007/978-3-030-44129-6)).

- [Bg12.pdf](fig/Bg12.pdf): Final networks for children aged 1–2 years.
- [Bg35.pdf](fig/Bg35.pdf): Final networks for children aged 3–5 years.
- [Bg.all.pdf](fig/Bg.all.pdf): Combined visualization of final networks for both age groups.
- [nets.png](fig/nets.png): Networks included as Figure 1 in the submitted version of the article.
  

#### Visual Encoding

Each network plot uses visual features to encode meaningful information about the nodes and edges:

- Edge Thickness: Represents the strength of association between nodes.

- Node Shape: Encodes the language assessment dimension based on [Bloom & Lahey (1978)](https://doi.org/10.7916/D8QZ2GQ5):
    - Circle: Use.
    - Triangle: Form.
    - Square: Content.

- Node Background Color: Represents the language domain based on [Conti-Ramsden & Durkin (2012)](https://doi.org/10.1007/s11065-012-9208-z):
    - Green: Lexicon (vocabulary)
    - Cyan: Pragmatics (communicative functions and conventions)
    - Pink: Discourse (integration into longer conversations)
    - White: Semantics (meaning)
    - Orange: Phonology (sounds of language)

- Node Label Font Style: Indicates the type of language skill assessed:
    - Regular font: Comprehension items
    - Italic and bold font: Production items


### Local Clustering Coefficients in the Estimated Networks
[barrat.png](fig/barrat.png)

This figure corresponds to Figure 2 in the original submitted article. It is a four-panel visualization displaying [Barrat et al. (2004)](https://doi.org/10.1073/pnas.0400087101) clustering coefficients for children segmented by age group and screen time exposure:

- Rows: Age groups.
    - Top row: Children aged 1–2 years.
    - Bottom row: Children aged 3–5 years.

- Columns: Screen time exposure.
    - Left column: Low screen time.
    - Right column: High screen time.

- Visual Encoding:
    - Node Order: Nodes are sorted in descending order based on their clustering coefficients.
    - Capital Letters: Indicate clusters of fully connected nodes, helping to visually identify tightly knit subgroups within each network.

This figure provides insight into the local connectivity structure of the networks, highlighting how clustering patterns vary across age and screen time groups.
 
### Edge Weight Analysis

[CI_12.png](fig/CI_12.png) and [CI_35.png](fig/CI_35.png)

These figures are included as Figure S1 and Figure S2 in the Supplementary Materials of the original submitted manuscript. They visualize the edge weights in the estimated networks and provide insight into the statistical reliability of the connections between nodes.

#### Visual Elements:
- Error Bars: Represent 95% non-parametric confidence intervals, based on 1,000 bootstrap iterations.
- Black Dots: Indicate the sample estimates of edge weights.
- Red Triangles: Show the bootstrapped means of edge weights.
- Blue Symbols: Highlight unique edges identified in the estimated networks when comparing within the same age group—i.e., edges that appear in one screen time condition but not the other.

These plots help assess the stability and significance of network connections, supporting the robustness of the final network models.

### Clustering Plots

[clp12.pdf](fig/clp12.pdf), [clp12_all.pdf](fig/clp12_all.pdf), [clp35.pdf](fig/clp35.pdf), and [clp35_all.pdf](fig/clp35_all.pdf)

These PDF files present clustering plots for networks estimated for children aged 1–2 years and 3–5 years.

#### File Details:
- [clp12.pdf](fig/clp12.pdf) and [clp35.pdf](fig/clp35.pdf): Each file contains one plot per page, with each plot representing a network for a specific screen time partition within the respective age group.

- [clp12_all.pdf](fig/clp12_all.pdf) and [clp35_all.pdf](fig/clp35_all.pdf): These files provide combined plots, where clustering coefficients for all screen time partitions within the age group are displayed in a single figure for easier comparison.

#### Visual Encoding:

- Node Labels: Ordered in descending order based on their Barrat clustering coefficient, highlighting nodes with the highest local connectivity.
- These plots help visualize the internal structure of each network and identify densely connected subgroups.

### Centrality Plots

[cp12.pdf](fig/cp12.pdf), [cp12_all.pdf](fig/cp12_all.pdf), [cp35.pdf](fig/cp35.pdf), and [cp35_all.pdf](fig/cp35_all.pdf)

These PDF files present centrality plots for networks estimated for children aged 1–2 years and 3–5 years, allowing for comparison across screen time exposure groups.

#### File Details:
-[cp12.pdf](fig/cp12.pdf) and [cp35.pdf](fig/cp35.pdf): Each file contains one plot per page, with each plot representing centrality statistics for a specific network within the respective age group.

- [cp12_all.pdf](fig/cp12_all.pdf) and [cp35_all.pdf](fig/cp35_all.pdf): These files provide combined plots, where centrality statistics for all clusters within the age group are displayed in a single figure for easier comparison.

#### Centrality Measures:
The plots include key centrality metrics such as:

- Closeness.
- Betweenness.
- Expected Influence.

These figures help visualize the relative importance of nodes within each network and how centrality patterns vary across age and screen time conditions.


### Centrality Stability Plots
[cs12.pdf](fig/cs12.pdf) and [cs35.pdf](fig/cs35.pdf)
  
These PDF files contain centrality stability plots for networks segmented by screen time exposure.

#### Structure:

Each document includes two pages:

- Page 1: Network for children in the low screen time group.
- Page 2: Network for children in the high screen time group.

#### Plot Details:

- X-axis: Proportion of cases retained in a sub-sample of screen time.
- Y-axis: Average correlation between centrality statistics from sub-samples and the full dataset.
- Lines: Represent the observed values and 95% confidence intervals for different centrality measures (e.g., strength, closeness, betweenness).

#### Purpose:
To evaluate the stability and reliability of centrality measures across screen time groups, supporting the robustness of network-based interpretations in the study.


### Edge Strength Confidence Intervals

[edgeCI_12.pdf](fig/edgeCI_12.pdf) and [edgeCI_35.pdf](fig/edgeCI_35.pdf)

These PDF files present edge strength estimates and their bootstrapped confidence intervals for selected networks.

#### Structure: 
Each document includes two pages:

  - Page 1: Network for children in the low screen time group.
  - Page 2: Network for children in the high screen time group.

#### Plot Details:

- Black dots: Estimated edge strength from the original data.
- Red triangles: Bootstrapped average edge strength.
- Error bars: Represent 95% non-parametric confidence intervals, based on 1,000 bootstrapped samples.

These plots correspond to the networks shown in the [Bg.all.pdf](fig/Bg.all.pdf) figure.

### Sample Size Estimation
[sampleSize.pdf](fig/sampleSize.pdf)

This PDF file presents sample size estimations for network analysis based on the methodology proposed by ([Constantin et al. (2023)](https://doi.org/10.1037/met0000555)).

#### Structure:
The document includes two pages:

- Page 1: Estimations for children aged 1–2 years.
- Page 2: Estimations for children aged 3–5 years.

#### Purpose:
To provide guidance on the minimum sample sizes required for reliable network analysis in each age group, ensuring methodological rigor in the interpretation of network metrics.



## Table Files

### Centrality Statistics Tables
#### [CenTab12.html](tab/CenTab12.html), [CenTab12.md](tab/CenTab12.md), [CenTab35.html](tab/CenTab35.html), and [CenTab35.md](tab/CenTab35.md)

These tables present centrality measures for the networks estimated for children aged 1–2 years (CenTab12) and 3–5 years (CenTab35). Each table is available in both Markdown (.md) and HTML (.html) formats to facilitate integration into reports and web-based outputs.

Each table includes the following components:

- Group identifier: Indicates the specific subgroup of children (by age and screen time) used to estimate the network.
- Node label: Refers to the variable or item represented as a node in the network.
- Centrality metrics:
  - Betweenness: Measures the extent to which a node lies on the shortest paths between other nodes.
  - Closeness: Reflects how close a node is to all other nodes in the network.
  - Strength: Represents the sum of edge weights connected to a node.
  - Expected Influence: Captures the overall influence of a node, considering both positive and negative edge weights.

These tables support the interpretation of node importance and connectivity patterns within each network.

### Clustering Coefficient Tables
#### [ClustTab12.html](tab/ClustTab12.html), [ClustTab12.md](tab/ClustTab12.md), [ClustTab35.html](tab/ClustTab35.html), and [ClustTab35.md](tab/ClustTab35.md)


These tables report clustering coefficients for the networks estimated for children aged 1–2 years (ClustTab12) and 3–5 years (ClustTab35). Each table is available in both Markdown (.md) and HTML (.html) formats to support flexible integration into reports and web-based outputs.

Each table includes the following components:

- Group identifier: Specifies the subgroup of children (by age and screen time) used to estimate the network.
- Node label: Indicates the variable or item represented as a node in the network.
- Clustering coefficient: Calculated using the method proposed by [Barrat et al. (2004)](https://doi.org/10.1073/pnas.0400087101), which is suitable for undirected and weighted graphs.

These coefficients provide insight into the local connectivity of nodes, reflecting the tendency of a node’s neighbors to form tightly knit groups.

### Edge Comparison Between Screen Time Groups
#### [comp-edges12.html](tab/comp-edges12.html), [comp-edges12.md](tab/comp-edges12.md), [comp-edges35.html](tab/comp-edges35.html) and [comp-edges35.md](tab/comp-edges35.md)

These tables compare the network structures of children in the low screen time group (g1) and the high screen time group (g2) for each age category:

- comp-edges12: Children aged 1–2 years
- comp-edges35: Children aged 3–5 years

Each table is available in both Markdown (.md) and HTML (.html) formats and includes the following columns:

- common: Edges shared by both networks (g1 and g2)
- unique_g1: Edges present only in the low screen time network
- unique_g2: Edges present only in the high screen time network

These comparisons provide insight into how screen time exposure may influence the structure of language-related networks across developmental stages.

### Centrality Stability Coefficient Tables
#### [CS12.html](tab/CS12.html), [CS12.md](tab/CS12.md), [CS35.html](tab/CS35.html), and [CS35.md](tab/CS35.md)
 
These tables report centrality stability coefficients for the networks estimated for children aged 1–2 years (CS12) and 3–5 years (CS35). Each table is available in both Markdown (.md) and HTML (.html) formats.

The centrality stability coefficients are calculated as *CS*(cor = 0.7), based on the lower bound of the 95% bootstrapped non-parametric confidence interval, following the methodology proposed by [Epskamp et al. (2018)](https://doi.org/10.3758/s13428-017-0862-1). These coefficients reflect the robustness of centrality metrics under case-dropping bootstraps.

Each table includes stability estimates for the following centrality measures:

- Strength.
- Closeness.
- Betweenness.
- Expected Influence.

These metrics help assess the reliability of node importance rankings across subsamples, supporting the interpretation of network structure in developmental contexts.
  
### Sample Description and Group Comparison Tables
#### [Table_1.html](tab/Table_1.html) and [Table_2.html](tab/Table_2.html)
  
These tables provide a comprehensive descriptive overview of the sample used in this study, with a focus on socio-demographic characteristics and screen time usage. Both tables are available in HTML (.html) format and include the following components:

- Descriptive statistics: Means and standard deviations for continuous variables.
- Frequency distributions: Observed counts and percentages for categorical variables.
- Cross-tabulations: Variables are cross-tabulated by screen time group (e.g., low vs. high screen time).

The socio-demographic variables include:

- Age.
- Sex.
- Birth order.
- Number of children in the household.
- Caregiver’s educational level.
- Caregiver’s employment status.
- Caregiver’s mental well-being.
- Parental nativity.

Additionally, the tables include cross-tabulations for language-related interaction habits, such as:

- Reading to the child.
- Telling stories/singing to the child.

To assess relationships between variables and screen time usage, the tables also report:

- Contrast statistics (e.g., t-tests, chi-square tests).
- Degrees of freedom.
- *p*-values.
- Effect size estimates.

These outputs support both descriptive and inferential interpretations of the sample characteristics.

### Stratified Sample Description and Group Comparison Tables
#### [Table_3.html](tab/Table_3.html) and [Table_4.html](tab/Table_4.html)

These tables provide a stratified overview of the sample, splitting the data by age group (1–2 years and 3–5 years) and, within each age group, by screen time usage (low vs. high). The tables are available in HTML (.html) format and contain the same types of information reported in [Table_1.html](tab/Table_1.html) and [Table_2.html](tab/Table_2.html), but with finer granularity.

Each table includes:

- Descriptive statistics: Means and standard deviations for continuous variables.
- Frequency distributions: Observed counts and percentages for categorical variables.
- Cross-tabulations: Variables are cross-tabulated by screen time group (e.g., low vs. high screen time).

The socio-demographic variables include:

- Age.
- Sex.
- Birth order.
- Number of children in the household.
- Caregiver’s educational level.
- Caregiver’s employment status.
- Caregiver’s mental well-being.
- Parental nativity.

Additionally, the tables include cross-tabulations for language-related interaction habits, such as:

- Reading to the child.
- Telling stories/singing to the child.

To assess relationships between variables and screen time usage, the tables also report:

- Contrast statistics (e.g., t-tests, chi-square tests).
- Degrees of freedom.
- *p*-values.
- Effect size estimates.

These stratified tables support more nuanced interpretations of how screen time relates to developmental and socio-demographic factors across different age groups.

###  Outdoor Play and Screen Time Comparison (Ages 3–5)
#### [Table_5.html](tab/Table_5.html)

This table presents a cross-tabulated analysis of outdoor play habits among children aged 3–5 years, comparing those with low and high screen time usage. The table includes separate comparisons for:

- Weekday outdoor play.
- Weekend outdoor play. 

For each comparison, the table reports:

- Frequencies of observed behaviors.
- Chi-squared test statistics.
- Degrees of freedom.
- *p*-values.
- Effect size estimates.

These results provide insight into the relationship between screen time exposure and outdoor activity patterns in early childhood.


## Function Files

### Combined Effect Size Calculation for Group Comparisons
#### [fc_combined_effect_size.R](fun/fc_combined_effect_size.R)

Function Defined: **combined_effect_size()**

#### Description:
This script defines the combined_effect_size() function, which computes effect sizes for group comparisons using either *t*-tests or chi-squared tests, depending on the variable types. It integrates the results into a formatted table using the gtsummary package.

#### Arguments:

- data: A data.frame containing the variables to be analyzed.
- variable: A factor variable used to define groups.
- by: An outcome variable used for comparison.

#### Functionality:

- Computes effect size *r* for t-tests.
- Computes Cramer's *V* for chi-squared tests.
- Outputs a summary table with computed effect sizes using gtsummary.

#### Purpose:
To provide a streamlined and interpretable summary of group differences with appropriate effect size metrics, supporting statistical reporting and result interpretation in the context of language development and screen time research.


### Compare Edges Between Two Graphs
#### [fc_compare_graph_edges.R](fun/fc_compare_graph_edges.R)

Function Defined: **compare_graph_edges()**

#### Description:
This script defines the compare_graph_edges() function, which compares the edges of two graphs derived from adjacency matrices.

#### Arguments:

- g1: An igraph object representing the first graph.
- g2: An igraph object representing the second graph.


#### Output:

A data.frame with three columns:

- Edges common to both graphs.
- Edges unique to g1.
- Edges unique to g2.

#### Purpose:
To facilitate the comparison of network structures, identifying shared and distinct connections between two graphs—useful for analyzing changes or differences across conditions or groups.


### Centrality Stability Summary
#### [fc_corStabSum.R](fun/fc_corStabSum.R)

Function Defined: **cs.sum()**

#### Description:
This script defines the cs.sum() function, which generates centrality stability summaries from a stability list.

#### Input:

A stability list produced by the CS.adj() function (see [fc_CS.adj.R](fun/fc_CS.adj.R) and [13_CS.R](stx/13_CS.R) for details).

#### Output:

A list of four data frames, each corresponding to a centrality index:

- Strength.
- Closeness.
- Betweenness.
- Expected Influence.

Each data frame contains:

- Mean correlation.
- Lower and upper 95% non-parametric confidence interval values.
- Computed across different proportions of case dropout.

#### Purpose:

To summarize the stability of centrality measures, facilitating interpretation of network robustness under varying sample conditions.


### Case Stability from Adjacency Matrices
#### [fc_CS.adj.R](fun/fc_CS.adj.R)

Function Defined: **CS.adj()**

#### Description:
This script defines the CS.adj() function, designed to compute case stability from adjacency matrices representing weighted networks. It was developed after identifying that the [bootnet](https://cran.r-project.org/package=bootnet) package does not support bootstrapping adjacency matrices for weighted graphs. The package documentation was reviewed and the author, ([Sacha Epskamp](https://github.com/SachaEpskamp)), was contacted to confirm this limitation prior to implementation.

#### Main Arguments:

- adj_matrix: Adjacency matrix representing the network.
- n: Sample size.
- n_iter: Number of bootstrap iterations (100 by default).
- proportions: Vector of proportions for case dropout. By default, the function uses the proportions: 0.95, 0.872, 0.795, 0.717, 0.639, 0.561, 0.483, 0.405, 0.328, and 0.25 — the same as those used in [bootnet](https://cran.r-project.org/package=bootnet) with type = "case". 

#### Procedure:

1. Computes centrality statistics from the input adjacency matrix.
2. Converts the adjacency matrix into a correlation matrix, ensuring it is positive definite.
3. Simulates a dataset congruent with the graph using mvrnorm() from the [MASS](https://cran.r-project.org/package=MASS) package.
4. Estimates a “full” network using estimateNetwork() from the [bootnet](https://cran.r-project.org/package=bootnet) package and computes centrality statistics.
5. Iteratively removes proportions of cases from the full dataset to create “sub-networks,” computes their centrality statistics, and correlates them with the full network statistics.
6. Returns a list of data frames containing these correlations for each centrality index.

#### Output:

A list of data frames containing correlations for each centrality index.

#### Purpose:
To enable robust bootstrapped stability analysis of weighted networks in the context of screen time and language development, overcoming limitations in existing packages.


### Centrality Stability Coefficient Calculation
#### [fc_cs.ci.R](fun/fc_cs.ci.R)

Function Defined: **cs.ci()**

#### Description:
This script defines the cs.ci() function, which calculates the centrality stability coefficient [*CS*(cor = 0.7)] for centrality statistics. This coefficient is based on the lower bound of the 95% bootstrapped non-parametric confidence interval, following the methodology proposed by [Epskamp et al. (2018)](https://doi.org/10.3758/s13428-017-0862-1).

#### Arguments:

- ci.list: A list of 95% confidence intervals produced by the cs.sum() function (see [fc_corStabSum.R](fun/fc_corStabSum.R)).
- threshold: A correlation threshold, fixed at 0.7 to align with [Epskamp et al.'s  (2018)](https://doi.org/10.3758/s13428-017-0862-1) recommendation.

#### Purpose:
To quantify the stability of centrality measures by identifying the maximum proportion of case dropout at which the lower bound of the confidence interval remains above the specified threshold. This provides a robust metric for evaluating the reliability of centrality indices in network analysis.

### Markdown and HTML Table Generator
#### [fc_df_to_tab.R](fun/fc_df_to_tab.R)

Function Defined: **gtmd()**

#### Description:
This script defines the gtmd() function, which converts an R data.frame into a Markdown (.md) table, and optionally renders it into an HTML (.html) file.

#### Main Argument:

- df: A data.frame object to be converted into a table.

#### Additional Arguments:

- tit: A character string specifying the title of the table (default = NULL).
- file: The filename and path for the output file. If not specified, the table is saved as "table.md" in the working directory (default = "table.md").
- sk: An integer indicating the number of empty lines to insert before printing the table (default = 2). 
- renderizar: A logical value indicating whether the .md file should be rendered into an .html file (default = TRUE)

#### Purpose:
To streamline the export and presentation of tabular data from R, allowing for easy integration into reports, websites, or supplementary materials.

### Find Fully Connected Cliques Including a Node
#### [fc_find_cliques_with_node.R](fun/fc_find_cliques_with_node.R)

Function Defined: **find_cliques_with_node()**

#### Description:
This script defines the find_cliques_with_node() function, which identifies fully connected clusters (cliques) in a network that include a specific node.

#### Arguments:

- graph: An igraph object representing the network.
- node_name: The name of the target node for which cliques are to be found.

#### Output:

A list of character vectors, where each vector contains the vertex names of a maximal clique that includes the specified node.

#### Functionality:

1. Verifies that the node exists in the graph.
2. Identifies all maximal cliques using max_cliques().
3. Filters those that include the target node.
4. Returns the vertex names of each matching clique.

#### Purpose:
To explore local connectivity around a node by identifying all fully connected subgraphs it belongs to—useful for analyzing tightly-knit structures in language development networks.



### Colour Mapping for Language Dimensions
#### [fc_lang_to_col.R](fun/fc_lang_to_col.R)

Function Defined: **fc_lang_to_col()**

#### Description:
This script defines the fc_lang_to_col() function, which maps language evaluation dimensions (as defined by [Conti-Ramsden & Durkin (2012)](https://doi.org/10.1007/s11065-012-9208-z) to specific colours. It is primarily used to assign node background colours when plotting graphs.

#### Input:

A language dimension (character string).

#### Output:

A colour name corresponding to the input dimension.

#### Re-coding Scheme:

- "Discourse" = "pink"
- "Lexicon" = "green"
- "Pragmatics" = "cyan"
- "Semantics" = "white"
- "Phonology" = "orange"

#### Purpose:
To visually differentiate nodes in network plots based on their associated language dimension, enhancing interpretability and thematic consistency in graphical representations.


### Centrality Stability Plot Generator
#### [fc_plot.CS.R](fun/fc_plot.CS.R)

Function Defined: **plot.CS()**

#### Description:
This script defines the plot.CS() function, which generates a centrality stability plot similar to those produced by the bootnet() function with type = "case" (see Figure 5 in [Epskamp et al., 2018](https://doi.org/10.3758/s13428-017-0862-1)).

#### Arguments:

- stab.list: A stability list created using the [CS.adj()](fun/fc_CS.adj.R) function.
- tit: A character string to customize the plot title (default = "Centrality stability").

#### Purpose:
To visually represent the stability of centrality measures across varying proportions of case dropout, aiding in the interpretation of network robustness and reliability.
  

### Font Shape Mapping for Language Functions
#### [fc_rfo.R](fun/fc_rfo.R)

Function Defined: **rfo()**

#### Description:
This script defines the rfo() function, which maps language functions to numeric codes used to define font shapes when plotting graphs.

#### Input:

A character string indicating the language function:

- "Comprehension" = 1
- "Production" = 4

#### Output:

A numeric value (1 or 4) corresponding to the input string.

#### Purpose:
To visually differentiate nodes in network plots based on their linguistic function by assigning distinct font shapes, enhancing the interpretability of graph-based representations.


### Node Shape Mapping for Language Dimensions
#### [fc_rs.R](fun/fc_rs.R)

Function Defined: **rs()**

#### Description:
This script defines the rs() function, which maps language assessment dimensions—as proposed by [Bloom & Lahey (1978)](https://doi.org/10.7916/D8QZ2GQ5)—to specific node shapes used in graph plotting.

#### Input:

A character string representing a language dimension.

#### Output:

A shape name corresponding to the input dimension.

#### Re-coding Scheme:

- "Use" = "circle"
- "Form" = "triangle"
- "Content" = "square"


#### Purpose:
To visually distinguish nodes in network plots based on their linguistic dimension, enhancing clarity and thematic consistency in graphical representations.

### Define Triangle Node Shape for igraph
#### [fc_triangle.R](fun/fc_triangle.R)

Function Defined: **mytriangle()**

#### Description:
This script defines the “triangle” node shape for use with igraph visualizations in R, following the customization guidelines described by ([Kolaczyk & Csárdi (2020)](https://doi.org/10.1007/978-3-030-44129-6)).

#### Purpose:
To enable the use of triangular node shapes in network plots, supporting the visual encoding of categorical variables—such as language dimensions—in graph-based analyses.

### Convert Vector to List of Value Positions
#### [fc_vtol.R](fun/fc_vtol.R)

Function Defined: **vtol()**

#### Description:
This script defines the vtol() function, which converts a vector into a list of positions for each unique value in the vector. It was developed to support network plotting using the qgraph package [(Epskamp et al., 2012)](https://doi.org/10.18637/jss.v048.i04).

#### Input:

A vector containing categorical or repeated values.

#### Output:

A list where each element corresponds to a vector value, and contains the positions (indices) where that value occurs.

#### Purpose:
To facilitate custom node grouping and layout control in network visualizations, particularly when using the qgraph package for plotting structured graphs.



## References

-   Barrat, A., Barthélemy, M., Pastor-Satorras, R., & Vespignani, A. (2004). The architecture of complex weighted networks. *Proceedings of the National Academy of Sciences, 101*(11), 3747-3752. <https://doi.org/10.1073/pnas.0400087101>

-   Berg, J. (2018, 13 April). Obfuscating with transparency. *Science*, *360*(6385), 133. <https://doi.org/10.1126/science.aat8121>

-   Bloom, L., & Lahey, M. (1978). *Language development and language disorders*. John Wiley & Sons. <https://doi.org/10.7916/D8QZ2GQ5>

-   Constantin, M. A., Schuurman, N. K., & Vermunt, J. K. (2023). A general Monte Carlo method for sample size analysis in the context of network models. *Psychological Methods*. Advance online publication. <https://doi.org/10.1037/met0000555>

-   Conti-Ramsden, G., & Durkin, K. (2012). Language development and assessment in the preschool period. *Neuropsychology Review, 22*(4), 384–401. <https://doi.org/10.1007/s11065-012-9208-z>

-   Epskamp, S., Borsboom, D., & Fried, E. I. (2018). Estimating psychological networks and their accuracy: A tutorial paper. *Behavior Research Methods, 50*(1), 195-212. <https://doi.org/10.3758/s13428-017-0862-1>

-   Epskamp, S., Cramer, A. O., Waldorp, L. J., Schmittmann, V. D., & Borsboom, D. (2012). qgraph: Network visualizations of relationships in psychometric data. *Journal of Statistical Software, 48*(4), 1–18. <https://doi.org/10.18637/jss.v048.i04>

-   Iannone, R., Cheng, J., Schloerke, B., Hughes, E., Lauer, A., Seo, J., Brevoort, K., & Roy, O. (2025). *gt: Easily create presentation-ready display tables. R package version 1.0.0* <https://CRAN.R-project.org/package=gt>

- Kassambara, A. (2023). *rstatix: Pipe-friendly framework for basic statistical tests. R package version 0.7.2* <https://CRAN.R-project.org/package=rstatix>

-   Kolaczyk, E. D., & Csárdi G. (2020). *Statistical analysis of network data with R* (2nd ed.). Springer. <https://doi.org/10.1007/978-3-030-44129-6>

-   Larmarange, J. (2025). *labelled: Manipulating labelled data. R package version 2.14.1*. <https://CRAN.R-project.org/package=labelled>

- Müller, K., & Wickham, H. (2023). *tibble: Simple data frames. R package version 3.2.1*. <https://CRAN.R-project.org/package=tibble>

- Pedersen, T. (2025). *patchwork: The composer of plots. R package version 1.3.1*. <https://CRAN.R-project.org/package=patchwork>

-   Sjoberg, D. D., Whiting, K., Curry, M., Lavery, J. A., & Larmarange, J. (2021). Reproducible summary tables with the gtsummary package. *The R Journal, 13*(1), 570-580. <https://doi.org/10.32614/RJ-2021-053>

-   van Vliet, M. (2019). Guidelines for data analysis scripts. <https://doi.org/10.48550/arXiv.1904.06163>

-   Venables, W. N., & Ripley, B. D. (2002). *Modern applied statistics with S* (4th ed.). Springer. <https://doi.org/10.1007/978-0-387-21706-2>

-   Watts, D., & Strogatz, S. (1998, June 4). Collective dynamics of ‘small-world’ networks. *Nature, 393*(6684), 440–442. <https://doi.org/10.1038/30918>

-   Wickham, H. (2016). *ggplot2: Elegant Graphics for Data Analysis*. Springer-Verlag. <https://doi.org/10.1007/978-3-319-24277-4>

-   Wickham, H. (2023). *stringr: Simple, consistent crappers for common string operations. R package version 1.5.1* <https://CRAN.R-project.org/package=stringr>

-   Wickham, H., François, R., Henry, L, Müller, K. & Vaughan, D. (2023). *dplyr: A Grammar of Data Manipulation. R package version 1.1.2.* <https://CRAN.R-project.org/package=dplyr>

- Wickham, H., & Henry, L. (2025). *purrr: Functional programming tools. R package version 1.1.0* <https://CRAN.R-project.org/package=purrr>

-   Wickham, H., Vaughan, D., Girlich, M. (2024). *tidyr: Tidy messy data. R package version 1.3.1*. <https://CRAN.R-project.org/package=tidyr>

- World Health Organization. (2019). *Guidelines on physical activity, sedentary behaviour and sleep for children under 5 years of age*. World Health Organization. <https://www.who.int/publications/i/item/9789241550536>