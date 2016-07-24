#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  headerPanel("Boston Data"),
  fluidRow(
    
    column(4,
           h4('Select'),
           selectInput("variable","Variable:",
                       c("per Capita Crime Rate"="crim",
                         "prop. of residential land for lots > 25,000 sq.ft"="zn",
                         "prop. of non-retail business acres per town"="indus",
                         "Charles River dummy variable"="chas",
                         "nitrogen oxides concentration (pp10m)"="nox",
                         "average number of rooms per dwelling"="rm",
                         "prop. of owner-occupied units built prior to 1940"="age",
                         "weighteed mean of distances to five Boston employment centers"="dis",
                         "index of accessibility to radial highways"="rad",
                         "full-value property-tax rate per USD10,000"="tax",
                         "pupil=teacher ratio by town"="ptratio",
                         "1000(Bk-0.63)^2, Bk=proportion of blacks by town"="black",
                         "lower status of the population (percent)"="lstat"
                          )
           ),
    p("This app uses the Boston data in the MASS library.  It shows the variation of median home values 
        against 13 variables.  You can use the selection box above to select the variable you want to
        study.  The app plots the median home values agaisnt the chosen variable, performs a linear fit
        that is shown in the plot.  Summary of the fit model is shown in the panel below.")
                       
    ),
    column(8,
          h3('Median House Values Data and Linear Regression'),
          plotOutput('myPlot')
    )
    
  ##  verbatimTextOutput('myVal')
  ),
  fluidRow(
    h3("Summary of Linear Fit"),
    verbatimTextOutput("mySum")
  )
)
)

