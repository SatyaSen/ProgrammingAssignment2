## Course: rprog-005, R Programming, by Dr. Roger D. Peng, from Coursera
## Assignment: 2
## File: cachematrix.R
## Created by: Satyabrata Sen
## Created on: July 25,2014

## Objective: Caching the Inverse of a Matrix
## This program intends to cache the inverse of a matrix particularly with large dimensions.
## Since inverting a matrix is potentially a time-consuming computation, 
## it makes sense to cache the inverse matrix so that if required (in future) 
## it can easily be looked up in the cache rather than be recomputed. 



## Function 1: makeCacheMatrix()
## This function creates a special matrix-object that can cache its inverse.
## It outputs a list containing four functions to: (i) set the matrix,
## (ii) get the matrix, (iii) set the inverse matrix, and (iv) get the inverse matrix.

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



## Function 2: cacheSolve()
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## It first checks to see if the inverse matrix has already been calculated.
## If so, it retrieves the inverse matrix from the cache.
## Otherwise, it calculates the inverse of the matrix and 
## sets the value of the inverse matrix in the cache.

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


