% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{is.OfType}
\alias{is.OfType}
\title{Similar to the function \code{is.na()} but focused on the equality
with the paramter 'type'.}
\usage{
is.OfType(data, type)
}
\arguments{
\item{data}{A data.frame}

\item{type}{The value to search in the dataframe}
}
\value{
A boolean dataframe
}
\description{
Similar to the function \code{is.na()} but focused on the equality
with the paramter 'type'.
}
\examples{
library(QFeatures)
data(ft, package='DaparToolshed')
obj <- ft[[1]]
data <- qMetacell(obj)
is.OfType(as.data.frame(data), "MEC")

}
\author{
Samuel Wieczorek
}
