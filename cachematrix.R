## Inverting a matrix can be highly time consuming. The following functions allow to cache the calculation.
## This avoids unnecessary computing.
## The functions have been modeled after Prof. Peng's makeVector and cache mean functions.


## The function makeCacheMatrix creates a list containing a function to

	## 1. set the value of the matrix
	## 2. get the value of the matrix
	## 3. set the value of the inverse matrix
	## 4. get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
         
        M <- NULL
         
        set <- function(y) {
                x <<- y
                M <<- NULL
        }
        
        get <- function() x
        
        setinv_mat <- function(inv_mat) m <<- inv_mat

        getinv_mat <- function() M
        
        list(set = set, get = get,
        setinv_mat = setinv_mat,
        getinv_mat = getinv_mat)
        
}


## The function cacheSolve checks if the inverse matrix stored by makeCacheMatrix already exists.
## If it does it returns the cached inverse matrix, otherwise calculates, stores and returns it.

cacheSolve <- function(x, ...) {
        
        M <- x$getinv_mat()
        
        
	## Checks if the inverse matrix of 'x' is already in the cache and if so returns it

	if(!is.null(M)) {

                message("getting cached data")
                return(M)
        }
        

        ## Calculates and return a matrix that is the inverse of 'x'

        data <- x$get()
        M <- solve(data, ...)
        x$setinv_mat(M)
        
	x$setinv_mat(M)

}
