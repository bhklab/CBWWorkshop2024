#' A `data.table` containing a subset of interesting drug combinations from the
#' NCI-ALMANAC
#'
#' This is a subset of the NCI-ALMANAC drug combination dataset from
#' Holkeck et al. 2017 where the top 10 most synergistic and antagonistic
#' drug combinations were selected based on ranking via ranking with Bliss
#' score.
#'
#' @references
#' Holbeck, S. L., Camalier, R., Crowell, J. A., Govindharajulu, J. P., Hollingshead, M., Anderson, L. W., Polley, E., Rubinstein, L., Srivastava, A., Wilsker, D., Collins, J. M., & Doroshow, J. H. (2017). The National Cancer Institute ALMANAC: A Comprehensive Screening Resource for the Detection of Anticancer Drug Pairs with Enhanced Therapeutic Activity. Cancer Research, 77(13), 3564–3576. https://doi.org/10.1158/0008-5472.CAN-17-0489
#'
#' @docType data
#' @name NCI_ALMANAC_raw
#' @usage data(NCI_ALMANAC_raw)
#' @keywords datasets
#' @format `data.table` object
NULL

#' A `MultiAssayExperiment` containing RNA microarray, mircoRNA and RNA
#' sequencing data from the NCI60, subset to cell-lines in NCI-ALMANAC
#'
#' This data has been precurated for inclusion in the NCI60_2021 PharmacoSet,
#' hosted on www.ORCESTRA.ca and downloadable from `PharmacoGx` via the
#' `downloadPSet` function. This data has already been subset to contain only
#' cancer cell-lines also present in the NCI-ALMANAC dataset.
#'
#' @references
#' 1. Shoemaker, R. H. (2006). The NCI60 human tumour cell line anticancer drug screen. Nature Reviews Cancer, 6(10), 813–823. https://doi.org/10.1038/nrc1951
#' 2. Holbeck, S. L., Camalier, R., Crowell, J. A., Govindharajulu, J. P., Hollingshead, M., Anderson, L. W., Polley, E., Rubinstein, L., Srivastava, A., Wilsker, D., Collins, J. M., & Doroshow, J. H. (2017). The National Cancer Institute ALMANAC: A Comprehensive Screening Resource for the Detection of Anticancer Drug Pairs with Enhanced Therapeutic Activity. Cancer Research, 77(13), 3564–3576. https://doi.org/10.1158/0008-5472.CAN-17-0489
#'
#' @docType data
#' @name NCI60_molecular_data
#' @usage data(NCI60_molecular_data)
#' @keywords datasets
#' @format `MultiAssayExperiment` object
NULL

#' A `data.frame` containing cell-line metadata manually curated as part of the
#' `PharmacoSet` creation process for the NCI-ALMANAC.
#'
#' Sample level metadata on cell-lines from the NCI-ALMANAC, standardized to
#' use identifers from Cellosaurus and included manually curated tissue
#' annotations from Oncotree as well as Cellosaurus disease type annotations.
#'
#' @references
#' 1. Bairoch A. he Cellosaurus, a cell line knowledge resource. J. Biomol. Tech. 29:25-38(2018) DOI: 10.7171/jbt.18-2902-002; PMID: 29805321
#' 2. Holbeck, S. L., Camalier, R., Crowell, J. A., Govindharajulu, J. P., Hollingshead, M., Anderson, L. W., Polley, E., Rubinstein, L., Srivastava, A., Wilsker, D., Collins, J. M., & Doroshow, J. H. (2017). The National Cancer Institute ALMANAC: A Comprehensive Screening Resource for the Detection of Anticancer Drug Pairs with Enhanced Therapeutic Activity. Cancer Research, 77(13), 3564–3576. https://doi.org/10.1158/0008-5472.CAN-17-0489
#'
#' @docType data
#' @name NCI_ALMANAC_sample_metadata
#' @usage data(NCI_ALMANAC_sample_metadata)
#' @keywords datasets
#' @format `data.frame` object
NULL

