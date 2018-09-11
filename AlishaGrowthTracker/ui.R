shinyUI(
dashboardPage(
    dashboardHeader(title = "Alisha's Activity Tracker"),
    dashboardSidebar(
      sidebarMenu(id = "sidebarmenu",
        menuItem("Activity", tabName = "Activity", icon = icon("Activity")),
        menuItem("Health details", tabName = "details", icon = icon("Health details")),
        menuItem("View Plot", tabName = "ViewPlot", icon = icon("View Plot"))
      )
    ),
    
    dashboardBody(
      tabItems(
        tabItem(tabName = "Activity",
                tabsetPanel(
                  tabPanel("Food", value = "food", dateInput("date_food", label = "Date:"),
                           timeInput("time_food", "Time:", value = Sys.time()),
                           numericInput("milk", label = "Milk quantity (ml):", value = 170,  min = 0, max = 300, step = 10),
                           selectInput("food", 
                                       "Food eaten (gm):",
                                       c("Fruits" = "fruits",
                                         "Vegetable" = "vegetable",
                                         "Cereals" = "cereal")),
                           actionButton("submit_food", label = "Submit"),
                           actionButton("createTable_food", "Create table"),
                           dataTableOutput("table_food")),
                  
                  tabPanel("Diaper", value = "Diaper", dateInput("date_diaper", label = "Date:"),
                           timeInput("time_diaper", "Time:", value = Sys.time()),
                           selectInput("diaper", "Event happened:",
                                       c("Soiled" = "big job",
                                         "Pee" = "small job",
                                         "Soiled_Pee" = "soiled_pee")),
                           actionButton("submit_diaper", label = "Submit"),
                           actionButton("createTable_diaper", "Create table"),
                           dataTableOutput("table_diaper")),
                  
                  tabPanel("Sleep", value = "Sleep", dateInput("date_sleep", label = "Date:"),
                           timeInput("time1", "Slept at:", value = strptime("12:34:56", "%T")),
                           timeInput("time2", "Woke up at:", value = strptime("12:34:56", "%T")),
                           actionButton("submit_sleep", label = "Submit"),
                           actionButton("createTable_sleep", "Create table"),
                           dataTableOutput("table_sleep"))
                )
        ),
        tabItem(tabName = "details",
                dateInput("Date", "Enter Date of appointment", value = ""),
                textInput("height", "Enter Height", value = ""),
                textInput("weight", "Enter Weight", value = ""),
                textInput("vaccine", "Enter name of vaccine", value = ""),
                textInput("vaccine", "Additional information", value = "")
        ),
        tabItem(tabName = "ViewPlot",
                radioButtons("plot", "Type of plot:",
                             c("Scatter" = "scatter",
                               "Line" = "line",
                               "Box plot" = "box",
                               "Histogram" = "hist"), inline = TRUE),
                plotOutput("Plot")
        )
        )
)
)
)
