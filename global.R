library(shiny)
#library(ggplot2)
#library(miscTools)
library(data.table)
<<<<<<< HEAD
#library(synapseClient)
=======
library(synapseClient)
>>>>>>> 9278b97d239faa0a1e6e002c7ec49ca7ba17633e

#synapseLogin()

#data_source <- "syn4719745"
#data_source <- synGet(data_source)
#data_source <- data_source@filePath

#data_source<-'data/PC3_SS2_Level3.txt'
data_source<-'data/PC3_SS2_Level4.txt'
#data_source<-'./Annotated Data/PC3_SS2_Level3.txt'
#data_source<-'./Annotated Data/PC3_SS2_Level4.txt'

LINCSraw<-fread(data_source)

LINCS<- setnames(LINCSraw,colnames(LINCSraw),make.names(colnames(LINCSraw)))

l_barcode<-unique(LINCS$Barcode)


l_ligand<-paste(unique(LINCS$Ligand), collapse=' ')

l_ecmp<-paste(unique(LINCS$ECMp), collapse=' ')
