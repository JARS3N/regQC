runOligoFolder <- function(D) {
  shh <-
    lapply(list.files(
      path = D,
      pattern = '[.xlsx]$',
      full.names = T
    ),
    oligoCSV)
  file.copy(system.file(package = 'regQC', "oligoIC50template.pzf"), D)
  depositPZC(D)
  pzc <- file.path(D, 'oligoScript.PZC')
  shell.exec(pzc)
  Sys.sleep(2)
  system2("taskkill", args = c("/f", "/im", 'prism.exe'))
  fix_csv(list.files(
    pattern = "csv$",
    full.names = T,
    path = D
  ))
}
