//Class Lab
//Komal Bhosle
//October 07, 2025

//change directory
cd "C:\Users\komal\OneDrive\Desktop\Advanced Epidemiology"

//use file
use "combined_class_data_250929.dta"

//log using
log using "C:\Users\komal\OneDrive\Desktop\Advanced Epidemiology\Lab3_Komal Bhosle_log.smcl"

//loading file details
summarize
describe

//calculate sensitivity and specificity
roctab heavy heavy_true

//install a command only once to run diagt commands
ssc install diagt

//calculate positive predictive value and negative predictive value
diagt heavy heavy_true

//log close
log close