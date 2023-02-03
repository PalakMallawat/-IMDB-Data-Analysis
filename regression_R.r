
regression<-function(){
  set.seed(123)
  #Read the dataset
  data<-read.csv("/Users/welcome/Downloads/BI_active_learning/Data_Files/Label-Encoded-data.csv",stringsAsFactors = FALSE,row.names =NULL)
  
  
  #Remove index column
  data<-subset(data,select=-c(X))
  
  
  #Filter out movies above 5000 votes
  data<-subset(data,data$Votes>5000)
  
  #Remove all duplicate rows
  data<-data[!duplicated(data$Title),]
  
  
  #Remove title column
  data<-subset(data,select=-c(Title))
  
  #Convert type to data frame, if not already a data frame
  data<-data.frame(data)
  
  #Create Correlation Matrix
  correlation_matrix<-cor(data, method=c("pearson"),use="complete.obs")
  print(correlation_matrix)

  
  #Create train and test index dataset
  train_index<-sample(1:nrow(data),0.8*nrow(data))
  test_index<-setdiff(1:nrow(data),train_index)
  
  #Divide into train and test datasets
  X_train <- data[train_index, -4]
  y_train <- data[train_index, "User.Rating"]
  
  X_test <- data[test_index, -4]
  y_test <- data[test_index, "User.Rating"]
  
  
  ###K Nearest Neighbor Regression###
 
  #Fit training data
  fit_knn<-knnreg(X_train,y_train,k=5)
  
  #Predict values of test data
  y_pred_knn<-predict(fit_knn,X_test)
  
  
  #Find R2 score
  r2_knn<-R2(y_pred_knn,y_test)
  print(paste("R2 score of KNN-Regression model",r2_knn))
  
  #Finding RMSE, 0.78/Mean(y_test)=> 0.78/6.5 gives 12.5 error rate which is low and good
  rmse_knn<-RMSE(y_pred_knn,y_test)
  print(paste("Root mean square error of KNN-Regression model",rmse_knn))
  
  #Get mean absolute error
  mae_knn<-MAE(y_pred_knn,y_test)
  print(paste("mean absolute error of KNN-Regression model",mae_knn))
  

}




