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
            fluidRow(box(title = 'part1',solidHeader = TRUE,status = "primary",width = 4,
                         selectizeInput("cut_id",label = "cut",choices = unique(df$cut)),
                         selectizeInput("color_id",label = "color",choices = unique(df$color)),
                         selectizeInput("clarity_id",label = "clarity",choices = unique(df$clarity))),
                     box(title = 'part2',solidHeader = TRUE,status = "primary",width = 4,
                         numericInput("carat_id",label = "carat", value = mean(df$carat), min = 0),
                         numericInput("depth_id",label = "depth", value = mean(df$depth), min = 0),
                         numericInput("table_id",label = "table", value = mean(df$table), min = 0)),
                     box(title = 'part3',solidHeader = TRUE,status = "primary",width = 4,
                         sliderInput("x_id",label = "x", value = mean(df$x),min = min(df$x), max(df$x)),
                         sliderInput("y_id",label = "y", value = mean(df$y),min = min(df$y), max(df$y)),
                         sliderInput("z_id",label = "z", value = mean(df$z),min = min(df$z), max(df$z)))),
            
            fluidRow(verbatimTextOutput("raw_print"))
    )
  )
)
  
  

dashboardPage(header, sidebar, body,skin="blue")