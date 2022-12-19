---
title: "Modules"
linkTitle: "Modules"
date: "2022-12-12"
description: "ready4 supports a modular approach to computational model development."
weight: 62
categories: 
- Documentation
tags: 
- Framework
- ready4 (library)
output: hugodown::md_document
rmd_hash: cedc509e3f4f7691
html_dependencies:
- <script src="kePrint-0.0.1/kePrint.js"></script>
- <link href="lightable-0.0.1/lightable.css" rel="stylesheet" />

---

{{% pageinfo %}} This below section renders a vignette article from the ready4 library. You can use the following links to:

-   [view the vignette on the library website (adds useful hyperlinks to code blocks)](https://ready4-dev.github.io/ready4/articles/V_01.html)
-   [view the source file](https://github.com/ready4-dev/ready4/blob/main/vignettes/V_01.Rmd) from that article, and;
-   [edit its contents](https://github.com/ready4-dev/ready4/edit/main/vignettes/V_01.Rmd) (requires a GitHub account). {{% /pageinfo %}}

<div class="highlight">

</div>

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='kr'><a href='https://rdrr.io/r/base/library.html'>library</a></span><span class='o'>(</span><span class='s'><a href='https://ready4-dev.github.io/ready4/'>"ready4"</a></span><span class='o'>)</span> </span></code></pre>

</div>

## Motivation

A potentially attractive approach to modelling complex youth mental health systems is to begin with a relatively simple computational model and to progressively extend its scope and sophistication. Such an approach could be described as "modular" if it is possible to readily combine multiple discrete modelling projects (potentially developed by different modelling teams) that each independently describe distinct aspects of the system being modelled. This modular and collaborative approach is being used in the development of [readyforwhatsnext - an open source health economic model of the systems shaping mental health and wellbeing in young people](https://www.ready4-dev.com). The `ready4` package provides tools to support the development and application of the readyforwhatsnext modular model.

## Implementation

The readyforwhatsnext model is being implemented in R its modular nature is enabled by the [encapsulation and inheritance features of Object Oriented Programming (OOP)](V_03.html). Specifically, [the framework being used to develop the model](https://www.ready4-dev.com/framework/) uses two of R's systems for implementing OOP - S3 and S4. An in-depth explanation of R's different class system is beyond the scope of this article, but is explored in [Hadley Wickham's Advanced R handbook](https://adv-r.hadley.nz/oo.html). However, it is useful to know some very high level information about S3 and S4 classes:

-   S4 classes are frequently said to be "formal", "strict" or "rigorous". The elements of an S4 class are called slots and the type of data that each slot is allowed to contain is specified in the class definition. An S4 class can be comprised of slots that contain different types of data (e.g. a slot that contains a character vector and another slot that contains tabular data).

-   S3 classes are often described as "simple", "informal" and "flexible". S3 objects attach an attribute label to base type objects (e.g. a character vector, a data.frame, a list), which in turn is used to work out what methods should be applied to the class.

### readyforwhatsnext Model Modules

A readyforwhatsnext model module is a data-structure and associated algorithms that is used to model a discrete component of a system relevant to young people's mental health. Each readyforwhatsnext model module is created using the `ready4` package's `Ready4Module` class. We can create an instance (`X`) of `Ready4Module` using the following command.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>X</span> <span class='o'>&lt;-</span> <span class='nf'>ready4</span><span class='nf'>::</span><span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/Ready4Module-class.html'>Ready4Module</a></span><span class='o'>(</span><span class='o'>)</span></span></code></pre>

</div>

However, if we inspect `X` we can see it is of limited use as it contains no data other than an empty element called `dissemination_1L_chr`.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'><a href='https://rdrr.io/r/utils/str.html'>str</a></span><span class='o'>(</span><span class='nv'>X</span><span class='o'>)</span></span>
<span><span class='c'>#&gt; Formal class 'Ready4Module' [package "ready4"] with 1 slot</span></span>
<span><span class='c'>#&gt;   ..@ dissemination_1L_chr: chr NA</span></span></code></pre>

</div>

The `Ready4Module` class is therefore not intended to be called directly. Instead, the purpose of `Ready4Module` is to be the parent-class of all readyforwhatsnext model modules. `Ready4Module` and all of its child-classes (ie all readyforwhatsnext model modules) are "S4" classes.

<div class="card border-primary mb-3" style="max-width: 20rem;">

<div class="card-header">

**readyforwhatsnext Concept**

</div>

<div class="card-body">

<div class="card-title">

#### Module

</div>

A formal (S4) `Ready4Module` child-class and its associated methods used to implement a discrete sub-component of the readyforwhatsnext youth mental health model.

</div>

</div>

`ready4` includes two child classes of `Ready4Module`. These are `Ready4Public` and `Ready4Private` and both are almost as minimally informative as their parent (the only difference being that their instances have the values "Public" or "Private" assigned to the `dissemination_1L_chr` slot).

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>Y</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/Ready4Public-class.html'>Ready4Public</a></span><span class='o'>(</span><span class='o'>)</span></span>
<span><span class='nf'><a href='https://rdrr.io/r/utils/str.html'>str</a></span><span class='o'>(</span><span class='nv'>Y</span><span class='o'>)</span></span>
<span><span class='c'>#&gt; Formal class 'Ready4Public' [package "ready4"] with 1 slot</span></span>
<span><span class='c'>#&gt;   ..@ dissemination_1L_chr: chr "Public"</span></span></code></pre>

</div>

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>Z</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/Ready4Private-class.html'>Ready4Private</a></span><span class='o'>(</span><span class='o'>)</span></span>
<span><span class='nf'><a href='https://rdrr.io/r/utils/str.html'>str</a></span><span class='o'>(</span><span class='nv'>Z</span><span class='o'>)</span></span>
<span><span class='c'>#&gt; Formal class 'Ready4Private' [package "ready4"] with 1 slot</span></span>
<span><span class='c'>#&gt;   ..@ dissemination_1L_chr: chr "Private"</span></span></code></pre>

</div>

Like the `Ready4Module` class they inherit from, the purpose of `Ready4Public` and `Ready4Private` is to be used as parent classes. Using either of `Ready4Public` and `Ready4Private` can be a potentially efficient way of partially automating access policies for model data. If **all** the data contained in a module can **always** be shared publicly, it may be convenient to note this by using a module that has been created as a child-class of `Ready4Public`. Similarly, if at least some of the data contained in a module will always be unsuitable for public dissemination, it can be useful to use a module that is a child of `Ready4Private`. When the dissemination policy for data contained in a module will vary depending on user or context, it is more appropriate to use a module that inherits from `Ready4Module` without being a child of either `Ready4Public` and `Ready4Private`. In this latest case, users may choose to add descriptive information about the data access policy themselves using the `renewSlot` method. The dissemination policy can be inspected with the `procureSlot` method.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>X</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/renewSlot-methods.html'>renewSlot</a></span><span class='o'>(</span><span class='nv'>X</span>,</span>
<span>               <span class='s'>"dissemination_1L_chr"</span>,</span>
<span>               <span class='s'>"Staff and students of research institutes"</span><span class='o'>)</span></span>
<span><span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/procureSlot-methods.html'>procureSlot</a></span><span class='o'>(</span><span class='nv'>X</span>,</span>
<span>            <span class='s'>"dissemination_1L_chr"</span><span class='o'>)</span></span>
<span><span class='c'>#&gt; [1] "Staff and students of research institutes"</span></span></code></pre>

</div>

### readyforwhatsnext Model Sub-modules

In the framework being used to develop the readyforwhatsnext model, S3 classes are principally used to help define the structural properties of slots (array elements) of model modules and the methods that can be applied to these slots. S3 classes created for these purposes are called **sub-modules**.

<div class="card border-primary mb-3" style="max-width: 20rem;">

<div class="card-header">

**\`readyforwhatsnext Concept**

</div>

<div class="card-body">

<div class="card-title">

#### Sub-Module

</div>

An informal (S3) class and its associated methods that describes, validates and applies algorithms to a slot of a readyforwhatsnext module.

</div>

</div>

### Module and Sub-module Methods

All methods associated with readyforwhatsnext modules and sub-modules adopt [a common syntax](V_02.html). However, the algorithms implemented by each command in that syntax will vary depending on which module it is applied to. However, a limited number of methods are defined at the level of the `Ready4Module` parent class and are therefore inherited by all readyforwhatsnext modules. Currently, the only methods defined for `Ready4Module` are [slot-methods](V_02.html#slot-generics-and-methods) and these can be itemised using the `get_methods` function.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/get_methods.html'>get_methods</a></span><span class='o'>(</span><span class='o'>)</span></span>
<span><span class='c'>#&gt;  [1] "authorSlot"        "characterizeSlot"  "depictSlot"        "enhanceSlot"       "exhibitSlot"       "ingestSlot"        "investigateSlot"  </span></span>
<span><span class='c'>#&gt;  [8] "manufactureSlot"   "metamorphoseSlot"  "procureSlot"       "prognosticateSlot" "ratifySlot"        "reckonSlot"        "renewSlot"        </span></span>
<span><span class='c'>#&gt; [15] "shareSlot"</span></span></code></pre>

</div>

### Authoring new readyforwhatsnext Modules and Sub-Modules

R provides an array of potential approaches to creating and documenting S3 and S4 classes. However, standardisation is an important enabler of modular approaches to computational model development, so [all readyforwhatsnext modules and sub-modules are authored and documented using a common house-style](https://ready4-dev.github.io/ready4pack/articles/V_01.html).

### Finding existing readyforwhatsnext Modules and Sub-Modules

A table of all currently available readyforwhatsnext model modules (S4 classes) and sub-modules (S3 classes) can be generated by web-scraping using `make_modules_tb`. This function produces up to date results but is a little slow to execute, so an alternative is to downloaded a periodically updated database of model modules using `get_modules_tb`. Note, this quicker to implement method may omit the most recently authored model modules.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='c'># Not run</span></span>
<span><span class='c'># a &lt;- make_modules_tb()</span></span></code></pre>

</div>

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>a</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/get_modules_tb.html'>get_modules_tb</a></span><span class='o'>(</span><span class='o'>)</span></span></code></pre>

</div>

HTML versions of the table of model modules and sub-modules can be displayed using the `print_modules` function. To display only modules (not submodules), supply the value "S4" to the `what_1L_chr` argument.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/print_modules.html'>print_modules</a></span><span class='o'>(</span><span class='nv'>a</span>,</span>
<span>              what_1L_chr <span class='o'>=</span> <span class='s'>"S4"</span><span class='o'>)</span></span>
</code></pre>
<table class="table table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;">
Class
</th>
<th style="text-align:left;">
Description
</th>
<th style="text-align:left;">
Examples
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/scorz/reference/ScorzProfile-class.html" style="     ">ScorzProfile</a>
</td>
<td style="text-align:left;">
A dataset to be scored, its associated metadata and details of the scoring instrument
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/scorz/reference/ScorzAqol6-class.html" style="     ">ScorzAqol6</a>
</td>
<td style="text-align:left;">
A dataset and metadata to support implementation of an AQoL-6D scoring algorithm
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/scorz/reference/ScorzAqol6Adol-class.html" style="     ">ScorzAqol6Adol</a>
</td>
<td style="text-align:left;">
A dataset and metadata to support implementation of a scoring algorithm for the adolescent version of AQoL-6D
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/scorz/articles/V_01.html" style="     ">3</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/scorz/reference/ScorzAqol6Adult-class.html" style="     ">ScorzAqol6Adult</a>
</td>
<td style="text-align:left;">
A dataset and metadata to support implementation of a scoring algorithm for the adult version of AQoL-6D
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/scorz/reference/ScorzEuroQol5-class.html" style="     ">ScorzEuroQol5</a>
</td>
<td style="text-align:left;">
A dataset and metadata to support implementation of an EQ-5D scoring algorithm
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/scorz/articles/V_02.html" style="     ">4</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/reference/SpecificParameters-class.html" style="     ">SpecificParameters</a>
</td>
<td style="text-align:left;">
Input parameters that specify candidate models to be explored
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/reference/SpecificPrivate-class.html" style="     ">SpecificPrivate</a>
</td>
<td style="text-align:left;">
Analysis outputs not intended for public dissemination
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/reference/SpecificShareable-class.html" style="     ">SpecificShareable</a>
</td>
<td style="text-align:left;">
Analysis outputs intended for public dissemination
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/reference/SpecificResults-class.html" style="     ">SpecificResults</a>
</td>
<td style="text-align:left;">
Analysis results
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/reference/SpecificProject-class.html" style="     ">SpecificProject</a>
</td>
<td style="text-align:left;">
Modelling project dataset, parameters and results
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/reference/SpecificInitiator-class.html" style="     ">SpecificInitiator</a>
</td>
<td style="text-align:left;">
Modelling project dataset, input parameters and empty results placeholder
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/reference/SpecificModels-class.html" style="     ">SpecificModels</a>
</td>
<td style="text-align:left;">
Modelling project dataset, input parameters and model comparison results
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/reference/SpecificPredictors-class.html" style="     ">SpecificPredictors</a>
</td>
<td style="text-align:left;">
Modelling project dataset, input parameters and predictor comparison results
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/reference/SpecificFixed-class.html" style="     ">SpecificFixed</a>
</td>
<td style="text-align:left;">
Modelling project dataset, input parameters and complete fixed models results
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/reference/SpecificMixed-class.html" style="     ">SpecificMixed</a>
</td>
<td style="text-align:left;">
Modelling project dataset, input parameters and complete mixed models results
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/reference/SpecificConverter-class.html" style="     ">SpecificConverter</a>
</td>
<td style="text-align:left;">
Container for seed objects used for creating SpecificModels modules
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/articles/V_01.html" style="     ">6</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/reference/SpecificSynopsis-class.html" style="     ">SpecificSynopsis</a>
</td>
<td style="text-align:left;">
Input, Output and Authorship Data For Generating Reports
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/TTU/reference/TTUSynopsis-class.html" style="     ">TTUSynopsis</a>
</td>
<td style="text-align:left;">
Input, Output and Authorship Data For Generating Utility Mapping Study Reports
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/TTU/reference/TTUReports-class.html" style="     ">TTUReports</a>
</td>
<td style="text-align:left;">
Metadata to produce utility mapping study reports
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/reference/YouthvarsDescriptives-class.html" style="     ">YouthvarsDescriptives</a>
</td>
<td style="text-align:left;">
Metadata about descriptive statistics to be generated
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/reference/YouthvarsProfile-class.html" style="     ">YouthvarsProfile</a>
</td>
<td style="text-align:left;">
A dataset and its associated dictionary, descriptive statistics and metadata
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_02.html" style="     ">2</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/reference/YouthvarsSeries-class.html" style="     ">YouthvarsSeries</a>
</td>
<td style="text-align:left;">
A longitudinal dataset and its associated dictionary, descriptive statistics and metadata
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_02.html" style="     ">2</a>
</td>
</tr>
</tbody>
</table>

</div>

To display a table of readyforwhatsnext model sub-modules , supply the value "S3" to the `what_1L_chr` argument.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/print_modules.html'>print_modules</a></span><span class='o'>(</span><span class='nv'>a</span>,</span>
<span>              what_1L_chr <span class='o'>=</span> <span class='s'>"S3"</span><span class='o'>)</span></span>
</code></pre>
<table class="table table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;">
Class
</th>
<th style="text-align:left;">
Description
</th>
<th style="text-align:left;">
Examples
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/reference/specific_models.html" style="     ">specific_models</a>
</td>
<td style="text-align:left;">
Candidate models lookup table
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/reference/specific_predictors.html" style="     ">specific_predictors</a>
</td>
<td style="text-align:left;">
Candidate predictors lookup table
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/reference/youthvars_aqol6d_adol.html" style="     ">youthvars_aqol6d_adol</a>
</td>
<td style="text-align:left;">
youthvars S3 class for Assessment of Quality of Life Six Dimension Health Utility - Adolescent Version (AQoL6d Adolescent))
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_01.html" style="     ">1</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/reference/youthvars_phq9.html" style="     ">youthvars_phq9</a>
</td>
<td style="text-align:left;">
youthvars S3 class for Patient Health Questionnaire (PHQ-9) scores
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_01.html" style="     ">1</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/reference/youthvars_bads.html" style="     ">youthvars_bads</a>
</td>
<td style="text-align:left;">
youthvars S3 class for Behavioural Activation for Depression Scale (BADS) scores
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_01.html" style="     ">1</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/reference/youthvars_gad7.html" style="     ">youthvars_gad7</a>
</td>
<td style="text-align:left;">
youthvars S3 class for Generalised Anxiety Disorder Scale (GAD-7) scores
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_01.html" style="     ">1</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/reference/youthvars_oasis.html" style="     ">youthvars_oasis</a>
</td>
<td style="text-align:left;">
youthvars S3 class for Overall Anxiety Severity and Impairment Scale (OASIS) scores
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_01.html" style="     ">1</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/reference/youthvars_scared.html" style="     ">youthvars_scared</a>
</td>
<td style="text-align:left;">
youthvars S3 class for Screen for Child Anxiety Related Disorders (SCARED) scores
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_01.html" style="     ">1</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/reference/youthvars_k6.html" style="     ">youthvars_k6</a>
</td>
<td style="text-align:left;">
youthvars S3 class for Kessler Psychological Distress Scale (K6) - US Scoring System scores
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_01.html" style="     ">1</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/reference/youthvars_sofas.html" style="     ">youthvars_sofas</a>
</td>
<td style="text-align:left;">
youthvars S3 class for Social and Occupational Functioning Assessment Scale (SOFAS)
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_01.html" style="     ">1</a>
</td>
</tr>
</tbody>
</table>

</div>

