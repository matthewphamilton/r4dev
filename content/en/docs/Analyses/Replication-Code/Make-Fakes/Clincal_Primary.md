---
title: "Create a synthetic population of young people attending primary mental health services"
linkTitle: "Clinical"
date: "2022-12-22"
description: "We created a basic synthetic dataset of to represent a clinical youth mental health sample."
weight: 3
categories: 
- Synthetic populations
tags: 
- Analyses
- Analyses - Replication
- Documentation
output: hugodown::md_document
rmd_hash: 67f6523c14b78bdf

---

{{% pageinfo %}} This below section embeds a HTML version of an R Markdown program. The following alternative options may provide improved viewing experience, more contextual information and access to more useful code formats:

-   [view the HTML in the dataset containing its outputs (includes contextual information)](https://doi.org/10.7910/DVN/HJXYKQ) from that article; and;
-   [view the HTML along with the current release of its R Markdown code (useful if you plan to run the code)](https://doi.org/10.5281/zenodo.6321820) and
-   [view the HTML along with the current development version of its R Markdown code (useful if you wish to copy or edit the code)](https://github.com/ready4-dev/aqol6dmap_fakes/)

{{% /pageinfo %}}

<div class='highlight'><!DOCTYPE html>

<html>


<body>






<div id="header">



<h1 class="title toc-ignore">Generate Fake Input Data For An AQoL-6D Mapping Study</h1>
<h4 class="author">Matthew Hamilton</h4>
<h4 class="date">02 March 2022</h4>

</div>


<div id="introduction" class="section level1">
<h1>Introduction</h1>
<p>This program generates a purely synthetic (i.e. fake - no trace of any real records) population that is reasonably representative of the input data we used for the utility mapping study described in the article <a href="https://doi.org/10.1101/2021.07.07.21260129" class="uri">https://doi.org/10.1101/2021.07.07.21260129</a>.</p>
<p>No access to the real data is required in order to use this program - it is based on summary statistics (e.g. means and standard deviations of variables, correlation matrices). It should be noted however, that a different (and simpler) workflow can be implemented when you do have access to the source dataset (for example, by using the <code>syn</code> function from the <code>synthpop</code> package).</p>
<p>The output of this program is very similar but not identical to a fake dataset created by an earlier version of this program and which is saved in the “ymh_clinical_dict_r3.RDS” file from the <a href="https://doi.org/10.7910/DVN/HJXYKQ" class="uri">https://doi.org/10.7910/DVN/HJXYKQ</a> data repository.</p>
</div>
<div id="install-required-r-packages" class="section level1">
<h1>Install required R packages</h1>
<p>If you do not have the following packages already installed, uncomment and run the following lines.</p>
<pre class="r"><code># install.packages(&quot;faux&quot;)
# devtools::install_github(&quot;ready4-dev/ready4) 
# devtools::install_github(&quot;ready4-dev/youthvars) 
# devtools::install_github(&quot;ready4-dev/scorz) 
# devtools::install_github(&quot;ready4-dev/specific&quot;) 
# devtools::install_github(&quot;ready4-dev/TTU&quot;)
# devtools::install_github(&quot;ready4-dev/youthu&quot;)</code></pre>
<p>Load the ready4 framework package.</p>
<pre class="r"><code>library(ready4)</code></pre>
</div>
<div id="specify-parameters-to-generate-outcome-fake-data" class="section level1">
<h1>Specify parameters to generate outcome fake data</h1>
<div id="aqol-item-response-parameters" class="section level2">
<h2>AQoL item response parameters</h2>
<p>The first set of input data are the proportions for each allowed response for each of the twenty AQOL-6D questions at both baseline and followup.</p>
<pre class="r"><code>aqol_items_prpns_tbs_ls &lt;- list(bl_answer_props_tb = tibble::tribble(
    ~Question, ~Answer_1, ~Answer_2, ~Answer_3, ~Answer_4, ~Answer_5, ~Answer_6,
    &quot;Q1&quot;, 0.35, 0.38, 0.16, 0.03, NA_real_,100, # Check item 5 in real data.
    &quot;Q2&quot;, 0.28, 0.38, 0.18, 0.08, 0.04,100,
    &quot;Q3&quot;, 0.78, 0.18, 0.03, 0.01, 0.0, 100,
    &quot;Q4&quot;, 0.64, 0.23, 0.09, 0.0, 100, NA_real_,
    &quot;Q5&quot;, 0.3, 0.48, 0.12, 0.05, 100, NA_real_,
    &quot;Q6&quot;, 0.33, 0.48, 0.15, 100, NA_real_,NA_real_,
    &quot;Q7&quot;, 0.44, 0.27, 0.11, 100, NA_real_, NA_real_,
    &quot;Q8&quot;, 0.18, 0.29, 0.23, 0.21, 100, NA_real_,
    &quot;Q9&quot;, 0.07, 0.27, 0.19, 0.37, 100, NA_real_,
    &quot;Q10&quot;, 0.04, 0.15, 0.4, 0.25, 100, NA_real_,
    &quot;Q11&quot;, 0.03, 0.13, 0.52, 0.25, 100, NA_real_,
    &quot;Q12&quot;, 0.06, 0.21, 0.25, 0.34, 100, NA_real_,
    &quot;Q13&quot;, 0.05, 0.25, 0.31, 0.28, 100, NA_real_,
    &quot;Q14&quot;, 0.05, 0.3, 0.34, 0.25, 100, NA_real_,
    &quot;Q15&quot;, 0.57, 0.25, 0.12, 100, NA_real_,NA_real_,
    &quot;Q16&quot;, 0.48, 0.42, 0.06, 100, NA_real_, NA_real_,
    &quot;Q17&quot;, 0.44, 0.3, 0.16, 0.07, 100, NA_real_,
    &quot;Q18&quot;, 0.33, 0.38, 0.25, 0.04, 0.0, 100,
    &quot;Q19&quot;, 0.33, 0.49, 0.16, 0.02, 0.0, 100,
    &quot;Q20&quot;, 0.67, 0.21, 0.02, 100, NA_real_,NA_real_),
    fup_answer_props_tb = tibble::tribble(
    ~Question, ~Answer_1, ~Answer_2, ~Answer_3, ~Answer_4, ~Answer_5, ~Answer_6,
    &quot;Q1&quot;, 0.51, 0.33, 0.12, 0.02, NA_real_, 100,
    &quot;Q2&quot;, 0.36, 0.38, 0.16, 0.06, 0.02,100,
    &quot;Q3&quot;, 0.81, 0.15, 0.04, 0.00, 0.0, 100,
    &quot;Q4&quot;, 0.73, 0.18, 0.09, 0.0, 100, NA_real_,
    &quot;Q5&quot;, 0.36, 0.42, 0.12, 0.05, 100, NA_real_,
    &quot;Q6&quot;, 0.48, 0.40, 0.11, 100, NA_real_,NA_real_,
    &quot;Q7&quot;, 0.57, 0.25, 0.09, 100, NA_real_, NA_real_,
    &quot;Q8&quot;, 0.31, 0.33, 0.17, 0.12, 100, NA_real_,
    &quot;Q9&quot;, 0.13, 0.35, 0.19, 0.23, 100, NA_real_,
    &quot;Q10&quot;, 0.1, 0.21, 0.43, 0.16, 100, NA_real_,
    &quot;Q11&quot;, 0.06, 0.25, 0.48, 0.18, 100, NA_real_,
    &quot;Q12&quot;, 0.08, 0.27, 0.26, 0.25, 100, NA_real_,
    &quot;Q13&quot;, 0.07, 0.37, 0.31, 0.19, 100, NA_real_,
    &quot;Q14&quot;, 0.08, 0.37, 0.34, 0.15, 100, NA_real_,
    &quot;Q15&quot;, 0.62, 0.23, 0.09, 100, NA_real_,NA_real_,
    &quot;Q16&quot;, 0.52, 0.40, 0.06, 100, NA_real_, NA_real_,
    &quot;Q17&quot;, 0.51, 0.28, 0.15, 0.06, 100, NA_real_,
    &quot;Q18&quot;, 0.37, 0.35, 0.25, 0.03, 0.0, 100,
    &quot;Q19&quot;, 0.43, 0.40, 0.16, 0.01, 0.0, 100,
    &quot;Q20&quot;, 0.77, 0.21, 0.02, 100, NA_real_,NA_real_)) %&gt;%
  youthvars::make_complete_prpns_tbs_ls()</code></pre>
</div>
<div id="outcome-variable-correlation-parameters" class="section level2">
<h2>Outcome variable correlation parameters</h2>
<p>First we specify the names of variables we will be creating as outcome variables.</p>
<pre class="r"><code>var_names_chr &lt;- c(&quot;aqol6d_total_w&quot;,&quot;phq9_total&quot;,&quot;bads_total&quot;,
                   &quot;gad7_total&quot;,&quot;oasis_total&quot;,&quot;scared_total&quot;,&quot;k6_total&quot;)</code></pre>
<p>The next step is to specify the correlations between outcome variables (variables assumed to be ordered as in previous step) at baseline and follow-up timepoints.</p>
<pre class="r"><code>cor_mat_ls &lt;- list(matrix(c(1,-0.78,0.72,-0.67,-0.71,-0.65,-0.67,
                               NA,1,-0.73,0.69,0.66,0.63,0.71,
                               NA,NA,1,-.57,-0.64,-0.57,-0.65,
                               NA,NA,NA,1,0.74,0.70,0.63,
                               NA,NA,NA,NA,1,0.7,0.59,
                               NA,NA,NA,NA,NA,1,0.55,
                               NA,NA,NA,NA,NA,NA,1),7,7),
                    matrix(c(1,-0.81,0.72,-0.71,-0.73,-0.64,-0.68,
                        NA,1,-0.72,0.69,0.68,0.61,0.68,
                        NA,NA,1,-0.59,-0.61,-0.51,-0.61,
                        NA,NA,NA,1,0.75,0.71,0.6,
                        NA,NA,NA,NA,1,0.68,0.59,
                        NA,NA,NA,NA,NA,1,0.52,
                        NA,NA,NA,NA,NA,NA,1),7,7)) </code></pre>
<p>We now specify the univariate distribution parameters for each of the outcome variables.</p>
<pre class="r"><code>synth_data_spine_ls &lt;- list(cor_mat_ls = cor_mat_ls,
                            nbr_obs_dbl = c(1068,643),
                            timepoint_nms_chr = c(&quot;BL&quot;,&quot;FUP&quot;),
                            means_ls = list(c(0.6,12.8,78.2, 10.4,8.1,34.2,12.2),
                                            c(0.7,9.8,89.4, 7.9,6.3,28.8,9.8)),
                            sds_ls = list(c(0.2,6.6,24.8,5.7,4.7,17.9,5.8),
                                          c(0.2,6.5,24.4,5.5,4.3,17.8,5.9)),
                            missing_ls = list(c(0,4,10,6,7,7,4),
                                              c(0,5,2,2,1,2,2)),
                            min_max_ls = list(c(0.03,1),
                                              c(0,27),
                                              c(0,150),
                                              c(0,21),
                                              c(0,20),
                                              c(0,82),
                                              c(0,24)),
                            discrete_lgl = c(F,rep(T,6)),
                            var_names_chr = var_names_chr,
                            aqol_tots_var_nms_chr = c(cumulative = &quot;aqol6d_total_c&quot;,
                                                      weighted = &quot;aqol6d_total_w&quot;)) </code></pre>
</div>
</div>
<div id="generate-fake-data" class="section level1">
<h1>Generate fake data</h1>
<div id="create-fake-outcome-variable-datasets" class="section level2">
<h2>Create fake outcome variable datasets</h2>
<p>We now use the parameters we have just specified to create baseline and follow-up datasets with fake data for our nominated outcome variables.</p>
<pre class="r"><code>aqol_scores_pars_ls &lt;- list(means_dbl = c(44.5,40.6), 
                            sds_dbl = c(9.9,9.8),
                            corr_dbl = -0.95)
aqol6d_adol_pop_tbs_ls &lt;- aqol_items_prpns_tbs_ls %&gt;%
  scorz::make_aqol6d_adol_pop_tbs_ls(aqol_scores_pars_ls = aqol_scores_pars_ls,
                                     series_names_chr =  c(&quot;bl_outcomes_tb&quot;,
                                                           &quot;fup_outcomes_tb&quot;),
                                     synth_data_spine_ls = synth_data_spine_ls,
                                     temporal_cors_ls = list(aqol6d_total_w = 0.85))</code></pre>
<pre><code>## Joining, by = c(&quot;id&quot;, &quot;match_var_chr&quot;)
## Joining, by = &quot;id&quot;
## Joining, by = c(&quot;id&quot;, &quot;match_var_chr&quot;)
## Joining, by = &quot;id&quot;</code></pre>
</div>
<div id="create-fake-descriptive-variables" class="section level2">
<h2>Create fake descriptive variables</h2>
<p>We now specify the names and statistical parameters of the variables we will be using in descriptive statistics. For this analysis we are not interested in capturing the joint distribution between these variables, so we only use univariate parameters.</p>
<pre class="r"><code>descriptives_BL_tb &lt;- tibble::tibble(fkClientID = aqol6d_adol_pop_tbs_ls$bl_outcomes_tb$fkClientID,
                                     round = c(1) ,
                                     d_age = rnorm(1068,18.1,3.3) %&gt;% 
                                       purrr::map_dbl(~min(.x,25) %&gt;% 
                                                        max(12)),
                                     d_gender = c(rep(1,653),
                                                  rep(2,359),
                                                  rep(3,39),
                                                  rep(NA_real_,17)) %&gt;% 
                                       specific::scramble_xx() %&gt;%
                                       factor(labels = c(&quot;Female&quot;,&quot;Male&quot;,&quot;Other&quot;)),
                                     d_sexual_ori_s = c(rep(1,738),
                                                        rep(2,289),
                                                        rep(NA_real_,41)) %&gt;% 
                                       specific::scramble_xx() %&gt;%
                                       factor(labels = c(&quot;Straight&quot;,&quot;Other&quot;)),
                                     Region = c(rep(1,671),
                                                rep(2,397)) %&gt;% 
                                       specific::scramble_xx() %&gt;%
                                       factor(labels = c(&quot;Metro&quot;,&quot;Regional&quot;)),
                                     CALD = c(rep(T,759),
                                              rep(F,169),
                                              rep(NA,140)) %&gt;% 
                                       specific::scramble_xx(),
                                     d_studying_working = c(rep(1,405),
                                                            rep(2,167),
                                                            rep(3,305),
                                                            rep(4,159),
                                                            rep(NA_real_,32)) %&gt;% 
                                       specific::scramble_xx() %&gt;% 
                                       factor(labels = c(&quot;Studying only&quot;,
                                                         &quot;Working only&quot;,
                                                         &quot;Studying and working&quot;,
                                                         &quot;Not studying or working&quot;)),
                                     c_p_diag_s = c(rep(1,182),
                                                    rep(2,264),
                                                    rep(3,332),
                                                    rep(4,237),
                                                    rep(NA_real_,53)) %&gt;% 
                                       specific::scramble_xx() %&gt;%
                         factor(labels = c(&quot;Depression&quot;, &quot;Anxiety&quot;,&quot;Depression and Anxiety&quot;, &quot;Other&quot;)),
                         c_clinical_staging_s = c(rep(1,625),
                                                  rep(2,326),
                                                  rep(3,86),
                                                  rep(NA_real_,31)) %&gt;% 
                           specific::scramble_xx() %&gt;%
                           factor(labels = c(&quot;0-1a&quot;,&quot;1b&quot;,&quot;2-4&quot;)),
                         c_sofas = c(rnorm(1068-30,65.2,9.5),
                                     rep(NA_real_,30)) %&gt;% 
                           purrr::map_dbl(~min(.x,100) %&gt;% 
                                            max(0)) %&gt;% 
                           specific::scramble_xx(),
                         s_centre = NA_character_, 
                         d_agegroup = NA_character_, 
                         d_sex_birth_s = NA_character_, 
                         d_country_bir_s = NA_character_,
                         d_ATSI = NA_character_,
                         d_english_home = NA, 
                         d_english_native = NA, 
                         d_relation_s = c(rep(1,325),
                                          rep(2,426),
                                          rep(3,286),
                                          rep(NA_real_,31)) %&gt;% 
                           specific::scramble_xx() %&gt;%
                           factor(labels = c(&quot;REPLACE_ME_1&quot;,
                                             &quot;REPLACE_ME_2&quot;,
                                             &quot;REPLACE_ME_3&quot;)))  %&gt;%
  dplyr::mutate(d_sex_birth_s = dplyr::case_when(is.na(d_gender) ~ NA_integer_,
                                                 as.integer(d_gender) %in% 
                                                   c(1L,2L) &amp; 
                                                   runif(1068)&gt;0.995 ~ as.integer(d_gender) %&gt;%
                                                   purrr::map_int(~ ifelse(is.na(.x), 
                                                                           .x, 
                                                                           switch(.x,2L,1L,3L))),
                                                 as.integer(d_gender) == 3 ~ sample(c(1L,2L), 
                                                                                    1068, 
                                                                                    replace = T),
                                                 TRUE ~ as.integer(d_gender)
                                                 ) %&gt;%
                  factor(labels = c(&quot;Female&quot;,&quot;Male&quot;)))</code></pre>
<pre><code>## Registered S3 methods overwritten by &#39;ggalt&#39;:
##   method                  from   
##   grid.draw.absoluteGrob  ggplot2
##   grobHeight.absoluteGrob ggplot2
##   grobWidth.absoluteGrob  ggplot2
##   grobX.absoluteGrob      ggplot2
##   grobY.absoluteGrob      ggplot2</code></pre>
<pre class="r"><code>descriptives_FUP_tb &lt;- descriptives_BL_tb %&gt;% 
  dplyr::filter(fkClientID %in% 
                  aqol6d_adol_pop_tbs_ls$fup_outcomes_tb$fkClientID) %&gt;%
  dplyr::mutate(round = 2,
                d_age = d_age + 0.25,
                Region = Region %&gt;% 
                  specific::randomise_changes_in_fct_lvls(0.98),
                d_studying_working = d_studying_working %&gt;%
                  specific::randomise_changes_in_fct_lvls(0.9),
                c_p_diag_s = c_p_diag_s %&gt;% 
                  specific::randomise_changes_in_fct_lvls(0.90),
                c_clinical_staging_s = c_clinical_staging_s %&gt;% 
                  specific::randomise_changes_in_fct_lvls(0.8),
                c_sofas = c_sofas + rnorm(643,4.7,10) %&gt;% 
                         purrr::map_dbl(~min(.x,100) %&gt;% max(0)))
bl_tb &lt;- dplyr::inner_join(descriptives_BL_tb,
                           aqol6d_adol_pop_tbs_ls$bl_outcomes_tb) </code></pre>
<pre><code>## Joining, by = &quot;fkClientID&quot;</code></pre>
<pre class="r"><code>fup_tb &lt;- dplyr::inner_join(descriptives_FUP_tb,
                            aqol6d_adol_pop_tbs_ls$fup_outcomes_tb)</code></pre>
<pre><code>## Joining, by = &quot;fkClientID&quot;</code></pre>
<p>We make some adjustments to ensure that the <code>c_sofas</code> variable is correlated with our <code>aqol6d_total_w</code> variable at both baseline and follow-up.</p>
<pre class="r"><code>bl_tb &lt;- bl_tb %&gt;%
  dplyr::mutate(c_sofas = faux::rnorm_pre(bl_tb$aqol6d_total_w %&gt;% 
                                            as.vector(), 
                                          mu = 65.2, 
                                          sd = 9.5, 
                                          r = 0.5, 
                                          empirical = T) %&gt;% 
                  purrr::map_dbl(~min(.x,100) %&gt;% max(0)))
fup_tb &lt;- fup_tb %&gt;%
  dplyr::mutate(c_sofas = faux::rnorm_pre(fup_tb$aqol6d_total_w %&gt;% 
                                            as.vector(), 
                                          mu = 69.9, 
                                          sd = 10, 
                                          r = 0.5, 
                                          empirical = T) %&gt;% 
                  purrr::map_dbl(~min(.x,100) %&gt;% max(0)))</code></pre>
</div>
<div id="combine-datasets" class="section level2">
<h2>Combine datasets</h2>
<p>We now add the fake outcome variables dataset to the fake descriptive variables dataset.</p>
<pre class="r"><code>composite_tb &lt;- dplyr::bind_rows(bl_tb, fup_tb) %&gt;%
  dplyr::mutate(d_age = floor(d_age)) %&gt;%
  dplyr::mutate(d_gender = d_gender %&gt;% as.character() %&gt;%
                  purrr::map_chr(~ifelse(.x==&quot;Other&quot;,
                                         sample(c(&quot;Genderqueer/gender nonconforming/agender&quot;,
                                                              &quot;Transgender&quot;),1),
                                         .x)),
                s_centre = Region %&gt;% as.character() %&gt;%
                  purrr::map_chr(~ifelse(.x==&quot;Metro&quot;,
                                         sample(c(&quot;Canberra&quot;,&quot;Southport&quot;,&quot;Knox&quot;),1),
                                         &quot;Regional Centre&quot;)),
                d_country_bir_s = CALD %&gt;%
                  purrr::map_chr(~ifelse(.x,
                                         &quot;Other&quot;,
                                         &quot;Australia&quot;)), 
                       d_ATSI = CALD %&gt;%
                  purrr::map_chr(~ifelse(.x,
                                         &quot;Yes&quot;,
                                         &quot;No&quot;)),
                       d_english_home = CALD %&gt;%
                  purrr::map_chr(~ifelse(.x,
                                         &quot;No&quot;,
                                         &quot;Yes&quot;)), 
                       d_english_native = CALD %&gt;%
                  purrr::map_chr(~ifelse(.x,
                                         &quot;No&quot;,
                                         &quot;Yes&quot;))
                ) %&gt;%
  dplyr::select(-CALD) %&gt;%
  dplyr::select(-Region)
composite_tb &lt;- composite_tb %&gt;%
  dplyr::select(-setdiff(names(composite_tb)[startsWith(names(composite_tb),
                                                        &quot;aqol6d_&quot;)],
                         names(composite_tb)[startsWith(names(composite_tb),
                                                        &quot;aqol6d_q&quot;)]))
composite_tb &lt;- composite_tb %&gt;%
  dplyr::mutate(c_sofas = as.integer(round(c_sofas,0))) %&gt;%
  dplyr::mutate(round = factor(round, labels = c(&quot;Baseline&quot;,
                                                 &quot;Follow-up&quot;))) %&gt;%
  dplyr::mutate(d_relation_s = dplyr::case_when(d_relation_s %in% 
                                                  c(&quot;REPLACE_ME_1&quot;,&quot;REPLACE_ME_2&quot;) ~ 
                                                  &quot;Not in a relationship&quot;,
                                                T ~ &quot;In a relationship&quot;)) %&gt;%
  youthu::add_dates_from_dstr(bl_start_date_dtm = Sys.Date() - lubridate::days(600),##
                              bl_end_date_dtm = Sys.Date() - lubridate::days(420),
                              duration_args_ls = list(a = 60, b = 140, mean = 90, sd = 10),
                              duration_fn = truncnorm::rtruncnorm,
                              date_var_nm_1L_chr = &quot;d_interview_date&quot;) %&gt;%
  dplyr::select(-duration_prd) %&gt;%
  youthvars::transform_raw_ds_for_analysis() %&gt;%
  dplyr::rename(phq9_total = PHQ9,
                bads_total = BADS,
                gad7_total = GAD7,
                oasis_total = OASIS,
                scared_total = SCARED,
                k6_total = K6,
                c_sofas = SOFAS) %&gt;%
  dplyr::select(-c(&quot;d_agegroup&quot;,&quot;Gender&quot;, &quot;CALD&quot;, &quot;Region&quot;))</code></pre>
</div>
</div>




</div>

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

