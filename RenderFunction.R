library(shiny)

ui <- fluidPage(
  titlePanel("RenderImage"),
  sidebarLayout(
    sidebarPanel(
    mainPanel(
      tabsetPanel(tabPanel(title = "KMeans"),id = "kmean",
                  radioButtons("n", label = h4("Radio Buttons"),
                               choices = list("Choice 1" = 1, 
                                              "Choice 2" = 2),
                               selected = 2))),
     imageOutput("Image", height = "auto", width ="auto")
      )
    )
  )

server <- function(input, output, session) {
  output$Image <- renderImage({
    # When input$n is 3, filename is ./images/image3.jpeg
    filename <- normalizePath(file.path('Render/www',
                                        paste('image', input$n, '.jpg', sep='')))
    #filename <- normalizePath(file.path("image1.jpg"))
    # Return a list containining the filename
    list(src = filename)
    
  }, deleteFile = FALSE)
}

shinyApp(ui, server)