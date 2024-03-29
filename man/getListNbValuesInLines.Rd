% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{getListNbValuesInLines}
\alias{getListNbValuesInLines}
\title{Returns the possible number of values in lines in the data}
\usage{
getListNbValuesInLines(object, conds, type = "WholeMatrix")
}
\arguments{
\item{object}{An object of class \code{QFeatures}}

\item{conds}{xxxx}

\item{type}{WholeMatrix, AllCond or AtLeastOneCond}
}
\value{
An integer
}
\description{
Returns the possible number of values in lines in the data
}
\examples{
data(ft, package='DaparToolshed')
res <- getListNbValuesInLines(ft, 1)

}
\author{
Samuel Wieczorek, Enora Fremy
}
