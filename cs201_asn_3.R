# cs201_asn_3.R
# Therese Racancoj 
# CS-201 
# Spring 2024

#R has a group of built-in datasets for US state data, including state.x77, 
#a matrix containing state data including population (in 1977). Write and 
#test the function pop_density() that accepts a state abbreviation from 
#the state.abb vector as input and returns the population density in people
#per square mile

pop_density <- function(some_state) {
 
  some_state <- toupper(some_state)
  
  index <- match(some_state, state.abb)
  
  if (is.na(index)) {
    return("this isi not a state")
  }
  
  pop <- state.x77[index, 1] * 1000
  area <- state.x77[index, 8]
  
  density <- round(pop/area, 1)
  
  name_of_state <- state.name[index]
  
  return(paste(name_of_state, ": ", density, " people per square mile (1977)", sep = ""))
}

pop_density('NJ')
pop_density('wy')

#Write a for loop to call the flips() function 1000 times and store 
#the 1000 resulting values in the vector called 'flips_vec'. Then, 
#as you did in Assignment 1, Problem 4, count the frequencies of 
#the number of flips in flips_vec and generate a bar plot of flips 
#frequencies, with x-axis label "Number of coin flips" and y-axis 
#label "Occurrences". 

# flips: return total number of coin flips that were required
#        to get three heads in a row
#
flips <- function() {
  total_flips <- 0
  nheads <- 0
  
  
  # if nheads becomes 3, we got three 'heads' in a row
  while (nheads < 3) {
    if (sample(c("T", "H"), 1) == "H") {
      nheads <- nheads + 1
    } else {
      # didn't get heads; must reset to 0
      nheads <- 0
    }
    
    
    total_flips <- total_flips + 1
  } # end while
  
  
  return(total_flips)
  
  
} # end flips()





flips_vec <- numeric(1000)

for (i in 1:1000) {
  flips_vec[i] <- flips()
}

flip_table <- table(flips_vec)


print(flip_table)


barplot(flip_table, 
        main = "Coin Flip Frequencies", xlab = "Number of coin flips", 
        ylab = "Occurrences", ylim = c(0, max(flip_table)), col = "gray")


#In R, the apply family of functions often makes it unnecessary to write loops. The 
#replicate() function is a simplified version of sapply() that allows you to repeat 
#an expression or function a set number of times. see ?replicate in the R console and 
#this link. Repeat part a) using the replicate() function instead of the for loop.

# flips: return total number of coin flips that were required
#        to get three heads in a row
#
flips <- function() {
  total_flips <- 0
  nheads <- 0
  
  
  # if nheads becomes 3, we got three 'heads' in a row
  while (nheads < 3) {
    if (sample(c("T", "H"), 1) == "H") {
      nheads <- nheads + 1
    } else {
      # didn't get heads; must reset to 0
      nheads <- 0
    }
    
    
    total_flips <- total_flips + 1
  } # end while
  
  
  return(total_flips)
  
  
} # end flips()


flips_vec <- replicate(1000, flips())

flip_table <- table(flips_vec)


print(flip_table)


barplot(flip_table, 
        main = "Coin Flip Frequencies", xlab = "Number of coin flips", 
        ylab = "Occurrences", ylim = c(0, max(flip_table)), col = "gray")


#Based on the results of a) or b), what is your approximation of the 
#probability of getting 3 heads in a row in just 3 coin tosses?


prob <- flip_table[3] / sum(flip_table)


print(paste("Approximate probability of getting 3 heads in a row in 3 coin tosses:", prob))
