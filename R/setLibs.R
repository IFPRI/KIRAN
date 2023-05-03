#' Set user specific R library for package installation
#'
#' @param export If R_LIBS_USER setting should be returned
#'
#' @return NULL
#' @export
#'
#' @examples
#' \dontrun{
#' setLibs()
#' }
setLibs <- function(export = FALSE){
  sysname <- Sys.info()["sysname"]
  prompt_user = FALSE
  if (sysname == "Windows") {
    message("Windows machine detected")
    if (grepl(pattern = "App",x = Sys.getenv("R_LIBS_USER"))){
      message("R libraries are located at\n",Sys.getenv("R_LIBS_USER"))
      message("It is highly recommended to set this
library where you have full read/write access")
      prompt_user = TRUE
    }

    message("Your R libraries will be installed at ", Sys.getenv("R_LIBS_USER"))

    if (prompt_user){
      drive <- readline(prompt = "Enter the hard-disk drive
symbol (eg. C or D ...): ")
      folder <- readline(prompt = "Enter folder name where the new
library will be set (eg. Rpackages ...): ")
      path <- paste0(drive,":/",folder)
      if (!dir.exists(path)) {
        dir.create(path, recursive = TRUE)
        Sys.setenv(R_LIBS_USER = path)
        if(Sys.getenv("R_LIBS_USER") == path) cat(
          "Personal library is now set to ---- ", path)
      }
    }
  } else {
    message("Non-windows machine detected.
Please ensure you have set 'R_LIBS_USER' correctly and that
you have full read/write access to this folder")
    message("Run the following command in your R console to check this setting")
    message("Sys.getenv('R_LIBS_USER')")
  }
  if(export) return(Sys.getenv("R_LIBS_USER"))
}
