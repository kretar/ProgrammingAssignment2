## This is a programming assignment for the Coursera Programming in R course.
## For the third week, the assignment is to create two method with which
## you can calculate the inverse of a matrix and cache the result for 
## future reference. If the inverse is requested again at a later point,
## the result should be taken from cache.

## This is a simple method that returns a list with functions for cached inverse matrices

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get, 
       setinverse = setinverse, 
       getinverse = getinverse)
}


## The following function calculates the inverse of the matrix 
## by solving it agains the identity matrix.
## If the inverse has been calculated before, it will return the previously calculated result

cacheSolve <- function(x) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  i
}
