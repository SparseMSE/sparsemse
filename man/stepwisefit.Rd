% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/routines.R
\name{stepwisefit}
\alias{stepwisefit}
\title{Stepwise fit using Poisson pvalues.}
\usage{
stepwisefit(zdat, pthresh = 0.001)
}
\arguments{
\item{zdat}{Data matrix with \eqn{t+1} columns. The first \eqn{t} columns, each corresponding to a particular list,
are 0s and 1s defining the capture histories
observed. The last column is the count of cases with that particular capture history.
List names A, B, ... are constructed if not supplied. Where a capture history is not explicitly listed,
it is assumed that it has observed count zero.}

\item{pthresh}{this is the threshold below which the p-value of the newly added parameter needs to be in order to be included in the model.
If \code{pthresh = 0} then the model with main effects only is returned.}
}
\value{
A list with components as follow

\code{fit} Details of the fit of the specified model as output by \code{glm}.  The Akaike information criterion is adjusted to take account
  of the parameters corresponding to empty overlaps.

\code{emptyoverlaps} Matrix with two rows, each column of which gives the list pairs within the model for which empty overlaps are observed

\code{poisspempty} the Poisson p-value of the empty overlaps.
}
\description{
Starting with a model with main effects only, pairwise interactions are added one by one.
At each stage the interaction with the lowest p-value is added, provided that p-value is lower than \code{pthresh}, and provided that the resulting
model does not fail either of the tests in \code{\link{checkident}}.
}
\details{
For each candidate interaction for possible addition to the model, the p-value is calculated as follows.
The total of cases occurring on both lists indexed by the interaction (regardless of
whether or not they are on any other lists) is calculated.
On the null hypothesis that the effect is not included in the model, this statistic has a Poisson
distribution whose mean depends on the parameters within the model.    The one-sided Poisson p-value of the observed statistic is calculated.
}
\examples{
data(NewOrl)
stepwisefit(NewOrl, pthresh=0.001)

}
