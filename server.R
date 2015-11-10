library(shiny)
library(ggplot2)
library(datasets)

# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output) {
  
  datasetInput <- reactive({
    switch(input$dataset,
           "all iris data" = iris,
           "setosa" = subset(iris, iris$Species == "setosa"),
           "versicolor" = subset(iris, iris$Species == "versicolor"),
           "virginica" = subset(iris, iris$Species == "virginica"))
  })
  
  # Generate a summary of the dataset
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  # Show the first "n" observations
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  
  # Show plot
  output$plot <- renderPlot({
    df_iris <- datasetInput()
    plot(x = df_iris$Sepal.Length, y = df_iris$Sepal.Width, xlab="Sepal Length", ylab="Sepal width",
         main=toupper(ifelse(input$dataset == "all iris data", "iris", input$dataset)), pch=16, cex = 2,
         col = ifelse(df_iris$Species == "setosa","darkgreen", ifelse(df_iris$Species == "versicolor","red","blue")))
  })
  
  
})