#' A `data.frame` containing drug metadata manually curated as part of the
#' `PharmacoSet` creation process for the NCI-ALMANAC.
#'
#' Treatment metadata on the various drugs used in the NCI-ALMANAC with additional
#' annotations included standardized drug identifiers which match the nomenclature
#' of other `PharmacoSet` object as well as links structural idenfiers such
#' as SMILES and InchiKeys as well as links to PubChem via the cid.
#'
#' @references
#' Holbeck, S. L., Camalier, R., Crowell, J. A., Govindharajulu, J. P., Hollingshead, M., Anderson, L. W., Polley, E., Rubinstein, L., Srivastava, A., Wilsker, D., Collins, J. M., & Doroshow, J. H. (2017). The National Cancer Institute ALMANAC: A Comprehensive Screening Resource for the Detection of Anticancer Drug Pairs with Enhanced Therapeutic Activity. Cancer Research, 77(13), 3564–3576. https://doi.org/10.1158/0008-5472.CAN-17-0489
#'
#' @docType data
#' @name NCI_ALMANAC_sample_metadata
#' @usage data(NCI_ALMANAC_sample_metadata)
#' @keywords datasets
#' @format `data.frame` object
NULL

#' A `data.frame` containing a subset of cell lines and driver mutations from
#' the Genomics of Drug Sensitivity in Cancer (GDSC) dataset.
#'
#' This is a subset of the GDSC driver mutations dataset from Iorio et al. 2016
#' containing a cancer driver mutation events for a random selection of cell lines.
#'
#' @references
#' 1. Yang, W., Soares, J., Greninger, P., Edelman, E. J., Lightfoot, H., Forbes, S., Bindal, N., Beare, D., Smith, J. A., Thompson, I. R., Ramaswamy, S., & Futreal, P. A. (2013). Genomics of Drug Sensitivity in Cancer (GDSC): a resource for therapeutic biomarker discovery in cancer cells. Nucleic Acids Research, 41(D1), D955–D961. https://doi.org/10.1093/nar/gks1111
#' 2. Iorio, F., Knijnenburg, T. A., Vis, D. J., Bignell, G. R., Menden, M. P., Schubert, M., Aben, N., Gonçalves, E., Barthorpe, S., Lightfoot, H., Cokelaer, T., Greninger, P., van Dyk, E., Chang, H., de Silva, H., Heyn, H., Deng, X., Egan, R. K., Liu, Q., Mironenko, T., … Garnett, M. J. (2016). A Landscape of Pharmacogenomic Interactions in Cancer. Cell, 166(3), 740–754. https://doi.org/10.1016/j.cell.2016.06.017
#' 3. Garnett, M. J., Edelman, E. J., Heidorn, S. J., Greenman, C. D., Dastur, A., Lau, K. W., Greninger, P., Thompson, I. R., Luo, X., Soares, J., Liu, Q., Iorio, F., Surdez, D., Chen, L., Milano, R. J., Bignell, G. R., Tam, A. T., Davies, H., Stevenson, J. A., … Benes, C. H. (2012). Systematic identification of genomic markers of drug sensitivity in cancer cells. Nature, 483(7391), 570–575. https://doi.org/10.1038/nature11005
#'
#' @docType data
#' @name GDSC_drivers
#' @usage data(GDSC_drivers)
#' @keywords datasets
#' @format `data.frame` object
NULL

