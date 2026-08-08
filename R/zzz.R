### Load any db objects whenever the package is loaded.
.onLoad <- function(libname, pkgname)
{
  ns <- asNamespace(pkgname)

  # find installed extdata directory; system.file returns "" if not found
  path <- system.file("extdata", package = pkgname, lib.loc = libname)
  if (!nzchar(path) || !dir.exists(path)) {
    return(invisible(NULL))
  }

  # only consider .sqlite files
  files <- dir(path, pattern = "\\.sqlite$", ignore.case = TRUE)
  if (length(files) == 0L) return(invisible(NULL))

  for (f in files) {
    fpath <- file.path(path, f)
    if (!file.exists(fpath)) next

    # safe load: don't abort package load if a file is missing/corrupt
    tryCatch({
      db <- AnnotationDbi::loadDb(fpath, packageName = pkgname)
      objname <- sub("\\.sqlite$", "", f, ignore.case = TRUE)
      assign(objname, db, envir = ns)
      namespaceExport(ns, objname)
    }, error = function(e) {
      packageStartupMessage(sprintf("Failed to load %s: %s", f, conditionMessage(e)))
    })
  }

  invisible(NULL)
}
