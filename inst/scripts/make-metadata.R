### =========================================================================
### make-metadata.R
### -------------------------------------------------------------------------
###
### Generates inst/extdata/metadata.csv, the AnnotationHub resource
### description for the TxDb built by inst/scripts/make-data.R.
###
### Validate the result with:
###     AnnotationHubData::makeAnnotationHubMetadata("<path to package>")
###

meta <- data.frame(
    Title           = "TxDb.Athaliana.Ensembl.TAIR10",
    Description     = "Transcript Annotation Database for Arabidopsis thaliana",
    BiocVersion     = "3.24",
    Genome          = "TAIR10",
    SourceType      = "GFF",
    SourceVersion   = "63",
    SourceUrl       = "https://ftp.ensemblgenomes.ebi.ac.uk/pub/plants/release-63/fasta/arabidopsis_thaliana/dna/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa.gz",
    Species         = "Arabidopsis thaliana",
    TaxonomyId      = "3702",
    Coordinate_1_based = TRUE,
    DataProvider    = "Ensembl Plants",
    Maintainer      = "Kabilan S <kabilan151414@gmail.com>",
    RDataClass      = "TxDb",
    DispatchClass   = "SQLiteFile",
    Location_Prefix = "https://zenodo.org/",
    RDataPath       = "records/21849168/files/TxDb.Athaliana.Ensembl.TAIR10",
    Tags            = "AnnotationData:TxDb:Arabidopsis_thaliana:SequenceAnnotation:AnnotationHub",
    stringsAsFactors = FALSE
)

write.csv(meta, file = "inst/extdata/metadata.csv", row.names = FALSE)

