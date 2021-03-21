#PRIMER LABORATORIO(INTRODUCCIÓN RSTUDIO)

#Instalando paquetes(quitar el numeral para instalar dplyr en la linea 2)
# install.packages("dplyr")
# Determinamos nuestro directorio de trabajo
setwd("C:/Users/52556/Desktop/Lab Intro")
#Cargar librerias
library("ggplot2")
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)
library(quantmod)
#recordar que deben instalar knitr
library(knitr)

#Cargamos base de datos
TLPR <- read.csv(file = 'predictionridge.csv')

#generamos un valor, en este caso la fecha
date <- seq(as.Date("2005/1/1"), as.Date("2016/9/30"), by = "quarter")

#Creamos base de datos
ridge<-cbind(TLPR, date)
df <- ridge %>%
  select(date, Oficial, Ridge) %>%
  gather(key = "Método", value = "value", -date)

Ridger <- ggplot(df, aes(x = date, y = value)) +
  scale_color_manual(values = c("#00AFBB", "#E7B800")) +
  geom_line(aes(color = Método), size = 1) +
  theme_minimal() +
  xlab('Periodo') +
  ylab('Pobreza')

#Ploteamos los datos
plot(Ridger)