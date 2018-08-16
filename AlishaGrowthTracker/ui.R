shinyUI(
dashboardPage(
    dashboardHeader(title = "Alisha's Activity Tracker"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Activity", tabName = "Activity", icon = icon("Activity")),
        menuItem("Health details", tabName = "Health details", icon = icon("Health details")),
        menuItem("View Plot", tabName = "View Plot", icon = icon("View Plot"))
      )
    ),
    dashboardBody(
            fluidPage(
                mainPanel(
                    tabsetPanel(
                          tabPanel("Food", value = "food", dateInput("date", label = "Date:"),
                                  timeInput("time2", "Time:", value = Sys.time()),
                                  numericInput("milk", label = "Milk quantity (ml):", value = 170,  min = 0, max = 300, step = 10),
                                  selectInput("food", 
                                              "Food eaten (gm):",
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
                          )
                      )
    )
)