# Run each time an RMD is changed prior to commit.
#blogdown::build_site(run_hugo = F, build_rmd =T)
source("R/Functions.R")
# write_to_copy_rmds(dir_path_1L_chr = "~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Framework/Developing models",
#                    fl_nm_1L_chr = "Helper functions",
#                    rmds_dir_1L_chr = "R/RMD Templates")
# write_blog_entries(dir_path_1L_chr = "~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Framework/Developing-models",
#                    fl_nm_1L_chr = "Helper functions")
## Render itemisation of currently available ready4 libraries
write_blog_entries(dir_path_1L_chr = "~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Getting-started/Software/Libraries/Types",
                   fl_nm_1L_chr = "Framework")
write_blog_entries(dir_path_1L_chr = "~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Getting-started/Software/Libraries/Types",
                  fl_nm_1L_chr = "Module")
# Render installation instructions of currenly available ready4 libraries
rmarkdown::render("~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Getting-started/Software/Libraries/Installation/Foundation/index.en.Rmarkdown")
rmarkdown::render("~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Getting-started/Software/Libraries/Installation/Authoring-Tools/index.en.Rmarkdown")
rmarkdown::render("~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Getting-started/Software/Libraries/Installation/Modules/index.en.Rmarkdown")
#
purrr::walk(c("Module-libraries",
              "Modules-and-sub-modules"
),
~write_blog_entries(dir_path_1L_chr = "~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Model-modules/Finding-modules",
                    fl_nm_1L_chr = .x))
rmarkdown::render("~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/blog/news/2022-12-05-test/index.en.Rmarkdown")
#
purrr::walk(c("Framework_Software",
              "Framework_Taxonomies", 
              "Spring_To_Life_Modules"
),
~write_blog_entries(dir_path_1L_chr = "~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/blog/releases",
                    fl_nm_1L_chr = .x))

# write_to_copy_rmds(dir_path_1L_chr = "~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Model modules",
#                    fl_nm_1L_chr = "Test",
#                    rmds_dir_1L_chr = "R/RMD Templates")
write_new_credentials("./content/en/docs/Readyforwhatsnext/Spring To Life/Modules/Predict choice.md",
                      new_credentials_1L_chr = "d7d86c443e2b45c1b43c7db36ad50bf3",
                      old_credentials_1L_chr = "93f800c0e2594268b9482bea99e2e434") # Prior to deployment
write_new_credentials("./content/en/docs/Readyforwhatsnext/Spring To Life/Modules/Predict choice.md",
                      old_credentials_1L_chr = "d7d86c443e2b45c1b43c7db36ad50bf3",
                      new_credentials_1L_chr = "93f800c0e2594268b9482bea99e2e434") # For local preview
# write_blog_entries(dir_path_1L_chr = "~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/blog/releases",
#                    fl_nm_1L_chr = "Spring_To_Life_Modules")
library(rsconnect)
deployApp("R/Shiny/Dependencies")