

shinyServer(function(input, output, session) {
  
  output$ggplot_id <- renderPlot({
    x <- input$x_axis
    y <- input$y_axis
    
    ggplot(df, aes_string(x=x,y=y)) + geom_smooth() +
      theme_bw() + 
      labs(x = x, y = y)
    
  })
  
})
