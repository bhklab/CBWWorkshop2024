# Workshop

## Overview

Note: This workshop is accompanied by 4 presentations.  

In this R Package, there are 4 vignettes which correspond to 4 modules of the workshop.


By visiting the [published workshop](https://bhklab.github.io/CBWWorkshop2024/), you can see the following modules:

1. Module 1 Lab: Getting to know multi-omics data (Julia, Nikta, Jermiah)
2. [Module 2 Lab: Hands-on with pharmacogenomics data (Jermiah, Almas)](https://bhklab.github.io/CBWWorkshop2024/articles/module2.html)
3. Module 3: Pharmacogenomics for biomarker discovery - Basic analysis (Nikta, Julia)
4. Module 4: Pharmacogenomics for biomarker discovery - Advanced analysis (Nikta, Julia)

To view the vignettes, click on the `articles` tab in the package landing page.

## Setup

### Installing from GitHub
Run 
```R
pak::pkg_install("bhklab/CBWWorkshop2024")
``` 

to install this package and its dependencies.


## Contributing

### Adding to the repo 

1. Clone the repository and create a new branch

```
git clone https://github.com/bhklab/CBWWorkshop2024.git
cd CBWWorkshop2024
git checkout -b <your-branch-name>
```

2. Add your changes

``` 
# Make a new Vignette 
biocthis::use_bioc_vignette("Module3", "Module 3: TITLE")

# Your vignette should be in the vignettes folder
# Make a bunch of changes, atleast delete all the content and add your own
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
See this helpful guide on resolving conflicts: [https://docs.github.com/en/github/collaborating-with-pull-requests/addressing-merge-conflicts/resolving-a-merge-conflict-using-the-command-line](https://docs.github.com/en/github/collaborating-with-pull-requests/addressing-merge-conflicts/resolving-a-merge-conflict-using-the-command-line)
