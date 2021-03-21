# Laboratorio sesión III: Samuel D. Restrepo

### Introducción


##### Fijamos el directorio de trabajo #####
setwd("D:/")

#Mostrar los archivos de mi directorio
dir()

##### Buscando ayuda #####

#buscando paqueterias para R: 
# este comando nos manda al repositorio de paquetes

#Menú general
RSiteSearch("")
#Paquete específico
RSiteSearch("tinytex")

#Ayuda para un término especificp
help.search("ols")

## Instalando una libreria #####
install.packages("olsrr")

help.search("olsrr")

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

#Comando para reiniciar R (Importante antes de entregar resultados)
#Se busca replicar los resultados

.rs.restartR()


##### Manejo básico de datos #####

#En R podemos trabajar con objetos, 
#y podemos visualizarlos todos al mismo tiempo.
#para asignar valores en R utilizamos una flecha "<-". 
#La direccion de la flecha es importante: 
a <- 3
5 -> c
a+c

#Comando para ver todos los objetos en la memoria
ls()
#Comando para borrar algun objeto cargado en la memoria
rm(a) 

#Comando para borrar todos los objetos de la memoria
rm(list=ls())

#Generacion de elementos numéricos
g <- 7.5

#Generacion de vectores. 
#En R, todos los vectores se generan como tipo columna, 
#bajo una funcion que "concatena" elementos
f <- c(7.5,6,5)

#Para mostrar el vector f, solo tecleamos su nombre
f

#Podemos hacer tambien operaciones con vectores:

#Números Reales
vectorNumerico1 <- c(1,2,3,4,5,6,7,8,9,10)

#Números Enteros
vectorNumerico2 <- c(1:10)
#Secuencia de números reales empezando en 1 e incrementándose
vectorNumerico3 <- c(seq(1,100,15.5))
#Secuencia de números reales empezando en 100 y disminuyendo
vectorNumerico4 <- c(seq(100,1,-15.5))

#Operaciones
nuevo1 <- vectorNumerico3+vectorNumerico4
nuevo2 <- vectorNumerico1*vectorNumerico2
nuevo3 <- vectorNumerico3*4
nuevo3
#operación que nos arroja advertencia
#(Recordar que una advertencia en R es distinto a un error)
# pero también hay que tener cuidado con las advertencias
nuevo4 <- vectorNumerico1*vectorNumerico3
nuevo4

rm(vectorNumerico3, vectorNumerico4, nuevo1, nuevo3, nuevo2) 

#La funcion c() puede contener cualquier tipo de elementos
h <- c("Macroeconomía Lab, II, gen, 2020")
#Visualizamos la columna creada h
h
#creamos un string (compuesto de palabras)
string1 <- "Estoy aprendiendo a usar R, R Markdown y LaTex"
#Contar el número de caracteres del string creado
nchar(string1)
#Quedándome solo con un pedazo del texto
string2 <- substr(string1, 3,26)
string2
#Asi como con los numeros, tambien podemos tener vectores de strings
vectorString <- c('Estoy', 'aprendiendo', 'a', 
                  'usar', 'R', ',', 'R Markdown', 'y', 'LaTex')
#Número de caracteres de cada palba
nchar(vectorString)

substr(vectorString,1,3)

#Podemos convertir variables numericas en string:
a <- 5
str(a)
a<-toString(a)
# Intentemos sumar 2 strings
a+a
str(a)
#Pasemos a numérica
a<-as.numeric(a)
#Podemos transponer el vector columna
f <- c(7.5,6,5)
F <- t(f)
F
# Limpiemos memoria


#Y tambien crear concatenaciones compuestas
data <- cbind(c(1,2,3),c(7,9879,4))
data

#O crear concatenaciones por filas
datarow <- rbind(c(5,6546,332),c(998,6138,4889))
datarow



#Podemos listar un elemento de un vector, indicandolo explicitamente
f[1]
F[2]
data[1,1]
data[1,]
datarow[1,]

#Generemos la siguiente matriz
ej1 <- rbind(c(1,2,3,4,5,6,7),c(8,9,10,11,12,13,14),c(15,16,17,18,19,20,21))
ej1

