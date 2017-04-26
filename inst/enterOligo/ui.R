library(shiny)
shinyUI(fluidPage(
  titlePanel("Oigo Analysis"),
    mainPanel(
      shiny::checkboxInput('cb','export from wave to excel',value=FALSE),
      shiny::actionButton('GO','Select Directory'),
      p('Select Directory of Oligo Excel files to run analysis')
    )
  )
)
