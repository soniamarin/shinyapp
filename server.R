library(shiny)
 first.year.desertion<-c(86119,81902,72302,65212,58992,49551,54108,55618,55118,70076)
 second.year.desertion<-c(39913,39294,38196,37452,36176,37295,33383,26807,20312,26770)
 third.year.desertion<-c(27084,26040,26007,25536,30511,31307,37549,27567,16869,27896)
 fourth.year.desertion<-c(24104,36167,35375,35231,31919,34539,44161,28721,20647,27256)
desertionRisk<- function(age,sex,year) {
  if( age>9 & age< 16 & sex == "F" & year == "1") {12.2*0.41}
  else if ( age>9 & age< 16 & sex == "F" & year == "2") {12.2*0.21}
  else if ( age>9 & age< 16 & sex == "F" & year == "3") {12.2*0.18}
  else if ( age>9 & age< 16 & sex == "F" & year == "4") {12.2*0.20}
  else if ( age>15 & age< 22 & sex == "F" & year == "1") {11.9*0.41}
  else if ( age>15 & age< 22 & sex == "F" & year == "2") {11.9*0.21}
  else if ( age>15 & age< 22 & sex == "F" & year == "3") {11.9*0.18}
  else if ( age>15 & age< 22 & sex == "F" & year == "4") {11.9*0.20}
  else if ( age>21 & age< 28 & sex == "F" & year == "1") {11.7*0.41}
  else if ( age>21 & age< 28 & sex == "F" & year == "2") {11.7*0.21}
  else if ( age>21 & age< 28 & sex == "F" & year == "3") {11.7*0.18}
  else if ( age>21 & age< 28 & sex == "F" & year == "4") {11.7*0.41}
  else if ( age>9 & age< 16 & sex == "M" & year == "1") {13.0*0.41}
  else if ( age>9 & age< 16 & sex == "M" & year == "2") {13.0*0.21}
  else if ( age>9 & age< 16 & sex == "M" & year == "3") {13.0*0.18}
  else if ( age>9 & age< 16 & sex == "M" & year == "4") {13.0*0.20}
  else if ( age>15 & age< 22 & sex == "M" & year == "1" ) {12.5*0.41}
  else if ( age>15 & age< 22 & sex == "M" & year == "2" ) {12.5*0.21}
  else if ( age>15 & age< 22 & sex == "M" & year == "3" ) {12.5*0.18}
  else if ( age>15 & age< 22 & sex == "M" & year == "4" ) {12.5*0.20}
  else if ( age>21 & age< 28 & sex == "M" & year == "1") {12.1*0.41}
  else if ( age>21 & age< 28 & sex == "M" & year == "2") {12.1*0.21}
  else if ( age>21 & age< 28 & sex == "M" & year == "3") {12.1*0.18}
  else if ( age>21 & age< 28 & sex == "M" & year == "4") {12.1*0.20}
  else {
  }
}
  
shinyServer(
  function(input, output){
   output$inputValue<- renderPrint(input$age)
   output$inputValue2<- renderPrint(input$sex)
   output$inputValue3<- renderPrint(input$year)
   output$prediction<-renderPrint(desertionRisk(input$age,input$sex,input$year))
   output$distPlot <- renderPlot({
      if (input$n == 1){ hist(first.year.desertion)}
     else if (input$n == 2){hist(second.year.desertion) }
     else if (input$n == 3){hist(third.year.desertion) }
     else if (input$n == 4){hist(fourth.year.desertion) }
     else {}
    })
   output$help <- renderUI({
     tagList(
##  rmarkdown::run("C:/Users/Sonia/Desktop/coursera/cdpproject/cdpprowriting.Rmd")
 includeMarkdown("decdpprowriting.Rmd")
##       inclRmd("./cdpproject/cdpprowriting.Rmd") 
     )
   })
   }
  )
