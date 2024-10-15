#' A `PharmacoSet` object containing randomly generated data for demonstration
#' purposes.
#' 
#' @docType data
#' @name dummy_pset
#' @usage data(dummy_pset) 
#' @usage CBWWorkshop2024::dummy_pset
#' @format `PharmacoSet` object
#' \describe{
#'  \item{sample}{50 samples}
#'  \item{treatment}{22 treatments}
#'  \item{molecularProfiles}{A `MultiAssayExperiment` with 2 
#'  `SummarizedExperiments`, both are RNASeq, but 
#'  we have manually applied a batch effect to one of them}
#'  \item{treatmentResponse}{A `TreatmentResponseExperiment` with 184 total
#'  experiments. Only the `raw` assay is included. 
#'  }
#'}
#' @keywords datasets
"dummy_pset"