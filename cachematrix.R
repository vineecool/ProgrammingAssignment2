
makeCacheMatrix <- function(ori.matrix = matrix()) {
  
  
  if (!is.matrix(ori.matrix)) {
    stop("Please give a matrix")
  }
  
  in.matrix <- NULL
  
  set <- function(y) {
    ori.matrix <<- y
    in.matrix <<- NULL
  }
  
  get <- function() ori.matrix
  set.in <- function(solve) in.matrix <<- solve
  get.in <- function() in.matrix
  
  list(
    set = set, 
    get = get,
    set.in = set.in,
    get.in= get.in)
  
}

cacheSolve <- function(cacheable.matrix, ...) {
  in.matrix <- cacheable.matrix$get.in()
  if(!is.null(in.matrix)) {
    message("Getting cached inverse matrix")
    return(in.matrix)
  }
  
  matrix.to.inverse <- cacheable.matrix$get()
  inverted.matrix <- solve(matrix.to.inverse)
  cacheable.matrix$set.in(in.matrix)
  in.matrix
  
}
