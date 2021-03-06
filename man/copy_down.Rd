% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/copy_down.R
\name{copy_down}
\alias{copy_down}
\alias{copy_down.mesh3d}
\alias{copy_down.SC}
\alias{copy_down.SC0}
\alias{copy_down.TRI}
\alias{copy_down.TRI0}
\alias{copy_down.PATH}
\alias{copy_down.PATH0}
\alias{copy_down.ARC}
\alias{copy_down.QUAD}
\title{Copy down values to vertices}
\usage{
copy_down(x, z = NULL, ..., .id = "z_")

\method{copy_down}{mesh3d}(x, z = NULL, ..., .id = "z_")

\method{copy_down}{SC}(x, z = NULL, ..., .id = "z_")

\method{copy_down}{SC0}(x, z = NULL, ..., .id = "z_")

\method{copy_down}{TRI}(x, z = NULL, ..., .id = "z_")

\method{copy_down}{TRI0}(x, z = NULL, ..., .id = "z_")

\method{copy_down}{PATH}(x, z = NULL, ..., .id = "z_")

\method{copy_down}{PATH0}(x, z = NULL, ..., .id = "z_")

\method{copy_down}{ARC}(x, z = NULL, ..., .id = "z_")

\method{copy_down}{QUAD}(x, z = NULL, ..., .id = "z_")
}
\arguments{
\item{x}{a mesh3d or a silicate object}

\item{z}{object specifying values to copy down, a vector of values, a column name, a raster (see details)}

\item{...}{currently ignored}

\item{.id}{character value, the name of the resulting column in the vertices, default is "z_"}
}
\value{
a mesh3d or silicate model with vertex values copied to vertices (depending
on the input argument 'x')
}
\description{
Copy down provides ways to transfer object level data values to
vertex level.
}
\details{
Various methods are used depending on the second argument \code{z}.

If \code{z} is a raster (\code{BasicRaster}) a numeric value for each vertex is found by bilinear
interpolation using \code{raster::extract(raster, vertex, method = "bilinear")}. Vertices
are transformed into the space used by the raster if possible.

If \code{z} is a character value, that column is taken from the object table.

The \code{.id} argument must be character and exist as a column name in the object table.

If z is a vector or a constant value it's simply copied down.

No checking is done on the type of the result, and so there's nothing to stop the use of the recycling rule
to expand out values, and nothing to stop the use of non numeric values being copied down.

Use \link[silicate:TRI0]{silicate::TRI0()} or \code{\link[=DEL0]{DEL0()}} or \code{\link[silicate:SC0]{silicate::SC0()}} to convert
various spatial formats into suitable forms for this function.
}
\examples{
library(raster)
r <- raster(volcano)
cl <- silicate::SC(rasterToContour(r))
plot3d(copy_down(cl, r))
## looks funny?
auto_3d(z = 15)

\donttest{
sc <- copy_down(SC0(cont_tas), "ELEVATION")
sc$object$color_ <- hcl.colors(nrow(sc$object), "YlOrRd")
 plot3d(sc)

 ## a planar straight line graph with x, y (UTM) and ELEVATION (metres)
 sc
}
}
