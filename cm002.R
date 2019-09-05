# here is your new script space
# plane text files and executions
5+2
number-2
number <- 5+2
number
number*2
number-9
# the order of line operations doesn't matter, if you've saved an object
# but, you should run your script from top to bottom (because it's logical)

# make a vector and explore
# travel times (in minutes) for a variety of commutes
(times <- c(60, 40, 33, 15, 20, 55, 35))
# wow, highlight the entire line and add a bracket, it puts the whole line in parentheses
# having brackets around the entire line automatically outputs the result
class(times)
str(times)
# 'times' is a numeric vector

mean(times)  # output is a single value 
sqrt(times)  # output is a vector of equal length
sd(times)
range(times)

# logical operators
times < 30
times == 20
times != 20
times > 20 & times <50
# this returns a vector of TRUE and FALSE

# check a specific value
any(times < 30)  # this could be really helpful for QC on stream level and bottle heights
# e.g. any(stage > max(bottle-height))

# if you want to know which position the values are that satisfy the TRUE result...
which(times < 30)

# subset
# to call the number from that position, subset with []:
times[4]
# can we nest functions to call the number after identifying it's position?
times[which(times < 30)]  # yes, yes we can
# even more tidy, same output
times[times <30]

times
times[times > 50] <- 50
# this allows you to re-save your original vector by over-writing all values that were greater than 50
# kind of weird

mean(times)
# note that this value is now lower than the first time this was calculated because of 

mean(times, na.rm = TRUE) # you don't have to define the first argument unless you're putting it out of order
mean(times, 0, TRUE)  # best practice is to explicitly define the argument (as above) rather than relying on order (here)

mtcars
str(mtcars)
names(mtcars)  # extracts a vector of the names of columns from the data frame (in order)
# extract columns with $
mtcars$mpg
mean(mtcars$mpg)
