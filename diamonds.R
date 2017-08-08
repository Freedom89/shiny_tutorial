library(ggplot2)
library(dplyr)
library(tidyr)
library(ranger)

df <- diamonds

# ggplot(df, aes(x=carat,y=price)) + 
#   geom_point(aes(group = cut, color = cut)) 
# 
# ggplot(df, aes(x=carat,y=price)) + 
#   geom_smooth(aes(group = cut, color = cut)) 
# 
# ggplot(df, aes(x=carat,y=price)) + 
#   geom_smooth(aes(group = cut, color = cut),method = 'lm') +
#   theme_bw()

random_forest_model <- ranger(price~. , df, num.trees = 10, importance = 'impurity' , write.forest = TRUE)

random_forest_model$variable.importance

test_sample <- data.frame(carat = 0.23, cut = "Ideal",color = "E",clarity = "SI2",
                          depth = 60.0, table = 55, x = 3, y = 3, z = 2)

# levels(test_sample$cut) <- levels(df$cut)
# levels(test_sample$color) <- levels(df$color)
# levels(test_sample$clarity) <- levels(df$clarity)

predict_value <- predict(random_forest_model,test_sample)$predictions

save.image("shiny_example.RData")
