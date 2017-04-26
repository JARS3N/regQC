library(shiny)
shinyServer(function(input, output) {
   observeEvent(input$GO,{
     if(!is.null(input$GO)){
     regQC::runOligoFolder()
     }
     })
})
