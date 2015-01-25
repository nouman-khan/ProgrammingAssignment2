## The following funtion is almost same as exampled in
## Assignment page's functions but only handling matrix.

## Contains the following functions:
# setmatrix      set the matrix
# getmatrix      get the value of that matrix
# cacheinverse   cached inverse of the matrix
# getinverse     get the cahced inverse of the matrix

makeCacheMatrix <- function(x = numeric()) {
  
  cache <- NULL

  setmat <- function(mat) {
    x <<- mat
    cache <<- NULL
  }
  
  getmat <- function() {
    x
  }
  
  cacheinverse <- function(solve) {
    cache <<- solve
  }
  
  getinverse <- function() {
    cache
  }
  
  list(setMatrix = setmat, getMatrix = getmat, cacheInverse = cacheinverse, getInverse = getinverse)
}


## Following funtion will now return the inverse

cacheSolve <- function(x, ...) {
  
  inverse <- x$getInverse()
  
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }

  data <- x$getMatrix()
  inverse <- solve(data)
  x$cacheInverse(inverse)
  
  return(inverse)
}