library(shiny)
inputs <- jsonlite::read_json("mas_s1_config.json")

traverse_objects <- function(x){
  
  if(length(x)!=1){
    traverse_objects(x)
  } else {
    return(x)
  }
}


# Define UI for miles per gallon app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Generate inputs for stock assessment models"),
  
  # Div panel for inputs ----
  tabsetPanel(id="tabs", 
              tabPanel("main",
  par <- div(id="input"),
  tablist <- vector("list"),
    for(i in seq_len(length(inputs))){
      if(length(inputs[[i]])==1){
      par <- shiny::tagAppendChild(par, textInput(inputId=paste("input",i,sep=""),
                                                  label = names(inputs)[i],
                                                  value = inputs[[i]]))
      } else{
        tablist[[names(inputs)[i]]] <- tabPanel(names(inputs)[i],"hi")
      }
    },
    par,
  actionButton("submit", "Enter", class="btn-primary")
  ),
  for(j in seq_len(length(tablist))){
    insertTab(names(tablist)[j],"This is a tab")
  }
  ))
  # Main panel for displaying outputs ----

# Define server logic to plot various variables against mpg ----
server <- function(input, output) {
  
}

shinyApp(ui, server)