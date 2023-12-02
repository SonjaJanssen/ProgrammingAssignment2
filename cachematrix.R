Project Assignment 2: Caching the Inverse of a Matrix in R and testing my codes scripts

## R version 4.2.2 in RStudio
## Write a short comment describing this function

# Review: SJ & 5 reviews
# Codes by Sonja Janssen-Sahebzad
### Assignment: 100%
####-----------------------------------------------------------------------------------------------------------------------------------------------####
Overview:
The goal of this script is to provide a mechanism for caching the inverse of a matrix to avoid repeated computations.
## Assignment is to write a pair of functions that cache the inverse of a matrix.
####-----------------------------------------------------------------------------------------------------------------------------------------------####
##     Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix 
##     Rather than compute it repeatedly (there are also alternatives to matrix inversion that we will not discuss here). 
####-----------------------------------------------------------------------------------------------------------------------------------------------####
## Write the following functions:
  
## A. makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
## B. cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##    If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
## C. Computing the inverse of a square matrix can be done with the solve function in R. 
##    For example, if X is a square invertible matrix, then solve(X) returns its inverse.
##    For this assignment, assume that the matrix supplied is always invertible.
####-----------------------------------------------------------------------------------------------------------------------------------------------####
Functions:
1. makeCacheMatrix Function:
Purpose: Creates a special "matrix" object that can cache its inverse.
Components:
x: A matrix.
inv: Internal storage for the inverse matrix.
set: Sets the matrix and resets the inverse cache.
get: Gets the stored matrix.
setInverse: Sets the inverse matrix.
getInverse: Gets the cached inverse matrix.

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
2. cacheSolve Function:
Purpose: Computes the inverse of the matrix. If the inverse has been calculated before, it retrieves it from the cache.
##    If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
##    Computing the inverse of a square matrix can be done with the solve function in R. 
##    For example, if X is a square invertible matrix, then solve(X) returns its inverse.
##    For this assignment, assume that the matrix supplied is always invertible.

Components:
x: A "matrix" object created by makeCacheMatrix.
...: Additional arguments passed to solve.
inv: Checks if the inverse is already cached.
data: Gets the matrix.
solve: Computes the inverse using the solve function.
If the inverse is computed, it updates the cache.
####---------------------------------------------------------------------------------------------------------------------------------------------####
cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if (!is.null(inv)) {
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
    The script includes a set of test cases to validate the functionality.
    It creates a "matrix" object using makeCacheMatrix and performs operations such as getting the matrix, 
    getting the inverse, and using cacheSolve to compute the inverse.  

###----------------------------------------------------------------------------------------------------------------------------------###
Outcomes:
The script demonstrates that the caching mechanism works by comparing whether 
the inverse is computed or retrieved from the cache.
###----------------------------------------------------------------------------------------------------------------------------------###

# Test Case 1
## Create a 2x2 matrix and cache it
my_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))
print(my_matrix)  # View the structure of my_matrix
my_matrix$get()   # Check the content of the matrix

# Test Case 2
## Try to get the inverse of the matrix (should be NULL initially)
my_matrix$getInverse()

# Test Case 3
## Cache solve the matrix (should compute the inverse)
cacheSolve(my_matrix)

# Test Case 4
## Check if the inverse is now cached
my_matrix$getInverse()

# Test Case 5
## Change the matrix and verify if the inverse is reset
my_matrix$set(matrix(c(2, 2, 1, 4), 2, 2))
my_matrix$get()

# Test Case 6
## Check if the inverse is reset after changing the matrix
my_matrix$getInverse()

# Test Case 7
## Cache solve the updated matrix
cacheSolve(my_matrix)

# Test Case 8
## Check if the new inverse is now cached
my_matrix$getInverse()

###----------------------------------------------------------------------------------------------------------------------------------###
Outcome structure:
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

