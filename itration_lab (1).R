# iteration_lab.R
# Ez Racancoj s1326470
#CS-201
#spring 2024 

# part 1 

# (a) write an equivalent while loop for the following code 


v <- vector(mode="numeric", length=10) # creates a 10-element vector of 0s

for(i in 1:10) {
  v[i] <- (i+2)^2 
}

print(v)

# while loop 

v <- vector(mode="numeric", length=10) # creates a 10-element vector of 0s
i <- 1
while(i <= 10)
{
  v[i] <- (i+2)^2 
  i <- i + 1  
}

print(v)


# (b) write an equivalent for loop for the following code 

i <- 0
seq <- ''
while(i < 50) {
  cat(seq, i %% 2, '\n', sep='')
  i <- i + 1
  seq <- paste(seq, ' ', sep='')
}

# for loop

seq <- ''
for(i in 0:49) {
  cat(seq, i %% 2, '\n', sep='')
  seq <- paste(seq, ' ', sep='')
}


# (c) write an equivalent for or while loop for the following code 

x <- c(2, 5, 3, 9, 8, 11, 6)
div <- as.integer((min(x)+max(x))/2)
x <- x %% div + 1
print(x)

#for loop 

x <- c(2, 5, 3, 9, 8, 11, 6)
div <- as.integer((min(x) + max(x)) / 2)

for (i in 1:length(x)) {
  x[i] <- x[i] %% div + 1
}

print(x)


# (Note: The new values of vector x after this vector operation are
  
# 3 6 4 4 3 6 1
  
# Your for or while loop must perform the same task.)


# part 2 

n <- 3

cat(n, " -> ")

while (n > 1) {
  if (n %% 2 == 0) {
    n <- n / 2
  } else {
    n <- 3 * n + 1
  }
  cat(n, if (n > 1) " -> " else "\n")
}


