library(shiny)
library(ggplot2)
#library(miscTools)
library(data.table)

shinyServer(function(input, output) {
     #observeEvent(input$reset,{updateTextInput(session,ligand,value=l_ligand)})
     
     #Subset Data by Barcode (Reactive?)
     plateSubset <- reactive({
#          print(input$barcodes)
#          if(input$barcodes!='No Option'){
#               df_LINCS <- subset(LINCS, Barcode %in% input$barcodes)
#          }else{
#               df_LINCS <- LINCS
#          }
          df_LINCS <- subset(LINCS,Barcode %in% l_barcode)
          
          print(input$ligand)
          ligand <- strsplit(input$ligand,' ')[[1]]
          df_LINCS <- subset(df_LINCS, Ligand %in% ligand)
          print(input$ecmp)
          ecmp <- strsplit(input$ecmp, ' ')[[1]]
          df_LINCS <- subset(df_LINCS, ECMp %in% ecmp)
          
          
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
          p <- ggplot(df_LINCS,aes_string(x=input$x,y=input$y)) +theme(axis.text.x=element_text(angle=90,vjust=.05,size=input$x_txt_size),axis.text.y=element_text(angle=0,vjust=.05,size=input$y_txt_size))
          
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
               p <- p + facet_wrap(facet_split,ncol=4)
          }
               
          if(input$line==TRUE){
               p <- p + geom_smooth(method='loess',span=input$span)
          }
          if(input$xlog==TRUE){
               p <- p + scale_x_log10()
          }
          if(input$ylog==TRUE){
               p <- p + scale_y_log10()    
          }
          if (input$plot_type=='scatter'){
               p <- p + geom_point(size=input$size_spot, alpha=input$density)
          }
          if (input$plot_type=='boxplot'){
               p <- p + geom_boxplot(aes(factor=Well))
          }
          if (input$color!='None'){
               p <- p + aes_string(color=input$color)
          }
          
          #theme(axis.text.x=element_text(angle=90,vadjust.05,size=12))
          #scale_colour_brewer(palette="Set1")
          print(p)
          
     }, width=1200,height=725)
})

