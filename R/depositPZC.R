### create przm script
depositPZC<-function(dir){
script<-c(
  paste0("SetPath ",normalizePath(dir)),
'OpenOutput oligoIC50.csv' ,
'Table CSV',
'Open "oligoIC50Template.pzf"',
'ForEach *.txt',
'GoTo D',
'ClearTable',
'Import',
'WTable "File Name", %F',
'GoTo R 3',
'Wtable "Kit 1", 5, 1',
'Wtable "Kit 2", 5, 2',
'Wtable "Kit 3", 5, 3',
'Wtable "Control", 5, 4',
'Next',
 'Save "oligoIC50Template.pzf"'
)
out<-paste0(script,collapse="\n")
writeBin(charToRaw(out),"oligoScript.PZC")
}
