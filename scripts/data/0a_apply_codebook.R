## This script 
## 1. adds descriptions to variable names 
## 2. defines levels and labels of categorical variables (factors) where necessary

options(width=160)
rm(list=ls())
cat("\f")

## @knitr load_packages
library(dplyr)

## @knitr preceding_scripts
# source("./scripts/data/0_import_raw.R")

## @knitr load_data
ds0 <- readRDS("./data/derived/ds0.rds")
ds <- ds0
str(ds)


## @knitr basic_explore
varnames <- as.data.frame(variable.names(ds0) ) # extract the names of the variables
some <- as.data.frame(varnames[1:10,])  # subset for closer inspection
some


## @knitr nl_function
# Create function that inspects names and labels
names.labels <- function(domain, file, wave){
    # ds <- dsDemo
    nl <- data.frame(matrix(NA, nrow=ncol(ds), ncol=2))
    names(nl) <- c("name","label")
      for (i in seq_along(names(ds))){
        nl[i,"name"] <- names(ds[i])
          if(is.null(attr(ds[[i]], "label")) ){
          nl[i,"label"] <- NA}else{
          nl[i,"label"] <- attr(ds[[i]], "label")  
          }
      }
    return(nl)
}
names.labels(ds)


## @knitr add_labels
# Add a descriptive label for each variable except "projid"
attr(ds$study,"label") <- "The particular sub-study within RADC"
# str(ds$study)

ds %>% dplyr::count(study)
attr(ds$study,"label") # check


