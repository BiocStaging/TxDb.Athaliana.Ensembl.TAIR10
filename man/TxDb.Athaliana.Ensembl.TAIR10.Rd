\name{TxDb.Athaliana.Ensembl.TAIR10}
\docType{package}

\alias{TxDb.Athaliana.Ensembl.TAIR10-package}
\alias{TxDb.Athaliana.Ensembl.TAIR10}
\alias{TxDb.Athaliana.Ensembl.TAIR10_dbconn}
\alias{TxDb.Athaliana.Ensembl.TAIR10_dbfile}
\alias{TxDb.Athaliana.Ensembl.TAIR10_dbschema}
\alias{TxDb.Athaliana.Ensembl.TAIR10_dbInfo}

\title{Annotation package for TxDb object(s)}

\description{
TxDb.Athaliana.Ensembl.TAIR10 provides transcript, exon, and CDS
annotations for Arabidopsis thaliana based on the TAIR10 reference
genome. It is a Bioconductor TxDb object built from the Ensembl Plants
GFF3 annotation (release 63).

The package provides genomic coordinates and transcript models that can
be accessed using GenomicFeatures accessors such as genes(),
transcripts(), exonsBy(), and cdsBy().
}

\note{
This data package was built from the Ensembl Plants GFF3 annotation
(release 63) for Arabidopsis thaliana using the TAIR10 reference genome.
The annotation includes the five nuclear chromosomes and the mitochondrial
and plastid sequences.
}

\author{
Dwijesh Chandra Mishra (aut),
Sharanbasappa D Madival (aut),
Kabilan S (aut, cre) \email{kabilan151414@gmail.com}
}

\seealso{
\link[GenomicFeatures]{genes},
\link[GenomicFeatures]{transcripts},
\link[GenomicFeatures]{transcriptsBy},
\link[GenomicFeatures]{exonsBy},
\link[GenomicFeatures]{cdsBy}
}

\examples{

## load the library

library(TxDb.Athaliana.Ensembl.TAIR10)

## show the TxDb object

TxDb.Athaliana.Ensembl.TAIR10

## retrieve chromosome information

seqinfo(TxDb.Athaliana.Ensembl.TAIR10)

## retrieve all genes

GenomicFeatures::genes(TxDb.Athaliana.Ensembl.TAIR10)

## retrieve transcripts

GenomicFeatures::transcripts(TxDb.Athaliana.Ensembl.TAIR10)

## retrieve exons grouped by transcript

GenomicFeatures::exonsBy(
    TxDb.Athaliana.Ensembl.TAIR10,
    by = "tx"
)

## retrieve CDS grouped by transcript

GenomicFeatures::cdsBy(
    TxDb.Athaliana.Ensembl.TAIR10,
    by = "tx"
)
}

\keyword{package}
\keyword{data}
