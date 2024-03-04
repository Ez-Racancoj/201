# functions_lab.R
# Ez Racancoj, s1326470
# CS-201
# Spring 2024


#Write and test the function rand_elem() that returns one element at 
#random from an input vector. The function would be called as follows

rand_elem <- function(vec) {
  if (length(vec) <= 0) {
    print("Input is not a valid vector")
  } else {
    index <- sample(length(vec), 1)
    return(vec[index])
  }
}

rand_elem(1:6)				# return one random integer between 1 and 6
rand_elem(c('yes', 'no', 'maybe'))	# return "yes", "no" or "maybe"
rand_elem(v = c(2, 4, 6, 8, 10))		# return 2, 4, 6, 8 or 10
rand_elem(vec = c('A', 'J', 'Q', 'K'))	# return "A", "J", "Q" or "K"


#Write and test the function even_odd_a() that accepts a vector of 
#integers as input and returns a two-element vector containing the
#number of evens and the number of odds. The function would be used 
#as follows

even_odd_a <- function(vec) {
  even_count <- 0
  odd_count <- 0
  if (length(vec) <= 0) {
    stop("Input is not a valid vector")
  } else {
    for (element in vec) {
      if (element != 0 & element %% 2 == 0) {
        even_count <- even_count + 1
      } else {
        if(element != 0){
          odd_count <- odd_count + 1
        }
      }
    }
    return(c(even_count, odd_count))
  }
}

even_odd_a(9:1)						# returns 4 5	 (4 evens, 5 odds)
even_odd_a(c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9))	# returns 4 5	 (4 evens, 5 odds)


even_odd_b <- function(vec) {
  vec_no_zero <- vec[vec != 0]
  even_count <- sum(vec_no_zero %% 2 == 0)
  odd_count <- length(vec_no_zero) - even_count

  return(c(even_count, odd_count))
}

even_odd_b(9:1)						# returns 4 5	 (4 evens, 5 odds)
even_odd_b(c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9))	# returns 4 5	 (4 evens, 5 odds)


