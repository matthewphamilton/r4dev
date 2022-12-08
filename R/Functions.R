library(ready4)
library(tidyRSS)
#library(zen4R) # https://cran.r-project.org/web/packages/zen4R/vignettes/zen4R.html#package_overview
make_code_releases_tbl <- function(repository_type_1L_chr = "Framework",
                                   as_kable_1L_lgl = T,
                                   brochure_repos_chr = character(0),
                                   exclude_chr = character(0),
                                   format_1L_chr = "%d-%b-%Y",
                                   framework_repos_chr = character(0),
                                   model_repos_chr = character(0),
                                   program_repos_chr = character(0),
                                   organisation_1L_chr = "ready4-dev",
                                   repositories_chr = character(0),
                                   subroutine_repos_chr = character(0),
                                   tidy_desc_1L_lgl = T,
                                   ...){
  if(identical(brochure_repos_chr,character(0))){
    brochure_repos_chr <- "ready4web"
  }
  if(identical(exclude_chr,character(0))){
    exclude_chr <- "rebuild"
  }
  if(identical(framework_repos_chr,character(0))){
    framework_repos_chr <- make_framework_pkgs_chr()
  }
  if(identical(model_repos_chr,character(0))){
    model_repos_chr <- make_modules_pks_chr(what_chr = "all")
  }
  if(identical(subroutine_repos_chr,character(0))){
    subroutine_repos_chr <- c( "ttu_mdl_ctlg","ms_tmpl","ttu_lng_ss")
  }
  if(identical(program_repos_chr,character(0))){
    program_repos_chr <- setdiff(natmanager::list_repo(organisation_1L_chr),
                                 c(brochure_repos_chr, exclude_chr, framework_repos_chr, model_repos_chr, subroutine_repos_chr))
  }
  if(identical(repositories_chr,character(0))){
    if(repository_type_1L_chr == "Framework"){
      repositories_chr <- framework_repos_chr 
    }
    if(repository_type_1L_chr == "Module"){
      repositories_chr <- model_repos_chr 
    }
    if(repository_type_1L_chr %in% c("Program","Subroutine","Program_and_Subroutine")){
      if(repository_type_1L_chr == "Subroutine"){
        repositories_chr <- subroutine_repos_chr
      }
      if(repository_type_1L_chr == "Program"){
        repositories_chr <- program_repos_chr
      }
      if(repository_type_1L_chr == "Program_and_Subroutine"){
        repositories_chr <- c(program_repos_chr, subroutine_repos_chr)
      }
    }else{
      repository_type_1L_chr <- "Package"
    }
  }
  releases_xx <- repositories_chr %>%
    purrr::map_dfr(~tidyRSS::tidyfeed(paste0("https://github.com/",organisation_1L_chr,"/",.x,"/releases.atom"))) %>%
    dplyr::arrange(dplyr::desc(entry_last_updated)) %>%
    dplyr::select(feed_title, entry_title, entry_last_updated, entry_content, entry_link) %>%
    dplyr::mutate(feed_title = feed_title %>% stringr::str_remove_all("Release notes from ")) %>%
    dplyr::rename(!!rlang::sym(repository_type_1L_chr) := feed_title,
                  Release = entry_title,
                  Date = entry_last_updated,
                  Description = entry_content,
                  URL = entry_link
    ) %>%
    dplyr::filter(Release != "Documentation_0.0")
  if(tidy_desc_1L_lgl){
    releases_xx <- releases_xx %>%
      dplyr::mutate(Description = Description %>% purrr::map2_chr(Program,
                                                                  ~ stringr::str_remove(.x,paste0(.y,": "))))
  }
  if(as_kable_1L_lgl){
    releases_xx <- releases_xx  %>% 
      dplyr::mutate(Release = Release %>% stringr::str_remove_all("Release ") %>%
                      stringr::str_remove_all("v") %>%
                      kableExtra::cell_spec(format = "html", link = URL),
                    Date = Date %>% format.Date(format_1L_chr) %>% as.character()) %>%
      # dplyr::mutate(Release = cell_spec(row.names(.), "html", link = dt_url)) %>% 
      dplyr::select(Date, !!rlang::sym(repository_type_1L_chr), Release, Description#dplyr::everything()
      ) 
    if(repository_type_1L_chr %in% c("Package","Module","Framework")){
      logos_chr <- purrr::map_chr(releases_xx %>% dplyr::pull(repository_type_1L_chr), 
                                  ~paste0("https://ready4-dev.github.io/", .x, "/logo.png"))
      releases_xx <- releases_xx %>%
        dplyr::mutate(!!rlang::sym(repository_type_1L_chr) := "")
      indx_1L_int <-which(names(releases_xx) %in% c("Package","Module","Framework"))
    }
    releases_xx <- releases_xx %>%
      kableExtra::kable("html", escape = FALSE) %>% # kableExtra::kbl() %>%
      kableExtra::kable_styling(...)   # kableExtra::kable_styling(...) %>% 
    if(repository_type_1L_chr %in% c("Package","Module","Framework"))
      releases_xx <- releases_xx %>%
      kableExtra::column_spec(indx_1L_int, 
                              image = kableExtra::spec_image(logos_chr, 
                                                             height = 160, width = 160)) 
  }
  return(releases_xx)
}
make_ds_releases_tbl <- function(ds_dois_chr,
                             format_1L_chr = "%d-%b-%Y",
                             server_1L_chr = "dataverse.harvard.edu"){
  ds_dois_chr %>%
    purrr::map_dfr(~{
      meta_ls <- dataverse::dataset_versions(.x, server = server_1L_chr) 
      doi_1L_chr <- .x
      1:length(meta_ls) %>%
        purrr::map_dfr(~tibble::tibble(Date = meta_ls[[.x]]$releaseTime,
                                       DOI = paste0("https://doi.org/",doi_1L_chr),
                                       Version = paste0(meta_ls[[.x]]$versionNumber,".",meta_ls[[.x]]$versionMinorNumber),
                                       `Number of files` = length(meta_ls[[1]]$files)))
      
    }) %>%
    dplyr::arrange(dplyr::desc(Date)) %>%
    dplyr::mutate(Date = Date %>% format.Date(format_1L_chr) %>% as.character())
}
make_framework_pkgs_chr <- function(){
  framework_pkgs_chr <- c("ready4","ready4fun","ready4class","ready4pack","ready4use","ready4show")
  return(framework_pkgs_chr)
}
make_libraries_tb <- function (include_1L_chr = "modules", 
                               ns_var_nm_1L_chr = "pt_ns_chr", 
                               reference_var_nm_1L_chr = "Reference", 
                               url_stub_1L_chr = "https://ready4-dev.github.io/", 
                               vignette_var_nm_1L_chr = "Vignettes", 
                               vignette_url_var_nm_1L_chr = "Vignettes_URLs") 
{
  modules_chr <- make_modules_pks_chr()#c("scorz", "specific", "TTU", "youthu", "youthvars")
  fw_chr <- make_framework_pkgs_chr()
  # c("ready4show", "ready4use", "ready4fun", "ready4class", 
  #             "ready4pack")
  if (include_1L_chr == "modules") {
    libraries_chr <- modules_chr
  }
  else {
    if (include_1L_chr == "framework") {
      libraries_chr <- fw_chr
    }
    if(include_1L_chr == "all")
      libraries_chr <- c(fw_chr, modules_chr)
  }
  pkg_extensions_tb <- tibble::tibble(pt_ns_chr = libraries_chr) %>% 
    dplyr::mutate(Type = dplyr::case_when(pt_ns_chr == "ready4" ~ "Foundation", 
                                          pt_ns_chr == "ready4class" ~ "Authoring (code - classes)", 
                                          pt_ns_chr == "ready4fun" ~ "Authoring (code - functions)", 
                                          pt_ns_chr == "ready4pack" ~ "Authoring (code - libraries)", 
                                          pt_ns_chr == "ready4show" ~ "Authoring (code - programs)", 
                                          pt_ns_chr == "ready4use" ~ "Authoring (datasets)", 
                                          pt_ns_chr == "youthvars" ~ "Description (datasets)", 
                                          pt_ns_chr == "scorz" ~ "Description (variable scoring)", 
                                          pt_ns_chr == "specific" ~ "Modelling (inverse problems)", 
                                          pt_ns_chr == "heterodox" ~ "Modelling (heterogeneity)", 
                                          pt_ns_chr == "mychoice" ~ "Modelling (choice)",
                                          pt_ns_chr == "TTU" ~ "Modelling (health utility)", 
                                          pt_ns_chr == "youthu" ~ "Prediction (health utility)", 
                                          T ~ "")) 
  if(include_1L_chr == "framework"){
    pkg_extensions_tb <- pkg_extensions_tb %>% 
      dplyr::arrange(dplyr::desc(Type),
                     pt_ns_chr) 
  }else{
    pkg_extensions_tb <- pkg_extensions_tb %>% 
      dplyr::arrange(Type,
                     pt_ns_chr) 
  }
  pkg_extensions_tb <- pkg_extensions_tb %>% 
    dplyr::mutate(Link = purrr::map_chr(pt_ns_chr, ~paste0(url_stub_1L_chr, 
                                                           .x, "/index", ".html"))) %>% 
    dplyr::mutate(Library = kableExtra::cell_spec(pt_ns_chr, 
                                                  "html", link = Link))
  pkg_extensions_tb <- add_vignette_links(pkg_extensions_tb, 
                                          ns_var_nm_1L_chr = ns_var_nm_1L_chr, 
                                          reference_var_nm_1L_chr = reference_var_nm_1L_chr, 
                                          url_stub_1L_chr = url_stub_1L_chr, 
                                          vignette_var_nm_1L_chr = vignette_var_nm_1L_chr, 
                                          vignette_url_var_nm_1L_chr = vignette_url_var_nm_1L_chr)
  pkg_extensions_tb <- pkg_extensions_tb %>% dplyr::mutate(Citation = paste0(url_stub_1L_chr, 
                                                                             pt_ns_chr, "/authors.html")) %>% 
    dplyr::mutate(manual_urls_ls = purrr::map2(pt_ns_chr, 
                                               Link, ~get_manual_urls(.x, pkg_url_1L_chr = .y))) %>% 
    dplyr::mutate(code_urls_ls = purrr::map2(pt_ns_chr, Link, 
                                             ~get_source_code_urls(.x, pkg_url_1L_chr = .y)))
  y_tb <- purrr::map_dfr(pkg_extensions_tb$Citation, ~{
    if (T) {
      f <- tempfile(fileext = ".bib")
      sink(f)
      writeLines(rvest::read_html(.x) %>% rvest::html_elements("pre") %>% 
                   rvest::html_text2())
      sink(NULL)
      suppressWarnings(bib2df::bib2df(f)) %>% dplyr::select(AUTHOR, 
                                                            TITLE, DOI)
    }
    else {
    }
  }) %>% dplyr::mutate(pt_ns_chr = pkg_extensions_tb$pt_ns_chr) %>% 
    dplyr::rename(DOI_chr = DOI, Title = TITLE, Authors = AUTHOR)
  pkg_extensions_tb <- dplyr::left_join(pkg_extensions_tb, 
                                        y_tb, 
                                        by = "pt_ns_chr")
  return(pkg_extensions_tb)
}
make_modules_pks_chr <- function(what_chr = "all"){
  modules_pks_chr <- character(0)
  if("people" %in% what_chr | "all" %in% what_chr)
    modules_pks_chr <- c(modules_pks_chr,
                         c("youthvars","scorz","specific","TTU","youthu","mychoice","heterodox"))
  if("places" %in% what_chr)
    modules_pks_chr <- c(modules_pks_chr,
                         character(0))
  if("platforms" %in% what_chr)
    modules_pks_chr <- c(modules_pks_chr,
                         ccharacter(0))
  if("programs" %in% what_chr)
    modules_pks_chr <- c(modules_pks_chr,
                         c("bimp"))
  return(modules_pks_chr)
} 
make_programs_tbl <- function(what_1L_chr = "Program",
                              as_kable_1L_lgl = F,
                              exclude_chr = "dce_sa_cards",
                              format_1L_chr = "%d-%b-%Y",
                              tidy_desc_1L_lgl = T,
                              zenodo_1L_chr = "ready4",
                              ...){
  programs_xx <- make_code_releases_tbl(what_1L_chr,
                                        as_kable_1L_lgl = F,
                                        exclude_chr = exclude_chr,
                                        tidy_desc_1L_lgl = F) %>% 
    dplyr::group_by(!!rlang::sym(what_1L_chr)) %>% 
    dplyr::filter(dplyr::row_number()==1) %>% 
    dplyr::arrange(!!rlang::sym(what_1L_chr)) %>% 
    dplyr::ungroup()
  zenodo_records_ls <- zenodo$getRecords(q = paste0("communities:(",zenodo_1L_chr,")"))
  descriptions_chr <- zenodo_records_ls %>% 
    purrr::map_chr(~rvest::html_text(rvest::read_html(.x$metadata$description %>% 
                                                        stringr::str_remove_all("&nbsp;"))) %>% 
                     stringr::str_replace_all("[\r\n]" , ""))
  indices_int <- programs_xx$Description %>% purrr::map_int(~which(.x == descriptions_chr))
  programs_xx$DOI <- indices_int %>%
    purrr::map_chr(~zenodo_records_ls[[.x]]$links$conceptdoi)
  programs_xx$GitHub <- gsub("/releases/.*","",programs_xx$URL)
  if(tidy_desc_1L_lgl)
    programs_xx <- programs_xx %>%
    dplyr::mutate(Description = Description %>% 
                    purrr::map2_chr(!!rlang::sym(what_1L_chr),
                                    ~ stringr::str_remove(.x,paste0(.y,": "))))
  if(as_kable_1L_lgl){
    programs_xx <- programs_xx  %>% 
      dplyr::mutate(Release = Release %>% stringr::str_remove_all("Release ") %>%
                      stringr::str_remove_all("v"),
                    Date = Date %>% format.Date(format_1L_chr) %>% as.character()) %>%
      dplyr::mutate(Source = purrr::pmap(list(GitHub, DOI),
                                         ~{
                                           kableExtra::cell_spec(c("Dev", "Archive"), 
                                                                 format = "html", 
                                                                 link = c(..1, ..2))
                                         }
      )) %>%
      dplyr::select(!!rlang::sym(what_1L_chr), Release, Date, Description, Source) 
    programs_xx <- programs_xx %>%
      kableExtra::kable("html", escape = FALSE) %>%  
      kableExtra::kable_styling(...)   
  }
  return(programs_xx)
}
write_blog_entries <- function(dir_path_1L_chr,
                               fl_nm_1L_chr){
  rmarkdown::render(paste0(dir_path_1L_chr,"/",fl_nm_1L_chr,"/index_Body.Rmd"), 
                    output_dir = paste0(dir_path_1L_chr,"/",fl_nm_1L_chr))
  write_to_trim_html(paste0(dir_path_1L_chr,"/",fl_nm_1L_chr,"/index_Body.html"))
  rmarkdown::render(paste0(dir_path_1L_chr,"/",fl_nm_1L_chr,"/index.Rmd"), 
                    output_dir = paste0(dir_path_1L_chr,"/",fl_nm_1L_chr))
  unlink(paste0(dir_path_1L_chr,"/",fl_nm_1L_chr,"/index_Body.html"))
  if(file.exists(paste0(dir_path_1L_chr,"/",fl_nm_1L_chr,"/index.html")))
    unlink(paste0(dir_path_1L_chr,"/",fl_nm_1L_chr,"/index.html"))
  file_chr <- readLines(paste0(dir_path_1L_chr,"/",fl_nm_1L_chr,"/index.md"))
  file_chr <- file_chr[file_chr != "<div class='highlight'>"]
  file_chr <- file_chr[c(1:(max(which(file_chr=="</div>"))-1),
                         (max(which(file_chr=="</div>"))+1):length(file_chr))]
  writeLines(file_chr,
             paste0(dir_path_1L_chr,"/",fl_nm_1L_chr,"/index.md"))
}
write_new_credentials <- function(path_to_file_1L_chr,
                                  new_credentials_1L_chr,
                                  old_credentials_1L_chr){
  readLines(path_to_file_1L_chr) %>%
    stringr::str_replace(
      pattern = old_credentials_1L_chr, 
      replace = new_credentials_1L_chr) %>%
    writeLines(con = path_to_file_1L_chr)
}
write_to_copy_rmds <- function(dir_path_1L_chr,
                               fl_nm_1L_chr,
                               rmds_dir_1L_chr = "R/RMD Templates"){
  file_nms_chr <- list.files(rmds_dir_1L_chr)
  destination_1L_chr <- paste0(dir_path_1L_chr,"/",fl_nm_1L_chr)
  if(!dir.exists(destination_1L_chr))
    dir.create(destination_1L_chr)
  purrr::walk(file_nms_chr,
              ~   write_new_files(destination_1L_chr,
                                  source_paths_ls = list(paste0(rmds_dir_1L_chr,"/",.x)),
                                  fl_nm_1L_chr = .x))
}
write_to_render_post <- function(included_dirs_chr,
                                 path_to_main_dir_1L_chr,
                                 
                                 is_RMD_1L_lgl = T){
  included_dirs_chr %>%
    purrr::walk(~{
      if(is_RMD_1L_lgl){
        write_blog_entries(dir_path_1L_chr = path_to_main_dir_1L_chr,
                           fl_nm_1L_chr = .x)
      }else{
        rmarkdown::render(paste0(path_to_main_dir_1L_chr,
                                 "/",
                                 .x,
                                 "/index.en.Rmarkdown"))
      }})
}
write_to_trim_html <- function(path_to_html_1L_chr){
  # html_1L_chr <- xfun::file_string(path_to_html_1L_chr)
  file_chr <- readLines(path_to_html_1L_chr)
  file_chr <- file_chr[file_chr != "<!DOCTYPE html>"]
  file_chr <- file_chr[c(1:(which(file_chr=="<head>")-1),
                         (which(file_chr=="</head>")+1):length(file_chr))]
  file_chr <- file_chr[file_chr != '<div class="container-fluid main-container">']
  file_chr <- file_chr[c(1:(max(which(file_chr=="</div>"))-1),
                         (max(which(file_chr=="</div>"))+1):length(file_chr))]
  # file_chr <- file_chr[file_chr != "<div class='highlight'>"]
  # file_chr <- file_chr[c(1:(max(which(file_chr=="</div>"))-1),
  #                        (max(which(file_chr=="</div>"))+1):length(file_chr))]
  writeLines(file_chr,
             path_to_html_1L_chr)

}