#' A `data.frame` containing a subset of cell lines and RNA-seq data from
#' the Genomics of Drug Sensitivity in Cancer (GDSC) dataset.
#'
#' This is a subset of the GDSC RNA-seq dataset from Iorio et al. 2016
#' containing RNA-sequencing expression data (read counts and FPKM)
#' for a random selection of cell lines.
#'
#' @references
#' 1. Yang, W., Soares, J., Greninger, P., Edelman, E. J., Lightfoot, H., Forbes, S., Bindal, N., Beare, D., Smith, J. A., Thompson, I. R., Ramaswamy, S., & Futreal, P. A. (2013). Genomics of Drug Sensitivity in Cancer (GDSC): a resource for therapeutic biomarker discovery in cancer cells. Nucleic Acids Research, 41(D1), D955–D961. https://doi.org/10.1093/nar/gks1111
#' 2. Iorio, F., Knijnenburg, T. A., Vis, D. J., Bignell, G. R., Menden, M. P., Schubert, M., Aben, N., Gonçalves, E., Barthorpe, S., Lightfoot, H., Cokelaer, T., Greninger, P., van Dyk, E., Chang, H., de Silva, H., Heyn, H., Deng, X., Egan, R. K., Liu, Q., Mironenko, T., … Garnett, M. J. (2016). A Landscape of Pharmacogenomic Interactions in Cancer. Cell, 166(3), 740–754. https://doi.org/10.1016/j.cell.2016.06.017
#' 3. Garnett, M. J., Edelman, E. J., Heidorn, S. J., Greenman, C. D., Dastur, A., Lau, K. W., Greninger, P., Thompson, I. R., Luo, X., Soares, J., Liu, Q., Iorio, F., Surdez, D., Chen, L., Milano, R. J., Bignell, G. R., Tam, A. T., Davies, H., Stevenson, J. A., … Benes, C. H. (2012). Systematic identification of genomic markers of drug sensitivity in cancer cells. Nature, 483(7391), 570–575. https://doi.org/10.1038/nature11005
#'
#' @docType data
#' @name GDSC_rnaseq
#' @usage data(GDSC_rnaseq)
#' @keywords datasets
#' @format `data.frame` object
NULL

#' A `data.frame` containing the mapping of gene names used in the Genomics of
#' Drug Sensitivity in Cancer (GDSC) dataset.
#'
#' This is an annotation file obtained from Iorio et al. 2016
#' containing the mapping of gene names used in the GDSC dataset.
#'
#' @references
#' 1. Yang, W., Soares, J., Greninger, P., Edelman, E. J., Lightfoot, H., Forbes, S., Bindal, N., Beare, D., Smith, J. A., Thompson, I. R., Ramaswamy, S., & Futreal, P. A. (2013). Genomics of Drug Sensitivity in Cancer (GDSC): a resource for therapeutic biomarker discovery in cancer cells. Nucleic Acids Research, 41(D1), D955–D961. https://doi.org/10.1093/nar/gks1111
#' 2. Iorio, F., Knijnenburg, T. A., Vis, D. J., Bignell, G. R., Menden, M. P., Schubert, M., Aben, N., Gonçalves, E., Barthorpe, S., Lightfoot, H., Cokelaer, T., Greninger, P., van Dyk, E., Chang, H., de Silva, H., Heyn, H., Deng, X., Egan, R. K., Liu, Q., Mironenko, T., … Garnett, M. J. (2016). A Landscape of Pharmacogenomic Interactions in Cancer. Cell, 166(3), 740–754. https://doi.org/10.1016/j.cell.2016.06.017
#' 3. Garnett, M. J., Edelman, E. J., Heidorn, S. J., Greenman, C. D., Dastur, A., Lau, K. W., Greninger, P., Thompson, I. R., Luo, X., Soares, J., Liu, Q., Iorio, F., Surdez, D., Chen, L., Milano, R. J., Bignell, G. R., Tam, A. T., Davies, H., Stevenson, J. A., … Benes, C. H. (2012). Systematic identification of genomic markers of drug sensitivity in cancer cells. Nature, 483(7391), 570–575. https://doi.org/10.1038/nature11005
#'
#' @docType data
#' @name GDSC_gene_identifiers
#' @usage data(GDSC_gene_identifiers)
#' @keywords datasets
#' @format `data.frame` object
NULL

