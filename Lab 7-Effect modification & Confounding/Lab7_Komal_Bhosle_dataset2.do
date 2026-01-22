//Lab 7
//Komal Bhosle
//December 1, 2025

//Chnage directory to saved dataset file
cd "C:\Users\komal\OneDrive\Desktop\Advanced Epidemiology"

//Using the file
use "lab7_dataset2.dta"

//create a unique variable
set seed 00912059

//create variable with random values
g random = runiform()

//drop 20% of observations
drop if random <.2

//create a log file
log using "Lab7_KomalBhosle_dataset2_log"

//To look at the dataset
sum

//Here we calculate the Odds Ratio of exposure to outcome variables
cc depression newdrug

//Calculate the odds ratio for younger and older participants
cc depression newdrug if older_age == 0
cc depression newdrug if older_age == 1

//To calculate the odds ratio for each group and also the adjusted OR (Mantel-Haenszel)
cc depression newdrug, by (older_age)

//Now we do the logistic regression to test the significance between exposure outcome and the possible confounder or modifier.
logistic depression newdrug##older_age

//Closing the log file
log close