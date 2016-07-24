#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(MASS)

myData <- Boston

thelab <-  c("per Capita Crime Rate",
    "prop. of residential land for lots > 25,000 sq.ft",
    "prop. of non-retail business acres per town",
    "Charles River dummy variable",
    "nitrogen oxides concentration (pp10m)",
    "average number of rooms per dwelling",
    "prop. of owner-occupied units built prior to 1940",
    "weighteed mean of distances to five Boston employment centers",
    "index of accessibility to radial highways",
    "full-value property-tax rate per USD10,000",
    "pupil=teacher ratio by town",
    "1000(Bk-0.63)^2, Bk=proportion of blacks by town",
    "lower status of the population (percent)"
  )
names(thelab)<-c("crim","zn", "indus", "chas","nox","rm","age",
                 "dis","rad","tax","ptratio","black","lstat")

shinyServer(function(input,output){
  lm.fit<-reactive({lm(as.formula(paste0("myData$medv","~myData$",input$variable)))})  
   output$myPlot <- renderPlot({
   plot(eval(parse(text=paste0("myData$",input$variable))),myData$medv,col="red",ylab="Median House Values in 1000s of USD",
        xlab=thelab[input$variable])
     ##plot(myData$lstat,myData$medv)
## lm.fit <<-lm(medv~Boston[,input$variable])   
 abline(lm.fit())
  })
   output$mySum <- renderPrint({summary(lm.fit())})
#   output$mySum <- renderPrint({c("This is a test")})
}
)

