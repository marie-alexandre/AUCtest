#' @title Spline Interpolation Method - Matrix of Second Derivative Coefficients
#' @description \loadmathjax  In the area under the curve calculation using the spline interpolation method, the vector of the second derivative of the outcome of interest \mjseqn{Y} is expressed as \mjseqn{A Y^{''} = B Y  + F}. This function calculate calculate the matrix A.
#' 
#' @param time a numerical vector of time points of length m (x-axis coordinates).
#' 
#' @details The tridiagonal matrix \mjseqn{A} is defined as (for the "not-a-knot boundary conditions):
#' The \mjseqn{j}th line of the matrix, \mjseqn{A_{\[j,\ :\]}} is given by
#' \mjsdeqn{A_{\[j,\ :\]} = \left(\frac{1}{h_2},-\left\[\frac{1}{h_2} + \frac{1}{h_3}\right\], \frac{1}{h_3}, 0, \cdots, 0 \right) \text{ if } j=1} 
#' \mjsdeqn{A_{\[j,\ :\]} = \left(0, \cdots, 0, \frac{1}{h_{m-1}},-\left\[\frac{1}{h_{m-1}} + \frac{1}{h_m}\right\], \frac{1}{h_m} \right) \text{ if } j=m}
#' \mjsdeqn{A_{\[j,\ :\]} = \left(0_1, \cdots, 0_{j-2}, \frac{h_j}{6},\frac{h_j+h_{j+1}}{3}, \frac{h_{j+1}}{6}, 0_{j+2}, \cdots, 0_{m} \right) \text{ otherwise }}
#' 
#' 
#' @return a tridiagonal matrix corresponding to the weights of the second derivative of the variable of interest in the spline interpolation method. In this version, the matrix is build considering the "not-a-knot" spline boundary conditions.
#' 
#' @rdname AUC_Spline_matrix_A
#' @export 


AUC_Spline_matrix_A <- function(time){
  m <- length(time)
  hj <- NULL  # Warning: length(hj)=m-1
  for(j in 2:m){
    hj <- c(hj,(time[j]-time[j-1]))
  }
  Matrix_A <- matrix(0,ncol=m,nrow=m)
  Matrix_A[1,1] <- 1/hj[1] ; Matrix_A[1,2] <- -(1/hj[1] + 1/hj[2]) ; Matrix_A[1,3] <- 1/hj[2]
  Matrix_A[m,m-2] <- 1/hj[length(hj)-1] ; Matrix_A[m,m-1] <- -(1/hj[length(hj)-1]+1/hj[length(hj)]) ; Matrix_A[m,m] <- 1/hj[length(hj)]
  
  for(j in 2:(m-1)){
    Matrix_A[j,j-1] <- hj[j-1]/6
    Matrix_A[j,j] <- (hj[j-1]+hj[j])/3
    Matrix_A[j,j+1] <- hj[j]/6
  }
  return(Matrix_A)
}
