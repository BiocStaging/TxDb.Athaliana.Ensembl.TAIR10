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
## The TxDb object is downloaded from AnnotationHub, so this example is
## only run when AnnotationHub is installed and the resource is
## reachable.
if (requireNamespace("AnnotationHub", quietly=TRUE)) {
    txdb <- tryCatch({
        ah <- AnnotationHub::AnnotationHub()
        ah[["AH122287"]]
    }, error=function(e) NULL)

    if (!is.null(txdb)) {
        txdb
        ## retrieve all genes
        GenomicFeatures::genes(txdb)
    }
}
}

\keyword{package}
\keyword{data}

