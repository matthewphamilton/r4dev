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
# write_blog_entries(dir_path_1L_chr = "~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/blog/releases",
#                    fl_nm_1L_chr = "Spring_To_Life_Modules")
