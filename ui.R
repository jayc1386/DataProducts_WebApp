library(shiny)
data(iris)

shinyUI(pageWithSidebar(
     headerPanel("Iris Prediction Shiny App"),
     
     ### INPUTS
     sidebarPanel(
          h3("Algorithm"),
          selectInput("trainMethod", "Prediction Type", c("RPart","Random Forest")),
          
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
     
     ### OUTPUTS
     mainPanel(
          h4("Prediction Algorithm Accuracy"),
          h5(textOutput('accuracy')),
          br(),
          br(),
          h4("New Observation Prediction"),
          h5(textOutput('prediction')),
          br(),
          br(),
          h4("About This App:"),
          h5("This shiny app displays a prediction algorithm in a easily accessible web format."), 
          h5("In this app, the user can first select which machine learning algorithm he chooses to use (between RPart and Random Forest)."), 
          h5("After selecting the algorithm, the user can select different inputs used in the dataset to make the prediction."),
          h5("The app will select the result that it has been trained on with the algorithm."),
          h5("This app uses the Iris dataset, allowing the user to adjust the Sepal and Petal Widths and Lengths in order to predict the Species.")
     )
))