#' A `data.frame` containing metadata for cell lines used in the Genomics of
#' Drug Sensitivity in Cancer (GDSC) project.
#'
#' This is an annotation file obtained from Iorio et al. 2016
#' containing a list of cell line models used, including metadata for each cell
#' line.
#'
#' @references
#' 1. Yang, W., Soares, J., Greninger, P., Edelman, E. J., Lightfoot, H., Forbes, S., Bindal, N., Beare, D., Smith, J. A., Thompson, I. R., Ramaswamy, S., & Futreal, P. A. (2013). Genomics of Drug Sensitivity in Cancer (GDSC): a resource for therapeutic biomarker discovery in cancer cells. Nucleic Acids Research, 41(D1), D955–D961. https://doi.org/10.1093/nar/gks1111
#' 2. Iorio, F., Knijnenburg, T. A., Vis, D. J., Bignell, G. R., Menden, M. P., Schubert, M., Aben, N., Gonçalves, E., Barthorpe, S., Lightfoot, H., Cokelaer, T., Greninger, P., van Dyk, E., Chang, H., de Silva, H., Heyn, H., Deng, X., Egan, R. K., Liu, Q., Mironenko, T., … Garnett, M. J. (2016). A Landscape of Pharmacogenomic Interactions in Cancer. Cell, 166(3), 740–754. https://doi.org/10.1016/j.cell.2016.06.017
#' 3. Garnett, M. J., Edelman, E. J., Heidorn, S. J., Greenman, C. D., Dastur, A., Lau, K. W., Greninger, P., Thompson, I. R., Luo, X., Soares, J., Liu, Q., Iorio, F., Surdez, D., Chen, L., Milano, R. J., Bignell, G. R., Tam, A. T., Davies, H., Stevenson, J. A., … Benes, C. H. (2012). Systematic identification of genomic markers of drug sensitivity in cancer cells. Nature, 483(7391), 570–575. https://doi.org/10.1038/nature11005
#'
#' @docType data
#' @name GDSC_model_list
#' @usage data(GDSC_model_list)
#' @keywords datasets
#' @format `data.frame` object
NULL

#' A `data.frame` containing methylation beta values for cell lines from the
#' Genomics of Drug Sensitivity in Cancer (GDSC) dataset.
#'
#' This is a subset of the GDSC methylation dataset from Iorio et al. 2016
#' containing methylation beta values for a random selection of cell lines.
#'
#' @references
#' 1. Yang, W., Soares, J., Greninger, P., Edelman, E. J., Lightfoot, H., Forbes, S., Bindal, N., Beare, D., Smith, J. A., Thompson, I. R., Ramaswamy, S., & Futreal, P. A. (2013). Genomics of Drug Sensitivity in Cancer (GDSC): a resource for therapeutic biomarker discovery in cancer cells. Nucleic Acids Research, 41(D1), D955–D961. https://doi.org/10.1093/nar/gks1111
#' 2. Iorio, F., Knijnenburg, T. A., Vis, D. J., Bignell, G. R., Menden, M. P., Schubert, M., Aben, N., Gonçalves, E., Barthorpe, S., Lightfoot, H., Cokelaer, T., Greninger, P., van Dyk, E., Chang, H., de Silva, H., Heyn, H., Deng, X., Egan, R. K., Liu, Q., Mironenko, T., … Garnett, M. J. (2016). A Landscape of Pharmacogenomic Interactions in Cancer. Cell, 166(3), 740–754. https://doi.org/10.1016/j.cell.2016.06.017
#' 3. Garnett, M. J., Edelman, E. J., Heidorn, S. J., Greenman, C. D., Dastur, A., Lau, K. W., Greninger, P., Thompson, I. R., Luo, X., Soares, J., Liu, Q., Iorio, F., Surdez, D., Chen, L., Milano, R. J., Bignell, G. R., Tam, A. T., Davies, H., Stevenson, J. A., … Benes, C. H. (2012). Systematic identification of genomic markers of drug sensitivity in cancer cells. Nature, 483(7391), 570–575. https://doi.org/10.1038/nature11005
#'
#' @docType data
#' @name GDSC_methylation
#' @usage data(GDSC_methylation)
#' @keywords datasets
#' @format `data.frame` object
NULL

