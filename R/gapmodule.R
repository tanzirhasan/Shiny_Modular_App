gapModuleUI <- function(id){
  tagList(
    plotOutput(NS(id,"plot")),
    sliderInput(NS(id,"year"),"Select Year", value = 1952,
                min= 1952,max = 2007,step = 5,
                animate = animationOptions(interval = 500))
  )
}



# Server module for the app

gapModuleServer <-function(id,data){
  moduleServer(id,function(input,output,session){
  # collect one year of data
  ydata = reactive({
    filter(data, year ==input$year)
  })

  xrange <-range(data$gdpPercap)
  yrange <- range(data$lifeExp)
  output$plot <- renderPlot({
    # draw the background plot with legend
    plot(data$gdpPercap,data$lifeExp, type = "n",
         xlab = "GDP per capita", ylab = "Life Expectancy",
         panel.first = {
           grid()
           text(mean(xrange),mean(yrange),input$year,
                col = "grey90",cex = 5)
         })


legend("bottomright",legend = levels(data$continent),
       cex =1.3,inset = 0.01,text.width = diff(xrange)/5,
       fill= c("#E41A1C99", "#377EB899", "#4DAF4A99",
               "#984EA399", "#FF7F0099"))

# Determine bubble colors
cols <-c(

  "Africa" = "#E41A1C99",
  "Americas" = "#377EB899",
  "Asia" = "#4DAF4A99",
  "Europe" = "#984EA399",
  "Oceania" = "#FF7F0099"

)[ydata()$continent]

# add bubble

symbols(ydata()$gdpPercap, ydata()$lifeExp,circles = sqrt(ydata()$pop),
        bg=cols,inches = 0.5,fg ="white",add = TRUE)

  })
  })
}



