# cs201_asn_4.R 
# Ez Racancoj ID: s1326470
# CS-201
# Spring 2024 

#Download the 2020-2023 state population estimates data file from Piazza. 
#The file name is 2020_2023_state_region_pop.csv, and it is in comma-separated value (CSV) format.

#See File Input & Output - Example 3.

#In cs201_asn_4.R, write code to do the following:
  
  

# (1) Read 2020_2023_state_region_est_pop_change.csv into a data 
#frame called state.pop. Examine state.pop with str(). Use 
#the state.pop data frame for the remainder of this assignment.

#Optional: Use attach() on state.pop so that you can access 
#the columns of state.pop without having to type state.pop$ 
#in front of the column names.
# Read the CSV file into a data frame called state.pop

#state_file <- read.csv("C:/Users/Ezjua/Downloads/2020_2023_state_region_pop.csv" )

file_path <- file.path("C:/Users/Ezjua/Downloads/2020_2023_state_region_pop.csv")
state.pop <- read.table(file_path, header = TRUE, sep = ",")
str(state.pop)

# (2) Create a vector called pct.pop.change that contains 
#the population change as a percentage of 2020 population, 
#i.e., (POPESTIMATE2023 - POPESTIMATE2020) * 100 / POPESTIMATE2020.

state.pop$pct.pop.change <- ((state.pop$POPESTIMATE2023 - state.pop$POPESTIMATE2020) * 100) / state.pop$POPESTIMATE2020

print("the population change as a percentage of 2020 population")
for(i in 1:nrow(state.pop)){
  print(paste(state.pop$NAME[i], state.pop$pct.pop.change[i], "%"))
}


# (3) Add the pct.pop.change vector as a new column in the 
#state.pop data frame like this:

#state.pop$PCTPOPCHG <- pct.pop.change

#The new column name will be PCTPOPCHG.


state.pop$PCTPOPCHG <- state.pop$pct.pop.change

str(state.pop)

# (4) Write code to output the names of the five states 
#that had the greatest percentage increase in population 
#from 2020-2023. Include the population increase percentages 
#in the output.

statepop_sroted <- state.pop[order(-state.pop$PCTPOPCHG), ]
five_states <- head(statepop_sroted)

for(i in 1:nrow(five_states)){
  print(paste(five_states$NAME[i], five_states$PCTPOPCHG[i], "%"))
}


# (5) Write code to output the names of the five states 
#that had the greatest percentage decrease in population 
#from 2020-2023. Include the population decrease percentages 
#in the output.

state_pop_sort_de <- state.pop[order(state.pop$PCTPOPCHG), ]
five_states_de <- head(state_pop_sort_de, 5)

for(i in 1:nrow(five_states_de)){
  print(paste(five_states_de$NAME[i], five_states_de$PCTPOPCHG[i], "%"))
}


# (6) Write code to write a new CSV file pop_change_rev.csv 
#from state.pop. When writing to the CSV file, use the 
#row.names=FALSE option. Dropbox pop_change_rev.csv along with 
#cs201_asn_5.R.

output_file <- "pop_change_rev.csv"
write.csv(state.pop, file = output_file, row.names = FALSE)

if (file.exists(output_file)) {
  cat("File has been made \n")
} else {
  print("File does not exist \n")
}

# (7) Write code to display the change in population density 
#(persons per square mile) for every state (excluding the 
#District of Columbia) from 1977 to 2023. Display the state 
#name, 1977 population density and 2023 population density 
#(3 columns). Get the 1977 state populations and state areas 
#from the state.x77 built-in matrix.

state_data_1977 <- as.data.frame(state.x77)
state_data_1977 <- state_data_1977[, c("Population", "Area")]
colnames(state_data_1977) <- c("Population1977", "Area")
state_data_1977$State <- rownames(state_data_1977)
state_data_1977$Density1977 <- state_data_1977$Population1977 / state_data_1977$Area
data_of_states <- merge(state_data_1977, state.pop, by.x = "State", by.y = "NAME")
data_of_states$Density2023 <- data_of_states$POPESTIMATE2023 / data_of_states$Area
print(data_of_states[, c("State", "Density1977", "Density2023")])

