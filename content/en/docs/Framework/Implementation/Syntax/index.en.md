---
title: "Syntax"
linkTitle: "Syntax"
date: "2022-12-23"
description: "ready4 modules use a simple and consistent syntax."
weight: 63
categories: 
- Documentation
tags: 
- Framework
- ready4 (library)
- Syntax
output: hugodown::md_document
rmd_hash: 3d4f54c5eed2d91e
html_dependencies:
- <script src="kePrint-0.0.1/kePrint.js"></script>
- <link href="lightable-0.0.1/lightable.css" rel="stylesheet" />

---

{{% pageinfo %}} This below section renders a vignette article from the ready4 library. You can use the following links to:

-   [view the vignette on the library website (adds useful hyperlinks to code blocks)](https://ready4-dev.github.io/ready4/articles/V_02.html)
-   [view the source file](https://github.com/ready4-dev/ready4/blob/main/vignettes/V_02.Rmd) from that article, and;
-   [edit its contents](https://github.com/ready4-dev/ready4/edit/main/vignettes/V_02.Rmd) (requires a GitHub account). {{% /pageinfo %}}

<div class="highlight">

</div>

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='kr'><a href='https://rdrr.io/r/base/library.html'>library</a></span><span class='o'>(</span><span class='s'><a href='https://ready4-dev.github.io/ready4/'>"ready4"</a></span><span class='o'>)</span> </span></code></pre>

</div>

## Motivation

Transparency is one of the underpinning principles of open science. One way to improve the transparency of the [ready4 model](https://www.ready4-dev.com) is to ensure that the programs implementing analyses using this model can be meaningfully inspected by readers with different levels of technical expertise. Even non-technical readers should be able to follow the high-level logic implemented by model algorithms. By using a simple programming syntax that can be consistently used across all model analyses programs, ready4 can help ensure that readers need to contend with relatively few new concepts when reviewing analysis code.

## Implementation

`ready4` provides a simple syntax that can be consistently applied to all [ready4 model modules](https://ready4-dev.github.io/ready4/articles/V_01.html). It does so by taking advantage of the [polymorphism and abstraction features of Object Oriented Programing](https://ready4-dev.github.io/ready4/articles/V_03.html) and R's use of generic functions. Generic functions don't obviously do anything by themselves - their most salient features are a name and a high level description of the type of task that any method using that name should perform. Whenever a method is defined for [classes that use R's S4 and S3 systems (the types used for ready4 model modules and sub-modules)](https://ready4-dev.github.io/ready4/articles/V_01.html), it is assigned to the generic that is the best match for the algorithm it implements.

### Finding ready4 Methods

A table that summarises the syntax used by ready4 model module methods, can be generated by web-scraping using `make_methods_tb` (which produces up to date results but can be a little slow to excecute) or alternatively be downloaded from a periodically updated database using `get_methods_tb` (which is quicker to implement, but may miss the most recent additions).

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='c'># Not run</span></span>
<span><span class='c'># x &lt;- make_methods_tb()</span></span></code></pre>

</div>

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>x</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/get_methods_tb.html'>get_methods_tb</a></span><span class='o'>(</span><span class='o'>)</span></span></code></pre>

</div>

#### Core generics

`ready4` includes a number of core generic functions which describe the main types of method to be implemented by ready4 model modules. Notably, the `ready4` package does not define methods for any of these core generics. Instead, methods are defined for these generics in R packages that contain ready4 modules. A HTML table of the core generics bundled with `ready4` and examples of methods that implement each generic can be displayed using the `print_methods` function, using the `return_1L_chr = "core"` argument.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/print_methods.html'>print_methods</a></span><span class='o'>(</span><span class='nv'>x</span>,</span>
<span>              return_1L_chr <span class='o'>=</span> <span class='s'>"core"</span>,</span>
<span>              scroll_width_1L_chr <span class='o'>=</span> <span class='s'>"100%"</span><span class='o'>)</span> </span>
</code></pre>

<div style="border: 1px solid #ddd; padding: 5px; overflow-x: scroll; width:100%; ">

<table class="table table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;">
Method
</th>
<th style="text-align:left;">
Purpose
</th>
<th style="text-align:left;">
Examples
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/author-methods.html"> author </a>
</td>
<td style="text-align:left;">
Author and save files
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/TTU/articles/V_01.html" style="     ">5</a> , <a href="https://ready4-dev.github.io/specific/articles/V_01.html" style="     ">6</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/characterize-methods.html"> characterize </a>
</td>
<td style="text-align:left;">
Characterize data by generating (tabular) descriptive statistics
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/depict-methods.html"> depict </a>
</td>
<td style="text-align:left;">
Depict (plot) features of a dataset
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_02.html" style="     ">2</a>, <a href="https://ready4-dev.github.io/scorz/articles/V_01.html" style="     ">3</a> , <a href="https://ready4-dev.github.io/scorz/articles/V_02.html" style="     ">4</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/enhance-methods.html"> enhance </a>
</td>
<td style="text-align:left;">
Enhance a dataset by adding new elements
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/exhibit-methods.html"> exhibit </a>
</td>
<td style="text-align:left;">
Exhibit features of a dataset by printing them to the R console
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_02.html" style="     ">2</a>, <a href="https://ready4-dev.github.io/scorz/articles/V_01.html" style="     ">3</a> , <a href="https://ready4-dev.github.io/scorz/articles/V_02.html" style="     ">4</a> , <a href="https://ready4-dev.github.io/specific/articles/V_01.html" style="     ">6</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/ingest-methods.html"> ingest </a>
</td>
<td style="text-align:left;">
Ingest data
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_02.html" style="     ">2</a>, <a href="https://ready4-dev.github.io/scorz/articles/V_01.html" style="     ">3</a> , <a href="https://ready4-dev.github.io/scorz/articles/V_02.html" style="     ">4</a> , <a href="https://ready4-dev.github.io/TTU/articles/V_01.html" style="     ">5</a> , <a href="https://ready4-dev.github.io/specific/articles/V_01.html" style="     ">6</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/investigate-methods.html"> investigate </a>
</td>
<td style="text-align:left;">
Investigate solutions to an inverse problem
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/articles/V_01.html" style="     ">6</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/manufacture-methods.html"> manufacture </a>
</td>
<td style="text-align:left;">
Manufacture a new object
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/metamorphose-methods.html"> metamorphose </a>
</td>
<td style="text-align:left;">
Metamorphose data from one model module (or sub-module) instance to an instance of a different model module or sub-module
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/TTU/articles/V_01.html" style="     ">5</a> , <a href="https://ready4-dev.github.io/specific/articles/V_01.html" style="     ">6</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/procure-methods.html"> procure </a>
</td>
<td style="text-align:left;">
Procure items from a dataset
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/articles/V_01.html" style="     ">6</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/prognosticate-methods.html"> prognosticate </a>
</td>
<td style="text-align:left;">
Prognosticate (make predictions) by solving a forward problem
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/ratify-methods.html"> ratify </a>
</td>
<td style="text-align:left;">
Ratify that a dataset meets validity criteria
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_02.html" style="     ">2</a>, <a href="https://ready4-dev.github.io/specific/articles/V_01.html" style="     ">6</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/reckon-methods.html"> reckon </a>
</td>
<td style="text-align:left;">
Reckon (calculate) a value
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/renew-methods.html"> renew </a>
</td>
<td style="text-align:left;">
Renew values in a dataset
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_02.html" style="     ">2</a>, <a href="https://ready4-dev.github.io/scorz/articles/V_01.html" style="     ">3</a> , <a href="https://ready4-dev.github.io/scorz/articles/V_02.html" style="     ">4</a> , <a href="https://ready4-dev.github.io/TTU/articles/V_01.html" style="     ">5</a> , <a href="https://ready4-dev.github.io/specific/articles/V_01.html" style="     ">6</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/share-methods.html"> share </a>
</td>
<td style="text-align:left;">
Share data via an online repository
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_02.html" style="     ">2</a>, <a href="https://ready4-dev.github.io/scorz/articles/V_01.html" style="     ">3</a> , <a href="https://ready4-dev.github.io/scorz/articles/V_02.html" style="     ">4</a>
</td>
</tr>
</tbody>
</table>

</div>

</div>

#### Slot generics and methods

Each of the "core" generics also has a "slot" version, for use when applying a core method to a specified slot of a class. The `ready4` package defines methods for each of these "slot" generics for [the `Ready4Module` class](https://ready4-dev.github.io/ready4/articles/V_01.html). Two of these "slot" methods can also be used for additional purposes:

-   [procureSlot](https://ready4-dev.github.io/ready4/reference/procureSlot-methods.html) is a "getter" method - its default behaviour is to return the value of a specified slot. If the argument `use_procure_mthd_1L_lgl = T` is included in the method call, `procureSlot` will instead apply the `procure` method to a specified slot.

-   [renewSlot](https://ready4-dev.github.io/ready4/reference/procureSlot-methods.html) is a "setter" method - if any value other than "use_renew_mthd" (the default) is passed to the `new_val_xx` argument, that value will be assigned to the specified slot.

A HTML table of the slot generics bundled with `ready4` can be displayed using the `print_methods` function, using the `return_1L_chr = "slot"` argument.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/print_methods.html'>print_methods</a></span><span class='o'>(</span><span class='nv'>x</span>,</span>
<span>              return_1L_chr <span class='o'>=</span> <span class='s'>"slot"</span>,</span>
<span>              scroll_width_1L_chr <span class='o'>=</span> <span class='s'>"100%"</span><span class='o'>)</span></span>
</code></pre>

<div style="border: 1px solid #ddd; padding: 5px; overflow-x: scroll; width:100%; ">

<table class="table table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;">
Method
</th>
<th style="text-align:left;">
Purpose
</th>
<th style="text-align:left;">
Examples
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/authorSlot-methods.html"> authorSlot </a>
</td>
<td style="text-align:left;">
Apply the author method to a model module slot
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/TTU/articles/V_01.html" style="     ">5</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/characterizeSlot-methods.html"> characterizeSlot </a>
</td>
<td style="text-align:left;">
Apply the characterize method to a model module slot
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/depictSlot-methods.html"> depictSlot </a>
</td>
<td style="text-align:left;">
Apply the depict method to a model module slot
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/enhanceSlot-methods.html"> enhanceSlot </a>
</td>
<td style="text-align:left;">
Apply the enhance method to a model module slot
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/TTU/articles/V_01.html" style="     ">5</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/exhibitSlot-methods.html"> exhibitSlot </a>
</td>
<td style="text-align:left;">
Apply the exhibit method to a model module slot
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/TTU/articles/V_01.html" style="     ">5</a> , <a href="https://ready4-dev.github.io/specific/articles/V_01.html" style="     ">6</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/ingestSlot-methods.html"> ingestSlot </a>
</td>
<td style="text-align:left;">
Apply the ingest method to a model module slot
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/investigateSlot-methods.html"> investigateSlot </a>
</td>
<td style="text-align:left;">
Apply the investigate method to a model module slot
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/TTU/articles/V_01.html" style="     ">5</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/manufactureSlot-methods.html"> manufactureSlot </a>
</td>
<td style="text-align:left;">
Apply the manufacture method to a model module slot
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/TTU/articles/V_01.html" style="     ">5</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/metamorphoseSlot-methods.html"> metamorphoseSlot </a>
</td>
<td style="text-align:left;">
Apply the metamorphose method to a model module slot
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/TTU/articles/V_01.html" style="     ">5</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/procureSlot-methods.html"> procureSlot </a>
</td>
<td style="text-align:left;">
Procure (get) data from a slot
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/scorz/articles/V_01.html" style="     ">3</a> , <a href="https://ready4-dev.github.io/TTU/articles/V_01.html" style="     ">5</a> , <a href="https://ready4-dev.github.io/specific/articles/V_01.html" style="     ">6</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/prognosticateSlot-methods.html"> prognosticateSlot </a>
</td>
<td style="text-align:left;">
Apply the prognosticate method to a model module slot
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/ratifySlot-methods.html"> ratifySlot </a>
</td>
<td style="text-align:left;">
Apply the ratify method to a model module slot
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/TTU/articles/V_01.html" style="     ">5</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/reckonSlot-methods.html"> reckonSlot </a>
</td>
<td style="text-align:left;">
Apply the reckon method to a model module slot
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/renewSlot-methods.html"> renewSlot </a>
</td>
<td style="text-align:left;">
Apply the renew method to a model module slot
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_02.html" style="     ">2</a>, <a href="https://ready4-dev.github.io/scorz/articles/V_01.html" style="     ">3</a> , <a href="https://ready4-dev.github.io/TTU/articles/V_01.html" style="     ">5</a> , <a href="https://ready4-dev.github.io/specific/articles/V_01.html" style="     ">6</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/shareSlot-methods.html"> shareSlot </a>
</td>
<td style="text-align:left;">
Apply the share method to a model module slot
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/TTU/articles/V_01.html" style="     ">5</a>
</td>
</tr>
</tbody>
</table>

</div>

</div>

#### Extended `author` generics

Finally, there are a small number of other generics that are more general extensions of the core functions. Currently, these extended generics are all variants on the `author` generics, with each specifying the type of output to be authored by the method. The `ready4` package does not include methods for any of these extended generics. A HTML table of the extended generics bundled with `ready4` can be displayed using the `print_methods` function, using the `return_1L_chr = "extended"` argument.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/print_methods.html'>print_methods</a></span><span class='o'>(</span><span class='nv'>x</span>,</span>
<span>              exclude_mthds_for_chr <span class='o'>=</span> <span class='s'>"Ready4Module"</span>,</span>
<span>              return_1L_chr <span class='o'>=</span> <span class='s'>"extended"</span>,</span>
<span>              scroll_width_1L_chr <span class='o'>=</span> <span class='s'>"100%"</span><span class='o'>)</span></span>
</code></pre>

<div style="border: 1px solid #ddd; padding: 5px; overflow-x: scroll; width:100%; ">

<table class="table table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;">
Method
</th>
<th style="text-align:left;">
Purpose
</th>
<th style="text-align:left;">
Examples
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/authorClasses-methods.html"> authorClasses </a>
</td>
<td style="text-align:left;">
Author and document classes
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/authorData-methods.html"> authorData </a>
</td>
<td style="text-align:left;">
Author and document datasets
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/TTU/articles/V_01.html" style="     ">5</a> , <a href="https://ready4-dev.github.io/specific/articles/V_01.html" style="     ">6</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/authorFunctions-methods.html"> authorFunctions </a>
</td>
<td style="text-align:left;">
Author and document functions
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/ready4/reference/authorReport-methods.html"> authorReport </a>
</td>
<td style="text-align:left;">
Author and save a report
</td>
<td style="text-align:left;">
</td>
</tr>
</tbody>
</table>

</div>

</div>

