library(shiny)
ui<-fluidPage(titlePanel(title), theme=shinytheme("cerulean"), d3heatmapOutput("heatmap", height="800px", width="80%"))

server <- function(input, output, session) { 
    output$heatmap <- renderD3heatmap({d3heatmap(clinical_data_matrix, Rowv=NA, Colv=NA, col=brewer.pal(9,"Reds"), 
                                                 scale="none", RowSideColors=country_colours, cellnote=clinical_data, 
                                                 labRow=project_codes, xaxis_font_size=10, 
                                                 yaxis_font_size=10, height=900)})}

shinyApp(ui=ui,server=server)