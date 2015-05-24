library(shiny)
data(iris)

shinyUI(pageWithSidebar(
     headerPanel("Iris Prediction"),
     sidebarPanel(
          h3("Algorithm"),
          selectInput("trainMethod", "Prediction Type", c("rpart","rf")),
          
          h3("New Observation"),
          sliderInput("SL", "Sepal Length", min(iris$Sepal.Length), 
                      min = min(iris$Sepal.Length), max = max(iris$Sepal.Length), step = .1),
          sliderInput("SW", "Sepal Width", min(iris$Sepal.Width), 
                      min = min(iris$Sepal.Width), max = max(iris$Sepal.Width), step = .1),
          sliderInput("PL", "Petal Length", min(iris$Petal.Length), 
                      min = min(iris$Petal.Length), max = max(iris$Petal.Length), step = .1),
          sliderInput("PW", "Petal Width", min(iris$Petal.Width), 
                      min = min(iris$Petal.Width), max = max(iris$Petal.Width), step = .1)
     ),
     mainPanel(
          h4("Prediction Algorithm Accuracy"),
          h5(textOutput('accuracy')),
          br(),
          h4("New Observation Prediction"),
          h5(textOutput('prediction'))
     )
))