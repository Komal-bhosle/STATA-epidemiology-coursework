//Lab 2 Regression
//Komal Bhosle
//September 26, 2025

//Change directory to saved dataset file
cd "C:\Users\komal\OneDrive\Desktop\Advanced Epidemiology"

//Using the file
use "regression_lab.dta"

//create a unique variable
set seed 00912059

//create variable with random values
g random = runiform()

//drop 20% of observations
drop if random <.2

//Log using
log using "Lab2_Komalbhosle_v2_log"

//Examine the dataset
summarize
describe

//Examine the variables
tab medicare

//Determine if there is association between miles walked per week and medicare enrollment
regress walk_mile medicare

//Determine if age makes a difference in this model
regress walk_mile medicare age

//Save the log file
log close

