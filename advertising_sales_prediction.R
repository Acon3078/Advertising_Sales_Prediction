# ##Example 11.8 (MBS, p.684). Data set ADSALE
# #McClave "Statistics for Business and Economics", 13th Ed 

# Predict the monthly sales for next month if $400 is spent on advertising. Use a 95% prediction interval

##PREVIOUS

library(readxl)
data_adsale = data.frame(read_excel ('/Users/homecon/Downloads/Deletable /ADSALE.xlsx'))
View(data_adsale)
str(data_adsale) #dataset in the appropriate format


model = lm(SALES_Y~ADVEXP_X, data = data_adsale)
model_summary = summary(model)

## If you want to estimate y when x takes a particular value:

## 1. Create 'newdata' stating the value of x desired-> newdata = data.frame(variable x = desired value)

newdata = data.frame(ADVEXP_X=4)
View(newdata)
## 2. Use the predict() function over the model and the new data. State the 'interval' argument of the predict() function 
## as "predict" -> If you want to estimate a prediction interval for y

prediction_CI = predict(object = model, newdata = newdata, interval="predict", level = 0.95)
prediction_CI

cat('Therefore, we predict with 95% confidence that the sales revenue (y) next month (a month in which we spend
$400 in advertising) will fall in the interval from $',prediction_CI[2]*1000, 'to $', prediction_CI[3]*1000)

# The width of the prediction interval could be reduced by using a larger number of data points
