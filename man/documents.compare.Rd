% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/deprecated.r
\name{documents.compare}
\alias{documents.compare}
\title{Compare the documents in two corpora/dtms}
\usage{
documents.compare(dtm, dtm.y = NULL, measure = c("cosine",
  "overlap_pct", "overlap", "crossprod", "softcosine", "query_lookup",
  "query_lookup_pct"), min.similarity = 0, n.topsim = NULL,
  max_p = 1, pvalue = c("none", "normal", "lognormal", "nz_normal",
  "nz_lognormal", "disparity"), simmat = NULL, simmat_thres = NULL)
}
\arguments{
\item{dtm}{A quanteda \link[quanteda]{dfm}. Alternatively, a DocumentTermMatrix from the tm package can be used.}

\item{dtm.y}{Optional. If given, documents from dtm will only be compared to the documents in dtm.y}

\item{measure}{the measure that should be used to calculate similarity/distance/adjacency. Currently supports the symmetrical measure "cosine" (cosine similarity), the assymetrical measures "overlap_pct" (percentage of term scores in the document 
that also occur in the other document), "overlap" (like overlap_pct, but as the sum of overlap instead of the percentage) and the symmetrical soft cosine measure (experimental).
The regular crossprod (inner product) is also supported.
If the dtm's are prepared with the create_queries function, the special "query_lookup" and "query_lookup_pct" can be used.}

\item{min.similarity}{a threshold for similarity. lower values are deleted. Set to 0 by default.}

\item{n.topsim}{An alternative or additional sort of threshold for similarity. Only keep the [n.topsim] highest similarity scores for x. Can return more than [n.topsim] similarity scores in the case of duplicate similarities.}

\item{max_p}{A threshold for maximium p value.}

\item{pvalue}{If max_p < 1, edges are removed based on a p value. For each document in dtm, a p value is calculated over its outward edges. 
Default is the p-value based on uniform distribution, akin to a "disparity" filter (see \href{https://www.pnas.org/content/106/16/6483.full}{Serrano et al.}) but without filtering on inward edges.}

\item{simmat}{If softcosine is used, a symmetrical matrix with the similarity scores of terms. If NULL, the cosine similarity of terms in dtm will be used}

\item{simmat_thres}{If softosine is used, a threshold for the similarity scores of terms}
}
\value{
A data frame with pairs of documents and their similarities.
}
\description{
Compare the documents in corpus dtm.x with reference corpus dtm.y.
}
\details{
The calculation of document similarity is performed using a vector space model approach. 
Inner-product based similarity measures are used, such as cosine similarity.
It is recommended to weight the DTM beforehand, for instance using Term frequency-inverse document frequency (tf.idf)
}
\examples{
comp = documents.compare(rnewsflow_dfm, min.similarity=0.4)
head(comp)
}
