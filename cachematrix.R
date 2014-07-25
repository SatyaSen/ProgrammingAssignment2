## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

	inv_matrix <- NULL

	set <- function(y) {

		x <<- y
		inv_matrix <<- NULL

	}

	get <- function() x

	setinv <- function(solve) inv_matrix <<- solve
	getinv <- function() inv_matrix

	list( set = set, get = get, setinv = setinv, getinv = getinv )


}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {

	inv_matrix <- x$getinv()

	if(!is.null(inv_matrix)) {

		message("getting cached data")
	        return(inv_matrix)

	}

	data <- x$get()
	inv_matrix <- solve(data, ...)
	x$setinv(inv_matrix)

	inv_matrix  

}
