
shinyServer(function(input, output, session) {
  
  output$ggplot_id <- renderPlot({
    x <- input$x_axis
    y <- input$y_axis
    
    method <- input$method_choice
    
    grouping <- input$grouping
    temp_plot <- ggplot(df, aes_string(x=x,y=y)) 
    
    if(grouping == "NIL"){
      temp_plot = temp_plot +
        geom_smooth(method = method) +
        theme_bw() + 
        labs(x = x, y = y)
      return(temp_plot)
    }else{
      temp_plot = temp_plot +
        geom_smooth(method = method , aes_string(color = grouping, group = grouping)) +
        theme_bw() + 
        labs(x = x, y = y)
      return(temp_plot)
    }

  })
  
  
  output$raw_print <- renderPrint({
    test_sample <- data.frame(carat = input$carat_id,
                              cut = input$cut_id,
                              color = input$color_id,
                              clarity = input$clarity_id,
                              depth = input$depth_id, 
                              table = input$table_id,
                              x = input$x_id,
                              y = input$y_id,
                              z = input$z_id)
    
    output <- predict(random_forest_model, test_sample)
    print(output$predictions)
    
  })
  
})
