library(ggplot2)
library(shiny)
library(shinydashboard)


shinyServer(
function(input, output){
  
  aa <- reactive({
    
    
    a <- data.frame(rnorm(n = input$norn, mean = input$normean, sd = input$norvar))
    
  })
  
  bb <- reactive({
    
    b <- data.frame(rchisq(n = input$chin,df = input$chinu))
  })
  
  cc <- reactive({
   
    c <- data.frame(rbinom(n = input$binon, size = input$binotrial, prob = input$binop))
  })
  
  dd <- reactive({
   
    d <- data.frame(rpois(n = input$poisn, lambda = input$poislam))
  })
  
  
  ee <- reactive({
    
    e <- data.frame(rexp(n = input$expn, rate = input$explam))
  })
  
  ff <- reactive({
   
    f <- data.frame(rgamma(n = input$gn, rate = input$grate, shape = input$gshape))
  })
  
  gg <- reactive({
    
    g <- data.frame(rbeta(n = input$betan, shape1 = input$beta1, input$beta2))
  })
  
  tt <- reactive({
   
    t <- data.frame(rt(n = input$tn, df = input$tdf))
  })
  
  ww <- reactive({
    
    w <- data.frame(rweibull(n = input$wn, shape = input$wshape, scale = input$wscale))
  })
  hh <- reactive({
    
    h <- data.frame(rf(n = input$fn, df1 = input$fv1, df2 = input$fv2))
  })
  
  #############################################################################
  output$normal <- renderPlot({
    
     ggplot(data=aa(), aes(x=aa())) +
      geom_histogram( aes(y=..density..,fill=..density..))+
       labs(x="Random variable") +
      geom_density(alpha=.2, color= "blue", fill= "blue")


      })

    output$enormean <- renderPrint({
    paste("Point Estimation for Mean is:", round(mean(aa()[,1]),2), "The Actual Value is:", input$normean, sep = " ")
     
  })
  
    output$enorvar <- renderPrint({
            paste("Point Estimation for Variance is:", round(var(aa()[,1]),2),"The Actual Value is:", input$norvar ,  sep = " ")
    })
  
    output$pnorm <- renderPrint({
      input$actionnormal
      br()
      isolate(paste("P(X<", input$pnorm,")=", round(pnorm(q = as.numeric(input$pnorm),mean = input$normean, sd = input$norvar ),3)))
    })
    
    #############################################################################
    output$tstudent <- renderPlot({
      
      ggplot(data=tt(), aes(x=tt())) +
        geom_histogram( aes(y=..density..,fill=..density..))+
        labs(x="Random variable") +
        geom_density(alpha=.2, color= "blue", fill= "blue")
      
      
    })
    
    output$pt <- renderPrint({
      input$actiont
      br()
      isolate(paste("P(X<", input$pt,")=", round(pt(q = as.numeric(input$pt),df = input$tdf ),3)))
    })
    #############################################################################
    output$gamma <- renderPlot({
      
      ggplot(data=ff(), aes(x=ff())) +
        geom_histogram( aes(y=..density..,fill=..density..))+
        labs(x="Random variable") +
        geom_density(alpha=.2, color= "blue", fill= "blue")
      
      
    })
    
    #############################################################################
    output$fdist <- renderPlot({
      
      ggplot(data=hh(), aes(x=hh())) +
        geom_histogram( aes(y=..density..,fill=..density..))+
        labs(x="Random variable") +
        geom_density(alpha=.2, color= "blue", fill= "blue")
      
      
    })
    
   
    
    ###################################################################################
    
  output$chi <- renderPlot({
   
      
    ggplot(data=bb(), aes(x=bb())) +
      geom_histogram( aes(y=..density..,fill=..density..))+
      labs(x="Random variable") +
      geom_density(alpha=.2, color= "blue", fill= "blue")
    
  })
  
  
  output$echimean <- renderPrint({
    paste("Point Estimation for nu is:", round(mean(bb()[,1]),2), "The Actual Value is:", input$chinu , sep = " ")

  })
  
  ###################################################################################
  
  output$exp <- renderPlot({
    
    
    ggplot(data=ee(), aes(x=ee())) +
      geom_histogram( aes(y=..density..,fill=..density..))+
      labs(x="Random variable") +
      geom_density(alpha=.2, color= "blue", fill= "blue")
    
  })
  

  output$eexpmean <- renderPrint({
    paste("Point Estimation for Rate is:", round(1/round(mean(ee()[,1]),2), 2), "The Actual Value is:", input$explam , sep = " ")

  })

  ###################################################################################
  
  output$beta <- renderPlot({
    
    
    ggplot(data=gg(), aes(x=gg())) +
      geom_histogram( aes(y=..density..,fill=..density..))+
      labs(x="Random variable") +
      geom_density(alpha=.2, color= "blue", fill= "blue")
    
  })
  
  ###################################################################################
  
  output$weibull <- renderPlot({
    
    
    ggplot(data=ww(), aes(x=ww())) +
      geom_histogram( aes(y=..density..,fill=..density..))+
      labs(x="Random variable") +
      geom_density(alpha=.2, color= "blue", fill= "blue")
    
  })
  
  
  ################################################################
  
  output$poisson <- renderPlot({
    
    
    ggplot(data=dd(), aes(x=dd())) +
      geom_histogram( aes(y=..density..,fill=..density..))+
      labs(x="Random variable") +
      geom_density(alpha=.2, color= "blue", fill= "blue")
    
  })
  
  
  output$epoislam <- renderPrint({
    paste("Point Estimation for Lambda is:", round(mean(dd()[,1]),2), "The Actual Value is:", input$poislam , sep = " ")

  })
  
  #################################################################
  
  output$binomial <- renderPlot({
    
    ggplot(data=cc(), aes(x=cc())) +
      geom_histogram( aes(y=..density..,fill=..density..))+
      labs(x="Random variable") +
      geom_density(alpha=.2, color= "blue", fill= "blue")
    
  })
  
  output$ebinop <- renderPrint({
    paste("Point Estimation for p is:", round(mean(cc()[,1]),2)/input$binotrial, "The Actual Value is:", input$binop , sep = " ")
    
  })
  
  
  
  

})