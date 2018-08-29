library(shiny)

ui <- (fluidPage(
  titlePanel("Widgets"),
  fluidRow(h4("Buttons"),
           
  sidebarLayout(
    sidebarPanel(
      br(),
      fluidRow(
        column(6,
               h4("Actionbutton"),
               actionButton("per", label = "Perform")),
        column(6,
               h4("Help Text"),
               helpText("Just for help"))),
      br(),
      fluidRow(
        column(6,
               h4("Submitbutton"),
               submitButton("Submit")),
        column(6,
               numericInput("numer",
                            label = h4("Numeric Input"),
                            value = 10))),
      fluidRow(
        column(6,
               h4("Single Checkbox"),
               checkboxInput("checkbox", label = "Choice A", value = TRUE)),
        column(6,
               radioButtons("radio", label = h4("Radio Buttons"),
                            choices = list("Choice 1" = 1, "Choice 2" = 2),
                            selected = 2))),
      fluidRow(
        column(6,
               checkboxGroupInput("checkGroup",
                                  label = h4("Checkbox group"),
                                  choices = list("Choice 1" = 1,
                                                 "Choice 2" = 2, "Choice 3" = 3),
                                  selected = 2)),
        
        column(6,
               selectInput("select", label = h4("Select Box"),
                           choices = list("Choice 1" = 1, "Choice 2" = 2
                           ), selected = 1))),
      fluidRow(
        column(6,
               dateInput("date",
                         label = h4("Date input"),
                         value = "2016-12-01")),
        column(6,
               sliderInput("slider1", label = h4("Sliders"),
                           min = 0, max = 100, value = c(10,90)))),
      fluidRow(
        column(6,
               dateRangeInput("dates", label = h4("Date Range"))),
        column(6,
               textInput("text", label = h4("Text Input"),
                         value = "Some Text"))),
      fileInput("file", label = h4("File Input"))),
    mainPanel(h1("Main"),
              img(src = "petal.jpg", height = 150, width = 200),
              br(),
              br(),
              p("This famous (Fisher's or Anderson's) ", a("iris",href="http://stat.ethz.ch/R-manual/R-devel/library/datasets/html/iris.html"), "data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are ",strong( "Iris setosa,"),strong( "versicolor"), "and", strong("virginica.")),
              br(),
              h2("Analysis")
              
    )
  )
  )))
server <- function(input, output, session) {}

shinyApp(ui = ui, server = server)