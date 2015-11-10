library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Iris dataset with Shiny"),
  
  # Sidebar with controls to select a dataset and specify the
  # number of observations to view
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset (or a subset):", 
                  choices = c("all iris data", "setosa", "versicolor", "virginica")),
      
      numericInput("obs", "Number of observations to view on table:", 10)
    ),
    
    # Show a summary of the dataset and an HTML table with the 
    # requested number of observations
    mainPanel(
      h1("Plot"),
      plotOutput("plot"),
      h1("Descriptive statistics"),
      verbatimTextOutput("summary"),
      h1("Table"),
      tableOutput("view")
    )
  )
))
