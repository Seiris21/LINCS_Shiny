library(shiny)

# Define UI 
shinyUI(fluidPage(
     titlePanel("LINCS Explorer"),
     
     fluidRow(
          column(3,
               #textInput('filesource',label=h3("File Source"), value="/data/PC3_SS2_CellSpotAnn.txt"),
               selectInput('x', 
                           'X', 
                           names(LINCS),
                           selected = "LigandAnnotID"),
               selectInput('y',
                           'Y', 
                           names(LINCS),
                           selected="EdUPositiveProportion"),
               selectInput('plot_type',
                           label='Plot Type',
                           choices=list('Scatter'='scatter','Boxplot'='boxplot'),
                           selected='boxplot'),
               selectInput('color',
                           label='Color',
                           choices=c('None', names(LINCS)),
                           selected='ECMp')
#               checkboxGroupInput('barcodes',
#                                  label='Select Barcode',
#                                  choices=l_barcode,
#                                  inline=TRUE,
#                                  selected=l_barcode[1]
#               ),
#               checkboxGroupInput('wells',
#                                  label='Select Wells',
#                                  choices=list('A01'=1,
#                                               'A02'=2,
#                                               'A03'=3,
#                                               'A04'=4,
#                                               'B01'=5,
#                                               'B02'=6,
#                                               'B03'=7,
#                                               'B04'=8),
#                                  inline=TRUE,
#                                  selected= c(1,2,3,4,5,6,7,8))
               ),
          column(3,
<<<<<<< HEAD
#                 textInput('ecmptxt',
#                           label='All proteins',
#                           value=l_ecmp),
                 h5('All ECMp'),
                 tags$textarea(id='ecmptxt',
                               rows=2,
                               cols=32,
                               readonly='readonly',
                               l_ecmp),
                 h5('Included ECMp:'),
                 tags$textarea(id='ecmp',
                               rows=5,
                               cols=32,
                               'Copy desired ECMp from textbox above. Include a space between ECMp'
                               #l_ecmp
                 ),
                 
                 #helpText('Current available Ligands:'),
                 #helpText(l_ligand),
                 #textInput('ligtxt',
                 #          label='All Ligands',
                 #          value=l_ligand),
                 h5('All Ligands'),
                 tags$textarea(id='ligtxt',
                               rows=2,
                               cols=32,
                               readonly='readonly',
                               l_ligand),
                 h5('Included Ligand:'),
                 tags$textarea(id='ligand',
                               rows=5,
                               cols=32,
                               'Copy desired Ligands from textbox above. Include a space between ligands.'
                               #l_ligand
                               )

                 
          ),
          column(2,
=======
>>>>>>> 9278b97d239faa0a1e6e002c7ec49ca7ba17633e
                 sliderInput('span', 
                             'Local Regression Span', 
                             min=0, 
                             max=1,
                             value=1, 
                             step=.01),
                 checkboxInput('line',
                               label='Best Fit Line (method: LOESS)',
                               value=FALSE),
                 checkboxInput('xlog',
                               label='Log X Axis',
                               value=FALSE),
                 checkboxInput('ylog',
                               label='Log Y Axis',
                               value=FALSE),
                 selectInput('facet_method',
                             label='Facet Method:',
<<<<<<< HEAD
                             choices=list('facet_wrap (col only, 4col/row)'=FALSE,
=======
                             choices=list('facet_wrap (only by col, 4 col/row)'=FALSE,
>>>>>>> 9278b97d239faa0a1e6e002c7ec49ca7ba17633e
                                          'facet_grid (facet by row and col)' =TRUE),
                             selected = FALSE
                 ),
                 selectInput('facet_row',
                             label='Facet Row by:',
                             choices=c('None'='.',names(LINCS)),
                             selected = '.'
                 ),
                 selectInput('facet_column',
                             label='Facet Column by:',
                             choices=c('None'='.',names(LINCS)),
                             selected='.'
                 )
          ),
<<<<<<< HEAD

          column(2,
                 numericInput('xlim_min',
                              'X minimum (-1 for automatic)',
                              value=-1,
                              step=1
                              ),
                 numericInput('xlim_max',
                              'X maximum (-1 for automatic)',
                              value=-1,
                              step=1
                 ),
                 numericInput('ylim_min',
                              'Y minimum (-1 for automatic)',
                              value=-1,
                              step=1
                 ),
                 numericInput('ylim_max',
                              'Y maximum (-1 for automatic)',
                              value=-1,
                              step=1
                 )
                 
          ),

=======
          column(3,
#                 textInput('ecmptxt',
#                           label='All proteins',
#                           value=l_ecmp),
                 h5('All ECMp'),
                 tags$textarea(id='ecmptxt',
                               rows=2,
                               cols=36,
                               readonly='readonly',
                               l_ecmp),
                 h5('Included ECMp:'),
                 tags$textarea(id='ecmp',
                               rows=5,
                               cols=36,
                               'Copy desired ECMp from textbox above. Include a space between ECMp'
                               #l_ecmp
                 ),
                 
                 #helpText('Current available Ligands:'),
                 #helpText(l_ligand),
                 #textInput('ligtxt',
                 #          label='All Ligands',
                 #          value=l_ligand),
                 h5('All Ligands'),
                 tags$textarea(id='ligtxt',
                               rows=2,
                               cols=36,
                               readonly='readonly',
                               l_ligand),
                 h5('Included Ligand:'),
                 tags$textarea(id='ligand',
                               rows=5,
                               cols=36,
                               'Copy desired Ligands from textbox above. Include a space between ligands.'
                               #l_ligand
                               )

                 
          ),
>>>>>>> 9278b97d239faa0a1e6e002c7ec49ca7ba17633e
          column(2,

                 sliderInput('size_spot', 
                             'Scatterplot Spot Size', 
                             min=0, 
                             max=10,
                             value=2, 
                             step=.1),
<<<<<<< HEAD
#                 sliderInput('density', 
#                             'Spot Density', 
#                             min=0, 
#                             max=1,
#                             value=.5, 
#                             step=.01),
                 selectInput('density',
                             'Spot Density',
                             choices=c('100%'=1,'75%'=.75,'50%'=.5,'25%'=.25),
                             selected=.75
                             ),
#                 sliderInput('x_txt_size',
#                             'X Axis Font',
#                             min=1,
#                             max=18,
#                             value=8,
#                             step=1
#                 ),
#                 sliderInput('y_txt_size',
#                             'Y Axis Font',
#                             min=1,
#                             max=18,
#                             value=8,
#                             step=1
#                 ),
                 selectInput('x_txt_size',
                             'X Axis Font',
                             choices=c('Large'=12,'Medium'=10,'Small'=8),
                             selected=10
                             ),
                 selectInput('y_txt_size',
                             'Y Axis Font',
                              choices=c('Large'=12,'Medium'=10,'Small'=8),
                              selected=10
                             ),


=======
                 sliderInput('density', 
                             'Spot Density', 
                             min=0, 
                             max=1,
                             value=.5, 
                             step=.01),
                 sliderInput('x_txt_size',
                             'X Axis Font',
                             min=1,
                             max=18,
                             value=8,
                             step=1
                 ),
                 sliderInput('y_txt_size',
                             'Y Axis Font',
                             min=1,
                             max=18,
                             value=8,
                             step=1
                 ),
>>>>>>> 9278b97d239faa0a1e6e002c7ec49ca7ba17633e
                 submitButton(
                              text='Render Plot',
                              icon=NULL
                              )
                 
          ),
     br(),
     mainPanel(
               plotOutput('plot')
               )
     )
     
     
))