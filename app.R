library(shiny)
library(dplyr)
library(plotly)

df <- read.csv("data/processed_global_education.csv", encoding = 'latin1')

# frontend design
# UI
ui <- fluidPage(
  theme = bslib::bs_theme(bootswatch = "darkly"),
  titlePanel("World Education Dashboard"),
  
  checkboxGroupInput("region", "Select Region:",
                     choices = unique(df$Region),
                     selected = unique(df$Region),
                     inline = TRUE),
  
  plotlyOutput("region_plot"),
  dataTableOutput("data_table")
)


# backend logic
server <- function(input, output) {
  
  filtered_data <- reactive({
      df |> filter(Region %in% input$region)
  })
    
  output$region_plot <- renderPlotly({
      plot_ly(
        filtered_data(),
        x = ~ Region,
        y = ~ Birth_Rate,
        type = "box"
      ) |> 
        layout(
          paper_bgcolor = "#222",
          plot_bgcolor = "#222",
          font = list(color = "white")
        )
  })
  
  output$data_table <- renderDataTable({
    filtered_data() |> 
      select(Countries.and.areas, 
             Region, Birth_Rate, 
             Unemployment_Rate)
  })
}

shinyApp(ui = ui, server = server)
