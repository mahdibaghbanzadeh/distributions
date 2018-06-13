library(shiny)
library(shinydashboard)


shinyUI(

dashboardPage(
  dashboardHeader(title = "Study of Probability Distribution Functions"),
  dashboardSidebar(br(),
                   br(),
                   
                   sidebarMenu
                   ( 
                     #menuItem(text = "Study of PDFs", tabName = "first"),
                     #menuItem(text = "Distributions", icon = icon("dashboard"), tabName = "dists",
                     
                       menuItem(text = "Normal", tabName = "normal", icon= icon("area-chart")),
                       menuItem(text = "Student t", tabName = "tstu", icon= icon("area-chart")),
                       menuItem(text = "Gamma", tabName = "gamma", icon= icon("area-chart")),
                       menuItem(text = "F", tabName = "fdist", icon= icon("area-chart")),
                      menuItem(text = "Chi-Square", tabName = "chi", icon= icon("area-chart")),
                      menuItem(text = "Exponential", tabName = "exp", icon= icon("area-chart")),
                      menuItem(text = "Beta", tabName = "beta", icon= icon("area-chart")),
                      menuItem(text = "Weibull", tabName = "wei", icon= icon("area-chart")),
                      menuItem(text = "Poisson", tabName = "pois", icon= icon("area-chart")),
                      menuItem(text =  "Binomial", tabName = "binom", icon = icon("area-chart"))
                  #   )
                  )
                     
                   ),
  
  
  ##################################################
  
  
  dashboardBody(
    tabItems( 
      
      #tabItem(tabName = "first", h2("Here is what you want to tell and istruct")),
      
      #####################################################################
      
      tabItem(tabName = "normal", h2("PDF Normal Dist"),
              fluidRow(
                box(plotOutput("normal"), 
                    br(),
                    verbatimTextOutput("enormean"),
                    br(),
                    verbatimTextOutput("enorvar"),
                    status = "primary",title="The Normal Distribution Curve", background = "aqua", solidHeader = TRUE, width = 8),
                box(title = "Control the Parameters of the Normal Density Function",width = 4,status = "warning", background = "lime",
                  sliderInput("normean", label = "Specify the Mean Value", min = -100, max = 100, value = 0),
                  sliderInput("norvar", label = "Specify the Variance Value", min = 1, max = 100, value = 1),
                  sliderInput("norn", label = "Sample Volume",min = 50, max = 1000, step = 100, value = 100, animate = animationOptions(interval= 2000, loop = TRUE)),
                
                  textInput(inputId ="pnorm",label = "F(x)=P(X<=x)",value =  2  ),
                  br(),
                  actionButton("actionnormal","Calculate The Probability" ),
                  br(),br(),
                  verbatimTextOutput("pnorm"))
                
              )
              
              
              ),
      
      #####################################################################
      
      tabItem(tabName = "tstu", h2("PDF Student t Dist"),
              fluidRow(
                box(plotOutput("tstudent"), status = "primary",title="The Student t Distribution Curve", background = "aqua", solidHeader = TRUE, width = 8),
                box(title = "Control the Parameter of the Student t Density Function",width = 4,status = "warning", background = "lime",
                    sliderInput("tdf", label = "Specify the Degree of Freedom Value", min = 1, max = 100, value = 1),
                    
                    sliderInput("tn", label = "Sample Volume",min = 50, max = 1000, step = 100, value = 100, animate = animationOptions(interval= 2000, loop = TRUE)),
                
                    textInput(inputId ="pt",label = "F(x)=P(X<=x)",value =  2  ),
                    br(),
                    actionButton("actiont","Calculate The Probability" ),
                    br(),br(),
                    verbatimTextOutput("pt")
                    
                    )
              )
              
              
      ),
      
      
      
      ###############################################################
      
      tabItem(tabName = "gamma", h2("PDF Gamma Dist"),
              fluidRow(
                box(plotOutput("gamma"),  status = "primary",title="The Gamma Distribution Curve", background = "aqua", solidHeader = TRUE, width = 8),
                box(title = "Control the Parameters of the Gamma Density Function",width = 4,status = "warning", background = "lime",
                    sliderInput("grate", label = "Specify the Rate Value", min = 1, max = 100, value =1),
                    sliderInput("gshape", label = "Specify the Shape Value", min = 1, max = 100, value = 1),
                    sliderInput("gn", label = "Sample Volume",min = 50, max = 1000, step = 100, value = 100, animate = animationOptions(interval= 2000, loop = TRUE))
                )
              )
              
              
      ),
      ###############################################################
      
      tabItem(tabName = "fdist", h2("PDF F Dist"),
              fluidRow(
                box(plotOutput("fdist"),  status = "primary",title="The F Distribution Curve", background = "aqua", solidHeader = TRUE, width = 8),
                box(title = "Control the Parameters of the F Density Function",width = 4,status = "warning", background = "lime",
                    sliderInput("fv1", label = "Specify the First DF Value", min = 1, max = 100, value =1),
                    sliderInput("fv2", label = "Specify the Second DF Value", min = 1, max = 100, value = 1),
                    sliderInput("fn", label = "Sample Volume",min = 50, max = 1000, step = 100, value = 100, animate = animationOptions(interval= 2000, loop = TRUE))
                )
              )


      ),

      ##############################################################
      
      tabItem(tabName = "chi", h3("PDF chi-square"),
              
              br(),
             
               fluidRow(
                
                 box(plotOutput("chi"),verbatimTextOutput("echimean"), status = "primary",title="The Chi-Square Distribution Curve", background = "aqua", solidHeader = TRUE, width = 8),
                
                 box(title = "Control the Parameters of the Chi-Square Density Function",width = 4,status = "warning", background = "lime",
                     sliderInput("chinu", label = "Specify the Degree of Freedom Value", min = 1, max = 100, value = 1),
                    
                     sliderInput("chin", label = "Sample Volume",min = 50, max = 1000, step = 100, value = 100, animate = animationOptions(interval= 2000, loop = TRUE))
                 ))),
      
      
      ##############################################################
      
      tabItem(tabName = "exp", h3("PDF Exponential"),
              
              br(),
              
              fluidRow(
                
                box(plotOutput("exp"),verbatimTextOutput("eexpmean"), status = "primary",title="The Exponential Distribution Curve", background = "aqua", solidHeader = TRUE, width = 8),
                
                box(title = "Control the Parameter of the Exponential Density Function",width = 4,status = "warning", background = "lime",
                    sliderInput("explam", label = "Specify the Rate Value", min = 1, max = 100, value = 1),
                    
                    sliderInput("expn", label = "Sample Volume",min = 50, max = 1000, step = 100, value = 100, animate = animationOptions(interval= 2000, loop = TRUE))
                ))),
      
      ##############################################################
      
      tabItem(tabName = "beta", h3("PDF Beta"),
              
              br(),
              
              fluidRow(
                
                box(plotOutput("beta"), status = "primary",title="The Beta Distribution Curve", background = "aqua", solidHeader = TRUE, width = 8),
                
                box(title = "Control the Parameters of the Beta Density Function",width = 4,status = "warning", background = "lime",
                    sliderInput("beta1", label = "Specify the First Parameter", min = 1, max = 100, value = 1),
                    sliderInput("beta2", label = "Specify the Second Parameter", min = 1, max = 100, value = 1),
                    sliderInput("betan", label = "Sample Volume",min = 50, max = 1000, step = 100, value = 100, animate = animationOptions(interval= 2000, loop = TRUE))
                ))),
      
      ##############################################################
      
      tabItem(tabName = "wei", h3("PDF Weibull"),
              
              br(),
              
              fluidRow(
                
                box(plotOutput("weibull"), status = "primary",title="The Weibull Distribution Curve", background = "aqua", solidHeader = TRUE, width = 8),
                
                box(title = "Control the Parameters of the Weibull Density Function",width = 4,status = "warning", background = "lime",
                    sliderInput("wshape", label = "Specify the Shape Parameter", min = .2, max = 10,step = .1, value = 1),
                    sliderInput("wscale", label = "Specify the Sclae Parameter", min = 1, max = 10, value = 1),
                    sliderInput("wn", label = "Sample Volume",min = 50, max = 1000, step = 100, value = 100, animate = animationOptions(interval= 2000, loop = TRUE))
                ))),
      
      
      
      #################################################################
      
      
      tabItem(tabName = "pois", h3("PDF Poisson Dist"),
              
              br(),
              
              fluidRow(
                
                box(plotOutput("poisson"),verbatimTextOutput("epoislam"), status = "primary",title="The poisson Distribution Curve", background = "aqua", solidHeader = TRUE, width = 8),
                
                box(title = "Control the Parameters of the Poisson Density Function",width = 4,status = "warning", background = "lime",
                    sliderInput("poislam", label = "Specify the Lambda Value", min = 1, max = 100, value = 5),
                    
                    sliderInput("poisn", label = "Sample Volume",min = 50, max = 1000, step = 100, value = 100, animate = animationOptions(interval= 2000, loop = TRUE))
                ))),
      
      
      ##################################################################################
      
      tabItem(tabName = "binom", h3("PDF Binomial Dist"),
              
              br(),
              
              fluidRow(
                
                box(plotOutput("binomial"),verbatimTextOutput("ebinop"), status = "primary",title="The Binomial Distribution Curve", background = "aqua", solidHeader = TRUE, width = 8),
                
                box(title = "Control the Parameters of the Binomial Density Function",width = 4,status = "warning", background = "lime",
                    sliderInput("binop", label = "Specify the Probability Value", min = 0.1, max = 1, value = .5),
                    sliderInput("binotrial", label = "Specify the Number of Trials", min = 1, max = 100, value = 20),
                    sliderInput("binon", label = "Sample Volume",min = 50, max = 1000, step = 100, value = 100, animate = animationOptions(interval= 2000, loop = TRUE))
                )))
      
      
    ))
))