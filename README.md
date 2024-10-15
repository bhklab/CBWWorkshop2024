<!-- badges: start -->
  [![pkgdown](https://github.com/bhklab/CBWWorkshop2024/actions/workflows/pkgdown.yaml/badge.svg)](https://github.com/bhklab/CBWWorkshop2024/actions/workflows/pkgdown.yaml)
  ![GitHub R package version](https://img.shields.io/github/r-package/v/bhklab/CBWWorkshop2024?label=pkg-version&color=green)
<!-- badges: end -->
  
# Pharmacogenomics CBW 2024 

The Canadian Bioinformatics Workshops (CBW) are a series of hands-on training 
sessions that provide bioinformatics training to biologists, researchers, and 
other professionals. 

Each workshop is designed to provide both theoretical knowledge and practical 
experience, ensuring participants leave with the skills and tools to apply 
bioinformatics techniques to their own research.

## Overview: Pharmacogenomics Data Analysis

This workshop delves into the rapidly advancing field of personalized cancer 
treatment, emphasizing how treatments can be tailored to individual patients
based on their unique molecular profiles. Participants will gain a foundational 
understanding of pharmacogenomics, focusing specifically on cancer biomarker 
analysis, and will be guided through a comprehensive workflow from basic 
concepts to advanced biomarker discovery techniques. Participants will be 
introduced to the [`PharmacoGx` package](https://www.bioconductor.org/packages/release/bioc/html/PharmacoGx.html) 
and how to use it to analyze pharmacogenomics data.
Through hands-on tutorials and practical exercises, participants will learn how 
to extract, analyze, and visualize data to identify robust cancer biomarkers, 
with transferable skills applicable to other areas of disease research.

Note: This workshop is accompanied by 4 presentations.  

*Distribution*: The workshop is developed as an R package. The package contains
vignettes, and data that correspond to the workshop modules.

The workshop will also be published by the [CBW Workshop Website](https://bioinformaticsdotca.github.io/PGX_2024)


By visiting the [published workshop](https://bhklab.github.io/CBWWorkshop2024/),
you can see the following modules:

1. [Module 1 Lab: Getting to know multi-omics data (Julia, Nikta, Jermiah)](https://bhklab.github.io/CBWWorkshop2024/articles/Module1.html)
2. [Module 2 Lab: Hands-on with pharmacogenomics data (Jermiah, Almas)](https://bhklab.github.io/CBWWorkshop2024/articles/Module2.html)
3. [Module 3: Pharmacogenomics for biomarker discovery - Basic analysis (Nikta, Julia)](https://bhklab.github.io/CBWWorkshop2024/articles/Module3.html)
4. [Module 4: Pharmacogenomics for biomarker discovery - Advanced analysis (Nikta, Julia)](https://bhklab.github.io/CBWWorkshop2024/articles/Module4.html)

To view the vignettes, click on the `articles` tab in the package landing page.

## Setup for Workshop Participants

### Installing from GitHub
Run to install this package and its dependencies.

```R
pak::pkg_install("bhklab/CBWWorkshop2024", dependencies=TRUE)
```

> [!NOTE]  
> You may need to install the `pak` package first. `pak` is a ["Fresh Approach to R Package Installation"](https://pak.r-lib.org/). You can install it by running:
> ```R
> install.packages("pak")
> ```


## Contributing

### 

### Adding to the repo 

0. Installing developer tools

If you haven't worked with R packages before, some packages make life a lot 
easier. You can do install them by running the following command in R:

```R
pkgs <- c("devtools", "usethis", "roxygen2", "testthat", "biocthis")
pak::pkg_install(pkgs)
```

1. Clone the repository and create a new branch

```
git clone https://github.com/bhklab/CBWWorkshop2024.git
cd CBWWorkshop2024
git checkout -b <your-branch-name>
```

2. Add your changes

Example 1: add yourself as an author to the package
``` R
usethis::use_author("firstname", "secondname", role="aut")
# your name should now appear in the description file
```

Example 2: Add a new vignette
``` 
# Make a new Vignette 
biocthis::use_bioc_vignette("Module3", "Module 3: TITLE")

# Your vignette should be in the vignettes folder
# Make a bunch of changes, atleast delete all the auto-generated
# and add your own content
```

3. Commit and push your changes

```
git add .
git commit -m "DESCRIPTIVE MESSAGE"
git push
```

4. Create a pull request

Visit the github repo and create a pull request at [https://github.com/bhklab/CBWWorkshop2024](https://github.com/bhklab/CBWWorkshop2024/pulls)

### Merging changes from the main branch

If the `main` branch has been updated, you can merge the changes into your branch by running the following commands:

```
git fetch origin
git checkout main
git pull
```

Then, merge the changes into your branch

```
git checkout <your-branch-name>
git merge origin/main
```

If there are conflicts, you will need to resolve them before you can merge the changes.
[See this helpful guide on resolving conflicts:](https://docs.github.com/en/github/collaborating-with-pull-requests/addressing-merge-conflicts/resolving-a-merge-conflict-using-the-command-line)
