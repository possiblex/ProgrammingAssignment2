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
        ##  return a list that contains these functions in order to 
        ##  use makeCacheMatrix object to perform as requested 
}



## Function "cacheSolve" is to return the inverse of the matrix 
##    1. checks if the inverse has already been computed
##    2. gets the result from cache m or computes the inverse of the matrix

cacheSolve <- function(x, ...) {
        m = x$getinverse() 
        ## get the inversed matrix from object makeCacheMatrix
        ## it will be null if uncalculated
        
        if (!is.null(m)){
        message("getting cached data")
        return(m)
        }
        ## if the inversion result is there
        ## return a matrix that is the inverse of 'x' and skips the computation.
        
        data = x$get() ## if not,  use x$get() to get the setted matrix
        m = solve(data, ...) ## use function "solve" to calculate the inverse of matrix
        x$setinverse(m)  ## setting caching m
        return(m)  ## return a matrix that is the inverse of 'x'
}
