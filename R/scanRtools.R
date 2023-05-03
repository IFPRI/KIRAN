#' Rtools finder for windows machines
#'
#' @return Message related to Rtools check
#' @export
#'
#' @examples
#' \dontrun{
#' scanRtools()
#' }

scanRtools <- function(){
  if (Sys.info()["sysname"] == "Windows") {
    message("Scanning for Rtools")
    x <- names(grep(pattern = "rtools",
                    x = Sys.getenv(),
                    fixed = FALSE,
                    value = TRUE))
    if (length(x) > 0) {
      cat("Rtools is included as system variables in ", x, "\n")
    } else {
      stop("Rtools not found in system variables.")
    }
  } else message("Skipping Rtools check on non-windows machine")
}
