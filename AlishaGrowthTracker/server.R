
shinyServer(function(input, output) {
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

