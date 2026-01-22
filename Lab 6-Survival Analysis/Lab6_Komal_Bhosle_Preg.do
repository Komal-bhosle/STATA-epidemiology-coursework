//Lab 6 Survival Analysis
//Komal Bhosle
//Date: 11/24/2025

//Change directory to saved dataset file
cd "C:\Users\komal\OneDrive\Desktop\Advanced Epidemiology"

//Add path to the directory where the dataset is saved
use "Lab6_Preg_Survival_Analysis.dta"

//create a unique variable
set seed 00912059

//create variable with random values
g random = runiform()

//drop 20% of observations
drop if random <.2

//begin log file
log using "Lab6_Komal_Bhosle_preg_log"

//Examining the dataset
describe
list in 1/10
tab subspreg
tab intervention

//To tell stata that this is a survival sample
stset subs_preg_mos, failure(subspreg)

//Now we create a lifetable for the full sample
ltable subs_preg_mos subspreg

//Now we determine median survival time
stsum

//Create a survival curve graph and include confidence intervals
sts graph, ci

//Now we create survival curve to look at is it different between intervention & contol groups.
sts graph, by(intervention)

sts test intervention, logrank

//Determine the median survival times for each treatment group.
stsum, by(intervention)

//Using Cox regression model to assess wether time to subsequent pregnancy differs between intervention & control groups.
stcox intervention

//Using Cox regression model to assess wether time to subsequent pregnancy differs between intervention & control groups, controlling for 
stcox intervention maternal_age LBW_firstchild

//close log
log close