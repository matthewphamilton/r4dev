---
title: "Add metadata to datasets of individual human records"
linkTitle: "Describe data"
date: "2022-12-23"
description: "Appending appropriate metadata to datasets of individual unit records can facilitate partial automation of some modelling tasks. This tutorial describes how a module from the youthvars R package can help you to add metadata to a youth mental health dataset so that it can be more readily used by other ready4 modules."
weight: 92
categories: 
- Documentation
tags: 
- Data management
- Metadata
- Model - People
- youthvars
output: hugodown::md_document
rmd_hash: d269a08efb7cc4eb

---

{{% pageinfo %}} This below section renders a vignette article from the youthvars library. You can use the following links to:

-   [view the vignette on the library website (adds useful hyperlinks to code blocks)](https://ready4-dev.github.io/youthvars/articles/V_02.html)
-   [view the source file](https://github.com/ready4-dev/youthvars/blob/main/vignettes/V_02.Rmd) from that article, and;
-   [edit its contents](https://github.com/ready4-dev/youthvars/edit/main/vignettes/V_02.Rmd) (requires a GitHub account). {{% /pageinfo %}}

<div class="highlight">

</div>

Note: **This vignette is illustrated with fake data**. The dataset explored in this example should not be used to inform decision-making.

<div class="highlight">

</div>

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='kr'><a href='https://rdrr.io/r/base/library.html'>library</a></span><span class='o'>(</span><span class='nv'><a href='https://ready4-dev.github.io/ready4/'>ready4</a></span><span class='o'>)</span></span>
<span><span class='kr'><a href='https://rdrr.io/r/base/library.html'>library</a></span><span class='o'>(</span><span class='nv'><a href='https://ready4-dev.github.io/youthvars/'>youthvars</a></span><span class='o'>)</span></span></code></pre>

</div>

Youthvars provides a two classes - `YouthvarsProfile` and `YouthvarsSeries` that are useful for describing features of datasets. The tools in `youthvars` build on the metadata included in a [Ready4useDyad](https://ready4-dev.github.io/ready4use/articles/V_02.html).

## Ingest data

To start we ingest `X`, a `Ready4useDyad` (dataset and data dictionary pair) that we can download from a remote repository.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>X</span> <span class='o'>&lt;-</span> <span class='nf'>ready4use</span><span class='nf'>::</span><span class='nf'><a href='https://ready4-dev.github.io/ready4use/reference/Ready4useRepos-class.html'>Ready4useRepos</a></span><span class='o'>(</span>dv_nm_1L_chr <span class='o'>=</span> <span class='s'>"fakes"</span>,</span>
<span>                               dv_ds_nm_1L_chr <span class='o'>=</span> <span class='s'>"https://doi.org/10.7910/DVN/W95KED"</span>,</span>
<span>                               dv_server_1L_chr <span class='o'>=</span> <span class='s'>"dataverse.harvard.edu"</span><span class='o'>)</span> <span class='o'><a href='https://magrittr.tidyverse.org/reference/pipe.html'>%&gt;%</a></span></span>
<span>  <span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/ingest-methods.html'>ingest</a></span><span class='o'>(</span>fls_to_ingest_chr <span class='o'>=</span> <span class='s'>"ymh_clinical_dyad_r4"</span>,</span>
<span>         metadata_1L_lgl <span class='o'>=</span> <span class='kc'>F</span><span class='o'>)</span></span></code></pre>

</div>

## Add metadata

We could add metadata about `X`, such as the unique identifier variable name, by transforming it to a `YouthvarsProfile` instance.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='c'>## Not run</span></span>
<span><span class='c'># X &lt;- YouthvarsProfile(a_Ready4useDyad = X,</span></span>
<span><span class='c'>#                       id_var_nm_1L_chr = "fkClientID")</span></span></code></pre>

</div>

However, in this case the data we ingested includes a longitudinal dataset. It is therefore preferable to transform `X` into a `YouthvarsSeries` instance. `YouthvarsSeries` objects contain all of the fields of `YouthvarsProfile` objects, but also include additional fields that are specific for longitudinal datasets (e.g. `timepoint_var_nm_1L_chr` and `timepoint_vals_chr` that respectively specify the data-collection timepoint variable name and values and `participation_var_1L_chr` that specifies the desired name of a yet to be created variable that will summarise the data-collection timepoints for which each unit record supplied data).

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>X</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://ready4-dev.github.io/youthvars/reference/YouthvarsSeries-class.html'>YouthvarsSeries</a></span><span class='o'>(</span>a_Ready4useDyad <span class='o'>=</span> <span class='nv'>X</span>,</span>
<span>                     id_var_nm_1L_chr <span class='o'>=</span> <span class='s'>"fkClientID"</span>,</span>
<span>                     participation_var_1L_chr <span class='o'>=</span> <span class='s'>"participation"</span>,</span>
<span>                     timepoint_vals_chr <span class='o'>=</span> <span class='nf'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='o'>(</span><span class='s'>"Baseline"</span>,<span class='s'>"Follow-up"</span><span class='o'>)</span>,</span>
<span>                     timepoint_var_nm_1L_chr <span class='o'>=</span> <span class='s'>"round"</span><span class='o'>)</span></span></code></pre>

</div>

## YouthvarsSeries methods

Currently, only methods for `YouthvarsSeries` (and not yet `YouthvarsProfile`) have been included with the `youthvars` package. These methods are summarised in the following sections.

### Validate data

We use the `ratify` method to ensure that `X` has been appropriately configured for methods examining datasets reporting measures at two timepoints.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>X</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/ratify-methods.html'>ratify</a></span><span class='o'>(</span><span class='nv'>X</span>,</span>
<span>            type_1L_chr <span class='o'>=</span> <span class='s'>"two_timepoints"</span><span class='o'>)</span></span></code></pre>

</div>

### Inspect data

We can now specify the variables that we would like to prepare descriptive statistics for using the `renewSlot` and `renew` methods. The variables to be profiled are specified in arguments beginning with "compare\_". Use `compare_ptcpn_chr` to compare variables based on whether cases reported data at one or both timepoints and `compare_by_time_chr` to compare the summary statistics of variables by timepoints, e.g at baseline and follow-up. If you wish these comparisons to report p values, then use the `compare_ptcpn_with_test_chr` and `compare_by_time_with_test_chr` arguments.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>X</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/renewSlot-methods.html'>renewSlot</a></span><span class='o'>(</span><span class='nv'>X</span>,</span>
<span>               <span class='s'>"descriptives_ls"</span>,</span>
<span>               compare_by_time_chr <span class='o'>=</span> <span class='nf'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='o'>(</span><span class='s'>"d_age"</span>,<span class='s'>"d_sexual_ori_s"</span>,<span class='s'>"d_studying_working"</span><span class='o'>)</span>,</span>
<span>               compare_by_time_with_test_chr <span class='o'>=</span> <span class='nf'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='o'>(</span><span class='s'>"k6_total"</span>, <span class='s'>"phq9_total"</span>, <span class='s'>"bads_total"</span><span class='o'>)</span>,</span>
<span>               compare_ptcpn_with_test_chr <span class='o'>=</span> <span class='nf'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='o'>(</span><span class='s'>"k6_total"</span>, <span class='s'>"phq9_total"</span>, <span class='s'>"bads_total"</span><span class='o'>)</span><span class='o'>)</span> <span class='o'><a href='https://magrittr.tidyverse.org/reference/pipe.html'>%&gt;%</a></span></span>
<span>  <span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/renew-methods.html'>renew</a></span><span class='o'>(</span>type_1L_chr <span class='o'>=</span> <span class='s'>"characterize"</span><span class='o'>)</span></span></code></pre>

