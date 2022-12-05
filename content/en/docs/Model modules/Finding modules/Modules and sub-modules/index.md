---
title: "ready4 modules and sub-modules"
linkTitle: "Modules and sub-modules"
date: "2022-12-05"
description: "How to find individual ready4 modules and sub-modules."
weight: 2
categories: 
- Documentation
tags: 
- Modules
- Sub-modules
output: hugodown::md_document
rmd_hash: 7ba562261aaec1b8

---

<html>


<body>






<div id="header">




</div>


<p>You can search for ready4 modules and sub-modules using tools from
the ready4 R package. <br /><br /></p>
<pre class="r"><code>library(ready4)</code></pre>
<p><br /><br /> A table of ready4 modules and sub-modules can be generated
by scraping ready4 R package websites using the
<code>make_modules_tb</code> function (this may take a couple of
minutes). <br /><br /></p>
<pre class="r"><code>modules_tb &lt;-  make_modules_tb()</code></pre>
<p><br /><br /> A slightly quicker method to achieve a similar (but
potentially less up to date) result is to use the
<code>get_modules_tb</code> function. <br /><br /></p>
<pre class="r"><code># Not run
# modules_tb &lt;- get_modules_tb()</code></pre>
<p><br /><br /> If you wish to display the table of modules as HTML, you
can use the <code>print_modules</code> function. You can choose to
display only ready4 modules (which always use R’s “S4” class type).
<br /><br /></p>
<pre class="r"><code>print_modules(modules_tb,
              what_1L_chr = &quot;S4&quot;)</code></pre>
<p><br /><br /></p>
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
A dataset to be scored, its associated metadata and details of the
scoring instrument
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/scorz/reference/ScorzAqol6-class.html" style="     ">ScorzAqol6</a>
</td>
<td style="text-align:left;">
A dataset and metadata to support implementation of an AQoL-6D scoring
algorithm
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/scorz/reference/ScorzAqol6Adol-class.html" style="     ">ScorzAqol6Adol</a>
</td>
<td style="text-align:left;">
A dataset and metadata to support implementation of a scoring algorithm
for the adolescent version of AQoL-6D
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
A dataset and metadata to support implementation of a scoring algorithm
for the adult version of AQoL-6D
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/scorz/reference/ScorzEuroQol5-class.html" style="     ">ScorzEuroQol5</a>
</td>
<td style="text-align:left;">
A dataset and metadata to support implementation of an EQ-5D scoring
algorithm
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
Modelling project dataset, input parameters and empty results
placeholder
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
Modelling project dataset, input parameters and predictor comparison
results
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/reference/SpecificFixed-class.html" style="     ">SpecificFixed</a>
</td>
<td style="text-align:left;">
Modelling project dataset, input parameters and complete fixed models
results
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/specific/reference/SpecificMixed-class.html" style="     ">SpecificMixed</a>
</td>
<td style="text-align:left;">
Modelling project dataset, input parameters and complete mixed models
results
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
Input, Output and Authorship Data For Generating Utility Mapping Study
Reports
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/TTU/articles/V_01.html" style="     ">5</a>
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
<a href="https://ready4-dev.github.io/TTU/articles/V_01.html" style="     ">5</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/TTU/reference/TTUProject-class.html" style="     ">TTUProject</a>
</td>
<td style="text-align:left;">
Input And Output Data For Undertaking and Reporting Utility Mapping
Studies
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/TTU/articles/V_01.html" style="     ">5</a>
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
A dataset and its associated dictionary, descriptive statistics and
metadata
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
A longitudinal dataset and its associated dictionary, descriptive
statistics and metadata
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_02.html" style="     ">2</a>
</td>
</tr>
</tbody>
</table>
<p><br /><br /> You can also choose to display only ready4 sub-modules
(which always use R’s “S3” class type). <br /><br /></p>
<pre class="r"><code>print_modules(modules_tb,
              what_1L_chr = &quot;S3&quot;)</code></pre>
<p><br /><br /></p>
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
youthvars S3 class for Assessment of Quality of Life Six Dimension
Health Utility - Adolescent Version (AQoL6d Adolescent))
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
youthvars S3 class for Behavioural Activation for Depression Scale
(BADS) scores
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
youthvars S3 class for Overall Anxiety Severity and Impairment Scale
(OASIS) scores
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
youthvars S3 class for Screen for Child Anxiety Related Disorders
(SCARED) scores
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
youthvars S3 class for Kessler Psychological Distress Scale (K6) - US
Scoring System scores
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
youthvars S3 class for Social and Occupational Functioning Assessment
Scale (SOFAS)
</td>
<td style="text-align:left;">
<a href="https://ready4-dev.github.io/youthvars/articles/V_01.html" style="     ">1</a>
</td>
</tr>
</tbody>
</table>





<script>

// add bootstrap table styles to pandoc tables
function bootstrapStylePandocTables() {
  $('tr.odd').parent('tbody').parent('table').addClass('table table-condensed');
}
$(document).ready(function () {
  bootstrapStylePandocTables();
});


</script>

<!-- tabsets -->

<script>
$(document).ready(function () {
  window.buildTabsets("TOC");
});

$(document).ready(function () {
  $('.tabset-dropdown > .nav-tabs > li').click(function () {
    $(this).parent().toggleClass('nav-tabs-open');
  });
});
</script>

<!-- code folding -->


<!-- dynamically load mathjax for compatibility with self-contained -->
<script>
  (function () {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src  = "https://mathjax.rstudio.com/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML";
    document.getElementsByTagName("head")[0].appendChild(script);
  })();
</script>

</body>
</html>