attr(ds0$age_bl,"label") <- "Age at baseline"
attr(ds0$agreeableness, "label") <- "NEO agreeableness-ROS"
attr(ds0$conscientiousness, "label") <- "Conscientiousness-ROS/MAP"
attr(ds0$extraversion, "label") <- "NEO extraversion-ROS/MAP"
attr(ds0$neo_altruism, "label") <- "NEO altruism scale-MAP"
attr(ds0$neo_conscientiousness, "label") <- "NEO conscientiousness-MAP"
attr(ds0$neo_trust, "label") <- "NEO trust-MAP"
attr(ds0$openness,"label") <- "NEO openess-ROS"
attr(ds0$anxiety_10items, "label") <- "Anxiety-10 item version - ROS and MAP"
attr(ds0$neuroticism_12, "label") <- "Neuroticism - 12 item version-RMM"
attr(ds0$neuroticism_6, "label") <- "Neuroticism - 6 item version - RMM"
attr(ds0$age_death, "label") <- "Age at death"
attr(ds0$died, "label") <- "Indicator of death"
attr(ds0$educ, "label") <- "Years of education"
attr(ds0$msex, "label") <- "Gender"
attr(ds0$race, "label") <- "Participant's race"
attr(ds0$spanish, "label") <- "Spanish/Hispanic origin"
attr(ds0$apoe_genotype, "label") <- "ApoE genotype"
attr(ds0$ldai_bl, "label") <- "Lifetime daily alcohol intake -baseline"
attr(ds0$q3smo_bl, "label") <- "Smoking quantity-baseline"
attr(ds0$q4smo_bl, "label") <- "Smoking duration-baseline"
attr(ds0$smoke_bl, "label") <- "Smoking at baseline"
attr(ds0$smoking, "label") <- "Smoking"
attr(ds0$fu_year, "label") <- "Follow-up year"
attr(ds0$scaled_to.y, "label") <- "No label found in codebook"
attr(ds0$cesdsum, "label") <- "CESD-Measure of depressive symptoms"
attr(ds0$r_depres, "label") <- "Major depression dx-clinic rating"
attr(ds0$intrusion, "label") <- "Negative social exchange-intrusion-MAP"
attr(ds0$neglifeevents, "label") <- "Negative life events"
attr(ds0$negsocexchange, "label") <- "Negative social exchange"
attr(ds0$nohelp, "label") <- "Negative social exchange-help-MAP"
attr(ds0$panas, "label") <- "Panas score"
attr(ds0$perceivedstress, "label") <- "Perceived stress"
attr(ds0$rejection, "label") <- "Negative social exchange - rejection-MAP"
attr(ds0$unsympathetic, "label") <- "Negative social exchange-unsymapathetic-MAP"
attr(ds0$dcfdx, "label") <- "Clinical dx summary"
attr(ds0$dementia, "label") <- "Dementia diagnosis"
attr(ds0$r_stroke, "label") <- "Clinical stroke dx"
attr(ds0$cogn_ep, "label") <- "Calculated domain score-episodic memory"
attr(ds0$cogn_global, "label") <- "Global cognitive score"
attr(ds0$cogn_po, "label") <- "Calculated domain score - perceptual orientation"
attr(ds0$cogn_ps, "label") <- "Calculated domain score - perceptual speed"
attr(ds0$cogn_se, "label") <- "Calculated domain score - semantic memory"
attr(ds0$cogn_wo, "label") <- "Calculated domain score - working memory"
attr(ds0$cts_bname, "label") <- "Boston naming - 2014"
attr(ds0$cts_catflu, "label") <- "Category fluency - 2014"
attr(ds0$cts_db, "label") <- "Digits backwards - 2014"
attr(ds0$cts_delay, "label") <- "Logical memory IIa - 2014"
attr(ds0$cts_df, "label") <- "Digits forwards - 2014"
attr(ds0$cts_doperf, "label") <- "Digit ordering - 2014"
attr(ds0$cts_ebdr, "label") <- "East Boston story - delayed recall - 2014"
attr(ds0$cts_ebmt, "label") <- "East Boston story - immediate - 2014"
attr(ds0$cts_idea, "label") <- "Complex ideas - 2014"
attr(ds0$cts_lopair, "label") <- "Line orientation - 2014"
attr(ds0$cts_mmse30, "label") <- "MMSE - 2014"
attr(ds0$cts_nccrtd, "label") <- "Number comparison - 2014"
attr(ds0$cts_pmat, "label") <- "Progressive Matrices - 2014"
attr(ds0$cts_read_nart, "label") <- "Reading test-NART-2014"
attr(ds0$cts_read_wrat, "label") <- "Reading test - WRAT - 2014"
attr(ds0$cts_sdmt, "label") <- "Symbol digit modalitities - 2014"
attr(ds0$cts_story, "label") <- "Logical memory Ia - immediate - 2014"
attr(ds0$cts_wli, "label") <- "Word list I- immediate- 2014"
attr(ds0$cts_wlii, "label") <- "Word list II - delayed - 2014"
attr(ds0$cts_wliii, "label") <- "Word list III - recognition - 2014"
attr(ds0$age_at_visit, "label") <-"Age at cycle - fractional"
attr(ds0$iadlsum, "label") <- "Instrumental activities of daily liviing"
attr(ds0$katzsum, "label") <- "Katz measure of disability"
attr(ds0$rosbscl, "label") <- "Rosow-Breslau scale"
attr(ds0$rosbsum, "label") <- "Rosow-Breslau scale"
attr(ds0$vision, "label") <- "Vision acuity"
attr(ds0$visionlog, "label") <- "Visual acuity"
attr(ds0$fev, "label") <- "forced expiratory volume"
attr(ds0$mep, "label") <- "maximal expiratory pressure"
attr(ds0$mip, "label") <- "maximal inspiratory pressure"
attr(ds0$pvc, "label") <- "pulmonary vital capacity"
attr(ds0$bun, "label") <- "Blood urea nitrogen"
attr(ds0$ca, "label") <- "Calcium"
attr(ds0$chlstrl, "label") <- "Cholesterol"
attr(ds0$cl, "label") <- "Chloride"
attr(ds0$co2, "label") <- "Carbon Dioxide"
attr(ds0$crn, "label") <- "Creatinine"
attr(ds0$fasting, "label") <- "Whether blood was collected on fasting participant"
attr(ds0$glucose, "label") <- "Glucose"
attr(ds0$hba1c, "label") <- "Hemoglobin A1c"
attr(ds0$hdlchlstrl, "label") <- "HDL cholesterol"
attr(ds0$hdlratio, "label")<- "HDL ratio"
attr(ds0$k, "label") <- "Potassium"
attr(ds0$ldlchlstrl, "label") <- "LDL cholesterol"
attr(ds0$na, "label")<- "Sodium"
attr(ds0$alcohol_g, "label") <- "Grams of alcohol per day"
attr(ds0$bmi, "label") <- "Body mass index" 
attr(ds0$htm, "label") <- "Height(meters)"
attr(ds0$phys5itemsum, "label") <- "Summary of self reported physical activity
measure (in hours) ROS/MAP"
attr(ds0$wtkg, "label") <- "Weight (kg)"
attr(ds0$bp11, "label") <- "Blood pressure measurement- sitting - trial 1"
attr(ds0$bp2, "label") <- "Blood pressure measurement- sitting - trial 2"
attr(ds0$bp3, "label") <- "Hx of Meds for HTN"
attr(ds0$bp31, "label") <- "Blood pressure measurement- standing"
attr(ds0$hypertension_cum, "label") <- "Medical conditions - hypertension - cumulative"
attr(ds0$dm_cum, "label") <- "Medical history - diabetes - cumulative"
attr(ds0$thyroid_cum, "label") <- "Medical Conditions - thyroid disease - cumulative"
attr(ds0$chf_cum, "label") <- "Medical Conditions - congestive heart failure -
cumulative"
attr(ds0$claudication_cum, "label") <- "Medical conditions - claudication -cumulative"
attr(ds0$heart_cum, "label") <- "Medical Conditions - heart - cumulative"
attr(ds0$stroke_cum, "label") <- "Clinical Diagnoses - Stroke - cumulative"
attr(ds0$vasc_3dis_sum, "label") <- "Vascular disease burden (3 items w/o chf)
ROS/MAP/MARS"
attr(ds0$vasc_4dis_sum, "label") <- "Vascular disease burden (4 items) - MAP/MARS
only"
attr(ds0$vasc_risks_sum, "label") <- "Vascular disease risk factors"
attr(ds0$gait_speed, "label") <- "Gait Speed - MAP"
attr(ds0$gripavg, "label") <- "Extremity strength" 

saveRDS(ds0,"./data/derived/ds0.rds")
write.csv(ds0,"./data/derived/ds0.csv", row.names=F)
write.table(ds0,"./reports/extanding_waves_andrey/ds0.dat", row.names=F, col.names=F)
write(names(ds0), "./reports/extanding_waves_andrey/varnames.txt", sep=" ")

############# Development script beyond this line #############



