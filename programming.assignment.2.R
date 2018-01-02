
## Provided that x is an invertible matrix (i.e. same number of columns and rows)
## The following will enable you to cache the matrix inputted through one function  
## and compute the inverse of the matrix through the other.  If the "matrix" being
## inputted into the second function already has an inverse defined, then the 
## function will use the cached inversed matrix rather than computing another one.

## By inputting a matrix, this function below creates a matrix-like object that can
## cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        i   <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) i <<- solve
        getinverse <- function() i
                list(set = set, get = get,
                setinverse = setinverse,
                getinverse = getinverse)
}

## By inputting the "matrix" object created by the function above, the following
## function will compute its inverse.  If the inverse has already been calculated
## and if the matrix has not been changed, then this function will retrieve the 
## inverse from the cache and publish a message indicating that it's doing so.

cache.solve <- function(x, ...) {
        i <- x$getinverse()
        if(!is.null(i)) {
                message("Getting Cached Inverse")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)
        i
}

