#' Rtools finder for windows machines
#'
#' @return Message related to Rtools check
#' @export
#'
#' @examples
#' \dontrun{
#' rtools_finder()
#' }

rtools_finder <- function(){
  if (Sys.info()["sysname"] == "Windows") {
    cat("Scanning for Rtools")
    x <- names(grep(pattern = "rtools",
                    x = Sys.getenv(),
                    fixed = FALSE,
                    value = TRUE))
    if (length(x) > 0) {
      cat("Found Rtools inclusion as system variables in", x)
    } else {
      stop("Rtools not found in system variables.")
    }
  } else cat("Skipping Rtools check on non-windows machine")
}
