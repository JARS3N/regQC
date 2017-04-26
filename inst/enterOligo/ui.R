library(shiny)
shinyUI(fluidPage(
  titlePanel("Oigo Analysis"),
    mainPanel(
      shiny::actionButton('GO','Select Directory'),
      p('Select Directory of Oligo Excel files to run analysis')
    )
  )
)
