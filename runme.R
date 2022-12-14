# Run each time an RMD is changed prior to commit. [IGNORE THIS]
# blogdown::build_site(run_hugo = F, build_rmd =T)
source("R/Functions.R")
### DOCUMENTATION SECTION
## Render itemisation of currently available ready4 libraries
c("Framework",
  "Module") %>%
  write_to_render_post(path_to_main_dir_1L_chr = "~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Getting-started/Software/Libraries/Types")  
# Render ready4 library installation instructions
c("Foundation",
  "Authoring-Tools/Reporting",
  "Authoring-Tools/Datasets",
  "Authoring-Tools/Code-Development",
  "Modules") %>%
write_to_render_post(path_to_main_dir_1L_chr = "~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Getting-started/Software/Libraries/Installation",
                     is_RMD_1L_lgl = F)
c("Modularity","Paradigm", "Syntax") %>%
  write_to_render_post(path_to_main_dir_1L_chr = "~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Framework",
                     is_RMD_1L_lgl = F)
c("Authoring-Algorithms","Authoring-Classes", "Packaging-Modules") %>%
  write_to_render_post(path_to_main_dir_1L_chr = "~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Model/Authoring-Modules",
                       is_RMD_1L_lgl = F)
c(#"Add-Metadata",
  "Assess-Cost-Utility", 
  #"Explore-Models", 
  #"Map-To-Utility", 
  "Predict-Choice",
  "Predict-Utility", 
  "Score-Health-Utility", "Validate-Variables") %>%
  write_to_render_post(path_to_main_dir_1L_chr = "~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Model/Using-Modules/People",
                       is_RMD_1L_lgl = F)
write_to_render_post("Finding-Modules",
                     path_to_main_dir_1L_chr = "~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Model",
                     is_RMD_1L_lgl = F)
# Render program and sub-routine summaries
c("Programs",
  "Subroutines") %>%
  write_to_render_post("~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Getting-started/Software/Programs")
rmarkdown::render("~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Analyses/Replication-Code/Make-Fakes/Clincal_Primary.Rmd")
write_to_trim_html("~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Analyses/Replication-Code/Make-Fakes/Clincal_Primary.md")
###


###
### BLOG SECTION
# Render release summaries
c("Framework_Software",
  "Framework_Taxonomies", 
  "Spring_To_Life_Modules") %>%
  write_to_render_post("~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/blog/releases")
#
# write_to_copy_rmds(dir_path_1L_chr = "~/Documents/WIP/ready4/Code/Brochure/HTML/r4dev/content/en/docs/Getting-started/Software/Programs",
#                    fl_nm_1L_chr = "Programs",
#                    rmds_dir_1L_chr = "R/RMD Templates/Include_HTML")
write_new_credentials("./content/en/docs/Readyforwhatsnext/Spring To Life/Modules/Predict choice.md",
                      new_credentials_1L_chr = "d7d86c443e2b45c1b43c7db36ad50bf3",
                      old_credentials_1L_chr = "93f800c0e2594268b9482bea99e2e434") # Prior to deployment
write_new_credentials("./content/en/docs/Readyforwhatsnext/Spring To Life/Modules/Predict choice.md",
                      old_credentials_1L_chr = "d7d86c443e2b45c1b43c7db36ad50bf3",
                      new_credentials_1L_chr = "93f800c0e2594268b9482bea99e2e434") # For local preview
## Deploy dependencies app
library(rsconnect)
deployApp("R/Shiny/Dependencies")


