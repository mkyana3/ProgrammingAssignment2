## Thi function gets a matrix as input and then creates a list of fucntion to get or  set the matrix
## the list returned has also the function to set or to get a matrix inverse
## Matrix inverse and matrix itself are saved in global environement to be access in order to save time

## lexical scope use of <<- operate to define global environment variables
##cashing both the matrix and matrix inverse
##

makeCacheMatrix <- function(x = matrix()) {
  inv <<- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setMatrixInv <- function(solve) inv <<- solve
  getMatrixInv <- function () inv
  list(set=set, get=get,setMatrixInve=setMatrixInv,getMatrixInv=getMatrixInv)

}


## calculating the matrix inverse in case it is not in cashed
## and caching the matrix inverse using return list from makeCacheMatrix function

cacheSolve <- function(x, ...) {
  inv <<- x$getMatrixInv()
  if(!is.null(inv)){
    message("printing matrix data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data,...)
  x$setMatrixInv(inv)
  inv
  
}
