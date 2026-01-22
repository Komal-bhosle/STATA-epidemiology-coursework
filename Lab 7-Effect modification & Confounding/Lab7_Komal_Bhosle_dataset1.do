//Lab 7
//Komal Bhosle
//December 1, 2025

//Chnage directory to saved dataset file
cd "C:\Users\komal\OneDrive\Desktop\Advanced Epidemiology"

//Using the file
use "lab7_dataset1.dta"

//create a unique variable
set seed 00912059

//create variable with random values
g random = runiform()

//drop 20% of observations
drop if random <.2

//create a log file
log using "Lab7_KomalBhosle_dataset1_log"

//To look at the dataset
sum

//Here we calculate the Odds Ratio for outcome and exposure variables to determine if hypertension is confounder or effect modifier
cc CHF diabetes

//Calculate the odds ratio for participants who have and do not have hypertension
cc CHF diabetes if hypertension == 0
cc CHF diabetes if hypertension == 1

//To calculate the odds ratio for each group and also the adjusted OR (Mantel-Haenszel)
cc CHF diabetes, by (hypertension)

//Now we do the logistic regression to test the significance between exposure outcome and the possible confounder or modifier.
logistic CHF diabetes##hypertension

//Closing the log file
log close