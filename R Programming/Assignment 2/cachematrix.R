makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinv <- function(inv) inverse <<- inv
  getinv <- function() inverse
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## The following function calculates the inverse of the special "vector" created with the above function. However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache and skips the computation. Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setmean function.


cacheSolve <- function(x) {
  inverse <- x$getinv()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  data <- x$get()
  inverse <- solve(data)
  x$setinv(inverse)
  inverse
}

# Sample run
# > x = rbind(c(1, 1/2), c(1/2, 1))> m = makeCacheMatrix(x)
# > m$get()
# [,1] [,2]
# [1,]  1.0  0.5
# [2,]  0.5  1.0
# > cacheSolve(m)
# [,1]       [,2]
# [1,]  1.3333333 -0.6666667
# [2,] -0.6666667  1.3333333
# > cacheSolve(m)
# getting cached data
# [,1]       [,2]
# [1,]  1.3333333 -0.6666667
# [2,] -0.6666667  1.3333333


