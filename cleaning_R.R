

cleaning <-function(){

  #Read the web scraped file 
  data<-read.csv("/Users/welcome/Downloads/Pre-cleaned-file.csv")
  
  data<-data.frame(data)
  #Remove '-'from Release Year column
  data$Release.Year = as.character(gsub("\\-","",data$Release.Year))
  
  #Remove 'min' from Duration column
  data$Duration.Min.. = as.character(gsub("\\min","",data$Duration.Min..))
  
  #Remove ',' from Votes column
  data$Votes = as.integer(gsub("\\,","",data$Votes))
  
  #Split Sub Genres column into three columns
  data<-cSplit(data,"Sub.Genres",",")
  
  #Rename Primary and Sub Genre Column names
  data<-rename(data, c("Genre"="Primary Genre","Sub.Genres_1"="Sub Genre 1", "Sub.Genres_2"="Sub Genre 2","Sub.Genres_3"="Sub Genre 3"))
  
  data2<-data
  
  #Delete Sub Genre 3 column as 25% rows had NA and the column itself isn't very important
  data2<-subset(data2,select=-c(`Sub Genre 3`))
  
  #Convert Data Types of all required columns
  data2$Title <-as.character(data2$Title)
  data2$Release.Year <- as.integer(data2$Release.Year)
  data2$Duration.Min.. <- as.integer(data2$Duration.Min..)
  data2$User.Rating <-as.double(data2$User.Rating)
  
  #Save file 
  write.csv(data2,"/Users/welcome/Downloads/BI_active_learning/Data_Files/R-Cleaned-File.csv")
}