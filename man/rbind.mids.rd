% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rbind.r
\name{rbind.mids}
\alias{rbind.mids}
\title{Rowwise combination of a \code{mids} object.}
\usage{
\method{rbind}{mids}(x, y = NULL, ...)
}
\arguments{
\item{x}{A \code{mids} object.}

\item{y}{A \code{mids} object, or a \code{data.frame}, \code{matrix}, \code{factor} 
or \code{vector}.}

\item{\dots}{Additional \code{data.frame}, \code{matrix}, \code{vector} or \code{factor}. 
These can be given as named arguments.}
}
\value{
An S3 object of class \code{mids}
}
\description{
Append \code{mids} objects by rows
}
\details{
This function combines two \code{mids} objects rowwise into a single
\code{mids} object, or combines a \code{mids} object with a vector, matrix,
factor or dataframe rowwise into a \code{mids} object. The columns
in the (incomplete) data \code{x$data} and \code{y} (or \code{y$data} if
\code{y} is a \code{mids} object) should match. If \code{y} is a
\code{mids} object, then \code{rbind} only works if the number of 
multiple imputations in \code{x} and \code{y} is equal.
}
\note{
The function construct the elements of the new \code{mids} object as follows:
\tabular{ll}{
\code{call}     \tab Vector, \code{call[1]} creates \code{x}, \code{call[2]} is call to \code{rbind.mids}\cr
\code{data}     \tab Rowwise combination of the (incomplete) data in \code{x} and \code{y}\cr
\code{where}    \tab Rowwise combination of \code{where} arguments\cr
\code{m}        \tab Equals \code{x$m}\cr
\code{nmis}     \tab \code{x$nmis} + \code{y$nmis}\cr
\code{imp}      \tab Equals \code{rbind(x$imp[[j]], y$imp[[j]])} if \code{y} is \code{mids} object; otherwise
the data of \code{y} will be copied\cr
\code{method}   \tab Taken from \code{x$method}\cr
\code{predictorMatrix} \tab Taken from \code{x$predictorMatrix}\cr
\code{visitSequence}   \tab Taken from \code{x$visitSequence}\cr
\code{seed}            \tab Taken from \code{x$seed}\cr
\code{iteration}       \tab Taken from \code{x$iteration}\cr
\code{lastSeedValue}   \tab Taken from \code{x$lastSeedValue}\cr
\code{chainMean}       \tab Set to \code{NA}\cr
\code{chainVar}        \tab Set to \code{NA}\cr
\code{pad}             \tab Recreated by \code{padModel()}\cr
\code{loggedEvents}    \tab Taken from \code{x$loggedEvents}
}
}
\examples{
imp1 <- mice(nhanes[1:13, ], m = 2, maxit = 1, print = FALSE)
imp5 <- mice(nhanes[1:13, ], m = 2, maxit = 2, print = FALSE)
mylist <- list(age = NA, bmi = NA, hyp = NA, chl = NA)

nrow(complete(rbind(imp1, imp5)))
nrow(complete(rbind(imp1, mylist)))

# Note: If one of the arguments is a data.frame 
# we need to explicitly call mice:::rbind.mids()
nrow(complete(mice:::rbind.mids(imp1, data.frame(mylist))))
nrow(complete(mice:::rbind.mids(imp1, complete(imp5))))
}
\references{
van Buuren S and Groothuis-Oudshoorn K (2011). \code{mice}:
Multivariate Imputation by Chained Equations in \code{R}. \emph{Journal of
Statistical Software}, \bold{45}(3), 1-67.
\url{http://www.jstatsoft.org/v45/i03/}
}
\seealso{
\code{\link{cbind.mids}}, \code{\link{ibind}}, \code{\link[=mids-class]{mids}}
}
\author{
Karin Groothuis-Oudshoorn, Stef van Buuren
}
\keyword{manip}
