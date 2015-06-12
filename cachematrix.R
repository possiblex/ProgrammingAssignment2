## Overall description of what these functions do
## In doing matrix inversion, it is better to cache the inverse of a matrix than to compute it repeatedly
## So following functions' is to cache the inverse of a matrix
## These functions were divided into two:
## a. makeCacheMatrix: is to creates a function list to  
##    1. set the value of the matrix
##    2. get the value of the matrix
##    3. set the value of inverse of the matrix
##    4. get the value of inverse of the matrix
## b. cacheSolve: is to return the inverse of the matrix 
##    1. checks if the inverse has already been computed
##    2. gets the result or computes the inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
