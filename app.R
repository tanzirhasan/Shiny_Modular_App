library(shiny)
library(tidyverse)
library(shinythemes)

ui<- fluidPage(theme = shinytheme("yeti"),
   #tags$style(type="text/css",".recalculating{ opacity: 1.0; }",theme = "bootstrap.css"),
  titlePanel("Gapminder"),
  tabsetPanel(
    id= "continent",
    tabPanel("All",gapModuleUI('all')),
    tabPanel("Africa",gapModuleUI("africa")),
    tabPanel("Americas",gapModuleUI('americas')),
    tabPanel("Asia",gapModuleUI("asia")),
    tabPanel("Europe",gapModuleUI("europe")),
    tabPanel("Oceania",gapModuleUI("oceania"))
  )
)


server <-function(input,output,session){
  gapModuleServer('all',all_data)
  gapModuleServer('africa',africa_data)
  gapModuleServer("americas",americas_data)
  gapModuleServer('asia',asia_data)
  gapModuleServer('europe',europe_data)
  gapModuleServer("oceania",oceania_data)
}

# Run the application

shinyApp(ui=ui,server=server)
