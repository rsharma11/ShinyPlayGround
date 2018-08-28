library(shiny)

ui <- (fluidPage(
  titlePanel("Widgets"),
  fluidRow(h4("Buttons"),
           
  sidebarLayout(
    sidebarPanel(
      br(),
      h4("Actionbutton"),
      actionButton(inputId = "per", label = "perform"),
      br(),
      h4("Submitbutton"),
      submitButton(text = "Submit"),
      h4("Single Checkbox"),
      checkboxInput(inputId = "checkbox", label = "Choice A", value = TRUE),
      checkboxGroupInput(inputId = "checkGroup", label = h4("Checkbox group"), choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3), selected = 2),
      dateInput(inputId = "date", label = h4("Date Input"), value = "2016-12-01"),
      dateRangeInput(inputId = "dates", label = h4("Date Range")),
      fileInput(inputId = "file", label = h4("File Input"))      
    ),
    mainPanel(
      h2("Main"),
      br(),
      br(),
      tags$img(src="Petal.jpg", height =150, width = 200),
      br(),
      br(),
        p(HTML("This famous (Fisher’s or Anderson’s) iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are <b>Iris setosa</b>, <b>versicolor</b>, and <b>virginica</b>. Use an HTML tag format.")),
        br(),  
        a("http://stat.ethz.ch/R-manual/R-devel/library/datasets/html/iris.html"),
        h2("Analyis")
      
        )))))
server <- function(input, output, session) {}

shinyApp(ui = ui, server = server)