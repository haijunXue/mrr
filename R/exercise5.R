
# in c++
diabete = read.csv(file = "data/train.csv")
#adaboost(formula,data,nIter)
diabete$diabetes <- factor(diabete$diabetes)
test_adaboost <- adaboost(diabetes~age,data=data.frame(diabete),10)
pred <- predict(test_adaboost,newdata = data.frame(diabete))
print(pred$error)
print(table(pred$class,diabete$diabetes))
#
tree <- get_tree(test_adaboost,5)
#
test_real_adaboost<- real_adaboost(diabetes~age,data=data.frame(diabete),10)
pred1 <- predict(test_real_adaboost,newdata = data.frame(diabete))
print(pred1$error)
# in weka

predict.adaboost <- function(object, newdata,...)
{
  return( predict_adaboost_internal(object,newdata,"M1") )
}

predict_adaboost_internal <-function(object, newdata, method){

}


bmr = benchmark(pred1,pred2)

library("RWeka")

m1 <- AdaBoostM1(diabetes ~ age , data = data.frame(diabete),
                 control = Weka_control(W = list(J48, M = 30)))
pred2 <- predict(m1)
table(predict(m1), diabete$diabetes)
