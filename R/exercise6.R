library(fastAdaboost)
library(microbenchmark)
library(RWeka)

diabete = read.csv(file = "data/train.csv")
predict.adaboost <-function(newdata){
  newdata$diabetes <- factor(newdata$diabetes)
  test_adaboost <- adaboost(diabetes~age,data=data.frame(newdata),100)
  return(test_adaboost)
}

predict.adaboost1 <-function(newdata){

  m1 <- AdaBoostM1(diabetes ~ age , data = data.frame(newdata),
                   control = Weka_control(W = list(J48, M = 30)),100)
  return(m1)
}


microbenchmark(
 m1<- predict.adaboost(diabete),
 m2 <-predict.adaboost1(diabete)
)
