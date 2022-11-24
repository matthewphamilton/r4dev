# Run each time an RMD is changed prior to commit.
#blogdown::build_site(run_hugo = F, build_rmd =T)
write_blog_entries <- function(dir_path_1L_chr,
                               fl_nm_1L_chr){
  rmarkdown::render(paste0(dir_path_1L_chr,"/",fl_nm_1L_chr,"/index_Body.Rmd"), 
                    output_dir = paste0(dir_path_1L_chr,"/",fl_nm_1L_chr))
  rmarkdown::render(paste0(dir_path_1L_chr,"/",fl_nm_1L_chr,"/index.Rmd"), 
                    output_dir = paste0(dir_path_1L_chr,"/",fl_nm_1L_chr))
  unlink(paste0(dir_path_1L_chr,"/",fl_nm_1L_chr,"/index_Body.html"))
  if(file.exists(paste0(dir_path_1L_chr,"/",fl_nm_1L_chr,"/index.html")))
    unlink(paste0(dir_path_1L_chr,"/",fl_nm_1L_chr,"/index.html"))
}
purrr::walk(c("Framework_Software",
              "Framework_Taxonomies", 
              "Spring_To_Life_Modules"
              ),
            ~write_blog_entries(dir_path_1L_chr = "~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/blog/releases",
                                fl_nm_1L_chr = .x))
write_new_credentials <- function(path_to_file_1L_chr,
                                  new_credentials_1L_chr,
                                  old_credentials_1L_chr){
  readLines(path_to_file_1L_chr) %>%
    stringr::str_replace(
      pattern = old_credentials_1L_chr, 
      replace = new_credentials_1L_chr) %>%
    writeLines(con = path_to_file_1L_chr)
}
write_new_credentials("./content/en/docs/Readyforwhatsnext/Spring To Life/Modules/Predict choice.md",
                      new_credentials_1L_chr = "d7d86c443e2b45c1b43c7db36ad50bf3",
                      old_credentials_1L_chr = "93f800c0e2594268b9482bea99e2e434") # Prior to deployment
write_new_credentials("./content/en/docs/Readyforwhatsnext/Spring To Life/Modules/Predict choice.md",
                      old_credentials_1L_chr = "d7d86c443e2b45c1b43c7db36ad50bf3",
                      new_credentials_1L_chr = "93f800c0e2594268b9482bea99e2e434") # For local preview
# write_blog_entries(dir_path_1L_chr = "~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/blog/releases",
#                    fl_nm_1L_chr = "Spring_To_Life_Modules")
