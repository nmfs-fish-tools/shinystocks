library(shiny)
config <- jsonlite::read_json("mas_s1_config.json")

inputTabServer <- function(id, inputType, listComponent){
  moduleServer(
    id,
    function(input, output, session){
      tabReturn <- reactive({
       
      })
      return(tabReturn)
    }
  )
}

inputTabUI <- function(id, listComponent){
  par <- div(id=paste(id,"div",sep=""))
  for(i in seq_len(length(listComponent))){
    if(length(listComponent[[i]])==1){
      par <- shiny::tagAppendChild(par, textInput(inputId=paste(id,names(listComponent)[i],sep=""),
                                                  label = names(listComponent)[i],
                                                  value = listComponent[[i]]))
    }
  }
  par
}

# Define UI for miles per gallon app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Generate config for stock assessment models"),
  
  # Div panel for config ----
  tabsetPanel(
    tabPanel("main",inputTabUI("main",config)),
    tabPanel("area", inputTabUI("area",config[["area"]])),
    tabPanel("recruitment", inputTabUI("recruitment",config[["recruitment"]])),
    tabPanel("growth", inputTabUI("growth",config[["growth"]])),
    tabPanel("natural mortality", inputTabUI("natural_mortality",config[["natural_mortality"]])),
    tabPanel("fishing mortality", inputTabUI("fishing_mortality",config[["fishing_mortality"]])),
    tabPanel("selectivity", inputTabUI("selectivity",config[["selectivity"]])),
    tabPanel("likelihood component", inputTabUI("likelihood_component",config[["likelihood_component"]])),
    tabPanel("fleet", inputTabUI("fleet",config[["fleet"]])),
    tabPanel("survey", inputTabUI("survey",config[["survey"]])),
 
  actionButton("submit", "Enter", class="btn-primary")
  ),
  )
  # Main panel for displaying outputs ----

# Define server logic to plot various variables against mpg ----
server <- function(input, output) {
  
}

shinyApp(ui, server)