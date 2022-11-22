library(ready4)
library(tidyRSS)
library(zen4R) # https://cran.r-project.org/web/packages/zen4R/vignettes/zen4R.html#package_overview
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
                            ...){
  if(identical(brochure_repos_chr,character(0))){
    brochure_repos_chr <- "ready4web"
  }
  if(identical(exclude_chr,character(0))){
    exclude_chr <- "rebuild"
  }
  if(identical(framework_repos_chr,character(0))){
    framework_repos_chr <- c("ready4","ready4fun","ready4class","ready4pack","ready4use","ready4show")
  }
  if(identical(model_repos_chr,character(0))){
    model_repos_chr <- c("youthvars","scorz","specific","TTU","youthu","mychoice","heterodox", "bimp")
  }
  if(identical(program_repos_chr,character(0))){
    program_repos_chr <- setdiff(natmanager::list_repo(organisation_1L_chr),
                                 c(brochure_repos_chr, exclude_chr, framework_repos_chr, model_repos_chr))
  }
  if(identical(repositories_chr,character(0))){
    if(repository_type_1L_chr == "Framework"){
      repositories_chr <- framework_repos_chr 
    }
    if(repository_type_1L_chr == "Module"){
      repositories_chr <- model_repos_chr 
    }
    if(repository_type_1L_chr == "Program"){
      repositories_chr <- program_repos_chr
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
