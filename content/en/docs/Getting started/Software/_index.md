---
title: "ready4 software tools"
linkTitle: "Software"
weight: 26
description: >
  ready4 includes a range of different software tools for developing and applying youth mental health computational models.
---

To help ensure the models we develop are as transparent as possible and to make their algorithms as useful to others as possible, all our software is free and open-source. 

## Types of software
Software to implement computational models is released as code libraries. Software to apply computational models to data and to report the resulting analyses are released as programs or sub-routines.

### Libraries
ready4 code libraries (all currently R packages) are used to provide:
- tools for applying and extending a consistent modelling framework; and
- modules of computational models developed with that framework.

#### Framework libraries

The two types of framework libraries are:

- ![](https://img.shields.io/badge/ready4-foundation-coral?style=flat&labelColor=black&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABHNCSVQICAgIfAhkiAAAAAFzUkdCAK7OHOkAAAAEZ0FNQQAAsY8L/GEFAAAACXBIWXMAABYlAAAWJQFJUiTwAAAAIXRFWHRDcmVhdGlvbiBUaW1lADIwMjI6MDM6MDcgMTY6MTM6NTPZeG5UAAABa0lEQVQ4T4WT607CQBCFpyUi3qIR0eAfNfCi/vENfEgENIAIlcJ6vr1oLaZOerJzdst0zpklc49nznqHZs6ZfWwDem1xM1sqXwtXkb8rL4SuOLEoLXPPXWfD01Dg9dPsrTQbngQ+EZ+LDyIfiy/FHyIfFZbbTslWKOOqxx/uWBPSfp07FahGlqlNfWGqL9HNfBO+CAfwdO55WS8g4MFML834sfJVA9e7vwsg50aGohncdmRojV9XeL+jArRNmZxVSJ4Acj3NHqARdyeFJqC2KJiCfKE9zsfxnNYTl5TcCtmNMcwY/ZXf+3wdzzVza2vj4iCaq3d1R/bvwVSH6IPjNIUHx0FSNZA7WquDqOVb35+eiO8h7Oe+vRfp0a3yGtFMDuiAIg2R20YaVwJ3Hj+4kehO/J/I7VJ/jHtpvBP6mrHnR4EzdyQ0xI8HhM8jUiChxVpDK3iVuadzx43yRdI4E2d0gNtX74TCs419AR8YEST/cHPBAAAAAElFTkSuQmCC) - the foundational ready4 module and syntax; and

 - ![](https://img.shields.io/badge/ready4-authoring-maroon?style=flat&labelColor=black&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABdUlEQVQ4T42TO0gDQRCGv3tsLqawEwtBsbOws7ExIIrYi02sLATBUkFQrG1E8IEPUOwsLMS0Wola2AiawkcZLG2SQnNe7kY2dyHhzEW32WLm//af2RmjVEBwwXyBYABwaHuMIiAgfWGaUXpE0jkwnyEYBHc9WW8+gbMWAtwN8Mc14A7JjEQiIwxIggs7D/ZVmFvNwfeyBhQQtQv2KVRnwFtoOLBPwB8D6Y3sFsFZAqMMlX2Q/gigwzVAriFWO6COQLqhou8IojOsU/Cj3JqDOEBtgzpuwOKQtoD6y/FWNkMSAdIJzmryLwR9UDkH6yyphGlwFsG6/g2RNLhbEAz/1QPvN6RZ/K8m0gSJi1sCrEtQB+DNgz8R2fcgtQLVqdB27ZQhtQnmG3hz4I/qObhHMlnQr6Lg8xZIt26k2gN12Jjar7wGPCAdk2B8gHSBN6s3pDXAfAX7Ig4oIMY7WDfgZ0F62iyjgHUFeqmCoXoJ0SS2X+Lk6A8CAbAFEGOxOgAAAABJRU5ErkJggg==) -  tools to implement standardised, semi-automated workflows for authoring and documenting computational models.
 
#### Module libraries
[Computational models](/docs/computational-models/) developed with ready4 are intended to be both generalisable (they are tools that can be used in multiple decision contexts) and modular (they are comprised of self-contained components, each of which performs a narrow sub-set of tasks). For these reasons, ready4 computational models are developed and distributed as libraries of modules. The three types of computational module libraries are:
 
  - ![](https://img.shields.io/badge/ready4-description-navy?style=flat&labelColor=black&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABdUlEQVQ4T42TO0gDQRCGv3tsLqawEwtBsbOws7ExIIrYi02sLATBUkFQrG1E8IEPUOwsLMS0Wola2AiawkcZLG2SQnNe7kY2dyHhzEW32WLm//af2RmjVEBwwXyBYABwaHuMIiAgfWGaUXpE0jkwnyEYBHc9WW8+gbMWAtwN8Mc14A7JjEQiIwxIggs7D/ZVmFvNwfeyBhQQtQv2KVRnwFtoOLBPwB8D6Y3sFsFZAqMMlX2Q/gigwzVAriFWO6COQLqhou8IojOsU/Cj3JqDOEBtgzpuwOKQtoD6y/FWNkMSAdIJzmryLwR9UDkH6yyphGlwFsG6/g2RNLhbEAz/1QPvN6RZ/K8m0gSJi1sCrEtQB+DNgz8R2fcgtQLVqdB27ZQhtQnmG3hz4I/qObhHMlnQr6Lg8xZIt26k2gN12Jjar7wGPCAdk2B8gHSBN6s3pDXAfAX7Ig4oIMY7WDfgZ0F62iyjgHUFeqmCoXoJ0SS2X+Lk6A8CAbAFEGOxOgAAAABJRU5ErkJggg==) - modules for describing and quality assuring model data;
  
 - ![](https://img.shields.io/badge/ready4-modelling-indigo?style=flat&labelColor=black&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABdUlEQVQ4T42TO0gDQRCGv3tsLqawEwtBsbOws7ExIIrYi02sLATBUkFQrG1E8IEPUOwsLMS0Wola2AiawkcZLG2SQnNe7kY2dyHhzEW32WLm//af2RmjVEBwwXyBYABwaHuMIiAgfWGaUXpE0jkwnyEYBHc9WW8+gbMWAtwN8Mc14A7JjEQiIwxIggs7D/ZVmFvNwfeyBhQQtQv2KVRnwFtoOLBPwB8D6Y3sFsFZAqMMlX2Q/gigwzVAriFWO6COQLqhou8IojOsU/Cj3JqDOEBtgzpuwOKQtoD6y/FWNkMSAdIJzmryLwR9UDkH6yyphGlwFsG6/g2RNLhbEAz/1QPvN6RZ/K8m0gSJi1sCrEtQB+DNgz8R2fcgtQLVqdB27ZQhtQnmG3hz4I/qObhHMlnQr6Lg8xZIt26k2gN12Jjar7wGPCAdk2B8gHSBN6s3pDXAfAX7Ig4oIMY7WDfgZ0F62iyjgHUFeqmCoXoJ0SS2X+Lk6A8CAbAFEGOxOgAAAABJRU5ErkJggg==) - modules to specify, assess and report statisitical models; and
 
 - ![](https://img.shields.io/badge/ready4-prediction-forestgreen?style=flat&labelColor=black&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABdUlEQVQ4T42TO0gDQRCGv3tsLqawEwtBsbOws7ExIIrYi02sLATBUkFQrG1E8IEPUOwsLMS0Wola2AiawkcZLG2SQnNe7kY2dyHhzEW32WLm//af2RmjVEBwwXyBYABwaHuMIiAgfWGaUXpE0jkwnyEYBHc9WW8+gbMWAtwN8Mc14A7JjEQiIwxIggs7D/ZVmFvNwfeyBhQQtQv2KVRnwFtoOLBPwB8D6Y3sFsFZAqMMlX2Q/gigwzVAriFWO6COQLqhou8IojOsU/Cj3JqDOEBtgzpuwOKQtoD6y/FWNkMSAdIJzmryLwR9UDkH6yyphGlwFsG6/g2RNLhbEAz/1QPvN6RZ/K8m0gSJi1sCrEtQB+DNgz8R2fcgtQLVqdB27ZQhtQnmG3hz4I/qObhHMlnQr6Lg8xZIt26k2gN12Jjar7wGPCAdk2B8gHSBN6s3pDXAfAX7Ig4oIMY7WDfgZ0F62iyjgHUFeqmCoXoJ0SS2X+Lk6A8CAbAFEGOxOgAAAABJRU5ErkJggg==) - modules for making predictions.


### Programs and sub-routines
All our [programs](../../publications/programs/) and [sub-routines](../../publications/subroutines/) implement literate programming techniques – they are written in R Markdown and will generate reporting documents in file formats such as PDF. 

[Programs](../../publications/programs/) can be executed in their current form without the need for additional input data and, unless modified, will always generate the exact same output. They are typically deployed for implementing a model and deploying it for a specific set of analyses.

[Sub-routines](../../publications/subroutines/) need to be called by [programs](../../publications/programs/) that supply them with input data. They can be called by multiple programs and will produce output that varies based on the input values they are supplied with. They are typically deployed to implement parts of a model's analysis and reporting algorithm.

## Versions, Storage and Installation
We use multiple types of online repository for hosting our software and related documentation and metadata.

- Archive: Permanent, uniquely identified (with DOI) archive copies of those versions of software items that we have issued as “releases” (for example, versions of the software at the time the analysis was undertaken) are stored within the [ready4 Zenodo community](https://zenodo.org/communities/ready4). Metadata on software we have archived on Zenodo are typically indexed by and retrievable from [OpenAire](https://explore.openaire.eu/). 

- Development: Impermanent (as these repositories can be moved or deleted at any time) copies of all versions of our software items over their entire development history (including the most up to date development version) are stored in the [ready4 GitHub organisation](https://github.com/ready4-dev). 

- Production: We have yet to make production releases of our software, which we intend to primarily submit to [CRAN](https://cran.r-project.org/). Unless and until a software item is submitted to a production code repository like CRAN, the recommended platform from which to install our software is that software's GitHub repository.

- Documentation: All our code [libraries](../../publications/libraries/) have a documentation website, the URL of which typically takes the form of `https://ready4-dev.github.io/PACKAGE_NAME` (for example https://ready4-dev.github.io/ready4). Documentation for [programs](../../publications/programs/) is typically contained in the program bundle, either as a PDF render of the RMarkdown source file (for self-contained programs). Documentation for [sub-routines](../../publications/subroutines/) typically take the form as notes contained in a README file.

## Citing and re-using our software
Each archived version of any software item we have released has its own unique Digital Object Identifier (DOI). Citing a specific version therefore requires the version specific DOI plus text such as “version 0.0.9.3”.  Each software item also has a generic DOI that can be used to refer to all versions of the software. Note that, if clicked on, the generic DOI will resolve to the latest archived version.

To make it easier to cite our software, each software item includes a CITATION.cff file. Inclusion of this file means that the repositories storing our software can generate appropriate citations in the format of most relevance to you. Currently:
 - Zenodo provides a free text field under the heading “Cite as” which enables you to generate a wide range of citation manager and journal specific citation outputs. There is also an “Export” tool that will generate citation metadata in multiple output formats;
 -	OpenAire Explore has a “Cite this software” button that allows you to generate a citation in multiple journal formats or to download BibTeX or RIS files;
 - Github repositories have a “Cite this repository” button that can generate both BibTeX and APA output as well as link to the Citation.cff file.

Additionally, with have included an additional CITATION file in each of our R [libraries](../../publications/libraries/) so that you can generate a citation from within an R session using the `citation` function (for example: `citation("ready4")`.

## Using and extending our software
You are encouraged to make as widespread use of our software, including the creation of derivative works, as you see fit, so long as it is consistent with each item's license. Our software is typically licensed under [GPL-3](https://ready4-dev.github.io/ready4/LICENSE.html), a copy-left open-source licensing regime.