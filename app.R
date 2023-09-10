library(shiny) 
library(tidyverse)
library(palmerpenguins)
library(ggplot2)
data("penguins")

# Define UI for application that draws a scatterplot
ui <- fluidPage(
    titlePanel(h1("Differences in Anatomical Relationships between Adelie, Chinstrap, and Gentoo Penguins", align = "center", style = "font-family: 'times'; font-si16pt")),
    sidebarLayout(
        sidebarPanel(
            selectInput("bodyparts",
                        "Anatomical Relationship:",
                        choices = c("Body Mass to Bill Length", "Body Mass to Flipper Length", "Bill Length to Flipper Length")),
            img(src = "penguin.webp", height = 300, width = 250)),

        # Show a plot of the generated distribution
        mainPanel(
          h4("Data collected by Dr. Kristen Gorman and the Palmer Station, Antartica", align = "center", style = "font-family: 'times'; font-si16pt"),
           plotOutput("scatterplot"),
          img(src = "lter_penguins.png", height = 400, width = 600))))

# Define server logic required to draw a scatterplot
server <- function(input, output) {
  
  output$scatterplot <- renderPlot({
    
    if(input$bodyparts == "Body Mass to Bill Length"){
      scatterplot <- ggplot(penguins, aes(x = body_mass_g, y= bill_length_mm)) +
        geom_point(aes(col = species)) +
        geom_smooth(aes(group = species)) +
        labs(title = "Relationship of Body Mass to Bill Length between Penguin Species",
             x = "Body Mass (g)", y = "Bill Length (mm)")
      
    } else if(input$bodyparts == "Body Mass to Flipper Length"){
      scatterplot <- ggplot(penguins, aes(x = body_mass_g, y = flipper_length_mm)) +
        geom_point(aes(col = species)) +
        geom_smooth(aes(group = species)) +
        labs(title = "Relationship of Body Mass to Flipper Length between Penguin Species",
             x = "Body Mass (g)", y = "Flipper Length (mm)")
      
    } else if(input$bodyparts == "Bill Length to Flipper Length"){
      scatterplot <- ggplot(penguins, aes(x = bill_length_mm, y = flipper_length_mm)) +
        geom_point(aes(col = species)) +
        geom_smooth(aes(group = species)) +
        labs(title = "Relationship of Bill Length to Flipper Length between Penguin Species",
             x = "Bill Length (mm)", y = "Flipper Length (mm)")
    }
    
    scatterplot
    
  })
}

# Run the application 
shinyApp(ui, server)
