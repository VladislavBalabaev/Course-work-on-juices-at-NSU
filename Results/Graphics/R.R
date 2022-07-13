library(readxl) #to read xlsx file

Data <- read.csv("C:/NSU/Econometrics/Works/1. Juices at NSU/Results/For images/test_468496.csv")

library(anytime)

Data$date = anytime(Data$date)

library(ggplot2) #to create graphs
library(plotly) #for the quality of graphs
library(dplyr)
library(RColorBrewer)

s = 1.4
a = 0.7

ggplotly(
  ggplot(data = Data) +
    
    geom_line(
      aes(x = date, y = Actual, colour = "Фактическое"), size = 0.5) +
    geom_point(aes(x = date, y = Actual, colour = "Фактическое"), size = 1.1) +
    
    
    geom_line(aes(x = date, y = Poisson, colour = "Poisson"), size = s, alpha = a) +
    
    
    geom_line(aes(x = date, y = NegBin.II, colour = "NegBin II"), size = s, alpha = a) +
    
    
    geom_line(aes(x = date, y = ZIP, colour = "ZIP"), size = s, alpha = a) +
    

    geom_line(aes(x = date, y = Discount, colour = "Скидка"), size = 1.5) +
    
    
    scale_colour_manual("",
                        breaks = c("Фактическое", "Poisson", "NegBin II", "ZIP", "Скидка"),
                        values = c("black", "#9F3ED5", "#6A48D7", "#FF6440", '#FFFF00')) +
    labs(title = "Результаты моделей раздела 2.1. на тестовой выборке SKU 468496",
         y = "Количество продаж в день",
         x = ""
    ) + theme_bw() + 
    theme(plot.title = element_text(size = 30, hjust = 0.5),
          plot.subtitle = element_text(size = 26),
          text = element_text(family = "Baskerville", size = 22),
          axis.text = element_text(family = "Baskerville", size = 16,
                                   color = "black"))
)

ggplotly(
  ggplot(data = Data) +
    
    geom_line(
      aes(x = date, y = Actual, colour = "Фактическое"), size = 0.5) +
    geom_point(aes(x = date, y = Actual, colour = "Фактическое"), size = 1.1) +
    
    
    geom_line(aes(x = date, y = Random.Forest, colour = "Random Forest"), size = s, alpha = a) +
    
    
    geom_line(aes(x = date, y = GBDT, colour = "GBDT"), size = s, alpha = a) +
    
    
    geom_line(aes(x = date, y = Discount, colour = "Скидка"), size = 1.5) +
    
    
    scale_colour_manual("",
                        breaks = c("Фактическое","Random Forest", "GBDT", "Скидка"),
                        values = c("black","#7109AA", "#CD0074", '#FFFF00')) +
    labs(title = "Результаты моделей раздела 2.2. на тестовой выборке SKU 468496",
         y = "Количество продаж в день",
         x = ""
    ) + theme_bw() + 
    theme(plot.title = element_text(size = 30, hjust = 0.5),
          plot.subtitle = element_text(size = 26),
          text = element_text(family = "Baskerville", size = 22),
          axis.text = element_text(family = "Baskerville", size = 16,
                                   color = "black"))
)
