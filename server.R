# SERVER:::::This script contains the nuts-and-bolts that bring the GIU to life
library(shiny)
library(leaflet)


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ SERVER @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

server <- shinyServer(function(input, output) {
  output$mymap <- renderLeaflet({
    #adding APA marker
    #adding divvy markers
    mymap<- absloc %>%
      leaflet() %>%
      addTiles() %>%
      addMarkers(icon = bikeicon, popup = info$Address) %>%
      addMarkers(lat=41.8858, lng=-87.62444, popup="American Planning Association Office") %>%
      setView(-87.62444, 41.8858, zoom = 16)
  })
  output$bar1 <- renderPlot({
    ggplot(info, aes(fill=Address, y=info$`Available Bikes`, x=info$Address), xlab = "Divvy Bike Station", ylab = "Available Bikes") + 
      geom_bar( stat="identity") +
      labs(x = "Divvy Bike Station") +
      labs(y = "Available Bikes") +
      labs(title = "Bike Availability") +
      labs(legend = "Station Name")
  })
})


shinyApp(ui, server)






