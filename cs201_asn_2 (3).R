# cs201_asn_2.R
# Ez Racancoj s1326470
# CS-201
# Spting 2024

#In the built-in R data frame called PlantGrowth, how many rows (observations) 
#and columns (variables) are there? What class and data type are the variables?

#Answer 
# there are 30 rows and 2 columns 
# for the weight var the class is numeric and it's data type is doulbe 
# for the group var the class is factor and the data type is integer 

data("PlanGrowth")

head(PlantGrowth)

number_o_rows <- nrow(PlantGrowth)
number_o_cols <- ncol(PlantGrowth)

cat("number of rows: ", number_o_rows, "\n")
cat("number of colunms: ", number_o_cols, "\n")


info <- sapply(PlantGrowth, function(x)
{
  class_info <- class(x)
  data_type <- typeof(x)
  c(Class = class_info, DataType = data_type)
})

print(info)

#What are the median, maximum and minimum weights for each of the three 
#groups (ctrl, trt1, trt2)? It's suggested to review useful example #2 
#(iris) for this.

#answer 
#ctrl{median 5.155, maximum 6.11 and minimum 4.17}, 
#trt1{median 4.55, maximum 6.03 and minimum 3.59} and 
#trt2{median 5.435, maximum 6.31 and minimum 4.92}

ctrl <- PlantGrowth$group == 'ctrl'

median(PlantGrowth$weight[ctrl]) 
max(PlantGrowth$weight[ctrl])  
min(PlantGrowth$weight[ctrl]) 

trt1 <- PlantGrowth$group == 'trt1'

median(PlantGrowth$weight[trt1]) 
max(PlantGrowth$weight[trt1])   
min(PlantGrowth$weight[trt1])  

trt2 <- PlantGrowth$group == 'trt2'

median(PlantGrowth$weight[trt2]) 
max(PlantGrowth$weight[trt2])   
min(PlantGrowth$weight[trt2])   

#Generate a plot that shows the number of weight observations for each group. 
#There should be one plot containing all three groups


#load the PlantGrowth dataset again for convenience 
data("PlantGrowth")

stripchart(PlantGrowth$weight ~ PlantGrowth$group,main = 
           "Number of Weight Observations for Each Group", xlab = "Group", 
           ylab = "Weight",method = "stack",pch = 19,col = PlantGrowth$group)





#Generate a boxplot of group vs. weight. The boxplot title must be 
#"PlantGrowth Data". The horizontal axis label must be "Group". 
#The vertical axis label must be "Dried weight of plants".


#load the PlantGrowth dataset again for convenience 
data("PlantGrowth")

boxplot(weight ~ group, data = PlantGrowth, main = "PlantGrowth Data",
        xlab = "Group", ylab = "Dried weight of plants")

#R has a group of built-in datasets for US state data. Run ?state in the R 
#console to see which datasets exist.

?state


#Use the built-in state.abb, state.area, and state.regions vectors to create 
#a data frame called st_area_region, which will contain the 50 state 
#abbreviations and their associated areas (square miles) and regions


st_area_region <- data.frame(
  state = state.abb,
  area = state.area,
  region = state.region
)

print(st_area_region)


#What is the sum of the 50 state areas in square miles? Use the data in 
#the st_area_region data frame, not in state.area.

#answer 3618399

total_area <- sum(st_area_region$area)

print(total_area)


#Which state has the largest area? the smallest area? Use the data in 
#the st_area_region data frame, not in state.area.

#answer state with the largest area AK state with the smallest area RI


largest_area_state <- st_area_region[which.max(st_area_region$area), ]

smallest_area_state <- st_area_region[which.min(st_area_region$area), ]

print(paste("state with the largest area:", largest_area_state$state))
print(paste("State with the smallest area:", smallest_area_state$state))


#Generate a plot that shows the number of states in each of the four 
#regions. The x axis should be labeled "Number of states per region". 
#There should be just one plot containing all four regions.

region_occurrences <- table(st_area_region$region)

barplot(region_occurrences, xlab = 'Number of States per Region')

#What are the total areas of each of the four regions?

# answer northeast: 169353 south: 899556 north central: 765530 west: 1783960

sum(st_area_region$area[st_area_region$region == 'Northeast'])
sum(st_area_region$area[st_area_region$region == 'South'])
sum(st_area_region$area[st_area_region$region == 'North Central'])
sum(st_area_region$area[st_area_region$region == 'West'])

#Write and test the function rand_bw() that returns one random integer in a 
#specified range of integers. The function would be called as follows:

#rand_bw <- function(start_o_rang, end_o_rang) {
#  return(sample(start_o_rang:end_o_rang, 1))
#}

rand_bw <- function(low, high) {
  return(sample(low:high, 1))
  }

rand_bw(1, 6)				# return an integer between 1 and 6
rand_bw(0, 1)				# return an integer between 0 and 1
rand_bw(19, 0)			# return an integer between 19 and 0
rand_bw(low = 1, high = 20)	# return an integer between 1 and 20
rand_bw(hi = 1, lo = 20)		# return an integer between 1 and 20

#Write and test the function pypr() that accepts a vector as input and 
#returns a string that represents the vector in square-bracketed form (like Python). 
#The function would be used as follows:

pypr <- function(vector) {
  return(paste("[", paste(vector, collapse = ", "), "]", sep = ""))
}

vector1 <- c(1, 2, 3, 4, 5)
vector2 <- c("apple", "banana", "circle")

print(pypr(vector1))  # Should print "[1, 2, 3, 4, 5]"
print(pypr(vector2))  # Should print '["apple", "banana", "orange"]'
