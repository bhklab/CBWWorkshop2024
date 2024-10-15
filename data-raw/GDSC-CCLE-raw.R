# load libraries
suppressMessages(library(data.table))

# load in GDSC data
GDSC_drivers <- read.csv("data-raw/GDSC-raw/GDSC_driver_mutations.csv")
GDSC_rnaseq <- read.csv("data-raw/GDSC-raw/GDSC_rnaseq_sanger.csv")
GDSC_gene_identifiers <- read.csv("data-raw/GDSC-raw/GDSC_gene_identifiers.csv")
GDSC_model_list <- read.csv("data-raw/GDSC-raw/GDSC_model_list.csv")
GDSC_methylation <- read.csv("data-raw/GDSC-raw/GDSC_methylation.csv")
GDSC_methylation_model_list <- read.csv("data-raw/GDSC-raw/GDSC_methylation_model_list.csv")
GDSC_drug_response <- as.data.frame(fread("data-raw/GDSC-raw/GDSC2_fitted_dose_response.tsv"))

# create data objects for GDSC data
usethis::use_data(GDSC_drivers, overwrite = TRUE)
usethis::use_data(GDSC_rnaseq, overwrite = TRUE)
usethis::use_data(GDSC_gene_identifiers, overwrite = TRUE)
usethis::use_data(GDSC_model_list, overwrite = TRUE)
usethis::use_data(GDSC_methylation, overwrite = TRUE)
usethis::use_data(GDSC_methylation_model_list, overwrite = TRUE)
usethis::use_data(GDSC_drug_response, overwrite = TRUE)

# load in CCLE data
CCLE_chromatin <- read.csv("data-raw/CCLE-raw/CCLE_chromatin_profiling.csv")
CCLE_rrpa <- read.csv("data-raw/CCLE-raw/CCLE_rrpa.csv")
CCLE_metabolomics <- read.csv("data-raw/CCLE-raw/CCLE_metabolomics.csv")
CCLE_model_list <- fread("data-raw/CCLE-raw/CCLE_cell_annotations.txt")

# create data objects for GDSC data
usethis::use_data(CCLE_chromatin, overwrite = TRUE)
usethis::use_data(CCLE_rrpa, overwrite = TRUE)
usethis::use_data(CCLE_metabolomics, overwrite = TRUE)
usethis::use_data(CCLE_model_list, overwrite = TRUE)
