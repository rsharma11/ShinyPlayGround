library(shiny)
library(shinyTime)
library(DT)
library(shinydashboard)
source("/Users/vimal/mongoFunctions.R")

shinyApp(
  ui =
    dashboardPage(
    dashboardHeader(title = "Alisha's Activity Tracker"),
    dashboardSidebar(sliderInput("Food", "Number of breaks", 1, 100, 50)),
    dashboardBody(
      fluidPage(
    mainPanel(
      tabsetPanel(
        tabPanel("Food", value = "food", dateInput("date", label = "Date:"),
                 timeInput("time2", "Time:", value = Sys.time()),
                 numericInput("milk", label = "Milk quantity (ml):", value = 170,  min = 0, max = 300, step = 10),
                 selectInput("food", "Food eaten (gm):",
                             c("Fruits" = "fruits",
                               "Vegetable" = "vegetable",
                               "Cereals" = "cereal")),
                 actionButton("submit", label = "Submit"),
                 actionButton("createTable", "Create table"),
                 dataTableOutput("table")),
      
        tabPanel("Diaper", value = "Diaper", dateInput("date", label = "Date:"),
                 timeInput("time2", "Time:", value = Sys.time()),
                 selectInput("diaper", "Event happened:",
                             c("Soiled" = "big job",
                               "Pee" = "small job",
                               "Soiled_Pee" = "soiled_pee")),
                 actionButton("submit", label = "Submit"),
                 actionButton("createTable", "Create table"),
                 dataTableOutput("table")),
      
        tabPanel("Sleep", value = "Sleep", dateInput("date", label = "Date:"),
                 timeInput("time3", "Slept at:", value = strptime("12:34:56", "%T")),
                 timeInput("time3", "Woke up at:", value = strptime("12:34:56", "%T")),
                 actionButton("submit", label = "Submit"),
                 actionButton("createTable", "Create table"),
                 dataTableOutput("table"))
      )
    )
  ))),
  
  server = function(input, output) {
    
    #Run this code when action button (submit) is presssed
    observeEvent(input$submit,{
      #creating data object from user input
      data <- data.frame(
        date = input$date,
        time= input$time2,
        milk = input$milk
      )
      #push data into mongo
      writeInMongo(data, "Milk")      
      
    })
    
    
    #ObserveEvent----
    #Run this code when action button (submit) is presssed
    observeEvent(input$createTable,{
      
      #push data into mongo
      data <- readFromMongo("Milk")      
      output$table <- renderDataTable({
        DT::datatable(data)
      })
    })
    
  }
)

