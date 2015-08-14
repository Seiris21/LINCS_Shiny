library(shiny)
library(ggplot2)
#library(miscTools)
library(data.table)
<<<<<<< HEAD
library(scales)
=======
>>>>>>> 9278b97d239faa0a1e6e002c7ec49ca7ba17633e

shinyServer(function(input, output) {
     #observeEvent(input$reset,{updateTextInput(session,ligand,value=l_ligand)})
     
     #Subset Data by Barcode (Reactive?)
     plateSubset <- reactive({
#          print(input$barcodes)
#          if(length(input$barcodes)!=0){
#               df_LINCS <- subset(LINCS, Barcode %in% input$barcodes)
#          }else{
#               df_LINCS <- LINCS
#          }
<<<<<<< HEAD
          
          print(input$ligand)
          ligand <- strsplit(input$ligand,' ')[[1]]
          df_LINCS <- subset(LINCS, Ligand %in% ligand)
          print(input$ecmp)
          ecmp <- strsplit(input$ecmp, ' ')[[1]]
          df_LINCS <- subset(df_LINCS, ECMp %in% ecmp)
          if(length(input$barcodes)!=0){
               df_LINCS <- subset(LINCS,Barcode %in% l_barcode)
          }
=======
          if(length(input$barcodes)!=0){
               df_LINCS <- subset(LINCS,Barcode %in% l_barcode)
          }
          print(input$ligand)
          ligand <- strsplit(input$ligand,' ')[[1]]
          df_LINCS <- subset(df_LINCS, Ligand %in% ligand)
          print(input$ecmp)
          ecmp <- strsplit(input$ecmp, ' ')[[1]]
          df_LINCS <- subset(df_LINCS, ECMp %in% ecmp)
>>>>>>> 9278b97d239faa0a1e6e002c7ec49ca7ba17633e
          
          
          #df_LINCS<-subset(df_LINCS, Ligand %in% )
          #print(names(df_LINCS))
          return (df_LINCS)
     })
     
     output$plot <- renderPlot({
          
          df_LINCS<-plateSubset()
#          #Subset that DF by Well
#          df_data<-df_LINCS[df_LINCS$Well=="A01"&(1 %in% input$wells)|
#                                df_LINCS$Well=="A02"&(2 %in% input$wells)|
#                                df_LINCS$Well=="A03"&(3 %in% input$wells)|
#                                df_LINCS$Well=="A04"&(4 %in% input$wells)|
#                                df_LINCS$Well=="B01"&(5 %in% input$wells)|
#                                df_LINCS$Well=="B02"&(6 %in% input$wells)|
#                                df_LINCS$Well=="B03"&(7 %in% input$wells)|
#                                df_LINCS$Well=="B04"&(8 %in% input$wells),]
          p <- ggplot(df_LINCS,aes_string(x=input$x,y=input$y)) + theme(axis.text.x=element_text(angle=90,vjust=.05,size=input$x_txt_size),axis.text.y=element_text(angle=0,vjust=.05,size=input$y_txt_size))
          
<<<<<<< HEAD
          x_val<-df_LINCS[,get(input$x)][1]
          print(x_val)
          if(is.numeric(x_val)==TRUE){
               print('x numeric')
               if(input$xlim_min!=-1){
                    if(input$xlim_max!=-1){
                         p <- p + xlim(input$xlim_min,input$xlim_max)
                    }else{
                         p <- p + xlim(input$xlim_min,NA)
                    }
               }else{
                    if(input$xlim_max!=-1){
                         p <- p + xlim(NA, input$xlim_max)
                    }else{
                         p <- p
                    }
               }
               
          }
          
          y_val<-df_LINCS[,get(input$y)][1]
          if(is.numeric(y_val)==TRUE){
               print('y numeric')
               if(input$ylim_min!=-1){
                    if(input$ylim_max!=-1){
                         p <- p + ylim(input$ylim_min,input$ylim_max)
                    }else{
                         p <- p + ylim(input$ylim_min,NA)
                    }
               }else{
                    if(input$ylim_max!=-1){
                         p <- p + ylim(NA, input$ylim_max)
                    }else{
                         p <- p
                    }
               }
               
          }

               
          
=======
>>>>>>> 9278b97d239faa0a1e6e002c7ec49ca7ba17633e
          if (input$plot_type=='scatter'){
               p <- p + geom_point(size=input$size_spot, alpha=input$density)
          }
          if (input$plot_type=='boxplot'){
<<<<<<< HEAD
               #input_x<-as.name(input$x)
               #print(input_x)
               p <- p + geom_boxplot()
=======
               input_x<-as.name(input$x)
               print(input_x)
               p <- p + geom_boxplot(factor=x)
>>>>>>> 9278b97d239faa0a1e6e002c7ec49ca7ba17633e
          }
          #facet_wrap(~Well,ncol=4)
          if(input$facet_method==TRUE){
               facet_split<-paste(input$facet_row,'~',input$facet_column)
               if(facet_split!='. ~ .'){
                    p <- p + facet_grid(facet_split)    
               }
          }
          if(input$facet_method==FALSE){
               # facet_wrap requires a formula object
               facet_split<-as.formula(paste('~',input$facet_column))
               if(input$facet_column!='.'){
                    p <- p + facet_wrap(facet_split,ncol=4)
               }
          }
               
          if(input$line==TRUE){
               p <- p + geom_smooth(method='loess',span=input$span)
          }
          if(input$xlog==TRUE){
<<<<<<< HEAD
               p <- p + scale_x_continuous(trans=log2_trans(),
                                           breaks=trans_breaks('log2',function(x) 2^x),
                                           labels=trans_format('log2',math_format(2^.x)))
          }
          if(input$ylog==TRUE){
               p <- p + scale_y_continuous(trans=log2_trans(),
                                           breaks=trans_breaks('log2',function(x) 2^x),
                                           labels=trans_format('log2',math_format(2^.x)))    
=======
               p <- p + scale_x_log10()
          }
          if(input$ylog==TRUE){
               p <- p + scale_y_log10()    
>>>>>>> 9278b97d239faa0a1e6e002c7ec49ca7ba17633e
          }
          
          if (input$color!='None'){
               p <- p + aes_string(color=input$color)
          }
          
          #theme(axis.text.x=element_text(angle=90,vadjust.05,size=12))
          #scale_colour_brewer(palette="Set1")
          print(p)
          
<<<<<<< HEAD
     }, width=1150,height=725)
=======
     }, width=1200,height=725)
>>>>>>> 9278b97d239faa0a1e6e002c7ec49ca7ba17633e
})

