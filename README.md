'LaDeNetST: Language Development Networks and Screen Time'
================

# Introduction

This the README file for the project *LaDeNetST: Language Development Networks and Screen Time* which was created to document the paper entitled "xxx xxx xxxx xxx xxx xxx xxx xxx xxx xxx xxx xxx xxx xxx xxx".

This project has been produced to allow reproducibility and checking [(Berg, 2018)](https://doi.org/10.1126/science.aat8121). As can be seen below, we provide source R code, figures, tables and the needed meta-information to replicate and check our analysis. Note we use random seeds to contribute replication when using randomly generated data or models. The information contained here can be also found in the files [README.pdf](README.pdf) and [README.html](README.html). This project is regulated under [GNU General Public License (GPL) 3.0](LICENSE).

Please, note this project will be uploaded and updated into three different websites: the [Open Science Framework (OSF)](https://osf.io/), [GitHub](https://github.com/) and [Zenodo](https://zenodo.org/). These are the identifiers to locate the project information in the mentioned websites:

-   OSF: <https://osf.io/xxxxxxxxxxxxxxxxxxxx>, this is a blind link (conceived to grantee blind peer-review) for review purposes but it will be updated to the public link after acceptance or publishing. The DOI for this project will be generated just after making public the project.
-   GitHub: *the repository in that platform will be made public after acceptance or publishing to grantee blind review.*
-   Zenodo: *the project will be released in that platform after acceptance or publishing to grantee blind review.*

**Warning!** The links to files are designed to properly work in the GitHub repository context or after downloading the whole project and opening it locally. As a result, none of the links will work in the [README.pdf](README.pdf) or [README.html](README.html) when open in the OSF website.


## Project structure overview

There are four key files in this project: a) the [README](README.md) file (this file, as said before, comes in two different formats -- [.pdf](README.pdf), and [.html](README.html)), b) the [nsch23.rds](dat/nsch23.rds) file, which contains the raw data, c) the [STnets_vmap.xlsx](dat/STnets_vmap.xlsx) file which contains the variable dictionary to correctly interpret the processed data, and d) the [workflow_LaDeNetST.R](workflow_LaDeNetST.R) which is considered the R master file of the project. The [workflow_LaDeNetST.R](workflow_LaDeNetST.R) file can be used to invoke all R source code files contained in that project. As a result, it is considered the file that trigger statistical analysis execution and produces figures, tables, and intermediate datasets.

The project has five folders or directories. The **root** directory is the one containing the whole project (*LaDeNetST*). Here you are a brief description of folders content:

