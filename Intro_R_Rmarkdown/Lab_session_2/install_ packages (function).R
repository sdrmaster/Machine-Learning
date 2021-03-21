#Función para instalar muchos paquetes al mismo tiempo

install <- function(packages){
  new.packages <- packages[!(packages %in% installed.packages()[, "Package"])]
  if (length(new.packages)) 
    install.packages(new.packages, dependencies = TRUE)
  sapply(packages, require, character.only = TRUE)
}
#Requerimos cierto conjunto de paquetes que necesitamos e.g. 'stargazer' etc.

required.packages <- c('stargazer', 'kableExtra', 'viridis', 'dplyr', 
                       'tidyr', 'ggplot2', 'readr', 'scales', 'quantmod', 'tinytex', 'texreg' )

#Usamos la función creada
install(required.packages)

#cargamos librerías
library(stargazer)
library(kableExtra)
library(viridis)
library(dplyr)
library(tidyr)
library(ggplot2)
library(readr)
library(scales)
library(quantmod)
library(texreg)
library(tinytex)