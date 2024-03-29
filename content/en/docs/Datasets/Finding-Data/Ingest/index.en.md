---
title: "Ingest data from an open access repository"
linkTitle: "Ingest"
date: "2022-12-23"
description: "A tutorial from the Acumen website about using ready4 to search and retrieve data from the Australian Mental Health Systems Models Dataverse."
weight: 92
categories: 
- Documentation
tags: 
- Data ingest
output: hugodown::md_document
rmd_hash: 127821fa158f5037

---

{{% pageinfo %}} This below section renders a R Markdown program from the [Acumen website](https://www.acumen-mh.org/). You can use the following links to:

-   [view the tutorial on the Acument website (adds useful hyperlinks to code blocks)](https://www.acumen-mh.org/blog/2022/08/28/access_open_data/)
-   [view the source file](https://github.com/mentalhealthmodels/nmhsmn_web/blob/main/content/blog/resources/modeller-resources/tutorials/Managing-Open-Code-And-Data/Access_Open_Data.Rmd) from that article, and;
-   [edit its contents](https://github.com/mentalhealthmodels/nmhsmn_web/edit/main/content/blog/resources/modeller-resources/tutorials/Managing-Open-Code-And-Data/Access_Open_Data.Rmd) (requires a GitHub account). {{% /pageinfo %}}

<div class="highlight">

</div>

# 1. Objectives

On completion of this tutorial you should be able to:

-   Understand basic concepts relating to the Australian Mental Health Systems Models Dataverse Collection; and

-   Have the ability to search for, download and ingest files contained in Dataverse Datasets that are linked to by the Australian Mental Health Systems Models Dataverse Collection using two alternative approaches;

    -   Using a web based interface; and
    -   Using R commands.

# 2. Prerequisites

You can complete most of this tutorial without any specialist skills or software other than having a web-browser connected to the Internet. However, if you wish to try running the R code for finding and downloading files described in the last part of the tutorial, then you must have R (and ideally RStudio as well) installed on your machine. Instructions for how to install this software are available at <https://rstudio-education.github.io/hopr/starting.html> .

# 3. Concepts

Before searching for or retrieving data from the Australian Mental Health Systems Models Dataverse Collection, the following concepts are useful to understand:

-   The **Dataverse Project** is "an open source web application to share, preserve, cite, explore, and analyze research data." It is developed at Harvard's Institute for Quantitative Social Science (IQSS). More information about the project is available on the [Dataverse Project's website](https://dataverse.org).

-   There are many **Dataverse Installations** around the world (85 at the time of writing this tutorial). Each Dataverse Installation is an instance of an organisation installing the Dataverse Project's software on its own servers to create and manage online data repositories. At the time of writing there is one Australian Dataverse Installation listed on the Dataverse Project's website, which is the [Australian Data Archive](https://dataverse.ada.edu.au).

-   The **Harvard Dataverse** is a Dataverse Installation that is managed by Harvard University, that is open to researchers from all disciplines from anywhere in the world. More details are available from [its website](https://dataverse.harvard.edu).

-   A **Dataverse Collection** (frequently and confusingly also referred to as simply a "Dataverse") is a part of a Dataverse Installation that a user can set up to host multiple "Dataverse Datasets" (see next bullet point). Dataverse Collections typically share common attributes (for example, are in the same topic area or produced by the same group(s) of researchers) and can be branded to a limited degree. Dataverse Collections will also contain descriptive metadata about the purpose and ownership of the collection.

-   A **Dataverse Dataset** is a uniquely identified collection of files (some of which, again confusingly, can be tabular data files of the type that researchers typically refer to as "datasets") within a **Dataverse Collection**. Each Dataverse Dataset will have a name, a Digital Object Identifier, a version number, citation information and details of the licensing/terms of use that apply to its contents.

-   A **Linked Dataverse Dataset** is a Dataverse Dataset that appears in a Dataverse Collection's list of contents without actually being in that Dataverse Collection (it is hosted in another Dataverse Collection and is potentially owned and controlled by another user).

-   The **Australian Mental Health Systems Models Dataverse Collection** (which we will refer to as "our Dataverse Collection") is a Dataverse Collection of Linked Dataverse Datasets within the Harvard Dataverse. We established our Dataverse Collection in the Harvard Dataverse because of the robustness and flexibility that this service provides. A factor in our choice of the Harvard Dataverse was that the aim of our Dataverse Collection is to promote easy access to **non-confidential data** relevant to modelling Australian mental health policy and service planning topics. The non-confidential nature of the data means that the additional administrative requirements that some other Dataverse Installations place on users were potentially unnecessary for our specific purposes. As a collection of Linked Dataverse Datasets, our Dataverse Collection can be used by modelling groups as both a centralised location to find relevant data and as an additional promotion / distribution channel to share Dataverse Datasets from their own Harvard Dataverse Collections without surrendering any control over the management of their data (they continue to curate their Dataverse Dataset and can modify Dataverse Dataset contents, metadata and terms of use as they see fit).

# 3. Search and download dataset files

There are multiple options for searching and downloading files contained in our Dataverse Collection. This tutorial will discuss just two - one based on using a web browser and the other based on using R commands. For details on other options, it is recommended to consult the Harvard Dataverse [user guide](https://guides.dataverse.org/en/latest/user/index.html) and (for more technical readers) [api guide](https://guides.dataverse.org/en/latest/api/index.html#).

## 3.1. Web browser approach

Searching and retriving data from our Dataverse Collection via a web-browser is very simple, and this methods is suitable for low volume requests (i.e. occasional use) where reproducibility is not important.

To find and download data using your web browser, implement the following steps:

-   Go to our Dataverse Collection at <https://dataverse.harvard.edu/dataverse/openmind>

-   Search for the Linked Dataverse Dataset most of interest to you by using the tools provided on the landing page.

-   Click on the link to your selected Dataverse Dataset. Note that by doing so you will leave our Dataverse Collection and be taken to the Dataverse Collection controlled by the Dataverse Dataset's owner.

-   (Optional) - Click on the "Metadata", "Terms" and "Versions" tabs or (if available) the Related Publication links to discover more about the dataset. When you are done, click on the "Files" tab to review the files contained in the Dataverse Dataset.

-   Select the files that you wish to download using the checkboxes and click on the "Download" button.

-   When prompted, review any terms of use you are presented with and either accept them or cancel the download as you feel appropriate.

More detail on some of the above steps is available in the following section of the Harvard Dataverse user guide: <https://guides.dataverse.org/en/latest/user/find-use-data.html#finding-data>

## 3.2 Using R commands

Some limitations of relying purely on a web-browser are that it is a purely manual approach that can become inefficient for large number of data requests and which is not reproducible (thereby limiting transparency about the specific data items / versions used in an analysis). It can therefore be desirable to explore alternatives that are based on programming commands. Programmatic approaches have the advantage of being more readily incorporated into automated and reproducible workflows.

There are a range of software tools in different languages that can be used to programmatically search and retrieve files in Dataverse Collections. More information on these resources on [a dedicated page within the Dataverse Project's documentation](https://guides.dataverse.org/en/latest/api/client-libraries.html).

One of these tools is `dataverse` - "the R Client for Dataverse Repositories". The `dataverse` R package has a range of functions that are very helpful for general tasks relating to the search and retrieval of files contained in Dataverse Datasets. These functions are not the focus of this tutorial, but you can read more about them on the \[packages documentation website\]((<https://iqss.github.io/dataverse-client-r/>).

The remainder of this tutorial is focused on the use of another R package called `ready4use` which created by Orygen to help manage open-source data for use in mental health models. The `ready4use` R package extends the `dataverse` R package and one of its applications is to ingest R objects stored in Dataverse Datasets in the ".Rds" file format directly into an R Session's working memory. More information about `ready4use` is available on its [documentation website](https://ready4-dev.github.io/ready4use/index.html).

### 3.2.1 Install and load required R packages

As `ready4use` is still a development package, you may need to first install the `devtools` package to help install it. The following commands entered in your R console will do this.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'>utils</span><span class='nf'>::</span><span class='nf'><a href='https://rdrr.io/r/utils/install.packages.html'>install.packages</a></span><span class='o'>(</span><span class='s'>"devtools"</span><span class='o'>)</span></span>
<span><span class='nf'>devtools</span><span class='nf'>::</span><span class='nf'><a href='https://remotes.r-lib.org/reference/install_github.html'>install_github</a></span><span class='o'>(</span><span class='s'>"ready4-dev/ready4use"</span><span class='o'>)</span></span></code></pre>

</div>

We now load the `ready4use` package and the `ready4` framework for youth mental health modelling that it depends on. The `ready4` framework will have been automatically installed along with `ready4use.`

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='kr'><a href='https://rdrr.io/r/base/library.html'>library</a></span><span class='o'>(</span><span class='nv'><a href='https://ready4-dev.github.io/ready4/'>ready4</a></span><span class='o'>)</span></span>
<span><span class='kr'><a href='https://rdrr.io/r/base/library.html'>library</a></span><span class='o'>(</span><span class='nv'><a href='https://ready4-dev.github.io/ready4use/'>ready4use</a></span><span class='o'>)</span></span></code></pre>

</div>

### 3.2.2 Specify repository details

The next step is to create a `Ready4useRepos` object, which in this example we will call `X`, that contains the details of the Dataverse Dataset from which we wish to retrieve R objects. We need to supply three pieces of information to `Ready4useRepos`. Two of these items of information will be the same for any data item retrieved from our Dataverse Collection and are the Dataverse Collection identifier (which for us is "openmind") and the server on which the containing Dataverse Installation is hosted (in our case "dataverse.harvard.edu"). The one item of information that will vary based on your requirements is the name / identifier (DOI) of the Dataverse Dataset from which we wish to retrieve data. In this example we are using the DOI for the "Synthetic (fake) youth mental health datasets and data dictionaries" Dataverse Dataset.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>X</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://ready4-dev.github.io/ready4use/reference/Ready4useRepos-class.html'>Ready4useRepos</a></span><span class='o'>(</span>dv_nm_1L_chr <span class='o'>=</span> <span class='s'>"openmind"</span>,</span>
<span>                    dv_server_1L_chr <span class='o'>=</span> <span class='s'>"dataverse.harvard.edu"</span>,</span>
<span>                    dv_ds_nm_1L_chr <span class='o'>=</span> <span class='s'>"https://doi.org/10.7910/DVN/HJXYKQ"</span><span class='o'>)</span></span></code></pre>

</div>

Having supplied the details of where the data is stored we can now ingest the data we are interested in. We can either ingest all R object in the selected Dataverse Dataset or just objects that we specify. By default R objects are ingested along with their metadata, but we can choose not to ingest the metadata.

### 3.2.3 Ingest all R objects from a Dataverse Dataset along with its metadata

To ingest all R objects in the dataset, we enter the following command.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>Y</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/ingest-methods.html'>ingest</a></span><span class='o'>(</span><span class='nv'>X</span><span class='o'>)</span></span></code></pre>

</div>

We can now create separate list objects for the ingested data and its metadata.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>data_ls</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/procureSlot-methods.html'>procureSlot</a></span><span class='o'>(</span><span class='nv'>Y</span>,<span class='s'>"b_Ready4useIngest@objects_ls"</span><span class='o'>)</span></span>
<span><span class='nv'>meta_ls</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/procureSlot-methods.html'>procureSlot</a></span><span class='o'>(</span><span class='nv'>Y</span>,<span class='s'>"a_Ready4usePointer@b_Ready4useRepos@dv_ds_metadata_ls$ds_ls"</span><span class='o'>)</span></span></code></pre>

</div>

We can itemise the data objects we have ingested with the following command.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'><a href='https://rdrr.io/r/base/names.html'>names</a></span><span class='o'>(</span><span class='nv'>data_ls</span><span class='o'>)</span></span></code></pre>

</div>

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='c'>#&gt; [1] "eq5d_ds_dict"         "eq5d_ds_tb"           "ymh_clinical_dict_r3" "ymh_clinical_tb"</span></span></code></pre>

</div>

We can also see what metadata fields we have ingested.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'><a href='https://rdrr.io/r/base/names.html'>names</a></span><span class='o'>(</span><span class='nv'>meta_ls</span><span class='o'>)</span></span></code></pre>

</div>

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='c'>#&gt;  [1] "id"                  "datasetId"           "datasetPersistentId" "storageIdentifier"   "versionNumber"       "versionMinorNumber" </span></span>
<span><span class='c'>#&gt;  [7] "versionState"        "lastUpdateTime"      "releaseTime"         "createTime"          "termsOfUse"          "fileAccessRequest"  </span></span>
<span><span class='c'>#&gt; [13] "metadataBlocks"      "files"</span></span></code></pre>

</div>

There can be a lot of useful information contained in this metadata list object. For example, we can retrieve descriptive information about the Dataverse Dataset from which we have ingested data.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>meta_ls</span><span class='o'>$</span><span class='nv'>metadataBlocks</span><span class='o'>$</span><span class='nv'>citation</span><span class='o'>$</span><span class='nv'>fields</span><span class='o'>$</span><span class='nv'>value</span><span class='o'>[[</span><span class='m'>7</span><span class='o'>]</span><span class='o'>]</span><span class='o'>$</span><span class='nv'>dsDescriptionValue</span><span class='o'>$</span><span class='nv'>value</span></span></code></pre>

</div>

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='c'>#&gt; [1] "The datasets in this collection are entirely fake. They were developed principally to demonstrate the workings of a number of utility scoring and mapping algorithms. However, they may be of more general use to others. In some limited cases, some of the included files could be used in exploratory simulation based analyses. However, you should read the metadata descriptors for each file to inform yourself of the validity and limitations of each fake dataset. To open the RDS format files included in this dataset, the R package ready4use needs to be installed (see https://ready4-dev.github.io/ready4use/ ). It is also recommended that you install the youthvars package ( https://ready4-dev.github.io/youthvars/) as this provides useful tools for inspecting and validating each dataset."</span></span></code></pre>

</div>

The metadata also contains descriptive information on each file in the Dataverse Dataset.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>meta_ls</span><span class='o'>$</span><span class='nv'>files</span><span class='o'>$</span><span class='nv'>description</span><span class='o'>[</span><span class='m'>5</span><span class='o'>]</span></span></code></pre>

</div>

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='c'>#&gt; [1] "A synthetic (fake) dataset representing clients in an Australian primary youth mental health service. This dataset was generated from parameter values derived from a sample of 1107 clients of headspace services using a script that is also included in this dataset. The purpose of this synthetic dataset was to allow the replication code for a utility mapping study (see: https://doi.org/10.1101/2021.07.07.21260129) to be run by those lacking access to the original dataset. The dataset may also have some limited value as an input dataset for purely exploratory studies in simulation studies of headspace clients, as its source dataset was reasonably representative of the headpace client population. However, it should be noted that the algorithm that generated this dataset only captures aspects of the joint distributions of the psychological and health utility measures. Other sample characteristic variables (age, gender, etc) are only representative of the source dataset when considered in isolation, rather than jointly."</span></span></code></pre>

</div>

### 3.2.4 Ingest all R objects from a Dataverse Dataset without metadata

If we wished to ingest only the R objects without metadata, we could have simply run the following command.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>data_2_ls</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/ingest-methods.html'>ingest</a></span><span class='o'>(</span><span class='nv'>X</span>,</span>
<span>                    metadata_1L_lgl <span class='o'>=</span> <span class='kc'>F</span><span class='o'>)</span></span></code></pre>

</div>

We can see that this ingest is identical to that made using the previous method.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'><a href='https://rdrr.io/r/base/identical.html'>identical</a></span><span class='o'>(</span><span class='nv'>data_ls</span>, <span class='nv'>data_2_ls</span><span class='o'>)</span></span></code></pre>

</div>

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='c'>#&gt; [1] TRUE</span></span></code></pre>

</div>

### 3.2.5 Ingest selected R objects

If we only want to ingest one specific object, we can supply its name.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>ymh_clinical_tb</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/ingest-methods.html'>ingest</a></span><span class='o'>(</span><span class='nv'>X</span>,</span>
<span>                          fls_to_ingest_chr <span class='o'>=</span> <span class='nf'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='o'>(</span><span class='s'>"ymh_clinical_tb"</span><span class='o'>)</span>,</span>
<span>                          metadata_1L_lgl <span class='o'>=</span> <span class='kc'>F</span><span class='o'>)</span></span></code></pre>

</div>

The output from an object specific call to the `ingest` method is the requested object.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>ymh_clinical_tb</span> <span class='o'><a href='https://magrittr.tidyverse.org/reference/pipe.html'>%&gt;%</a></span></span>
<span>  <span class='nf'><a href='https://rdrr.io/r/utils/head.html'>head</a></span><span class='o'>(</span><span class='o'>)</span></span></code></pre>

</div>

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='c'>#&gt; <span style='color: #555555;'># A tibble: 6 × 43</span></span></span>
<span><span class='c'>#&gt;   fkClie…¹ round d_interv…² d_age d_gen…³ d_sex…⁴ d_sex…⁵ d_ATSI d_cou…⁶ d_eng…⁷ d_eng…⁸ d_stu…⁹ d_rel…˟ s_cen…˟ c_p_d…˟ c_cli…˟ k6_to…˟ phq9_…˟ bads_…˟</span></span>
<span><span class='c'>#&gt;   <span style='color: #555555; font-style: italic;'>&lt;chr&gt;</span>    <span style='color: #555555; font-style: italic;'>&lt;fct&gt;</span> <span style='color: #555555; font-style: italic;'>&lt;date&gt;</span>     <span style='color: #555555; font-style: italic;'>&lt;int&gt;</span> <span style='color: #555555; font-style: italic;'>&lt;chr&gt;</span>   <span style='color: #555555; font-style: italic;'>&lt;chr&gt;</span>   <span style='color: #555555; font-style: italic;'>&lt;fct&gt;</span>   <span style='color: #555555; font-style: italic;'>&lt;chr&gt;</span>  <span style='color: #555555; font-style: italic;'>&lt;chr&gt;</span>   <span style='color: #555555; font-style: italic;'>&lt;chr&gt;</span>   <span style='color: #555555; font-style: italic;'>&lt;chr&gt;</span>   <span style='color: #555555; font-style: italic;'>&lt;chr&gt;</span>   <span style='color: #555555; font-style: italic;'>&lt;chr&gt;</span>   <span style='color: #555555; font-style: italic;'>&lt;chr&gt;</span>   <span style='color: #555555; font-style: italic;'>&lt;chr&gt;</span>   <span style='color: #555555; font-style: italic;'>&lt;chr&gt;</span>     <span style='color: #555555; font-style: italic;'>&lt;int&gt;</span>   <span style='color: #555555; font-style: italic;'>&lt;int&gt;</span>   <span style='color: #555555; font-style: italic;'>&lt;int&gt;</span></span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>1</span> Partici… Base… 2020-03-22    14 Male    Male    Hetero… No     Austra… Yes     Yes     Not st… In a r… Southp… Other   0-1a          8       7      96</span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>2</span> Partici… Base… 2020-06-15    19 Female  Female  Hetero… Yes    Other   No      No      Studyi… In a r… Region… Anxiety 0-1a         13      13      63</span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>3</span> Partici… Base… 2020-08-20    21 Female  Female  Other   <span style='color: #BB0000;'>NA</span>     <span style='color: #BB0000;'>NA</span>      <span style='color: #BB0000;'>NA</span>      <span style='color: #BB0000;'>NA</span>      Studyi… Not in… Canber… Anxiety 1b           12      17      72</span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>4</span> Partici… Base… 2020-05-23    12 Female  Female  Hetero… Yes    Other   No      No      Not st… In a r… Southp… Depres… 2-4          17      17      75</span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>5</span> Partici… Base… 2020-04-05    19 Male    Male    Hetero… Yes    Other   No      No      Not st… Not in… Southp… Depres… 0-1a         12      22      82</span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>6</span> Partici… Base… 2020-06-09    19 Male    Male    Hetero… Yes    Other   No      No      Studyi… In a r… Region… Anxiety 1b           11       8     105</span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'># … with 24 more variables: gad7_total &lt;int&gt;, oasis_total &lt;int&gt;, scared_total &lt;int&gt;, c_sofas &lt;int&gt;, aqol6d_q1 &lt;int&gt;, aqol6d_q2 &lt;int&gt;, aqol6d_q3 &lt;int&gt;,</span></span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>#   aqol6d_q4 &lt;int&gt;, aqol6d_q5 &lt;int&gt;, aqol6d_q6 &lt;int&gt;, aqol6d_q7 &lt;int&gt;, aqol6d_q8 &lt;int&gt;, aqol6d_q9 &lt;int&gt;, aqol6d_q10 &lt;int&gt;, aqol6d_q11 &lt;int&gt;,</span></span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>#   aqol6d_q12 &lt;int&gt;, aqol6d_q13 &lt;int&gt;, aqol6d_q14 &lt;int&gt;, aqol6d_q15 &lt;int&gt;, aqol6d_q16 &lt;int&gt;, aqol6d_q17 &lt;int&gt;, aqol6d_q18 &lt;int&gt;, aqol6d_q19 &lt;int&gt;,</span></span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>#   aqol6d_q20 &lt;int&gt;, and abbreviated variable names ¹​fkClientID, ²​d_interview_date, ³​d_gender, ⁴​d_sex_birth_s, ⁵​d_sexual_ori_s, ⁶​d_country_bir_s,</span></span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>#   ⁷​d_english_home, ⁸​d_english_native, ⁹​d_studying_working, ˟​d_relation_s, ˟​s_centre, ˟​c_p_diag_s, ˟​c_clinical_staging_s, ˟​k6_total, ˟​phq9_total,</span></span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>#   ˟​bads_total</span></span></span></code></pre>

</div>

We can also request to ingest multiple specified objects from a Dataverse Dataset.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>data_3_ls</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://ready4-dev.github.io/ready4/reference/ingest-methods.html'>ingest</a></span><span class='o'>(</span><span class='nv'>X</span>,</span>
<span>                    fls_to_ingest_chr <span class='o'>=</span> <span class='nf'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='o'>(</span><span class='s'>"ymh_clinical_tb"</span>,<span class='s'>"ymh_clinical_dict_r3"</span><span class='o'>)</span>,</span>
<span>                    metadata_1L_lgl <span class='o'>=</span> <span class='kc'>F</span><span class='o'>)</span></span></code></pre>

</div>

This last request produces a list of ingested objects.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nf'><a href='https://rdrr.io/r/base/names.html'>names</a></span><span class='o'>(</span><span class='nv'>data_3_ls</span><span class='o'>)</span></span></code></pre>

</div>

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='c'>#&gt; [1] "ymh_clinical_dict_r3" "ymh_clinical_tb"</span></span></code></pre>

</div>

