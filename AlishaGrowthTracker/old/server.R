server <- function(input, output) { 
  
# Showing modal on start of app to get intend of user
    showModal(
    modalDialog(
        title = "Welcome to Alisha Tracker",
        "Please choose what you want to do!",
        radioButtons(inputId = "rb1", "Choices: ", choices = c("Food(Milk)", "Diaper", "Sleep")),
        actionButton(inputId = "go", label = "Enter the data"),
        easyClose = TRUE
  ))
  
  # Action after sctionButton (Enter the data) pressed
  observeEvent(input$go, {
    removeModal()
    if(input$rb1 == "Food(Milk)"){
    output$mainPage  <- renderUI(
      fluidRow(
      box(
          dateInput("date", "Enter Current Date:",  value =Sys.Date()),
          timeInput("time", "Enter Current Time: ", value = Sys.time()),
          numericInput(inputId = "milkPrep", "Milk prepared (ml):", value = 135, step = 30),
          numericInput("milkDrank", "Milk Drank (ml):", value = 135, step = 10, min = 0, max = 200 )
          
      )
      )
    )
      
      
    }
    
    
  })
  
  
  
  }