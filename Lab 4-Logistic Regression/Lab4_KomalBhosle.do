//Lab 4 Regression
//Komal Bhosle
//October 27, 2025

//Chnage directory to saved dataset file
cd "C:\Users\komal\OneDrive\Desktop\Advanced Epidemiology"

//Using the file
use "regression_lab.dta"

//create a unique variable
set seed 00912059

//create variable with random values
g random = runiform()

//drop 20% of observations
drop if random <.2

//starting the log file by log using
log using "Lab4_KomalBhosle_v2_log"

//Looking at the outcome variable in logistic regression
tab lessactive_other

//Looking at the medicare variable in logistic regression
tab medicare

//To determine the continuous variable
summarize

//To determine if there is an association between being less active than others and Medicare enrollment,
logistic lessactive_other medicare

//To determine if age makes a difference in this model
logistic lessactive_other medicare age

//log close
log close