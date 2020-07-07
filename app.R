library(shiny)
inputs <- list(load("example.RData"))
inputs <- inputs[[1]][-grep(".",inputs[[1]], fixed=TRUE)]


traverse_objects <- function(x){
  if(typeof(get(x))!="S4"){
    return(get(x))
  } else if(typeof(get(x))=="list"){
    return(names(x))
  }
}


in_list <- purrr::map(inputs, traverse_objects)
names(in_list) <- inputs

# Define UI for miles per gallon app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Generate inputs for stock assessment models"),
  
  # Div panel for inputs ----
  
    par <- div(id="input"),
    for(i in seq_len(length(inputs))){
      par <- shiny::tagAppendChild(par, textInput(inputId=paste("input",i,sep=""),inputs[[i]]))
    },
    par,
  actionButton("submit", "Enter", class="btn-primary")
  )
  # Main panel for displaying outputs ----

# Define server logic to plot various variables against mpg ----
server <- function(input, output) {
  
}

shinyApp(ui, server)