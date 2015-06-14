## Overall description of what these functions do
## In doing matrix inversion, it is better to cache the inverse of a matrix than to compute it repeatedly
## So following functions' is to cache the inverse of a matrix
## 
## Function "makeCacheMatrix" is to creates a function list to  
##    1. set the value of the matrix
##    2. get the value of the matrix
##    3. set the value of inverse of the matrix
##    4. get the value of inverse of the matrix
## 

makeCacheMatrix <- function(x = matrix()) {
        ## create a matrix object x and some branch of functions
        m <- NULL                ## define the cache m
        set <- function(y) {
                x <<- y          ## assign the input matrix y to the variable x in the parent environment
                m <<- NULL       ## initialize m again in the parent environment to null
        }
        get <- function() { x }  ## return the matrix x
        setinverse <- function(inverse) {m <<- inverse}
        ## set the cache m to the inverse of the matrix x
        getinverse <- function() {m}  
        ## return the cached inverse of x
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}



## Function "cacheSolve" is to return the inverse of the matrix 
##    1. checks if the inverse has already been computed
##    2. gets the result from cache m or computes the inverse

cacheSolve <- function(x, ...) {
        m = x$getinverse()
        if (!is.null(m)){
        ## get it from the cache and skips the computation. 
        message("getting cached data")
        return(m)
        }
        ## Return a matrix that is the inverse of 'x'
        data = x$get()
        m = solve(data, ...)
        x$setinverse(m)
        return(m)
}