</div>

The tables generated in the preceding step can be inspected using the `exhibit` method.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>X</span> <span class='o'><a href='https://magrittr.tidyverse.org/reference/pipe.html'>%&gt;%</a></span></span>
<span>  <span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/exhibit-methods.html'>exhibit</a></span><span class='o'>(</span>profile_idx_int <span class='o'>=</span> <span class='m'>1L</span>,</span>
<span>          scroll_box_args_ls <span class='o'>=</span> <span class='nf'><a href='https://rdrr.io/r/base/list.html'>list</a></span><span class='o'>(</span>width <span class='o'>=</span> <span class='s'>"100%"</span><span class='o'>)</span><span class='o'>)</span></span>
</code></pre>

</div>

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>X</span> <span class='o'><a href='https://magrittr.tidyverse.org/reference/pipe.html'>%&gt;%</a></span></span>
<span>  <span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/exhibit-methods.html'>exhibit</a></span><span class='o'>(</span>profile_idx_int <span class='o'>=</span> <span class='m'>2L</span>,</span>
<span>          scroll_box_args_ls <span class='o'>=</span> <span class='nf'><a href='https://rdrr.io/r/base/list.html'>list</a></span><span class='o'>(</span>width <span class='o'>=</span> <span class='s'>"100%"</span><span class='o'>)</span><span class='o'>)</span></span>
</code></pre>

