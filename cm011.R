library(tidyverse)
library(gapminder)

# paired programming

# write the gapminder data set to a CSV
write_csv(gapminder, './gapminder.csv')  # the dot adds the current working directory! So tidy
View(gapminder)  # look at the data set like a spreadsheet


gapminder_sum <- gapminder %>% 
  group_by(continent) %>% 
  summarize(ave_lifeExp = mean(lifeExp))
View(gapminder_sum)

# exporting CSV files helps in data sharing between software
# also -- incorporate version control into the whole thing (git)


# plot
gapminder_sum %>% 
  ggplot(aes(x = continent, y = ave_lifeExp)) +
  geom_point() +
  theme_bw()

# bad practices
# using 'remove(list = (ls))' removes all your objects but doesn't detach any packages
# don't use remove(list = (ls))
# don't use "setwd()"

#####
# package "here"

# install.packages("here")
library(here)  

# instead of copying your directory and switching all back slashes to forward slashes, use here
# write_csv(here::here(????))
# sets a working directory without slash preference...
# I don't understand why you would use this... just keep all work in one project folder?

# grabbing URL
# URL for greatest givers (XLS file from cloud): 


# define URL as an object
data_url <- "http://gattonweb.uky.edu/sheather/book/docs/datasets/GreatestGivers.xls"

# read_csv can directly import URLs 
# read_excel requires that ou first download the file

# set file name
file_name <- basename(data_url)

# this is the "old" way...
#download.file(url = data_url, destfile = paste('./cm011-datasets/', file_name))

# this is the "new" way...
#download.file(url = data_url, destfile = here::here("cm011-datasets", file_name))
### --- these don't work because the file was corrupted for Windows users :(
### --- download the file normally and save to folder

# read it in? 
library(readxl)
philanthropists <- read_excel((here::here("cm011-datasets", file_name, trim_ws = TRUE)))
# trim white space makes numbers numbers
# may not trim leading white space... although it's supposed to


## -------- reading in XLS
mri_file <- here::here("cm011-datasets", "Firas-MRI.xls")
mri <-  read_excel(mri_file)
head(mri)

mri <- read_excel(mri_file, range = "A1:L12")
View(mri)

# end. of. class.

# this lecture was very confusing to me. stressful. byyyyyeeee

