# indexing_lab.r 
# Ez Racancoj s1326470
# CS-201
#Spring 2024

# "Positive Indexing of Vectors 

set.seed(33) # For reproducibility 
x.vec <- rnorm(6) # Generate a vector of 6 standard normal variates
x.vec

x.vec[3] # Third element 

x.vec[c(3,4,5)] # Third through fifth elements

x.vec[3:5] # same, but written more succinctly

x.vec[c(3,5,4)] # Third, fifth, then fourth element 


# "Negative" Indexing of Vectors 

x.vec[-3] # All but the third element 

x.vec[c(-3,-4,-5)] # All but third through fifth element 

x.vec[-c(3,4,5)] # Same 

x.vec[-(3:5)] #same, more succint (note the parentheses!)

# Indexing Matrices 
x.mat <- matrix(x.vec, 3, 2) # Fill a 3 x 3 matrix with 
                             # the elements of x.vec,
                             # in colum-major order
x.mat

x.mat[5] # Same (note this is using column major order)


# More Matrix Indexing 

x.mat[2,] # Second row 

x.mat[1:2,] # First and second row 

x.mat[,1] # First column 

x.mat[,-1] # All but first column 

# Indexing Lists 

# what dose sample do here?

x.list <- list(x.vec, letters,
               sample(c(TRUE,FALSE),
               size=4,replace=TRUE))
x.list

x.list[[3]] # Third element of the list 

x.list[[3]] # Third element of list, kept as a list 

# Everything is Exactly the Same as Vector Indexing
x.list[1:2] # First and second element of list (note the single bracets!)
x.list[-1] # All but the first element of the list 

# But Be Careful!

# This works.
x.list[[1]]
# This probably doesn't do what you expect:
x.list[[1:2]]


# Indexing with Booleans

x.vec[c(F,F,T,F,F,F)] # The third element
x.vec[c(T,T,F,T,T,T)] # All but the third element
pos.vec <- x.vec > 0 # Boolean vector indicating whether each element is positive
pos.vec
x.vec[pos.vec] # Pull out only positive elements 
x.vec[x.vec > 0] # Same but more succint (this is done "on-the-fly")

# Indeving with Names 

names(x.list) <- c("normals", "letters", "bools")
x.list[["letters"]] # ''letters'' (third) element")

x.list[c("normals", "bools")]