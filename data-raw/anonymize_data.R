# This script is run only once to remove the prolific ids for the data stored
# in the folder `data-raw/origianl`. That folder is not included in the repository

source('R/data.r')

orig_dir <- "data-raw/original"
target_dir <- "data-raw"

files <- list.files(orig_dir, recursive = TRUE)

for (file in files) {
  file_path <- fs::path(orig_dir, file)
  anonymize_data_file(file_path, orig_dir, target_dir)
}
