% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DaparToolshed_filter_Adjmat.R
\name{adjacency-matrix-filter}
\alias{adjacency-matrix-filter}
\alias{AdjMatFilters}
\alias{allPeptides}
\alias{specPeptides}
\alias{subAdjMat_specificPeptides}
\alias{sharedPeptides}
\alias{subAdjMat_sharedPeptides}
\alias{topnFunctions}
\alias{topnPeptides}
\alias{subAdjMat_topnPeptides}
\title{Filter a peptide assay on the basis of its adjacency matrix.}
\usage{
AdjMatFilters()

allPeptides(object, ...)

specPeptides(object, ...)

subAdjMat_specificPeptides(X)

sharedPeptides(object, ...)

subAdjMat_sharedPeptides(X)

topnFunctions()

topnPeptides(object, fun, top)

subAdjMat_topnPeptides(X, qData, fun, top)
}
\arguments{
\item{object}{An object of class \code{SummarizedExperiment}}

\item{...}{Additional arguments}

\item{X}{xxx}

\item{fun}{A \code{list()} of additional parameters}

\item{top}{A \code{integer(1)} which is the number of xxx}

\item{qData}{xxx}
}
\value{
NA
}
\description{
These functions filters (delete) peptides of an assay, applying a function
on peptides and proteins. They can be used alone but the usual usage is to
create an instance of a class \link{FunctionFilter} and to pass it to the function
\link{filterFeaturesOneSE} in order to create a new assay, embedded into the
\link{QFeatures} object.
}
\details{
This function builds an intermediate matrix with scores for each peptide
based on 'fun' parameter. Once this matrix is built, one select the
'n' peptides which have the higher score

The list of filter functions is given by \code{adjMatFilters()}:
\itemize{
\item \code{specPeptides()}: returns a new assay of class \code{SummazizedExperiment}
with only specific peptides;
\item \code{sharedpeptides()}: returns a new assay of class \code{SummazizedExperiment}
with only shared peptides;
\item \code{opnPeptides()}: returns a new assay of class \code{SummazizedExperiment} with
only the 'n' peptides which best satisfies the condition. The condition is
represented by functions which calculates a score for each peptide among
all samples. The list of these functions is given by \code{topnFunctions()}:
\item \code{rowMedians()}: xxx;
\item \code{rowMeans()}: xxx;
\item \code{rowSums()}: xxx;
}
}
\examples{

#------------------------------------------------
# This function will keep only specific peptides
#------------------------------------------------

f1 <- FunctionFilter("specPeptides", list())

#------------------------------------------------
# This function will keep only shared peptides
#------------------------------------------------

f2 <- FunctionFilter("sharedPeptides", list())

#------------------------------------------------
# This function will keep only the 'n' best peptides
# w.r.t the quantitative sum of each peptides among
# all samples
#------------------------------------------------

f3 <- FunctionFilter("topnPeptides", fun = "rowSums", top = 2)

#------------------------------------------------------
# To run the filter(s) on the dataset, use [xxx()]
# IF several filters must be used, store them in a list
#------------------------------------------------------

data(ft, package='DaparToolshed')
lst.filters <- list()
lst.filters <- append(lst.filters, f1)
lst.filters <- append(lst.filters, f3)

ft <- filterFeaturesOneSE(
    object = ft,
    i = 1,
    name = "filtered",
    filters = lst.filters
)

}
\seealso{
The \link{QFeatures-filtering-oneSE} man page for the
class \code{FunctionFilter}.
}
\author{
Samuel Wieczorek
}
