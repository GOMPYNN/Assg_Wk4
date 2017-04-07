library(shiny)
library(ISLR)
library(ggplot2)
library(caret)

data(Wage)

shinyServer(function(input, output) {
        
        WageData <- reactive({
                subset(Wage, select = -c(sex, region))
        })
        
        inTrain <- reactive({
                createDataPartition(y = WageData()$wage, p = 0.7, list = FALSE)
        })
        
        training <- reactive({
                WageData()[inTrain(), ]
        })
        
        testing <- reactive({
                WageData()[-inTrain(), ]
        })
        
        inyear <- reactive({ ifelse(input$year, "+ year", "") })
        inage <- reactive({ ifelse(input$age, " + age", "") })
        inmaritl <- reactive({ ifelse(input$maritl, " + maritl", "") })
        inrace <- reactive({ ifelse(input$race, " + race", "") })
        ineducation <- reactive({ ifelse(input$education, " + education", "") })
        injobclass <- reactive({ ifelse(input$jobclass, " + jobclass", "") })
        inhealth <- reactive({ ifelse(input$health, " + health", "") })
        inhealth_ins <- reactive({ ifelse(input$health_ins, " + health_ins", "") })
        inlogwage <- reactive({ ifelse(input$logwage, " + logwage", "") })
                
        strg <- reactive({
                paste0(inyear(), inage(), inmaritl(), inrace(), ineducation(), 
              injobclass(), inhealth(), inhealth_ins(), inlogwage())
        })
                
        used_preds <- reactive({
                z <- if(strg() == ""){"."}
                else{strg()}
                z
        })
        
        frm_txt <- reactive({
                paste0("wage ~", used_preds())
        })
        
        modFit <- reactive({
                train(as.formula(frm_txt()), method = "glm", data = training())
        })
        
        pred <- reactive({
                predict(modFit(), newdata = testing())
        })
        
        output$caption <- renderText({
                frm_txt()
        })
        
        output$wagePlot <- renderPlot({
        
                p <- ggplot(data = testing(), aes(x = testing()$wage, y = pred()))
                p <- p + geom_point(size = 2, pch = 21, aes(fill = year))
                p <- p + xlab("Wage") + ylab("Predictions") + labs(fill = "Year")
                
                print(p)
                
        })
        
})