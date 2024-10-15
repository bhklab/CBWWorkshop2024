## code to prepare `dummy_rnaseq` dataset goes here

# Set seed for reproducibility
set.seed(123)

data("NCI_ALMANAC_sample_metadata")
data("NCI60_molecular_data")

allsampleids <- NCI60_molecular_data$sampleid

# take 50 random samples
sampleids <- allsampleids[sample(1:length(allsampleids), 50, replace = FALSE)]

num_samples <- length(sampleids)

# Generate fake gene IDs based on Gencode annotation pattern
gene_ids <- paste0("GENE", sprintf("%03d", 1:100))  # 100 fake Gencode gene IDs

dummy_sampleMetadata <- NCI_ALMANAC_sample_metadata[sampleids,]

# CREATING DATA

# Create a matrix of TPM normalized counts with random values between 0 and 100
tpm_matrix <- matrix(
  runif(num_samples * length(gene_ids), 0, 100), 
  nrow = length(gene_ids),
  dimnames = list(gene_ids, sampleids)
)

# Create a matrix with an intentional batch effect
batch1 <- sample(colnames(tpm_matrix), size = 25)

batch_rna <- tpm_matrix
batch_rna[,colnames(batch_rna) %in% batch1] <- batch_rna[,colnames(batch_rna) %in% batch1] * 1.2

# tpm_matrix <- as.data.frame(t(tpm_matrix))
# batch_rna <- as.data.frame(t(batch_rna))
# 
# org_pca <- prcomp(tpm_matrix)
# org_pca <- as.data.frame(org_pca$x)
# 
# new_pca <- prcomp(batch_rna)
# new_pca <- as.data.frame(new_pca$x)
# 
# org_pca$label <- ifelse(rownames(org_pca) %in% batch1, "Batch1", "Batch2") 
# 
# new_pca$label <- ifelse(rownames(new_pca) %in% batch1, "Batch1", "Batch2")
# 
# library(ggplot2)
# library(ggpubr)
# p1 <- ggplot(org_pca, aes(x = PC1, y = PC2, color = label)) + geom_point()
# p2 <- ggplot(new_pca, aes(x = PC1, y = PC2, color = label)) + geom_point()
# ggarrange(p1, p2, nrow = 2)

rnaseq_tpm_se <- SummarizedExperiment::SummarizedExperiment(
  assays=list(exprs=tpm_matrix),
  colData=data.frame(sampleid=sampleids, batchid=1),
  metadata=list(
    annotation="rnaseq"
  )
)

# batchid should be 1 for samples in batch1 and 2 otherwise
batch_colData <- data.frame(sampleid=sampleids, batchid=1)
batch_colData$batchid[!batch_colData$sampleid %in% batch1] <- 2

rnaseq_tpm_batch_se <- SummarizedExperiment::SummarizedExperiment(
  assays=list(exprs=batch_rna),
  colData=batch_colData,
  metadata=list(
    annotation="rnaseq"
  )
)

dummy_mae <- MultiAssayExperiment::MultiAssayExperiment(
  experiments=list(
    "rnaseq.tpm"=rnaseq_tpm_se,
    "rnaseq.tpm.batch"=rnaseq_tpm_batch_se
    ), 
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
# 
# 

message("Fitting treatment response curves")
# 
# tre |> CoreGx::endoaggregate(
#   {
#     # mean_viability <- mean(viability)
#     # 
#     # list(
#     #   mean_viability=mean_viability,
#     #   std_viability=sd(viability)
#     # )
#     fit <- PharmacoGx::logLogisticRegression(treatmentdose, viability,
#                                              viability_as_pct=FALSE)
#     ic50 <- PharmacoGx::computeIC50(treatmentdose, Hill_fit=fit)
#     aac <- PharmacoGx::computeAUC(treatmentdose, Hill_fit=fit)
#     list(
#       HS=fit[["HS"]],
#       E_inf = fit[["E_inf"]],
#       EC50 = fit[["EC50"]],
#       Rsq=as.numeric(unlist(attributes(fit))),
#       aac_recomputed=aac,
#       ic50_recomputed=ic50
#     )
#   },
#   assay="raw",
#   target="profiles",
#   enlist=FALSE,
#   by=c("treatmentid", "sampleid"),
#   nthread=8
# ) -> tre_fit
