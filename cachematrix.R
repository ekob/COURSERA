###
### Programming Assignment 2
### Github: EKOB
###


## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  set <- function(y) { # Define a function that assigns the inverse of matrix outside the environment
    cachemat <<- solve(x)     # Find the inverse of the matrix X and assign to object cachemat (in cache, outside this environment)
    y <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve  # define a function that will produce the inverse of the matrix
  getsolve <- function(solve) m  # find the solution and save it in getsolve 
  list(set = set, get = get, # put the results of set, get, getsolve, and setsolve into one list
       setsolve = setsolve,
       getsolve = getsolve) 
}  
}


## This function computes the inverse of the special "matrix" returned by
## makeCacheMatrix above. If the inverse has already been calculated (and the
## matrix has not changed), then the cachesolve should retrieve the inverse from
## the cache.

## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) { # define the function
  c <- cachemat()
  if(!is.null(c)) { # look for the existing cached object. If it's there, return it and print the message.
    message("take the matrix that already existed and return it")
    return(m) 
  }
  data <- x$get() # Look for the get function in the x environment
  m <- solve(data, ...) # Assign to m the output from passing the get function into the solve function
  x$setsolve(m)  # Pass the results from the previous line into this one.
  m
}

## END OF FILE
