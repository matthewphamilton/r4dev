---
title: Installing ready4 framework authoring tools
linkTitle: "Authoring tools"
author: Matthew Hamilton
date: "2022-12-06"
description: Depending on how you plan to use ready4, you may need to install some or all of its authoring tools.
slug: Authoring-tools
weight: 2
categories: 
- Documentation
tags: 
- Installing libraries
- Framework
- Framework authoring
output: hugodown::md_document
rmd_hash: 34d9d3ee857b5bba

---

## Installing tools for authoring reproducible analyses

If you are planning on using ready4 to implement a reproducible analysis, you will need to install the [ready4show](https://ready4-dev.github.io/ready4show/) library. If you have installed other ready4 libraries, then ready4show may have already been installed as a package dependency. You can check if it is present with the following command:

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'><a href='https://rdrr.io/r/base/find.package.html'>find.package</a></span><span class='o'>(</span><span class='s'>"ready4show"</span><span class='o'>)</span></span></code></pre>

</div>

If that command produces an error, then ready4show is not installed. This can be rectified by installing the ready4show library directly from its [GitHub repository](https://github.com/ready4-dev/ready4show) (it is currently only available as a development release).

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'>devtools</span><span class='nf'>::</span><span class='nf'><a href='https://remotes.r-lib.org/reference/install_github.html'>install_github</a></span><span class='o'>(</span><span class='s'>"ready4-dev/ready4show"</span><span class='o'>)</span></span></code></pre>

</div>

Before you apply ready4show tools to your own project, you should make sure you can run some or all of the example code included in the [package vignettes](https://ready4-dev.github.io/ready4show/articles/).

## Installing tools for managing model datasets

If you are planning on using ready4 to implement a reproducible analysis, you will need to install the [ready4use](https://ready4-dev.github.io/ready4use/) library. You can first check if it is already installed.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'><a href='https://rdrr.io/r/base/find.package.html'>find.package</a></span><span class='o'>(</span><span class='s'>"ready4use"</span><span class='o'>)</span></span></code></pre>

</div>

You can then install ready4use directly from its [GitHub repository](https://github.com/ready4-dev/ready4use).

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'>devtools</span><span class='nf'>::</span><span class='nf'><a href='https://remotes.r-lib.org/reference/install_github.html'>install_github</a></span><span class='o'>(</span><span class='s'>"ready4-dev/ready4use"</span><span class='o'>)</span></span></code></pre>

</div>

If one of your intended uses of ready4use is to share outputs in online datasets, you will need to have set up an account on a [Dataverse](https://dataverse.org) installation (we recommend using the [Harvard Dataverse](https://dataverse.harvard.edu)). Some of the key concepts relating to using the Dataverse in conjunction with ready4use are described [in this tutorial](https://www.acumen-mh.org/blog/2022/08/28/access_open_data/).

It is a requirement to have write permissions to any Dataverse Datasets that you plan to disseminate files to with the help of ready4use. Furthermore, the machine on which you install ready4use should also securely store your Dataverse account credentials (specifically, values for the DATAVERSE_KEY and DATAVERSE_SERVER tokens). Details of how to do this are [described in documentation for the dataverse R package](https://cran.r-project.org/web/packages/dataverse/vignettes/A-introduction.html), a key dependency package for ready4use.

You should now be able to run the example code included in the [package vignettes](https://ready4-dev.github.io/ready4use/articles/). To run all of this code you will need to replace the details of the Dataverse Dataset to which files are being written to those of your own Dataverse Dataset.

## Installing tools for authoring computational models

If you are planning on using ready4 framework tools for authoring computational models (something you should only be planning if you are a coder with a high degree of confidence in developing R packages), then you need to install the [ready4class](https://ready4-dev.github.io/ready4class/), [ready4fun](https://ready4-dev.github.io/ready4fun/) and [ready4pack](https://ready4-dev.github.io/ready4pack/) libraries. The first two of these are bundled as dependencies of ready4pack, so you can install from [our GitHub organisation](https://github.com/ready4-dev) using one command.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'>devtools</span><span class='nf'>::</span><span class='nf'><a href='https://remotes.r-lib.org/reference/install_github.html'>install_github</a></span><span class='o'>(</span><span class='s'>"ready4-dev/ready4use"</span><span class='o'>)</span></span></code></pre>

</div>

To use these computational model authoring tools, you will need to have set-up and appropriately configured your own accounts in:

-   [GitHub](https://github.com) (you will need write permissions to a GitHub organisation and enable GitHub actions and GitHub pages support for the repositories you create in that organisation);
-   [Zenodo](https://zenodo.org) (you will need to have linked each GitHub repository rused for your ready4 projects to your Zenodo account); and
-   [Codecov](https://about.codecov.io) (linked to your GitHub organisation)

The machine onto which you install ready4pack will also need to be securely storing your GitHub credentials (i.e. the value for the GITHUB_PAT token).

It should be noted that the development workflow supported by our computational model authoring tools is not yet well documented. We don't recommend undertaking R package development with these tools until this has been rectified. However, if you still want to try these tools out, the best place to start is review the examples in the [ready4pack vignette](https://ready4-dev.github.io/ready4pack/articles/V_01.html).

