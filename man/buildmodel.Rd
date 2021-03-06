% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/routines.R
\name{buildmodel}
\alias{buildmodel}
\title{Build model for multiple systems estimation}
\usage{
buildmodel(zdat, mX)
}
\arguments{
\item{zdat}{Data matrix with \eqn{t+1} columns. The first \eqn{t} columns, each corresponding to a particular list,
are 0s and 1s defining the capture histories
observed. The last column is the count of cases with that particular capture history.
List names A, B, ... are constructed if not supplied. Where a capture history is not explicitly listed,
it is assumed that it has observed count zero.}

\item{mX}{A \eqn{2 \times k} matrix giving the \eqn{k} two-list interactions to be included in the model.
Each column of \code{mX} contains the numbers of the corresponding pair of lists.
If \code{mX = 0}, then all two-list interactions are included. If \code{mX = NULL}, no interactions are included and
 the main effects model is fitted.}
}
\value{
A list with components as below.

 \code{datamatrix} A matrix with all possible capture histories, other than those corresponding to empty overlaps
 within the model.  An empty overlap is a pair of lists \eqn{(i,j)} such that no case is observed in both lists,
 regardless of whether it is present on any other lists.   If \eqn{(i,j)} is within the model specified by \code{mX},
 all capture histories containing both \eqn{i} and \eqn{j} are
 then excluded.

\code{modelform} The model formula suitable to be called by the Generalized Linear Model function \code{glm}

\code{emptyoverlaps} A matrix with two rows, whose columns give the indices of pairs of lists for which there are empty overlaps and where
the pair is within the specified model. The column names give the names of the lists
corresponding to each pair.
}
\description{
For multiple systems estimation model corresponding to a specified set of two-list effects,
   set up the GLM model formula and data matrix.
}
\examples{
data(NewOrl)
buildmodel(NewOrl, mX=NULL)
}
