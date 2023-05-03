#' Install dependency packages needed needed for KIRAN suite of packages
#'
#' @return NULL
#' @importFrom utils install.packages
#' @export
#'
#' @examples
#' \dontrun{
#' setKiran()
#' }

setKiran <- function(){

  KIRAN::scanRtools()

  KIRAN::setLibs()

  default_library <- KIRAN::setLibs(export = TRUE)

  KIRAN::setRepos()

  message("Installing core dependencies for 'gamstransfer' package")
  install.packages("R6", dependencies = TRUE, lib = default_library)
  install.packages("R.utils", dependencies = TRUE, lib = default_library)
  install.packages("Rcpp", dependencies = TRUE, lib = default_library)

  message("Installing devtools and its dependencies")
  install.packages("devtools",
                   dependencies = TRUE,
                   lib = default_library)

  message("Installing magclass and its dependencies")
  devtools::install_github("pik-piam/magclass",
                           dependencies = TRUE,
                           upgrade = "never",
                           force = TRUE, lib = default_library)

  message("Installing 'gamstransfer' package")
  gams_path <-
    paste0(scanGAMS(),
           "/apifiles/R/gamstransfer/source/gamstransfer_r.tar.gz")

  install.packages(gams_path, dependencies = TRUE)

  message("Installing KIRAN suite of packages ....")
  message(".... Data Processor for IMPACT runs (DOORMAT)")
  install.packages("DOORMAT")
  message(".... Reporting tools (reportIMPACT)")
  install.packages("reportIMPACT")
  message(".... App for IMPACT (ARIA)")
  install.packages("ARIA")
}