#Podemos guardar solo algunas columnas en otro arreglo
subej1 <- ej1[,c(1,3,5)]
subej1

#Podemos remover algunas columnas
subej2 <- ej1[,-c(1,3,5)]
subej2


#Indexado
x <- seq(1, 100, 2)
x

#Del elemento 1 hasta el elemento 5
x[1:5]
#Del elemento 10 hasta el elemento 5
x[10:5]

#Indexado con condicionales
x[x != 9] #De x muestre todos los elementos excepto el 9...
x[x > 20] 

z <- seq(-10, 10, by = .5)
z

z[z < -5 | z > 5]

cond <- (z >= 0 & z <= 5)
cond

z[cond]

#Asignamos una distribucion/valor a una variable
x<-rnorm(5)
x
#Descripcion de la variable x
summary(x)

#Histograma de la variable x
hist(x)

#Asignamos un vector a una variable
age <- c(1,3,5,2,11,9,3,9,12,3)
weight <- c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1)

#Generamos una grafica
plot(age,weight)
density(x)
plot(density(x))

#Mostramos un elemento en particular del vector dando su posicion
age[1]
weight[c(4,12)]
age[3:9]

#Calculamos estadisticas
mean(weight)
sd(weight)
cor(age,weight)

#Matrices
#Desde 1 hasta 20
y <- matrix(1:20, nrow=5, ncol=4)
y

#Creamos una serie de numeros y la guardamos en forma de matrix
cells <-c(654,84,10,9941)
cells

#definimos nombres de filas y columnas
rows <-c("Fila1", "Fila2")
cols <-c("Col1", "col2")
matrix2 <-matrix(cells, nrow=2, ncol=2, byrow=TRUE, dimnames=list(rows, cols))
matrix2

#Guardemos el valorla segunda fila de la matriz y
y
A <- y[2,]
#Guarde de la fila 1 los elementos que aparecen en la colunma 2 hasta 4
C <- y[1,2:4]

#Multiplicación de Matrices (%*% NO CONFUNDIR CON %>% DE LA SESION II)
B <- matrix2%*%matrix2

##### Data frames #####

#Bases de datos con varios tipos de datos: numericos, texto y logicos

###
#Ejemplo 1: cuatro pacientes, tipo de diabetes que sufren, edad y condicion
###
patientID <- c(1, 2, 3, 4)
age <- c(25, 34, 28, 52)
diabetes <- c("Tipo 1", "Tipo 2", "Tipo 1", "Tipo 1")
status <- c("Mal", "Mejor", "Excelente", "Mal")

#creamos el data frame
patientdata <- data.frame(patientID, age, diabetes, status)
# Dos formas de ver nuestro dataframe
patientdata
View(patientdata)

#Mostrar los valores de una variable en particular del data frame
patientdata$age

### Nota de la Tarea ###
library("stargazer")
#De la fila 1 hasta la 4
stargazer(patientdata[1:4,], summary=FALSE, rownames=FALSE)

#Crea una tabla con los datos del frame
table(patientdata$diabetes, patientdata$status)

#Especificamos la variable que identifica casos
patientdata <- data.frame(patientID, age, diabetes, status, row.names=patientID)
patientdata

#Las variables categóricas y ordinales (categoricas con orden) 
#se llaman "Factores" en R.
#Con la funcion factor() podemos almacenar los valores de 
#una variable categorica en vectores de enteros.
#En nuestro ejemplo de diabetes:
diabetes <- c("Tipo 1", "Tipo 2", "Tipo 1", "Tipo 1")
diabetes
diabetes <- factor(diabetes)
diabetes

#Para vectores que representan variable ordinales, agregamos un comando
status <-c("Mal", "Mejor", "Excelente", "Mal")
status
status <- factor(status, ordered=TRUE)
status

#Los valores se asignan en orden alfabetico
#Si queremos cambiarlos entonces escribimos
status <- factor(status, order=TRUE,
                 levels=c("Mal", "Mejor", "Excelente"))
status

