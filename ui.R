library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Iris dataset with Shiny"),
  
  # Sidebar with controls to select a dataset and specify the
  # number of observations to view
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset (or a subset) :", 
                  choices = c("all iris data", "setosa", "versicolor", "virginica")),
      selectInput("Xvar", "X variable", 
                  choices = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")),
      selectInput("Yvar", "Y variable", 
                  choices = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"), selected = "Sepal.Width"),
      numericInput("clusters", "Cluster count", 3, min = 1, max = 9),
      numericInput("obs", "Number of observations to view on table:", 10)
    ),
    
    # Show a summary of the dataset and an HTML table with the 
    # requested number of observations
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", h1("Plot"),plotOutput("simplePlot")),
        tabPanel("Descriptive statistics", h1("Descriptive statistics"),verbatimTextOutput("summary")),
        tabPanel("Table", h1("Table"),tableOutput("view")),
        tabPanel("Clustering", h1("K-Means"),plotOutput("kmeansPlot"))
      ) 
    )
  )
))
