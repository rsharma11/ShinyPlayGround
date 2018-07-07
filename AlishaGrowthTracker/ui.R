ui <- dashboardPage(
  dashboardHeader(title = "Alisha activity"),
  dashboardSidebar(),
  dashboardBody(
    uiOutput("mainPage")
    
  )
)