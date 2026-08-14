### =========================================================================
### make-data.R
### -------------------------------------------------------------------------
###
### Builds the TxDb SQLite database distributed with this package through
### AnnotationHub, from the official TAIR10 reference genome and Ensembl Plants
### release 63 GFF3 annotation.
###
### The resulting file, TxDb.Athaliana.Ensembl.TAIR10.sqlite, is deposited on
### Zenodo (record 21849168) and referenced from inst/extdata/metadata.csv.
###
### Not run at build or check time; kept here for provenance and
### reproducibility, as required for AnnotationHub packages.
###

library(txdbmaker)
library(AnnotationDbi)

GFF_URL <- paste0("https://ftp.ensemblgenomes.ebi.ac.uk/pub/plants/",
                  "release-63/gff3/arabidopsis_thaliana/",
                  "Arabidopsis_thaliana.TAIR10.63.gff3.gz")

gff_file <- file.path(tempdir(), "Arabidopsis_thaliana.TAIR10.63.gff3.gz")
download.file(GFF_URL, gff_file, mode = "wb")

txdb <- txdbmaker::makeTxDbFromGFF(
    file = gff_file,
    format = "gff3",
    dataSource = GFF_URL,
    organism = "Arabidopsis thaliana",
    taxonomyId = 3702
)

AnnotationDbi::saveDb(txdb, file = "TxDb.Athaliana.Ensembl.TAIR10.sqlite")
