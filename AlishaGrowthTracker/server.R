shinyServer(function(input, output) {

    #Run this code when action button (submit_food) is presssed
    observeEvent(input$submit_food,{
      #creating data object from user input
      data_food <- data.frame(
        date = input$date_food,
        time= input$time_food,
        milk = input$milk
      )
      #push data into mongo
      writeInMongo(data_food, "Food")      
      
    })
    
  #Run this code when action button (submit_diaper) is presssed
  observeEvent(input$submit_diaper,{
    #creating data object from user input
    data_diaper <- data.frame(
      date = input$date_diaper,
      time= input$time_diaper,
      diaper = input$diaper
    )
    #push data into mongo
    writeInMongo(data_diaper, "Diaper")      
    
  })
  
  #Run this code when action button (submit_sleep) is presssed
  observeEvent(input$submit_sleep,{
    #creating data object from user input
    data_sleep <- data.frame(
      date = input$date_sleep,
      Slept = input$time1,
      Woke = input$time2
    )
    #push data into mongo
    writeInMongo(data_sleep, "Sleep")      
    
  })
    
  #Run this code when action button (create table) is presssed
  
   observeEvent(input$createTable_food,{
    #read data into mongo
    data_food <- readFromMongo("Food")      
    output$table_food <- renderDataTable({
      DT::datatable(data_food)
    })
  })
  
    observeEvent(input$createTable_diaper,{
      data_diaper <- readFromMongo("Diaper")      
      output$table_diaper <- renderDataTable({
        DT::datatable(data_diaper)
      })
    })
    
    observeEvent(input$createTable_sleep,{
      data_sleep <- readFromMongo("Sleep")      
      output$table_sleep <- renderDataTable({
        DT::datatable(data_sleep)
      })
    })
    
  }
)

