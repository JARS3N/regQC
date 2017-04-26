XLos<-function(u=getwd()){
system(paste0(
"Cscript",
" ",
shQuote(normalizePath(system.file("/vbs/XLOSC.vbs", package="PipeFish"))),
" ",
shQuote(normalizePath(u))
))
}
## assuming MassAssayExporter.exe exists,is in the correct location and added to the system path
exportXL<-function(path_in){
   shell(
       paste('MassAssayExporter.exe',
          shQuote(normalizePath(path_in)),
          shQuote(normalizePath(path_in)),
          sep=" "
          )
          )
}

## combines exporter and open save of asyr files
Outandsave<-function(path_in=getwd()){
  n<-length(list.files(path=path_in,pattern='.asyr'))
  if (n>0){
  PipeFish::exportXL(path_in);
  PipeFish::XLos(path_in)
  }
}
