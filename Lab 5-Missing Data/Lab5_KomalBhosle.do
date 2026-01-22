//Lab 5 Missing Data
//Komal Bhosle
//Date: 11/09/2025

//Change directory to saved dataset file
cd "C:\Users\komal\OneDrive\Desktop\Advanced Epidemiology"

//Add path to the directory where the dataset is saved
use "lab5_missingdata_missing.dta"

//create a unique variable
set seed 00912059

//create variable with random values
g random = runiform()

//drop 20% of observations
drop if random <.2

//begin the log file
log using "Lab5_KomalBhosle_Missingdata_log"

//To look at the dataset and explore the variables with 
//number of observations, mean, and min. and max. values
sum

//To list the variables with their labels and value labels
//codebook

//This will open a window to show you the raw dataset
//browse

//To determine how much data are missing
//Provides a table showing how much is missing from each variable
//This creates a new variable for each existing variable and names them as miss_existingname
misstable summarize, gen(miss_)

//The easy way to see what is missing is to summarize the miss_ variables 
//with this code where * tells stata to include all variables starting with "miss_"
sum miss_*

//Calculating the Odds ratio for the association between the intervention and detecting improvement
logistic improvement intervention

//Calculating the Odds ratio for the association between the intervention and detecting improvement for each age group
logistic improvement intervention if age_group==0
logistic improvement intervention if age_group==1

//To do multiple imputation using mlong will create observations with missing values added for each imputation
mi set mlong

//other way is flong which repeats every observation for every imputation which creates larger files.

//To take a look at how the data are missing we run the code below 
//Obs=. tells you how many observations are missing values for the variable
//Obs<. tells you how many are not missing
mi misstable summarize

//To tell stata which variable to be used in imputation model
mi register imputed intervention days_enrolled weight_lb

//This tells stata not to impute these variables, in this case there are no missing values.
mi register regular improvement age_group

//Imputing by adding 5 new sets of data
mi impute chained (regress) days_enrolled (logit) intervention = age_group improvement,add(5)

//"(regress) days_enrolled"– days_enrolled is a continuous variable so we will use linear regression ("regress") to fill in the missing values.
//"(logit) intervention" – intervention is dichotomous so we will use logistic regression ("logit") to fill in the missing values.
//The variables after the equal sign (=) will not be imputed, but they contribute to the models imputing the other variables

//Now we estimate the odds ratio with this new information
mi estimate, or: logistic improvement intervention
mi estimate, or: logistic improvement intervention if age_group==0
mi estimate, or: logistic improvement intervention if age_group==1
  
//Now we see if the estimates change if we add 5 more imputations
mi impute chained (regress) days_enrolled (logit) intervention = age_group improvement,add(5)

//Now we estimate the odds ratio with this new information
mi estimate, or: logistic improvement intervention
mi estimate, or: logistic improvement intervention if age_group==0
mi estimate, or: logistic improvement intervention if age_group==1
  
//Now we see if the estimates change if we add 10 more imputations
mi impute chained (regress) days_enrolled (logit) intervention = age_group improvement,add(10)

//Now we estimate the odds ratio with this new information
mi estimate, or: logistic improvement intervention
mi estimate, or: logistic improvement intervention if age_group==0
mi estimate, or: logistic improvement intervention if age_group==1

//closing the log file
log close