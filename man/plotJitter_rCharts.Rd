% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_pep_prot_cc.R
\name{plotJitter_rCharts}
\alias{plotJitter_rCharts}
\title{Display a a jitter plot for CC}
\usage{
plotJitter_rCharts(df, clickFunction = NULL)
}
\arguments{
\item{df}{xxxx}

\item{clickFunction}{xxxx}
}
\value{
A plot
}
\description{
Display a a jitter plot for CC
}
\examples{
data(Exp1_R25_pept, package="DaparToolshedData")
obj <- Exp1_R25_pept[seq_len(100)]
X <- BuildAdjacencyMatrix(obj, "Protein_group_IDs", TRUE)
ll <- get.pep.prot.cc(X)[1:4]
n.prot <- unlist(lapply(ll, function(x) {length(x$proteins)}))
n.pept <- unlist(lapply(ll, function(x) {length(x$peptides)}))
df <- tibble::tibble(
x = jitter(n.pept),
y = jitter(n.prot),
index = seq_len(length(ll))
)
plotJitter_rCharts(df)

}
\author{
Thomas Burger, Samuel Wieczorek
}