###
# Ejemplo 2: 
###
#creemos un dataframe de los alumnos que incluya 4 vectores distintos: 
#edades, nombres, calificaciones y una evaluación subjetiva. 
#Para hacerlo, es necesario instalar y cargar una libreria.
#Aca descargamos e instalamos los paquetes. 
#Esto es necesario hacerlo solo una vez. 
install.packages('tibble') 
#Aca le decimos a R que usaremos este paquete en esta sesion. 
#Cada que abran R o R Studio tienen que poner esta linea. 
library(tibble)
require(tibble) 

edades <- c(19,20,21,22,18,17, 26, 19, 30)
nombres <- c('Pablo','Sebastian','Adriana','Luis','Marcelo','Hilda',
             'Jimena', 'Laura', 'Diego')
calificaciones <- c(100, 36, 88, 56, 94, 66, 89, 78, 85)
calif_sub <-factor(x=c(1,3,2,1,2,3,3,3,1), levels=c(1,2,3), 
                   labels = c('No ponia atencion', "Alumno promedio",
                              "Ponia mucha atencion"))
alumnos <- data.frame(clave = 1:length(edades),
                      edad=edades,nombre=nombres, 
                      calificacion=calificaciones, 
                      tipo_alumno=calif_sub)
# Observamos la estructura de la base de datos
str(alumnos)
# Observamos Primeras 7 filas 
head(alumnos, 7)
# Observamos las últimas filas
tail(alumnos)

#Una vez que los datos son un dataframe, podemos emplear varias funciones. 
#Por ejemplo, la funcion subset nos ayuda a quedarnos 
#con observaciones que cumplan con alguna característica. 
#Supongamos que queremos quedarnos solo con los mayores de edad: 
ME <- subset(alumnos, edad>=18)
ME

#O solo con los mayores de edad que ponian mucha atencion: 
ME_atencion <- subset(alumnos, edad>=18 & tipo_alumno=='Ponia mucha atencion')
ME_atencion
#Finalmente, podemos eliminar columnas asignándoles el valor 'NULL'
ME$tipo_alumno <- NULL
rm(list=ls())

###
# Ejemplo 3: Otra forma de subsetear datos, es seleccionando manualmente 
###
#el número de renglones y columnas que queremos:
#Creemos un dataframe grande, de 100x100

#Muy importante para poder replicar cuando trabajamos con valores aleatorios
set.seed(2021)
data <- as.data.frame(matrix(sample(0:50, 10000, replace=T), nrow=100, ncol=100))
data
View(data)

#Número de columnas de la base de datos
ncol(data)
#Número de filas de la base de datos
nrow(data)
#
length(data)
#Dimensiones
dim(data)

# De la fila 1 hasta la 95
data<-data[c(1:95),]
# Columna 40 hasta el final
data<-data[,c(40:ncol(data))]

data <- data[c(1:20),c(1:30)]

#Podemos hacerlo tambien con el nombre de las columnas
data <- data[, c("V41", "V47", "V54")]
data <- subset(data, V41==30 | V41==5)
data



############################
#Ejemplo Tarea 1 - Año 2020#
###########################


#A)Crear un vector de 20 ingresos permanentes aleatorios  YiP, distribuidos normalmente, con media 10 y varianza Sp.
#Crear 20 vectores (Cada uno de estos representa a una persona) cada uno con 100 observaciones id?nticas del ingreso permanente.
#Graficar (eje x persona, eje y, ingreso permanente)
set.seed(1235)
Matriz_Ingresos_Permanentes<-matrix(data=NA,nrow=100,ncol=20);
for (i in 1:20) {Matriz_Ingresos_Permanentes[,i]<-rnorm(1,10)};
ingresos_permanentes<-c("Yp1","Yp2","Yp3","Yp4","Yp5","Yp6","Yp7","Yp8","Yp9","Yp10",
                        "Yp11","Yp12","Yp13","Yp14","Yp15","Yp16","Yp17","Yp18","Yp19","Yp20");
colnames(Matriz_Ingresos_Permanentes)<-ingresos_permanentes;
observaciones<-c(seq(100));
rownames(Matriz_Ingresos_Permanentes)<-observaciones;
par(mfrow=c(1,1))

Matriz_Ingresos_Permanentes[1,]
plot(Matriz_Ingresos_Permanentes[1,],xlab="individuo",ylab="ingreso permanente")




