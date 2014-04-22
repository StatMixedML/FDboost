\name{bbsc}
\alias{bbsc}
\alias{bolsc}
\alias{brandomc}
\title{Constrained Base-learners for Scalar Covariates}
\usage{
  bbsc(..., by = NULL, index = NULL, knots = 10,
    boundary.knots = NULL, degree = 3, differences = 2,
    df = 4, lambda = NULL, center = FALSE, cyclic = FALSE)

  bolsc(..., by = NULL, index = NULL, intercept = TRUE,
    df = NULL, lambda = 0, K = NULL,
    contrasts.arg = "contr.treatment")

  brandomc(..., contrasts.arg = "contr.dummy", df = 4)
}
\arguments{
  \item{...}{one or more predictor variables or one matrix
  or data frame of predictor variables.}

  \item{by}{an optional variable defining varying
  coefficients, either a factor or numeric variable.}

  \item{index}{a vector of integers for expanding the
  variables in \code{...}.}

  \item{knots}{either the number of knots or a vector of
  the positions of the interior knots (for more details see
  \code{\link[mboost]{bbs}}).}

  \item{boundary.knots}{boundary points at which to anchor
  the B-spline basis (default the range of the data). A
  vector (of length 2) for the lower and the upper boundary
  knot can be specified.}

  \item{degree}{degree of the regression spline.}

  \item{differences}{a non-negative integer, typically 1, 2
  or 3. If \code{differences} = \emph{k}, \emph{k}-th-order
  differences are used as a penalty (\emph{0}-th order
  differences specify a ridge penalty).}

  \item{df}{trace of the hat matrix for the base-learner
  defining the base-learner complexity. Low values of
  \code{df} correspond to a large amount of smoothing and
  thus to "weaker" base-learners.}

  \item{lambda}{smoothing penalty, computed from \code{df}
  when \code{df} is specified.}

  \item{K}{in \code{bolsc} it is possible to specify the
  penalty matrix K}

  \item{center}{not implemented yet}

  \item{cyclic}{if \code{cyclic = TRUE} the fitted values
  coincide at the boundaries (useful for cyclic covariates
  such as day time etc.).}

  \item{contrasts.arg}{Note that a special
  \code{contrasts.arg} exists in package \code{mboost},
  namely "contr.dummy". This contrast is used per default
  in \code{brandomc}. It leads to a dummy coding as
  returned by \code{model.matrix(~ x - 1)} were the
  intercept is implicitly included but each factor level
  gets a separate effect estimate (for more details see
  \code{\link[mboost]{brandom}}).}

  \item{intercept}{if intercept = TRUE an intercept is
  added to the design matrix of a linear base-learner.}
}
\value{
  Equally to the base-learners of the package mboost:

  An object of class \code{blg} (base-learner generator)
  with a \code{dpp} function.

  The call of \code{dpp} returns an object of class
  \code{bl} (base-learner) with a \code{fit} function. The
  call to \code{fit} finally returns an object of class
  \code{bm} (base-model).
}
\description{
  Constrained base-learners for fitting effects of scalar
  covariates in models with functional response
}
\details{
  The base-learners \code{bbsc}, \code{bolsc} and
  \code{brandomc} are basically the base-learners
  \code{\link[mboost]{bbs}}, \code{\link[mboost]{bols}} and
  \code{\link[mboost]{brandom}} with additional
  identifiability constraints. Instead of the default
  identifiability constraints (\eqn{\sum_{i,t} \hat f(x_i,
  t) = 0}) implemented in \code{mboost} for tensor product
  terms whose marginal terms include the index of the
  functional response \eqn{t} constraints that enforce
  \eqn{\sum_i \hat f(z_i, x_i, t) = 0} for all \eqn{t} are
  used, so that effects varying over \eqn{t} can be
  interpreted as deviations from the global functional
  intercept.

  Cannot deal with any missing values in the covariates.
}
\references{
  Scheipl, F., Staicu, A.-M., and Greven, S. (2014),
  Functional Additive Mixed Models, Journal of
  Computational and Graphical Statistics, in press, DOI
  10.1080/10618600.2014.901914.
  \url{http://arxiv.org/abs/1207.5947}
}
\seealso{
  \code{\link{FDboost}} for the model fit.
  \code{\link[mboost]{bbs}}, \code{\link[mboost]{bols}} and
  \code{\link[mboost]{brandom}} for the corresponding
  base-learners in mboost.
}
\keyword{models}
