#' Install dependency packages needed needed for KIRAN suite of packages
#'
#' @return NULL
#' @importFrom utils install.packages
#' @importFrom devtools install_github
#' @export
#'
#' @examples
#' \dontrun{
#' install_KIRAN()
#' }

install_KIRAN <- function(){
  message("Seeting repositories ....")
  options(repos = c(CRAN  = "https://cloud.r-project.org/",
                    PIK   = "https://rse.pik-potsdam.de/r/packages",
                    KIRAN = "https://ifpri.r-universe.dev"))
  message("Following repos added for package installation ....")
  cat(getOption("repos"),"\n")

  message("Installing core dependencies for 'gamstransfer' package")
  install.packages("R6", dependencies = TRUE)
  install.packages("R.utils", dependencies = TRUE)
  install.packages("Rcpp", dependencies = TRUE)

  message("Installing devtools and its dependencies")
  install.packages("devtools", dependencies = TRUE, lib = .libPaths()[1])

  message("Installing magclass and its dependencies")
  install_github("pik-piam/magclass",
                           dependencies = TRUE,
                           upgrade = "never",
                           force = TRUE)

  message("Installing 'gamstransfer' package")
  gams_path <- paste0(gams_finder(),"/apifiles/R/gamstransfer/source/gamstransfer_r.tar.gz")
  install.packages(gams_path, dependencies = TRUE)

  message("Installing KIRAN suite of packages ....")
  message(".... Data Processor for IMPACT runs (DOORMAT)")
  install.packages("DOORMAT")
  message(".... Reporting tools (reportIMPACT)")
  install.packages("reportIMPACT")
  message(".... App for IMPACT (ARIA)")
  install.packages("ARIA")
}
