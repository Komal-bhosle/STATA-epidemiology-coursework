//Lab 6 Survival Analysis
//Komal Bhosle
//Date: 11/24/2025

//Change directory to saved dataset file
cd "C:\Users\komal\OneDrive\Desktop\Advanced Epidemiology"

//Add path to the directory where the dataset is saved
use "Lab6_Survival_Analysis_dataset.dta"

//create a unique variable
set seed 00912059

//create variable with random values
g random = runiform()

//drop 20% of observations
drop if random <.2

//Create log file
log using "Lab6_Komal_Bhosle_Log"

//Examining the dataset
describe
list in 1/10
tab newdrug
tab rehosp

//To tell stata that this is a survival sample
stset rehosp_mos, failure(rehosp)

//Now we create a lifetable for the full sample
ltable rehosp_mos rehosp

//Now we determine median survival time
stsum

//Create a survival curve graph and include confidence intervals
sts graph, ci

//Now we create survival curve comparing those who received the new drug to those who did not.
sts graph, by(newdrug) ci

//Determine the median survival times for each treatment group.
stsum, by(newdrug)

//to know if the new drug is associated with more time until the next hospitalization.
sts test newdrug, logrank

//To check if being administered with new drug predict time until next hospitalization
stcox newdrug

//To predict if age, asthma diagnoisis and receipt of outpatient follow-up care predict time until next hospitalization (with new drug in the model)
stcox newdrug age asthma outpt_follow

//Closing the log file
log close