-   The **dat** folder contains the main raw data file [nsch23.rds](dat/nsch23.rds). This directory is also the destiny of intermediate datasets to be analysed across the workflow.
-   The **stx** folder contains all R source code files. As an exception, the master file (the [workflow_LaDeNetST.R](workflow_LaDeNetST.R) file) is not contained into this folder but in the root directory of the project. As can be noticed, the names of the files contained in this folders are sensitive to workflow sequence [(van Vliet, 2019)](https://doi.org/10.48550/arXiv.1904.06163).
-   The **fig** folder contains figures.
-   The **tab** folder contains results tables.
-   The **fun** folder contains functions designed to run specific analysis.

Here below you can find a brief description of every single file contained in the project. Files are classified considering the type of information contained in the file considering the folder structure listed above. Additionally, you can find the full list of files in the project in the file [Folders and Files Map](Folders_Files_Map.md). To have a clearer view of the workflow, it is suggested to see the [Scripts Table](scripts_table.md).
 

## R packages needed to run source code

Some R packages are used to analyse data. The packages are invoked in the code files listed below and *detached* by restarting R after a file is processed. Here you are the list of packages needed to run this project in R:

-   powerly ([Constantin et al., 2023](https://doi.org/10.1037/met0000555))
-   dplyr ([Wickham et al., 2023](https://CRAN.R-project.org/package=dplyr))
-   cluster ([Maechler et al., 2023](https://CRAN.R-project.org/package=cluster))
-   clustMixType ([Szepannek, 2018](https://doi.org/10.32614/RJ-2018-048))
-   NbClust ([Charrad et al., 2014](https://doi.org/10.18637/jss.v061.i06))
-   bootnet ([Epskamp et al., 2017](https://doi.org/10.3758/s13428-017-0862-1))
-   qgraph ([Epskamp et al., 2012](https://doi.org/10.18637/jss.v048.i04))
-   igraph ([Kolaczyk &  Csárdi, 2020](https://doi.org/10.1007/978-3-030-44129-6))
-   ggplot2 ([Wickham, 2016](https://doi.org/10.1007/978-3-319-24277-4))
-   MASS ([Venables & Ripley, 2002](https://doi.org/10.1007/978-0-387-21706-2))
-   stringr ([Wickham, 2023](https://CRAN.R-project.org/package=stringr))
-   tidyr ([Wickham et al., 2024](https://CRAN.R-project.org/package=tidyr))
-   gt ([Iannone et al., 2025](https://CRAN.R-project.org/package=gt))
-   gtsummary ([Sjoberg et al., 2021](https://doi.org/10.32614/RJ-2021-053))
-   labelled ([Larmarange, 2025](https://CRAN.R-project.org/package=labelled))

Note the required packages are loaded at the beginning of source code files and detached at the end of each source code file. To see the role each package has on workflow, it is recommended to have a look at the [Scripts Table](scripts_table.md) file.


## Data Files

### [a12.rds](dat/a12.rds) and [a35.rds](dat/a35.rds)

### [a12_c.rds](dat/a12_c.rds) and [a35_c.rds](dat/a35_c.rds)

### [boots.12.RData](dat/boots.12.RData) and [boots.35.RData](dat/boots.35.RData)

### [c12.rds](dat/c12.rds) and [c35.rds](dat/c35.rds)

### [clus_out.RData](dat/clus_out.RData)
  
### [CS-data.RData](dat/CS-data.RData)
  
### [Nets12.RData](dat/Nets12.RData) and [Nets35.RData](dat/Nets35.RData)
  
### [nf12.csv](dat/nf12.csv) and [nf35.csv](dat/nf35.csv)

### [nsch23.rds](dat/nsch23.rds)

This is the main row data file in this project (*n* = 55,162, 456 variables). It comes from the [United States Census Bureau](https://www.census.gov/en.html). This file contains a single object for the R programming language called *nsch23*. The data in this file was imported from the [SAS Topical Data and Input Files](https://www.census.gov/programs-surveys/nsch/data/datasets.html) containing the data collected in the 2023 wave of the [National Survey of Children's Health (NSCH)](https://www.census.gov/nsch).

### [rt1.csv](dat/rt1.csv), [rt1.rds](dat/rt1.rds), and [rt1_2.csv](dat/rt1_2.csv)

### [sigNets12.RData](dat/sigNets12.RData) and [sigNets35.RData](dat/sigNets35.RData)

### [STnets_vmap.xlsx](dat/STnets_vmap.xlsx)

It is a Microsoft Excel file containing the codebook for the variables used in this project. The codebook is in the tab *VariablesMap*. The table in that tab has 11 columns and 36 rows (first row is reserved for column titles). The columns refer to:

- *Variable numeric code*: It is an arbitrary assigned label to identify variables in that study.
- *Original variable name*: It indicates the original name for variables coming from the [nsch23.rds](dat/nsch23.rds).  
- *Recoded variable name*: It is the shortened name assigned to variables in this project. 
- *Item*: It is the item statement originally presented to parents. More details about the items can be found in the [codebook for the NSCH 2023 data collection wave](https://www.census.gov/data-tools/demo/uccb/nschdict?s_year=2023).  
- *Original alternatives*: It contains the original alternatives for each item in the NSCH 2023 survey. More details about the items can be found in the [codebook for the NSCH 2023 data collection wave](https://www.census.gov/data-tools/demo/uccb/nschdict?s_year=2023).
- *Recoded alternatives*: This column indicates how item alternatives were recoded in this project. Original item alternatives about language development were recoded to indicate when children had not achieved the language development milestones. Socio demographic items were recoded to make them consistent with previous scientific literature on the topic.
- *Topic*: It refers to the dimension or topic in the 2023 NSCH survey.
- *Language skills*: It indicates whether the item is referred to productive or comprehensive language.
- *Bloom & Lahey (1978)*: It indicates whether language items refer to *content*, *form* or *use* dimensions of language assessment as stated by [Bloom & Lahey (1978)](https://doi.org/10.7916/D8QZ2GQ5).
- *Conti-Ramsden & Durkin (2012)*: It refers to language assessments dimensions identified by [Conti-Ramsden & Durkin (2012)](https://doi.org/10.1007/s11065-012-9208-z).
- *Universe*: It indicates who answered the items. Three possible alternatives applies:
    - *All*: All participants taking part in the 2023 NSCH survey.
    - *>=1*: Parents whose children were one year or older.
    - *>=3*: Parents whose children were three year or older.


### cs12 and cs35 folders




## Figure files

### [all.pdf](fig/all.pdf), [g12.pdf](fig/g12.pdf), [g35.pdf](fig/g35.pdf), [Bg.all.pdf](fig/Bg.all.pdf), [Bg12.pdf](fig/Bg12.pdf), and [Bg35.pdf](fig/Bg35.pdf)

All these files contain networks. Files [g12.pdf](fig/g12.pdf), [g35.pdf](fig/g35.pdf), and [all.pdf](fig/all.pdf) contain preliminary networks estimated with estimateNetwork() function implemented in bootnet R package ([Epskamp et al., 2017](https://doi.org/10.3758/s13428-017-0862-1)) whereas [Bg.all.pdf](fig/Bg.all.pdf), [Bg12.pdf](fig/Bg12.pdf), and [Bg35.pdf](fig/Bg35.pdf) are the finally selected networks plotted with igraph R package igraph ([Kolaczyk &  Csárdi, 2020](https://doi.org/10.1007/978-3-030-44129-6)). The files labelled with "12" refers contain networks for children aged 1 to 2, the label "35" refers to children aged 3 to 5 whereas label "all" is used to say both 1-to-2 and 3-to-5 networks are plotted together. In all cases, the thickness of the edges encode the strength of association between nodes. Nodes encode three different characteristics as a function of the following features:

- Node shape: There are three possible node shapes encoding language assessment dimensions proposed by [Bloom & Lahey (1978)](https://doi.org/10.7916/D8QZ2GQ5):
  - Circle nodes ($\circ$) refer to *use* items.
  - Triangle nodes ($\triangle$) refer to *form* items.
  - Square nodes ($\square$) refer to *content* items.

- Node background colour: There are four possible colours to fill nodes each one referring to the language assessment dimensions proposed by [Conti-Ramsden & Durkin (2012)](https://doi.org/10.1007/s11065-012-9208-z):
  - Lexicon (<span style="color:green">green</span>): It refers to the vocabulary of a language.
  - Pragmatics (<span style="color:cyan">cyan</span>): It refers to communicative functions and conventions used in a language.
  - Discourse (<span style="color:pink">pink</span>): It refers to the integration of language productions into longer conversations.
  - Semantics (white): It refers to meaning.
  - Phonology (<span style="color:orange">orange</span>): It refers to the sounds of a language.
  

- Node label font type: Font type encodes the two general dimensions, comprehension and production, of language assessment. The coding is the following:
  - Regular font shape refer to *comprehension* items.
  - Italics and bold face fonts refer to *production* items.





### [clp12.pdf](fig/clp12.pdf) and [clp35.pdf](fig/clp35.pdf)

### [cp12.pdf](fig/cp12.pdf) and [cp35.pdf](fig/cp35.pdf)

### [cs12.pdf](fig/cs12.pdf) and [cs35.pdf](fig/cs35.pdf)

### [edgeCI_12.pdf](fig/edgeCI_12.pdf) and [edgeCI_35.pdf](fig/edgeCI_35.pdf)

### [sampleSize.pdf](fig/sampleSize.pdf)

It is a two pages PDF document containing sample size estimations for networks analysis ([Constantin et al., 2023](https://doi.org/10.1037/met0000555)) for children aged 1 or 2 (page 1) and children aged 3 to 5 (page 2).








## Functions files

### [fc_cc.R](fun/fc_cc.R)

### [fc_corStabSum.R](fun/fc_corStabSum.R)

### [fc_CS.adj.R](fun/fc_CS.adj.R)

### [fc_cs.ci.R](fun/fc_cs.ci.R)

### [fc_df_to_tab.R](fun/fc_df_to_tab.R)

### [fc_lang_to_col.R](fun/fc_lang_to_col.R)

### [fc_plot.CS.R](fun/fc_plot.CS.R)

### [fc_rfo.R](fun/fc_rfo.R)

### [fc_rs.R](fun/fc_rs.R)

### [fc_triangle.R](fun/fc_triangle.R)

### [fc_vtol.R](fun/fc_vtol.R)










## Source code files

### [01_SampleSize.R](stx/01_SampleSize.R)

This file was was designed to estimate the required sample size for network analysis by using the powerly R package ([Constantin et al., 2023](https://doi.org/10.1037/met0000555)). This file produces the [sampleSize.pdf](fig/sampleSize.pdf) file which contains sample size estimation plots for children aged 1 or 2 (page 1) and children aged 3 to 5 (page 2). 

### [02_variables.R](stx/02_variables.R)

### [03_recode.R](stx/03_recode.R)

### [04_cluster.R](stx/04_cluster.R)

### [05_tipify.R](stx/05_tipify.R)

### [06_netEst.R](stx/06_netEst.R)

### [07_bootNets.R](stx/07_bootNets.R)

### [08_clinNets.R](stx/08_clinNets.R)

### [09_plotCliNets.R](stx/09_plotCliNets.R)

### [10_Fig_desc_Nets.R](stx/10_Fig_desc_Nets.R)

### [11_Tab_desc_Nets.R](stx/11_Tab_desc_Nets.R)

### [12_edgeCI.R](stx/12_edgeCI.R)

### [13_CS.R](stx/13_CS.R)

xxx x x x x xx xxxxx xxxx

```r
##************************************************************
# 
# Children aged 1 to 2
cs12 <- list()

key <- format(Sys.time(), "%d%m%y%H%M%S")

for (i in 1:length(am12)){
  cs12[[i]] <- CS.adj(am12[[i]], ss12[[i]], n_iter = 50)
}

saveRDS(cs12, paste0("dat/cs12/cs12_", key, ".rds"))
# 
##************************************************************

```
For children aged 3 to 5 the omitted code is this:

```r
##************************************************************
# 
# # Children aged 3 to 5
cs35 <- list()

key <- format(Sys.time(), "%d%m%y%H%M%S")

for (i in 1:length(am35)){
  cs35[[i]] <- CS.adj(am35[[i]], ss35[[i]], n_iter = 50)
}

saveRDS(cs35, paste0("dat/cs35/cs35_", key, ".rds"))
# 
##************************************************************
```

### [14_sampDesc.R](stx/14_sampDesc.R)

### [15_clustDesc.R](stx/15_clustDesc.R)








## Table files 

### [CenTab12.html](tab/CenTab12.html) and [CenTab12.md](tab/CenTab12.md)

### [CenTab35.html](tab/CenTab35.html) and [CenTab35.md](tab/CenTab35.md)

### [ClustTab12.html](tab/ClustTab12.html), [ClustTab12.md](tab/ClustTab12.md), [ClustTab35.html](tab/ClustTab35.html), and [ClustTab35.md](tab/ClustTab35.md)

xxxx xxxxxxx xxxxxxx xxxxxxx 

- WS: It refers to the [Watts & Strogatz (1998)](https://doi.org/10.1038/30918) clustering coefficient for each node.

- Barrat: It refers to [Barrat et al. (2024)](https://doi.org/10.1073/pnas.0400087101) clustering coefficient for each node.

### [CS12.html](tab/CS12.html) and [CS12.md](tab/CS12.md)

### [CS35.html](tab/CS35.html) and [CS35.md](tab/CS35.md)

### [Table_1.html](tab/Table_1.html)

### [Table_2.html](tab/Table_2.html)

### [Table_3.html](tab/Table_3.html)

### [Table_4.html](tab/Table_4.html)

### [Table_5.html](tab/Table_5.html)




























































# References

- Barrat, A., Barthélemy, M., Pastor-Satorras, R., & Vespignani, A. (2004). The architecture of complex weighted networks. *Proceedings of the National Academy of Sciences, 101*(11), 3747-3752. <https://doi.org/10.1073/pnas.0400087101>

- Berg, J. (2018, 13 April). Obfuscating with transparency. *Science*, *360*(6385), 133. <https://doi.org/10.1126/science.aat8121>

- Bloom, L., & Lahey, M. (1978). *Language development and language disorders*. John Wiley & Sons. <https://doi.org/10.7916/D8QZ2GQ5>

- Charrad, M., Ghazzali, N., Boiteau, V., & Niknafs, A. (2014). NbClust: an R package for determining the relevant number of clusters in a data set. *Journal of Statistical Software, 61*(6), 1–36. <https://doi.org/10.18637/jss.v061.i06>

- Constantin, M. A., Schuurman, N. K., & Vermunt, J. K. (2023). A general Monte Carlo method for sample size analysis in the context of network models. *Psychological Methods*. Advance online publication. <https://doi.org/10.1037/met0000555>

- Conti-Ramsden, G., & Durkin, K. (2012). Language development and assessment in the preschool period. *Neuropsychology Review, 22*(4), 384–401. <https://doi.org/10.1007/s11065-012-9208-z>

- Epskamp, S., Borsboom, D., & Fried, E. I. (2017). Estimating psychological networks and
  their accuracy: A tutorial paper. *Behavior Research Methods, 50*(1), 195-212. <https://doi.org/10.3758/s13428-017-0862-1>
  
- Epskamp, S., Cramer, A. O., Waldorp, L. J., Schmittmann, V. D., & Borsboom, D. (2012). qgraph: Network visualizations of relationships in psychometric data. *Journal of Statistical Software, 48*(4), 1–18. <https://doi.org/10.18637/jss.v048.i04>

- Iannone, R., Cheng, J., Schloerke, B., Hughes, E., Lauer, A., Seo, J., Brevoort, K., & Roy, O. (2025). *gt: Easily create presentation-ready display tables. R package version 1.0.0* <https://CRAN.R-project.org/package=gt>

- Kolaczyk, E. D., & Csárdi G. (2020). *Statistical  analysis  of  network  data with R* (2nd ed.). Springer. <https://doi.org/10.1007/978-3-030-44129-6>

- Larmarange, J. (2025). *labelled: Manipulating labelled data. R package version 2.14.1*. <https://CRAN.R-project.org/package=labelled>

- Maechler, M., Rousseeuw, P., Struyf, A., Hubert, M., & Hornik, K. (2023).
  *cluster: Cluster Analysis Basics and Extensions. R package version 2.1.6.* <https://cran.r-project.org/package=cluster>

- Sjoberg, D. D., Whiting, K., Curry, M., Lavery, J. A., & Larmarange, J. (2021). Reproducible summary tables with the gtsummary package. *The R Journal, 13*(1), 570-580. <https://doi.org/10.32614/RJ-2021-053>
  
- Szepannek, G. (2018). clustMixType: User-friendly clustering of mixed-type data in R. *The R Journal, 10*(2), 200-208. <https://doi.org/10.32614/RJ-2018-048>

- van Vliet, M. (2019). Guidelines for data analysis scripts. <https://doi.org/10.48550/arXiv.1904.06163>

- Venables, W. N., & Ripley, B. D. (2002). *Modern applied statistics with S* (4th ed.). Springer. <https://doi.org/10.1007/978-0-387-21706-2>

- Watts, D., & Strogatz, S. (1998, 4 de June). Collective dynamics of ‘small-world’ networks. *Nature 393*(6684), 440–442. https://doi.org/10.1038/30918

- Wickham, H. (2016). *ggplot2: Elegant Graphics for Data Analysis*. Springer-Verlag. <https://doi.org/10.1007/978-3-319-24277-4>

- Wickham, H. (2023). *stringr: Simple, consistent crappers for common string operations. R package version 1.5.1* <https://CRAN.R-project.org/package=stringr>

- Wickham, H., François, R., Henry, L, Müller, K. & Vaughan, D. (2023). *dplyr: A Grammar of Data Manipulation. R package version 1.1.2.*  <https://CRAN.R-project.org/package=dplyr>

- Wickham, H., Vaughan, D., Girlich, M. (2024). *tidyr: Tidy messy data. R package version 1.3.1*. <https://CRAN.R-project.org/package=tidyr>