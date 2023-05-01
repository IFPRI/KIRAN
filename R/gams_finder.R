#' GAMS finder for windows machines
#'
#' @return GAMS installation location
#' @export
#'
#' @examples
#' \dontrun{
#' gams_finder()
#' }

gams_finder <- function(){
  gams_dir_sys_path <- gams_dir <- NULL
  if (Sys.info()["sysname"] == "Windows") {
    cat("Scanning for GAMS in environment variables \n")
    x <- grep(pattern = "GAMS",
              x = Sys.getenv(),
              fixed = FALSE,
              value = TRUE,
              ignore.case = TRUE)
    x_name <- names(x)

    if (length(x_name) > 0) {
      cat("Found GAMS inclusion as system variables in", x_name,"\n")

      gams_dir_sys_path <- grep(pattern = "gams",
                            x = unlist(strsplit(x, ";")),
                            value = TRUE,
                            fixed = FALSE,
                            ignore.case = TRUE)
      gams_dir_sys_path <- as.vector(gams_dir_sys_path)
      gams_dir_sys_path <- gsub("\\\\", "/", gams_dir_sys_path)
    }

    cat("Scanning for GAMS in default locations \n")
    gams_check <- grep(pattern = "GAMS",
                       x = list.dirs(path = "C:/",
                                     recursive = FALSE),
                       ignore.case = TRUE,
                       value = TRUE)
    gams_version_check <- list.dirs(gams_check, recursive = FALSE)
    gams_versions <- as.numeric(gsub("\\D", "", gams_version_check))
    if (gams_versions)

    if (length(gams_versions) > 1) {
      message("Multiple GAMS installation detected, using latest GAMS version")
      if(max(gams_versions) < 41) {
        stop("GAMS version 41 and above required.
             See https://www.gams.com/download/")
        }
      gams_dir <- grep(pattern = max(gams_versions),
                       x = gams_version_check,
                       value = TRUE)
      gams_dir <- paste0(gsub("\\//", "/", gams_dir),"/")
    }

    if (!is.null(gams_dir_sys_path) & !is.null(gams_dir)) {
      if (gams_dir_sys_path != gams_dir){
        message("Latest GAMS version does not appear in environment variables")
        message("Using latest version of GAMS from default installation path")
      }
    }

    if (!is.null(gams_dir_sys_path) & !is.null(gams_dir)) {
      if (gams_dir_sys_path == gams_dir){
        message("Latest GAMS version already added to environment variables")
      }
    }

    if (is.null(gams_dir_sys_path) & !is.null(gams_dir)) {
      message("Using GAMS installations from windows installation")
    }

    if (!is.null(gams_dir_sys_path) & is.null(gams_dir)) {
      gams_dir <- gams_dir_sys_path
      message("Using GAMS installations from environment variables")
    }

    if (is.null(gams_dir_sys_path) & is.null(gams_dir)) {
      cat("GAMS not found in system variables. Returning NULL \n")
      cat("See", "https://www.gams.com/latest/docs/UG_WIN_INSTALL.html \n")
      stop("Cannot proceed without basic GAMS installation")
    }

  } else cat("Skipping GAMS check on non-windows machine")

  return(gams_dir)
}
