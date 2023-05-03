#' Setting Repositories
#'
#' @return Sets IFPRI based R repositories related to IMPACT model
#' @export
#'
#' @examples
#' \dontrun{
#' setRepos()
#' }

setRepos <- function(){
  message("Seeting repositories ....")
  options(repos = c(CRAN  = "https://cloud.r-project.org/",
                    PIK   = "https://rse.pik-potsdam.de/r/packages",
                    KIRAN = "https://ifpri.r-universe.dev"))
  message("Following repos added for package installation ....")
  getOption("repos")
}
