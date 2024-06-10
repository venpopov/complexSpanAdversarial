#' Replace the prolific id of the raw data with a new random string
#' 
#' The raw data contains prolific ids to identify the participants. These ids are stored in two places:
#'   - the filename begins with the prolific id, followed by an underscore
#'   - the column `participant` contains the prolific id
#' 
#' This function takes a single file and replaces the prolific id with a new random string
#' 
#' @param file_path The path to the file to be processed
#' @return a list with two elements:
#'   - the transformed data.frame
#'   - the old prolific id
#'   - the new prolific id
#' 
#' @export
replace_id <- function(file_path) {
  # Load the data
  data <- readr::read_csv(file_path)
  
  # Extract the prolific id
  old_id <- stringr::str_extract(string = basename(file_path), pattern = "^[^_]+")
  
  # Generate a new id
  new_id <- stringi::stri_rand_strings(n = 1, length = 10)
  
  # Replace the id in the filename
  new_file_path <- stringr::str_replace(string = file_path, pattern = old_id, replacement = new_id)
  
  # Replace the id in the data
  data$participant <- new_id
  
  # Return the data and the new id
  list(data=data, old_id=old_id, new_id=new_id, file_path=new_file_path)
}

#' Anonymize a data file
#' 
#' This function takes a single file, replaces the prolific id and writes the data to a new file
#' 
#' @param file_path The path to the file to be processed
#' @param orig_dir The directory where the original data is stored
#' @param target_dir The directory where the anonymized data should be stored
#' @return a data.frame with the old and new prolific id
#' 
#' @export
anonymize_data_file <- function(file_path, orig_dir = "data-raw/original", target_dir = "data-raw") {
  if (!dir.exists(orig_dir)) stop("The directory `", orig_dir, "` does not exist"
  res <- replace_id(file_path)
  new_path <- stringi::stri_replace(res$file_path, fixed = orig_dir, replacement = target_dir)
  fs::dir_create(fs::path_dir(new_path))
  write.csv(res$data, new_path, row.names = FALSE)
  data.frame(old_id = res$old_id, new_id = res$new_id)
}


