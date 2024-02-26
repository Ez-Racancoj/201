# cs201_asn_1.R
# Ez Racancoj s1326470
# cs-201
# Spring 2024


# Question What happens whe you try to make a vector contain different types by using 
# c( ) funtion?

# Answer
# R is a strongly typed programming language, so all the elements in a vector 
# must be of the same data type. Trying to make a vector with different data
# types in R will force all the elements to be the same type through a process
# known as type coercion.


# Question Try to make a vector that contains some numbers and some strings. Waht happens 
# to the integers ia the vector?

# Mix vector
some_vector <- c(1, "two", 3, "four", 5)

# Answer
# The integers will become strings. This happens since R is trying to make all
# elements in the vector the same data type and sicne a string can not become
# an integer R will make the integers into strings

# In the R script file cs201_asn_1.R, write R cade to perform the 
# following tasks. 

# Say a cafeteria is using R to create their breakfast menu.

items <- c("spam", "eggs", "beans", "bacon", "sausage")

# Question What does items[-3] produuce? Based on what you find use indexing to create
# a version of the items vector without "spam" in it.

# Answer 
# items[-3] will list all the elements except the third from the items vector 

items[-3]

# New items vector

new_items <- items[-1]
new_items

# Use indexing to create a vector called more_spam from items; more _spam 
# will contain spam, eggs, sausage, spam, and spam

items_to_delete <- c(3, 4)
more_spam <- items[-items_to_delete]
more_spam <- c(more_spam, "spam", "spam")
more_spam


# Add a new item, "lobster", to the items vactor

items <- c(items, "lobster")
items

# Generate a character matrix that contains the following tic-tac-toe pattern;

tic_tac_toe <- matrix(c("x","o","x","o","x","o","x","o","x"), nrow = 3, ncol = 3)
print(tic_tac_toe)

# Simulate rolling a pair of standard six-sided dice 1000 times. Use vectors
# die1 and die2 to hold the values of the 1000 rolls for each die. You 
# will want to use the R sample() function to generate the 1000 random 
# integers in the vectors. Store the sums of the 1000 dice rolls in the 
# vector dice_sums. Count the frequencies of the dice sums in dice_sums 
# and generate a bar plot of dice sum frequencies with the axis labels 
# shown below.

die1 <- sample(1:6, 1000, replace = TRUE) # Generate 1000 integers from 1-6 inclusive to represent the 1000 rolls for teh first die
die2 <-sample(1:6, 1000, replace = TRUE) # do the same for the second die
  
dice_sums <- die1 + die2 # Vector to holed the sums of the 1000 dice 


sum_freq_table <- table(dice_sums) # Table of frequencies


print(sum_freq_table) # Display the frequency table

# Task 4 continued: Generate a bar plot of dice sum frequencies

# Plotting the bar plot
#print(barplot(sum_freq_table, main = "Dice Sum Frequencies", xlab = "Dice sums", ylab = "Occurrences", col = "gray"))

barplot(sum_freq_table, 
        main = "Dice Sum Frequencies", 
        xlab = "Dice Sums", 
        ylab = "Occurrences", 
        col = "gray",
        ylim = c(0, 200),  # Set custom y-axis limits (adjust as needed)
        names.arg = unique(dice_sums))  # Display unique dice sums on the x-axis

