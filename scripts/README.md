Not all scripts in this folder are mandatory for execution. Consult this README as the ultimate guide to understanding the work flow of the project. 

## Prep data

1. [data/0_import_raw.R]() brings in two data files: the baseline measure (`data/raw/dataset_285_basic_03-2014.csv`)  and the longitudinal observations (`data/raw/dataset_285_long_03-2014.csv`).  Files are merged and saved into an object `data/derived/ds0.rds`.

2. [data/0a_apply_codebook]() attaches descriptive labels to selected variables of the `ds0.rds` data file using the meta-data from the [data/raw/Codebook_IALSA 03-2014.pdf](). Saves the data into the same `ds0.rds`  object. 

## Prep scripts 
Using the provided meta-data we then generate scripts for Mplus estimation. 

- [`functions-to-generate-mplus-scripts.r]() 

- [`generate_run_graph`]()   


## Reports


 - [kb_fans_waves]() 
 
 - [kb_profiles]()
 
 