#' A `data.frame` containing GDSC methylation Sentrix array cell line metadata 
#' for the Genomics of Drug Sensitivity in Cancer (GDSC) dataset.
#'
#' This is an annotation file obtained from Iorio et al. 2016
#' containing metadata for cell lines used in the GDSC methylation dataset, 
#' specifically containing information regarding the Sentrix arrays.
#'
#' @references
#' 1. Yang, W., Soares, J., Greninger, P., Edelman, E. J., Lightfoot, H., Forbes, S., Bindal, N., Beare, D., Smith, J. A., Thompson, I. R., Ramaswamy, S., & Futreal, P. A. (2013). Genomics of Drug Sensitivity in Cancer (GDSC): a resource for therapeutic biomarker discovery in cancer cells. Nucleic Acids Research, 41(D1), D955–D961. https://doi.org/10.1093/nar/gks1111
#' 2. Iorio, F., Knijnenburg, T. A., Vis, D. J., Bignell, G. R., Menden, M. P., Schubert, M., Aben, N., Gonçalves, E., Barthorpe, S., Lightfoot, H., Cokelaer, T., Greninger, P., van Dyk, E., Chang, H., de Silva, H., Heyn, H., Deng, X., Egan, R. K., Liu, Q., Mironenko, T., … Garnett, M. J. (2016). A Landscape of Pharmacogenomic Interactions in Cancer. Cell, 166(3), 740–754. https://doi.org/10.1016/j.cell.2016.06.017
#' 3. Garnett, M. J., Edelman, E. J., Heidorn, S. J., Greenman, C. D., Dastur, A., Lau, K. W., Greninger, P., Thompson, I. R., Luo, X., Soares, J., Liu, Q., Iorio, F., Surdez, D., Chen, L., Milano, R. J., Bignell, G. R., Tam, A. T., Davies, H., Stevenson, J. A., … Benes, C. H. (2012). Systematic identification of genomic markers of drug sensitivity in cancer cells. Nature, 483(7391), 570–575. https://doi.org/10.1038/nature11005
#'
#' @docType data
#' @name GDSC_methylation_model_list
#' @usage data(GDSC_methylation_model_list)
#' @keywords datasets
#' @format `data.frame` object
NULL

#' A `data.frame` containing drug response data for the Genomics of Drug
#' Sensitivity in Cancer (GDSC) dataset.
#'
#' This is a subset of drug repsonse dataset from Iorio et al. 2016
#' containing cell line response (AUC, IC50) for a selection of drugs.
#'
#' @references
#' 1. Yang, W., Soares, J., Greninger, P., Edelman, E. J., Lightfoot, H., Forbes, S., Bindal, N., Beare, D., Smith, J. A., Thompson, I. R., Ramaswamy, S., & Futreal, P. A. (2013). Genomics of Drug Sensitivity in Cancer (GDSC): a resource for therapeutic biomarker discovery in cancer cells. Nucleic Acids Research, 41(D1), D955–D961. https://doi.org/10.1093/nar/gks1111
#' 2. Iorio, F., Knijnenburg, T. A., Vis, D. J., Bignell, G. R., Menden, M. P., Schubert, M., Aben, N., Gonçalves, E., Barthorpe, S., Lightfoot, H., Cokelaer, T., Greninger, P., van Dyk, E., Chang, H., de Silva, H., Heyn, H., Deng, X., Egan, R. K., Liu, Q., Mironenko, T., … Garnett, M. J. (2016). A Landscape of Pharmacogenomic Interactions in Cancer. Cell, 166(3), 740–754. https://doi.org/10.1016/j.cell.2016.06.017
#' 3. Garnett, M. J., Edelman, E. J., Heidorn, S. J., Greenman, C. D., Dastur, A., Lau, K. W., Greninger, P., Thompson, I. R., Luo, X., Soares, J., Liu, Q., Iorio, F., Surdez, D., Chen, L., Milano, R. J., Bignell, G. R., Tam, A. T., Davies, H., Stevenson, J. A., … Benes, C. H. (2012). Systematic identification of genomic markers of drug sensitivity in cancer cells. Nature, 483(7391), 570–575. https://doi.org/10.1038/nature11005
#'
#' @docType data
#' @name GDSC_drug_response
#' @usage data(GDSC_drug_response)
#' @keywords datasets
#' @format `data.frame` object
NULL

