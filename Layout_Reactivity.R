# ui.R
library(shiny)
ui <- fluidPage(
  titlePanel("TabPanel"),
  sidebarLayout(
    sidebarPanel(h3("Menu")),
    mainPanel(h3("Main Panel"),
              tabsetPanel(
                type = "tabs",tabPanel("Data Table",dataTableOutput("dt1")),tabPanel("Summary"))
  )))

#server.R
library(shiny)
server <- (function(input, output) {
  output$dt1 <- renderDataTable(Iris)
})

shinyApp(ui = ui, server = server)