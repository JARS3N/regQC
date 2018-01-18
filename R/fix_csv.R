fix_csv <- function(x) {
  x2 <- readLines(x)
  n <- grep(x2[1], x2)[-1]
  if (length(n) < 1) {
    return(NULL)
  } else{
    writeLines(x2[-1 * n], x)
  }
}
