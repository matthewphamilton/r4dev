---
title: "Installation"
linkTitle: "Installation"
weight: 266
description: >
  Important information to review before installing and using our software
---

## Pre-requisites

A pre-requisite to install and use ready4 is to have an up to date version of R installed on your machine. It is also recommended that you install RStudio.

If you plan on using ready4's computational model authoring tools, you will need to have set-up and appropriately configured your own accounts in:

- [GitHub](https://github.com) (you will need write permissions to a GitHub organisation and enable GitHub actions and GitHub pages support for the repositories you create in that organisation);
- [Zenodo](https://zenodo.org) (you will need to have linked each GitHub repository rused for your ready4 projects to your Zenodo account); and
- [Codecov](https://about.codecov.io) (linked to your GitHub organisation)

If you wish to share data using ready4's data management tools you will need to have set up an account on a [Dataverse](https://dataverse.org) installation (we recommend using the [Harvard Dataverse](https://dataverse.harvard.edu)) and have write permissions to the Dataverse Datasets that you plan to use in conjunction with ready4.

Holders of GitHub and Dataverse accounts will ensure that the machine onto which they install ready4 has securely stored their credentials for these services (specifically, values for GITHUB_PAT, DATAVERSE_KEY and DATAVERSE_SERVER tokens).

## Disclaimer
All ready4 software is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Furthermore, no ready4 software is yet sufficiently well documented and tested to be given a production release. All ready4 software should therefore viewed as in-development pre-releases.

## Installation
As ready4 R packages have yet to be submitted to CRAN as production releases, you will need to use a tool like devtools to assist with installing ready4 R packages. If you do not have devtools on your machine you can install it as follows:

```r
utils::install.packages("devtools")
```
Once you have devtools installed, you can now install the ready4 framework library.

```r
devtools::install_github("ready4-dev/ready4")
```

If you are planning on writing new ready4 computational model modules (only recommended for data scientists), then you can install the relevant ready4 authoring tools (otherwise skip this step).

```r
devtools::install_github("ready4-dev/ready4pack")
```

If you plan on using existing ready4 modules for a modelling project, you can review currently available modules, before installing the libraries that are relevant to your project. For example, if you are planning to predict health utility using some of the mapping algorithms that we have previously developed, you can install the youthu library.

```r
devtools::install_github("ready4-dev/youthu")
```

If you are planning on using ready4 to implement a reproducible analysis and share outputs of that analysis, you will need to have the ready4show and ready4use R packages installed respectively. Depending on what ready4 modules you have installed, they may already be installed as package dependencies. You can check if they are present with the following commands:

```r
find.package("ready4use")
```
```r
find.package("ready4show")
```

If either of these commands produces an error, the relevant package is not installed. This can be rectified with the following commands:

```r
devtools::install_github("ready4-dev/ready4show")
```
```r
devtools::install_github("ready4-dev/ready4use")
```

## Set-up
A small number of ready4 modules require that you configure some of the dependencies installed with them before they can be used. In particular:

- If you are using modules from the TTU package to undertake a utility mapping study, you will need to have both installed and configured the cmdstanr R package as per the instructions on [that package's documentation website](https://mc-stan.org/cmdstanr/)

- If you are using the mychoice package to undertake a discrete choice experiment study and are using a Mac, you need to ensure that you have a Fortran compiler installed. Some relevant advice on this: https://mac.r-project.org/tools/


## Try it out!

Before you apply ready4 tools to your own project, you should make sure you can run some or all of the example code included in the documentation website for each ready4 R package that you installed. The package website URL takes the form of `https://ready4-dev.github.io/PACKAGE_NAME` (so the ready4 package's website is at https://ready4-dev.github.io/ready4)

