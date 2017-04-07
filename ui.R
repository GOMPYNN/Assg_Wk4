library(shiny)

shinyUI(
        navbarPage("Developing Data Products Shiny Application",
                   tabPanel("Documentation",
                            h2("Predicting Workers Wages with a Generalized Linear Model"),
                            hr(),
                            h4("By choosing predictors on the tab Prediction Plot the following actions occur:"),
                            br(), p("1. A generalized linear regression model is fitted with wage as outcome."),
                            br(), p("2. The wages from a test data set are predicted with the model."),
                            br(), p("3. The predicted wages are plotted against the actual wages."),
                            br(), p("4. The used formula is printed as the caption of the plot."),
                            br(), br(), p("On the tab Data Information additional information regarding the data may be found."),
                            hr(),
                            h4("Note: If no predictors are chosen all available predictors are used!"),
                            br(), h4("Please be patient as the rendering of the plot may take some time.")
                           ),
                   tabPanel("Prediction Plot",
                            fluidPage(
                                    titlePanel("The predicted wage plotted against the actual wage"),
                                    sidebarLayout(
                                            sidebarPanel(
                                                    checkboxInput("year", "Use year as predictor"
                                                                  , value = FALSE),
                                                    checkboxInput("age", "Use age as predictor"
                                                                  , value = FALSE),
                                                    checkboxInput("maritl", "Use marital status as predictor"
                                                                  , value = FALSE),
                                                    checkboxInput("race", "Use race as predictor"
                                                                  , value = FALSE),
                                                    checkboxInput("education", "Use education as predictor"
                                                                  , value = FALSE),
                                                    checkboxInput("jobclass", "Use job class as predictor",
                                                                  value = FALSE),
                                                    checkboxInput("health", "Use health as predictor",
                                                                  value = FALSE),
                                                    checkboxInput("health_ins", "Use health insurance as predictor",
                                                                  FALSE),
                                                    checkboxInput("logwage", "Use log of the wage as predictor",
                                                                  FALSE)
                                            ),
                                            
                                            mainPanel(
                                                    h3(textOutput("caption")),
                                                    plotOutput("wagePlot")
                                                    )
                                            )
                                    )
                            ),
                   tabPanel("Data Information",
                            h2("Mid-Atlantic Wage Data"),
                            hr(),
                            h3("Description"),
                            helpText("Wage and other data for a group of 3000 workers in the Mid-Atlantic region"),
                            h3("Format"),
                            p("A data frame with 3000 observations on the following 12 variables."),
                            
                            p("  [, 1]   year           Year that wage information was recorded"),
                            p("  [, 2]	 age	        Age of worker"),
                            p("  [, 3]	 sex	        Gender"),
                            p("  [, 4]	 maritl	        A factor with levels 1. Never Married 2. Married 3. Widowed 
                                                        4. Divorced and 
                                                        5. Separated indicating marital status"),
                            p("  [, 5]	 race	        A factor with levels 1. White 2. Black 3. Asian and 
                                                        4. Other indicating race"),
                            p("  [, 6]	 education      A factor with levels 1. < HS Grad 2. HS Grad 3. Some College 
                                                        4. College Grad and 5. Advanced Degree 
                                                        indicating education level"),
                            p("  [, 7]	 region	        Region of the country (mid-atlantic only)"),
                            p("  [, 8]	 jobclass       A factor with levels 1. Industrial and 
                                                        2. Information indicating type of job"),
                            p("  [, 9]	 health	        A factor with levels 1. <=Good and 2. >=Very Good 
                                                        indicating health level of worker"),
                            p("  [,10]	 health_ins     A factor with levels 1. Yes and 2. No 
                                                        indicating whether worker has health insurance"),
                            p("  [,11]	 logwage        Log of workers wage"),
                            p("  [,12]	 wage           Workers raw wage"),
                            
                            h3("Source"),
                            
                            p("Data was manually assembled by Steve Miller, of Open BI (www.openbi.com),
                              from the March 2011 Supplement to Current Population Survey data.")
                   )
        )
)
