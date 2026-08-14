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

### ARAB_GFF3 – full TxDb (chromosomes + scaffolds)
# ----------------------------------------------------------------------
# 1. Define paths and parameters
# ----------------------------------------------------------------------
library(Biostrings)
library(GenomicFeatures)
library(txdbmaker)

# --- File paths (adjust as needed) ---
# Below files were downloaded from below link
# https://ftp.ensemblgenomes.ebi.ac.uk/pub/plants/release-63/gff3/arabidopsis_thaliana/Arabidopsis_thaliana.TAIR10.63.gff3.gz

gff_file   <- "Arabidopsis_thaliana.TAIR10.63.gff3.gz"
fasta_file <- "Arabidopsis_thaliana.TAIR10.dna.toplevel.fa.gz"

output_sqlite <- "TxDb.Athaliana.Ensembl.TAIR10.sqlite"


organism_name <- "Arabidopsis thaliana"
taxonomy_id   <- 3702
ensembl_release <- "63"
genome_assembly <- "TAIR10"

# ----------------------------------------------------------------------
# 2. Build full chrominfo from the FASTA (all sequences)
# ----------------------------------------------------------------------
genome <- readDNAStringSet(fasta_file)
cat("Number of sequences in FASTA:", length(genome), "\n")

chrominfo <- data.frame(
  chrom       = names(genome),
  length      = width(genome),
  is_circular = rep(FALSE, length(genome))
)
cat("chrominfo rows:", nrow(chrominfo), "\n")

chrominfo <- data.frame(
  chrom = c("1", "2", "3", "4", "5", "Mt", "Pt"),
  length = c(
    30427671,
    19698289,
    23459830,
    18585056,
    26975502,
    366924,
    154478
  ),
  is_circular = c(
    FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE
  )
)

chrominfo

# ----------------------------------------------------------------------
# 3. Build the TxDb directly from the compressed GFF + full chrominfo
# ----------------------------------------------------------------------
cat("Building TxDb from the full GFF file ... (this may take a while)\n")
arab_txdb <- suppressWarnings(
  makeTxDbFromGFF(
    file       = gff_file,       # original .gz file – can be read directly
    format     = "gff3",
    dataSource = "Ensembl Plants",
    organism   = organism_name,
    taxonomyId = taxonomy_id,
    chrominfo  = chrominfo       # all chromosomes + scaffolds
  )
)

# ----------------------------------------------------------------------
# 4. Fix genome label
# ----------------------------------------------------------------------
genome(seqinfo(arab_txdb)) <- genome_assembly

# ----------------------------------------------------------------------
# 5. Save to SQLite
# ----------------------------------------------------------------------
saveDb(arab_txdb, output_sqlite)

# ----------------------------------------------------------------------
# 6. Quick validation
# ----------------------------------------------------------------------
cat("TxDb saved to:", output_sqlite, "\n")
cat("Number of transcripts:", length(transcripts(arab_txdb)), "\n")
cat("Number of exons:", length(exons(arab_txdb)), "\n")
cat("Number of genes:", length(genes(arab_txdb)), "\n")



