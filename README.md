# TxDb.Athaliana.Ensembl.TAIR10

TxDb.Athaliana.Ensembl.TAIR10 provides transcript, exon, CDS, and gene
annotations for *Arabidopsis thaliana* based on the TAIR10 reference
genome. It is a Bioconductor TxDb object built from the Ensembl Plants
GFF3 annotation (Ensembl Plants release 63), covering the TAIR10 nuclear
chromosomes and organellar genomes.

After loading the package, you can use GenomicFeatures accessors such as
`genes()`, `transcripts()`, `exonsBy()`, and `cdsBy()` to extract and
query gene models from the TAIR10 annotation.
