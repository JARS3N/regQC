library(shiny)
shinyServer(function(input, output) {
   observeEvent(input$GO,{
      D<-choose.dir()
     if(input$cb==TRUE){
        regQC::Outandsave(D)
        }
     if(!is.null(D)){
     regQC::runOligoFolder(D)
     }
     })
})
