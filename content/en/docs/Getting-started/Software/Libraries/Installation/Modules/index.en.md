---
title: Installing ready4 computational model modules
linkTitle: "Modules"
author: Matthew Hamilton
date: "2022-12-06"
description: To implement a modelling analysis with ready4 you need to install computational model modules.
slug: Modules
weight: 3
categories: 
- Documentation
tags: 
- Installing libraries
- Modules
output: hugodown::md_document
rmd_hash: 1232f722cd5d4e98

---

If you plan on using existing ready4 modules for a modelling project, you can review currently available modules, before installing the libraries that are relevant to your project.

The command to install each ready4 module takes the following format.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'>devtools</span><span class='nf'>::</span><span class='nf'><a href='https://remotes.r-lib.org/reference/install_github.html'>install_github</a></span><span class='o'>(</span><span class='s'>"ready4-dev/PACKAGE_NAME"</span><span class='o'>)</span></span></code></pre>

</div>

For example, if you are planning to predict health utility using some of the mapping algorithms that we have previously developed, you can install the [youthu](https://ready4-dev.github.io/youthu/) library with the following command.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'>devtools</span><span class='nf'>::</span><span class='nf'><a href='https://remotes.r-lib.org/reference/install_github.html'>install_github</a></span><span class='o'>(</span><span class='s'>"ready4-dev/youthu"</span><span class='o'>)</span></span></code></pre>

</div>

A small number of ready4 modules require that you configure some of the dependencies installed with them before they can be used. In particular:

-   If you are using modules from the [TTU](https://ready4-dev.github.io/TTU/) package to undertake a utility mapping study, you will need to have both installed and configured the cmdstanr R package as per the instructions on [that package's documentation website](https://mc-stan.org/cmdstanr/)

-   If you are using the [mychoice](https://ready4-dev.github.io/mychoice/) package to undertake a discrete choice experiment study and are using a Mac, you need to ensure that you have a Fortran compiler installed. Some relevant advice on this: <https://mac.r-project.org/tools/>

Before you apply ready4 modules to your own project, you should make sure you can run some or all of the example code included in relevant library vignette articles. The package website URL takes the form of `https://ready4-dev.github.io/PACKAGE_NAME/articles/)` (so the vignettes for the youthvars package are available at website is at <https://ready4-dev.github.io/youthvars/articles/>).
