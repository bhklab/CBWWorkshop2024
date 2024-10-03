## code to prepare `dummy_rnaseq` dataset goes here

# Set seed for reproducibility
set.seed(123)

data("NCI_ALMANAC_sample_metadata")
data("NCI60_molecular_data")

allsampleids <- NCI60_molecular_data$sampleid

sampleids <- allsampleids[seq(1, length(allsampleids), by = 2)]

num_samples <- length(sampleids)

# Generate fake gene IDs based on Gencode annotation pattern
gene_ids <- paste0("GENE", sprintf("%03d", 1:100))  # 100 fake Gencode gene IDs

dummy_sampleMetadata <- NCI_ALMANAC_sample_metadata[sampleids,]

# Create a matrix of TPM normalized counts with random values between 0 and 100
tpm_matrix <- matrix(
  runif(num_samples * length(gene_ids), 0, 100), 
  nrow = length(gene_ids),
  dimnames = list(gene_ids, sampleids)
)
dummy_se <- SummarizedExperiment::SummarizedExperiment(
  assays=list(exprs=tpm_matrix),
  colData=data.frame(sampleid=sampleids, batchid=1)
)

dummy_mae <- MultiAssayExperiment(
  experiments=list("rnaseq.tpm"=dummy_se), 
  colData = dummy_sampleMetadata
)

usethis::use_data(dummy_mae, overwrite = TRUE)

data("NCI_ALMANAC_raw")
data("NCI_ALMANAC_treatment_metadata")
# CREATING DUMMY TREATMENT RESPONSE EXPERIMENT 
# 

# Need: "dose" "viability" "sampleid" "treatmentid"

subset_treatmentmeta <- NCI_ALMANAC_treatment_metadata[, c("treatmentid", "cid", "inchikey")]

# grab only rows where "treatmentid" is less than 12 characters

subset_treatmentmeta <- subset_treatmentmeta[nchar(subset_treatmentmeta$treatmentid) < 12,]

treatmentids <- subset_treatmentmeta$treatmentid

# Create a long table of treatment response data for each pair of treatmentid and sampleid
# Each row will represent a single treatment response measurement
# There will be the following doses
subset_raw_tr <- NCI_ALMANAC_raw[
  treatment2id == "", 
  mean(viability), by = .(treatment1id, treatment1dose,sampleid, PANEL, CONC1)
][
  treatment1id %in% treatmentids & sampleid %in% sampleids
]
data.table::setnames(subset_raw_tr, c("V1", "treatment1id", "treatment1dose"), c("viability", "treatmentid", "treatmentdose"))


tremapper <- CoreGx::TREDataMapper(rawdata=subset_raw_tr)
# 
# CoreGx::assayMap(tremapper) <- list(
#   raw = list(
#     id_columns=c("treatmentid", "treatmentdose", "sampleid"),
#     mapped_columns=c("viability")
#   )
# )
# 
# CoreGx::colDataMap(tremapper) <- list(
#   raw = list(
#     id_columns=c("sampleid"),
#     mapped_columns=c("PANEL")
#   )
# )
# 
# CoreGx::rowDataMap(tremapper) <- list(
#   raw = list(
#     id_columns=c("treatmentdose", "treatmentid"),
#     mapped_columns=c("CONC1")
#   ))

guess <- CoreGx::guessMapping(
  tremapper,
  list(
    rowDataMap=c("treatmentdose", "treatmentid"),
    colDataMap=c("sampleid"),
    assayMap=c("treatmentdose", "treatmentid", "sampleid")
  ),
  subset=TRUE
)

CoreGx::rowDataMap(tremapper) <- guess$rowDataMap
CoreGx::colDataMap(tremapper) <- guess$colDataMap
CoreGx::assayMap(tremapper) <- list( raw = guess$assayMap)

(dummy_tre <- CoreGx::metaConstruct(tremapper))

(dummy_pset <- PharmacoGx::PharmacoSet2(
  name="dummy_pset",
  treatment=subset_treatmentmeta,
  sample=dummy_sampleMetadata,
  molecularProfiles=dummy_mae,
  treatmentResponse=dummy_tre,
  curation = list(sample = data.frame(),treatment = data.frame(), tissue = data.frame())
))

usethis::use_data(dummy_pset, overwrite = TRUE)
# usethis::use_data(dummy_rnaseq, overwrite = TRUE)
# 
# dummy_sampleMetadata <- NCI_ALMANAC_sample_metadata[sampleids,]
# usethis::use_data(dummy_sampleMetadata, overwrite = TRUE)
# 
# 
# dummy_mae <- NCI60_molecular_data[, sampleids]
