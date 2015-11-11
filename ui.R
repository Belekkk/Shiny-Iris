library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Descriptive statistics of Iris dataset with R and Shiny Apps"),
  
  # Sidebar with controls 
  sidebarLayout(
    sidebarPanel(
      h3("Filtering data"),
      selectInput("dataset", "Choose a dataset (or a subset) :", 
                  choices = c("all iris data", "setosa", "versicolor", "virginica")),
      selectInput("Xvar", "X variable", 
                  choices = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")),
      selectInput("Yvar", "Y variable", 
                  choices = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"), selected = "Sepal.Width"),
      numericInput("obs", "Number of observations to view on table:", 10),
      h3("K-Means"),
      numericInput("clusters", "Cluster count", 3, min = 1, max = 9),
      h3("DBSCAN"),
      sliderInput("eps", "Radius of neighborhood of each point", min = 0.0, max = 1.0, value = 0.2),
      sliderInput("minPoints", "Number of neighbors within the eps radius", min = 0, max = 10, value = 3),
      h3("Iris Data"),
      downloadButton("downloadData", "Download 'Iris.csv'", class = NULL)
    ),
    
    # MainPanel divided into many tabPanel
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", h1("Scatterplot"), plotOutput("simplePlot"), h1("Boxplot"), plotOutput("boxPlot")),
        tabPanel("Descriptive statistics", h1("Descriptive statistics"),verbatimTextOutput("summary")),
        tabPanel("Table", h1("Table"), textOutput("NbRows"), tableOutput("view")),
        tabPanel("Clustering", h1("K-Means"), textOutput("NbClust"), plotOutput("kmeansPlot"), 
                 h1("Density-based cluster (DBSCAN)"), textOutput("dbscan_Param"), plotOutput("dbscanPlot"),
                 h1("Decision tree"), plotOutput("treePlot"))
      ) 
    )
  )
))
