library(shinydashboard)
header <- dashboardHeader(title="Example")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Widgets", tabName = "widgets", icon = icon("th"))
  )
)

body <-   dashboardBody(
  
  tabItems(
    # First tab content
    tabItem(tabName = "dashboard",
            fluidRow(
              box(title = "Input", solidHeader =  TRUE, status = "primary",
                  selectizeInput("y_axis",label = "enter choice",
                                 choices = c("carat","depth","table","price","x","y","z")),
                  selectizeInput("x_axis",label = "enter choice",
                                 choices = c("carat","depth","table","price","x","y","z"))),
              
              box(title = "Input2", solidHeader = TRUE,status = "primary",
                  selectizeInput("method_choice", label = "method", choices = c("auto","lm","glm")),
                  selectizeInput("grouping",label = "group", choices = c("NIL","cut","color","clarity")))
              

            ),
            
            fluidRow(
              box(title = "plot output", solidHeader = TRUE, status  = "warning",plotOutput("ggplot_id"),width = 12)
            )
    ),
    
    # Second tab content
    tabItem(tabName = "widgets",
            h2("Widgets tab content")
    )
  )
)
  
  

dashboardPage(header, sidebar, body,skin="blue")