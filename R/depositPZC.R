### create przm script
depositPZC<-function(dir){
script<-c(
  paste0("SetPath ",normalizePath(getwd())),
'OpenOutput oligoIC50.csv' ,
'Table CSV',
'Open "oligoIC50Template.pzf"',
'ForEach *.txt',
'GoTo D 5',
'ClearTable',
'Import',
'WTable "File Name", %F',
'GoTo R 12',
'Wtable "Kit 1", 5, 1',
'Wtable "Kit 2", 5, 2',
'Wtable "Kit 3", 5, 3',
'Wtable "Control", 5, 4',
'Next'
)
out<-paste0(sapply(script,paste,"\n"),collapse="")
writeBin(charToRaw(out),"oligoScript.PZC")
}