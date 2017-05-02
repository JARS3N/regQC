## Grabs Oligo Measure4,sorts for graphpad
oligoCSV<-function(fl){
  require(readxl)
  require(dplyr)
mtchKit<-list(
  data.frame(ROW=lapply(LETTERS[1:4],rep,6) %>% unlist,
             COL=rep(1:6,4),Kit='1'),
  data.frame(ROW=lapply(LETTERS[1:4],rep,6) %>% unlist,
             COL=rep(7:12,4),Kit='3'),
  data.frame(ROW=lapply(LETTERS[5:8],rep,6) %>% unlist,
             COL=rep(1:6,4),Kit='2'),
  data.frame(ROW=lapply(LETTERS[5:8],rep,6) %>% unlist,
             COL=rep(7:12,4),Kit='Control')
) %>% bind_rows()

mtchConc<-data.frame(COL=1:12,
                     conc= c(0,0.25,0.5,1.0,1.5,2.0,0.25,0.5,1.0,1.5,2.0,0)
)
conc<-c(2,1.5,1,.5,.25,0)
GetBlocks<-function(U){
  arrange(U,conc) %>%
  {split(.$OCR,.$conc)} %>%
    bind_rows() %>%
    t() %>%
    as.data.frame(.) %>%
    {mutate(.,conc=row.names(.))} %>%
    arrange(.,desc(conc)) %>%
    {.[,names(.)[order(names(.))]]} %>%
    dplyr::select(.,-conc) %>%
    mutate_all(.,funs(blank0))
}
  read_excel(fl,sheet='Rate') %>%
  filter(.,Measurement==4) %>%
  mutate(.,OCR=set0(OCR,grepl("outlier|background",tolower(Group)))) %>%
  dplyr::select(.,Well,OCR) %>%
  mutate(.,COL=gsub('[A-Z]',"",Well) %>% as.numeric()) %>%
  mutate(.,ROW=gsub('[0-9]',"",Well)) %>%
  inner_join(.,mtchKit,by=c('COL','ROW')) %>%
  inner_join(.,mtchConc,by='COL') %>%
  {split(.,.$Kit)} %>%
  lapply(.,GetBlocks) %>%
  bind_cols() %>%
  cbind(conc,.) %>%
  unname() %>%
  write.csv(.,
            paste0(fl,".oligo.txt"),
            row.names=FALSE)

}



