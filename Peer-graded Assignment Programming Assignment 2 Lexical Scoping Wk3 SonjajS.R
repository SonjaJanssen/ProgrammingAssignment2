# Codes by Sonja Janssen-Sahebzad 🎓 
### Graded Assignment:  100%, # Review: SJ & Peers
####-----------------------------------------------------------------------------------------------------------------------------------------------####
##     Assignment 2: Caching the Inverse of a Matrix in R and testing my codes scripts!
#      At Johns Hopkins University 🎓 
####-----------------------------------------------------------------------------------------------------------------------------------------------####
##     Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix 
##     rather than compute it repeatedly (there are also alternatives to matrix inversion that we will not discuss here). 
####-----------------------------------------------------------------------------------------------------------------------------------------------####
##     Assignment is to write a pair of functions that cache the inverse of a matrix.
#####----------------------------------------------------------------------------------------------------------------------------------------------####
##     Write the following functions:
  
## A.  makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
## B.  cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##     If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
## c.  Computing the inverse of a square matrix can be done with the solve function in R. 
##     For example, if X is a square invertible matrix, then solve(X) returns its inverse.
##     For this assignment, assume that the matrix supplied is always invertible.
####----------------------------------------------------------------------------------------------------------------------------------------------####
##  makeCacheMatrix function
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse<- function() inv
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

####---------------------------------------------------------------------------------------------------------------------------------------------####
## B.  cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##     If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
## c.  Computing the inverse of a square matrix can be done with the solve function in R. 
##     For example, if X is a square invertible matrix, then solve(X) returns its inverse.
##     For this assignment, assume that the matrix supplied is always invertible.
####---------------------------------------------------------------------------------------------------------------------------------------------####
cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setInverse(inv)
  inv
}

###----------------------------------------------------------------------------------------------------------------------------------###
##  Testing codes:            Test is ok Assignment completed = ok
###----------------------------------------------------------------------------------------------------------------------------------###
 my_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))
 print(my_matrix)    #view(my_matrix) 
 
# view(my_matrix) my_matrix   List of 4
# set           function     function(y)(...)
# get           function     function()(...)
# setInverse    function     function(inverse)(...)
# getInverse    function     function()(...) 

 my_matrix$get()  
#       [,1] [,2]
# [1,]    1    3
# [2,]    2    4
 
 my_matrix$getInverse()
# NULL

 cacheSolve(my_matrix)
#  cached data
#       [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
 
  my_matrix$getInverse()
#       [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5

 my_matrix$set(matrix(c(2, 2, 1, 4), 2, 2))
 my_matrix$get()
#       [,1] [,2]
# [1,]    2    1
# [2,]    2    4
 
 my_matrix$getInverse()
# NULL
 
 cacheSolve(my_matrix)
#  cached data
# [,1]       [,2]
# [1,]  0.6666667 -0.1666667
# [2,] -0.3333333  0.3333333
 
 my_matrix$getInverse()
#             [,1]       [,2]
# [1,]  0.6666667 -0.1666667
# [2,] -0.3333333  0.3333333
 
####-------------------------------------------------------------------------------------------------------------------------------- ####

