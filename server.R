library(shiny)
library(caret)
library(rpart)
library(e1071)
library(randomForest)
data(iris)

shinyServer(
     function(input, output) {
          
          ### DISPLAY ACCURACY OF SELECTED ALGORITHM
          output$accuracy <- renderText({
               set.seed(8613)
               inTrain <- createDataPartition(y = iris$Species, p = .75, list = FALSE)
               training <- iris[inTrain,]; testing <- iris[-inTrain,]
               if (input$trainMethod == "RPart"){
                    algo <- "rpart"
               } else if (input$trainMethod == "Random Forest"){
                    algo <- "rf"
               }
               modelFit <- train(Species ~., data = training, method = algo)
               compareSet <- data.frame(actual = testing$Species, predicted = predict(modelFit, newdata = testing))
               paste0(as.character(100*sum(compareSet$actual == compareSet$predicted)/nrow(compareSet)),"%")
          })
          
          ### PREDICT BASED ON USER INPUTS
          output$prediction <- renderText({
               set.seed(8613)
               inTrain <- createDataPartition(y = iris$Species, p = .75, list = FALSE)
               training <- iris[inTrain,]; testing <- iris[-inTrain,]
               if (input$trainMethod == "RPart"){
                    algo <- "rpart"
               } else if (input$trainMethod == "Random Forest"){
                    algo <- "rf"
               }
               modelFit <- train(Species ~., data = training, method = algo)
               as.character(predict(modelFit, newdata = data.frame(Sepal.Length = input$SL,
                                                                   Sepal.Width = input$SW,
                                                                   Petal.Length = input$PL,
                                                                   Petal.Width = input$PW)))
          })
     }
)