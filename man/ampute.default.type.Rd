% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ampute.default.R
\name{ampute.default.type}
\alias{ampute.default.type}
\title{Default \code{type} in \code{ampute()}}
\usage{
ampute.default.type(patterns)
}
\arguments{
\item{patterns}{A matrix of size #patterns by #variables where 0 indicates a 
variable should have missing values and 1 indicates a variable should remain 
complete. Could be the result of \code{\link{ampute.default.patterns}}.}
}
\value{
A string vector of length #patterns containing the missingness types.  
Each pattern will be amputed with a "RIGHT" missingness.
}
\description{
Defines the default type vector for the multivariate amputation function 
\code{ampute}.
}
\seealso{
\code{\link{ampute}}, \code{\link{ampute.default.patterns}}
}
\author{
Rianne Schouten, 2016
}
\keyword{internal}
