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

Here below you can find a brief description of every single file contained in the project. Files are classified considering the type of information contained in the file considering the folder structure listed above. Additionally, you can find the full list of files in the project in the file [Folders and Files Map](Folders_Files_Map.html). To have a clearer view of the workflow, it is suggested to see the [Scripts Table](scripts_table.html).
 



## R Packages needed to run source code

Some R packages are used to analyse data. The packages are invoked in the code files listed below and *detached* by restarting R after a file is processed. Here you are the list of packages needed to run this project in R:

-   powerly ([Constantin et al., 2023](https://doi.org/10.1037/met0000555))
-   dplyr ([Wickham et al., 2023](https://CRAN.R-project.org/package=dplyr))
-   bootnet ([Epskamp et al., 2017](https://doi.org/10.3758/s13428-017-0862-1))
-   qgraph ([Epskamp et al., 2012](https://doi.org/10.18637/jss.v048.i04))


Note the required packages are loaded at the beginning of source code files and detached at the end of each source code file.































































# References

- Barrat, A., Barthélemy, M., Pastor-Satorras, R., & Vespignani, A. (2004). The architecture of complex weighted networks. *Proceedings of the National Academy of Sciences, 101*(11), 3747-3752. <https://doi.org/10.1073/pnas.0400087101>

- Berg, J. (2018, 13 April). Obfuscating with transparency. *Science*, *360*(6385), 133. <https://doi.org/10.1126/science.aat8121>

- Bloom, L., & Lahey, M. (1978). *Language development and language disorders*. John Wiley & Sons. <https://doi.org/10.7916/D8QZ2GQ5>

- Constantin, M. A., Schuurman, N. K., & Vermunt, J. K. (2023). A general Monte Carlo method for sample size analysis in the context of network models. *Psychological Methods*. Advance online publication. <https://doi.org/10.1037/met0000555>

- Conti-Ramsden, G., & Durkin, K. (2012). Language development and assessment in the preschool period. *Neuropsychology Review, 22*(4), 384–401. <https://doi.org/10.1007/s11065-012-9208-z>

- Epskamp, S., Borsboom, D., & Fried, E. I. (2017). Estimating psychological networks and
  their accuracy: A tutorial paper. *Behavior Research Methods, 50*(1), 195-212. <https://doi.org/10.3758/s13428-017-0862-1>
  
- Epskamp, S., Cramer, A. O., Waldorp, L. J., Schmittmann, V. D., & Borsboom, D. (2012). qgraph: Network visualizations of relationships in psychometric data. *Journal of Statistical Software, 48*(4), 1–18. <https://doi.org/10.18637/jss.v048.i04>

- van Vliet, M. (2019). Guidelines for data analysis scripts. <https://doi.org/10.48550/arXiv.1904.06163>

- Watts, D., & Strogatz, S. (1998, 4 de June). Collective dynamics of ‘small-world’ networks. *Nature 393*(6684), 440–442. https://doi.org/10.1038/30918

- Wickham, H., François, R., Henry, L, Müller, K. & Vaughan, D. (2023). *dplyr: A Grammar of Data Manipulation. R package version 1.1.2.*  <https://CRAN.R-project.org/package=dplyr>

