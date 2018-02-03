#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(devtools)
install_github("arilamstein/choroplethrCaCensusTract@v1.2.0")
library(choroplethrCaCensusTract)
library(tidyverse)


df.tracts<-read_csv('tracts.csv')
#drop blank row
df.tracts = df.tracts[-1,]
#create 'region' with ID
df.tracts$region<-df.tracts$geoid
# rent/income ratio starts out as headcount,for different percents. _010 is 50%+
# turn into fraction population
df.tracts$value<-(df.tracts$B25070_010/df.tracts$B01001_001)
regexp <- "[[:digit:]]+"

ca_tract_choropleth(df.tracts,
                    title       = "Fraction Households Paying %50+ of Income as Rent\n San Francisco Census Tracts",
                    legend      = "Fraction",
                    county_zoom = 6075) + coord_map()

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("California's Housing Crisis"),
   includeMarkdown("include.md"),
   
   fluidRow(
     column(6, align="left", selectInput(inputId = "county1", label = "Choose a county to zoom in on:",
               list (`counties`=c("	1	Alameda County	"	,
                                "	3	Alpine County	"	,
                                "	5	Amador County	"	,
                                "	7	Butte County	"	,
                                "	9	Calaveras County	"	,
                                "	11	Colusa County	"	,
                                "	13	Contra Costa County	"	,
                                "	15	Del Norte County	"	,
                                "	17	El Dorado County	"	,
                                "	19	Fresno County	"	,
                                "	21	Glenn County	"	,
                                "	23	Humboldt County	"	,
                                "	25	Imperial County	"	,
                                "	27	Inyo County	"	,
                                "	29	Kern County	"	,
                                "	31	Kings County	"	,
                                "	33	Lake County	"	,
                                "	35	Lassen County	"	,
                                "	37	Los Angeles County	"	,
                                "	39	Madera County	"	,
                                "	41	Marin County	"	,
                                "	43	Mariposa County	"	,
                                "	45	Mendocino County	"	,
                                "	47	Merced County	"	,
                                "	49	Modoc County	"	,
                                "	51	Mono County	"	,
                                "	53	Monterey County	"	,
                                "	55	Napa County	"	,
                                "	57	Nevada County	"	,
                                "	59	Orange County	"	,
                                "	61	Placer County	"	,
                                "	63	Plumas County	"	,
                                "	65	Riverside County	"	,
                                "	67	Sacramento County	"	,
                                "	69	San Benito County	"	,
                                "	71	San Bernardino County	"	,
                                "	73	San Diego County	"	,
                                "	75	San Francisco County	"	,
                                "	77	San Joaquin County	"	,
                                "	79	San Luis Obispo County	"	,
                                "	81	San Mateo County	"	,
                                "	83	Santa Barbara County	"	,
                                "	85	Santa Clara County	"	,
                                "	87	Santa Cruz County	"	,
                                "	89	Shasta County	"	,
                                "	91	Sierra County	"	,
                                "	93	Siskiyou County	"	,
                                "	95	Solano County	"	,
                                "	97	Sonoma County	"	,
                                "	99	Stanislaus County	"	,
                                "	101	Sutter County	"	,
                                "	103	Tehama County	"	,
                                "	105	Trinity County	"	,
                                "	107	Tulare County	"	,
                                "	109	Tuolumne County	"	,
                                "	111	Ventura County	"	,
                                "	113	Yolo County	"	,
                                "	115	Yuba County	"	)))
            ),
            
            
  column(6, align="left", selectInput(inputId = "county2", label = "Choose a county to zoom in on:",
                                              list (`counties`=c("	1	Alameda County	"	,
                                                                 "	3	Alpine County	"	,
                                                                 "	5	Amador County	"	,
                                                                 "	7	Butte County	"	,
                                                                 "	9	Calaveras County	"	,
                                                                 "	11	Colusa County	"	,
                                                                 "	13	Contra Costa County	"	,
                                                                 "	15	Del Norte County	"	,
                                                                 "	17	El Dorado County	"	,
                                                                 "	19	Fresno County	"	,
                                                                 "	21	Glenn County	"	,
                                                                 "	23	Humboldt County	"	,
                                                                 "	25	Imperial County	"	,
                                                                 "	27	Inyo County	"	,
                                                                 "	29	Kern County	"	,
                                                                 "	31	Kings County	"	,
                                                                 "	33	Lake County	"	,
                                                                 "	35	Lassen County	"	,
                                                                 "	37	Los Angeles County	"	,
                                                                 "	39	Madera County	"	,
                                                                 "	41	Marin County	"	,
                                                                 "	43	Mariposa County	"	,
                                                                 "	45	Mendocino County	"	,
                                                                 "	47	Merced County	"	,
                                                                 "	49	Modoc County	"	,
                                                                 "	51	Mono County	"	,
                                                                 "	53	Monterey County	"	,
                                                                 "	55	Napa County	"	,
                                                                 "	57	Nevada County	"	,
                                                                 "	59	Orange County	"	,
                                                                 "	61	Placer County	"	,
                                                                 "	63	Plumas County	"	,
                                                                 "	65	Riverside County	"	,
                                                                 "	67	Sacramento County	"	,
                                                                 "	69	San Benito County	"	,
                                                                 "	71	San Bernardino County	"	,
                                                                 "	73	San Diego County	"	,
                                                                 "	75	San Francisco County	"	,
                                                                 "	77	San Joaquin County	"	,
                                                                 "	79	San Luis Obispo County	"	,
                                                                 "	81	San Mateo County	"	,
                                                                 "	83	Santa Barbara County	"	,
                                                                 "	85	Santa Clara County	"	,
                                                                 "	87	Santa Cruz County	"	,
                                                                 "	89	Shasta County	"	,
                                                                 "	91	Sierra County	"	,
                                                                 "	93	Siskiyou County	"	,
                                                                 "	95	Solano County	"	,
                                                                 "	97	Sonoma County	"	,
                                                                 "	99	Stanislaus County	"	,
                                                                 "	101	Sutter County	"	,
                                                                 "	103	Tehama County	"	,
                                                                 "	105	Trinity County	"	,
                                                                 "	107	Tulare County	"	,
                                                                 "	109	Tuolumne County	"	,
                                                                 "	111	Ventura County	"	,
                                                                 "	113	Yolo County	"	,
                                                                 "	115	Yuba County	"	)))
  )),
  
  fluidRow(
     column(6, align="center", plotOutput("countymap1")),
     column(6, align="center", plotOutput("countymap2"))
     )
)

# Define server logic required to draw a histogram
server<- function(input, output) {

  #output$countymapFIPS <- renderText({str_extract(input$county, regexp)})
  
  output$countymap1 <- renderPlot({
   ca_tract_choropleth(df.tracts,
                       title       = "Fraction Households Paying %50+ of Income as Rent",
                       legend      = "Fraction",
                       county_zoom = (6000+as.numeric(str_extract(input$county1, regexp)))) + coord_map()
  
  })
  output$countymap2 <- renderPlot({
    ca_tract_choropleth(df.tracts,
                        title       = "Fraction Households Paying %50+ of Income as Rent",
                        legend      = "Fraction",
                        county_zoom = (6000+as.numeric(str_extract(input$county2, regexp)))) + coord_map()
    
  })
}
shinyApp(ui = ui, server = server)
