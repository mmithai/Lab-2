
#install.packages("shinythemes")
library(shinythemes)
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Define UI for Divvy Bikes App @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

ui <- fluidPage(theme = shinytheme("united"),
  #title
  titlePanel("Divvy Bikes Near APA Office"),
  sidebarLayout(
    # Sidebar with a dropdown input
    sidebarPanel(
      selectInput("info", "Choose a dataset:", choices = c("Available Bikes", "Available Docks", "Total Docks"))), 
    mainPanel(tabsetPanel(tabPanel("About Assignment", verbatimTextOutput("About Assigmnet")),
      tabPanel("Map", plotOutput("Map"),
               column(width = 11,box(width = NULL, 
                                    solidHeader = TRUE, 
                                    leafletOutput("mymap", height = 500), 
                                    column(width = 3, box(width = NULL, status = "warning",
                                                          uiOutput("routeSelect"),
                                                          checkboxGroupInput("directions", "Divvy Bikes Within Walking Distance",
                                                                             choices = c("Michigan Ave & Washington", "St State St & Randolph St", "Michigan Ave & Lake St", "Wabash Ave & Wacker Pl", "Stetson Ave & South Water St"), 
                                                                             selected = c("Michigan Ave & Washington", "St State St & Randolph St", 
                                                                                          "Michigan Ave & Lake St", "Wabash Ave & Wacker Pl", "Stetson Ave & South Water St"))))
               ))),
      tabPanel("Bike Availability", plotOutput("bar1"))))), position = c("left"), fluid = TRUE)



#source: http://shiny.rstudio.com/gallery/bus-dashboard.html