</div>

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>X</span> <span class='o'><a href='https://magrittr.tidyverse.org/reference/pipe.html'>%&gt;%</a></span></span>
<span>  <span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/exhibit-methods.html'>exhibit</a></span><span class='o'>(</span>profile_idx_int <span class='o'>=</span> <span class='m'>3L</span>,</span>
<span>          scroll_box_args_ls <span class='o'>=</span> <span class='nf'><a href='https://rdrr.io/r/base/list.html'>list</a></span><span class='o'>(</span>width <span class='o'>=</span> <span class='s'>"100%"</span><span class='o'>)</span><span class='o'>)</span></span>
</code></pre>

</div>

The `depict` method can create plots, comparing numeric variables by timepoint.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/depict-methods.html'>depict</a></span><span class='o'>(</span><span class='nv'>X</span>,</span>
<span>       type_1L_chr <span class='o'>=</span> <span class='s'>"by_time"</span>,</span>
<span>       var_nms_chr <span class='o'>=</span> <span class='nf'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='o'>(</span><span class='s'>"c_sofas"</span><span class='o'>)</span>,</span>
<span>       label_fill_1L_chr <span class='o'>=</span> <span class='s'>"Time"</span>,<span class='c'>#</span></span>
<span>       labels_chr <span class='o'>=</span> <span class='nf'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='o'>(</span><span class='s'>"SOFAS"</span><span class='o'>)</span>,<span class='c'>#</span></span>
<span>       y_label_1L_chr <span class='o'>=</span> <span class='s'>""</span><span class='o'>)</span></span>
</code></pre>

<div class="figure" style="text-align: center">

<img src="figs/totalsfig-1.png" alt="SOFAS total scores by data collection round" width="600px" />
<p class="caption">
SOFAS total scores by data collection round
</p>

</div>

</div>

## Share data

**If and only if the dataset you are working with is appropriate for public dissemination (e.g. is synthetic data), you can use the following workflow for sharing it.** We can share the dataset we created for this example using the `share` method, specifying the repository to which we wish to publish the dataset (and for which we have write permissions) in a ([Ready4useRepos object](https://ready4-dev.github.io/ready4use/articles/V_01.html)).

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'>Y <- Ready4useRepos(gh_repo_1L_chr = "ready4-dev/youthvars", # Replace with your repository 
                          gh_tag_1L_chr = "Documentation_0.0"), # (need write permissions).
Y <- share(Y,
           obj_to_share_xx = X,
           fl_nm_1L_chr = "ymh_YouthvarsSeries")
</code></pre>

</div>

`X` is now available for download as the file `ymh_YouthvarsSeries.RDS` from the ["Documentation_0.0" release of the youthvars package](https://github.com/ready4-dev/youthvars/releases/tag/Documentation_0.0).

