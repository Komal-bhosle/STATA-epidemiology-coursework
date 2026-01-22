//Lab 1
//Komal Bhosle
//September 22, 2025

//change directory
cd "C:\Users\komal\OneDrive\Desktop\Advanced Epidemiology"

//use file
use "Lab1_incidence.dta"

//log
log using "C:\Users\komal\OneDrive\Desktop\Advanced Epidemiology\Lab1_KomalBhosle_log.smcl", replace

//set the seed
set seed 00912059

drop random
//creating random variable
g random = runiform()

//drop 20% of observations
drop if random <.2

//get number of observations, Mean, Sd's, Min, Max
summarize
describe

//look at distribution of variables
tab sick
tab exposed

//2x2 table
tab sick exposed

//calculate cumulative incidence
cs sick exposed

//calculate incidence rate
ir sick exposed months

//log close
log close