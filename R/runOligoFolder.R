runOligoFolder<-function(D){
  setwd(D)
  shh<-lapply(list.files(path=D,pattern='[.xls]$'),oligoCSV)
  file.copy(system.file(package = 'regQC',"oligoIC50template.pzf"),D)
  depositPZC(D)
  shell.exec('oligoScript.PZC')
  system2("taskkill",args=c("/f","/im",'prism.exe'))
}