#' A `data.frame` containing global chromatin profiling of histone marks for
#' the Cancer Cell Line Encyclopedia (CCLE) dataset.
#'
#' This is a subset of the CCLE histone modifications dataset from Ghandi et al. 2019 
#' for available cell lines.
#'
#' @references
#' Ghandi, M., Huang, F. W., Jané-Valbuena, J., Kryukov, G. V., Lo, C. C., McDonald, E. R., Barretina, J., Gelfand, E. T., Bielski, C. M., Li, H., Hu, K., Andreev-Drakhlin, A. Y., Kim, J., Hess, J. M., Haas, B. J., Aguet, F., Weir, B. A., Rothberg, M. V., Paolella, B. R., … Golub, T. R. (2019). Next-generation characterization of the Cancer Cell Line Encyclopedia. Nature, 569(7757), 503–508. https://doi.org/10.1038/s41586-019-1186-3
#'
#' @docType data
#' @name CCLE_chromatin
#' @usage data(CCLE_chromatin)
#' @keywords datasets
#' @format `data.frame` object
NULL

#' A `data.frame` containing RPPA protein expression data for the Cancer Cell Line
#' Encyclopedia (CCLE) dataset.
#'
#' This is a subset of the RPPA protein expression dataset from Ghandi et al. 2019 that includes
#' measurements of protein expression levels across a random selection of cell lines.
#'
#' @references
#' Ghandi, M., Huang, F. W., Jané-Valbuena, J., Kryukov, G. V., Lo, C. C., McDonald, E. R., Barretina, J., Gelfand, E. T., Bielski, C. M., Li, H., Hu, K., Andreev-Drakhlin, A. Y., Kim, J., Hess, J. M., Haas, B. J., Aguet, F., Weir, B. A., Rothberg, M. V., Paolella, B. R., … Golub, T. R. (2019). Next-generation characterization of the Cancer Cell Line Encyclopedia. Nature, 569(7757), 503–508. https://doi.org/10.1038/s41586-019-1186-3
#'
#' @docType data
#' @name CCLE_rrpa
#' @usage data(CCLE_rrpa)
#' @keywords datasets
#' @format `data.frame` object
NULL

#' A `data.frame` containing metabolite expression data for the Cancer Cell Line
#' Encyclopedia (CCLE) dataset.
#'
#' This is a subset of the CCLE metabolomic dataset from Ghandi et al. 2019 that includes
#' measurements of metabolite expression levels across a random selection of cell lines.
#'
#' @references
#' Ghandi, M., Huang, F. W., Jané-Valbuena, J., Kryukov, G. V., Lo, C. C., McDonald, E. R., Barretina, J., Gelfand, E. T., Bielski, C. M., Li, H., Hu, K., Andreev-Drakhlin, A. Y., Kim, J., Hess, J. M., Haas, B. J., Aguet, F., Weir, B. A., Rothberg, M. V., Paolella, B. R., … Golub, T. R. (2019). Next-generation characterization of the Cancer Cell Line Encyclopedia. Nature, 569(7757), 503–508. https://doi.org/10.1038/s41586-019-1186-3
#'
#' @docType data
#' @name CCLE_metabolomics
#' @usage data(CCLE_metabolomics)
#' @keywords datasets
#' @format `data.frame` object
NULL

#' A `data.frame` containing metadata for cell lines used in the Cancer Cell
#' Line Encyclopedia (CCLE) project.
#'
#' This is an annotation file obtained from Ghandi et al. 2019 containing a
#' list of cell line models used, including metadata for each cell line.
#'
#' @references
#' Ghandi, M., Huang, F. W., Jané-Valbuena, J., Kryukov, G. V., Lo, C. C., McDonald, E. R., Barretina, J., Gelfand, E. T., Bielski, C. M., Li, H., Hu, K., Andreev-Drakhlin, A. Y., Kim, J., Hess, J. M., Haas, B. J., Aguet, F., Weir, B. A., Rothberg, M. V., Paolella, B. R., … Golub, T. R. (2019). Next-generation characterization of the Cancer Cell Line Encyclopedia. Nature, 569(7757), 503–508. https://doi.org/10.1038/s41586-019-1186-3
#'
#' @docType data
#' @name CCLE_model_list
#' @usage data(CCLE_model_list)
#' @keywords datasets
#' @format `data.frame` object
NULL
