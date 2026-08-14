# TxDb.Athaliana.Ensembl.TAIR10

TxDb.Athaliana.Ensembl.TAIR10 provides transcript, exon, CDS, and gene
annotations for *Arabidopsis thaliana* based on the TAIR10 reference
genome. It is a Bioconductor TxDb object built from the Ensembl Plants
GFF3 annotation (Ensembl Plants release 63), covering the TAIR10 nuclear
chromosomes and organellar genomes.

After loading the package, you can use GenomicFeatures accessors such as
`genes()`, `transcripts()`, `exonsBy()`, and `cdsBy()` to extract and
query gene models from the TAIR10 annotation.

## Installation

```r
if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}
BiocManager::install(c("AnnotationHub", "GenomicFeatures"))
```
## Usage

The TxDb object is not shipped inside the package; it is hosted on
AnnotationHub and downloaded on first use.

```r
library(TxDb.Athaliana.Ensembl.TAIR10)
library(AnnotationHub)
library(GenomicFeatures)

ah <- AnnotationHub()
txdb <- ah[["AH122287"]]

genes(txdb)
head(transcripts(txdb))
exonsBy(txdb, by = "tx")
```

See the vignette for a full walkthrough:

```r
vignette("vignette", package = "TxDb.Athaliana.Ensembl.TAIR10")
```


