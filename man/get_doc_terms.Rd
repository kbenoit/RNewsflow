% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/feature_preparation.r
\name{get_doc_terms}
\alias{get_doc_terms}
\title{View term scores for a given document}
\usage{
get_doc_terms(dtm, docname = NULL, doc_i = NULL)
}
\arguments{
\item{dtm}{A quanteda dfm}

\item{docname}{name of document to select}

\item{doc_i}{alternatively, select document by index}
}
\value{
A named vector with terms (names) and scores
}
\description{
View term scores for a given document
}
\examples{
get_doc_terms(rnewsflow_dfm, doc_i=1)
}
