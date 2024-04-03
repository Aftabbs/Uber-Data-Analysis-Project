### Uber Data Analysis Using R
# Import Necessary Libraries
library(ggplot2)
library(ggthemes)
library(lubridate)
library(dplyr)
library(tidyr)
library(tidyverse) # metapackage of all tidyverse packages
library(DT)
library(scales)

# Create Colurs For Vectors
colors = c("#CC1011", "#665555", "#05a399", "#cfcaca", "#f5e840", "#0683c9", "#e075b0")
colors

# Read Data
# Read the data for each month separately 

apr <- read.csv("C:\\Users\\Admin\\R Language\\Projects In R\\Uber Data Analysis\\uber-raw-data-apr14.csv")
may <- read.csv("C:\\Users\\Admin\\R Language\\Projects In R\\Uber Data Analysis\\uber-raw-data-may14.csv")
june <- read.csv("C:\\Users\\Admin\\R Language\\Projects In R\\Uber Data Analysis\\uber-raw-data-jun14.csv")
july <- read.csv("C:\\Users\\Admin\\R Language\\Projects In R\\Uber Data Analysis\\uber-raw-data-jul14.csv")
aug <- read.csv("C:\\Users\\Admin\\R Language\\Projects In R\\Uber Data Analysis\\uber-raw-data-aug14.csv")
sept <- read.csv("C:\\Users\\Admin\\R Language\\Projects In R\\Uber Data Analysis\\uber-raw-data-sep14.csv")

# Combine the data together 
data <- rbind(apr, may, june, july, aug, sept)
cat("The dimensions of the data are:", dim(data))



# Print the first 6 rows of the data
head(data)



#The data contains the columns Date.Time which is a factor, Latitude and Longitudes 
#which are double and Base which is factor. we will format the datetime into a more readable format using the Date Time conversion function.

data$Date.Time <- as.POSIXct(data$Date.Time, format="%m/%d/%Y %H:%M:%S")
data$Time <- format(as.POSIXct(data$Date.Time, format = "%m/%d/%Y %H:%M:%S"), format="%H:%M:%S")
data$Date.Time <- ymd_hms(data$Date.Time)

library(lubridate)

# Create individual columns for month day and year
data$day <- factor(day(data$Date.Time))
data$month <- factor(month(data$Date.Time, label=TRUE))
data$year <- factor(year(data$Date.Time))
data$dayofweek <- factor(wday(data$Date.Time, label=TRUE))


# Add Time variables as well 
data$second = factor(second(hms(data$Time)))
data$minute = factor(minute(hms(data$Time)))
data$hour = factor(hour(hms(data$Time)))


head(data)

install.packages("magrittr")

library(magrittr)

tail(data)
#Data Visualisation
#Plotting the trips by hours in a day


# Load necessary libraries
library(dplyr)
library(magrittr)
library(DT)

# Data Visualisation
# Plotting the trips by hours in a day

hourly_data <- dplyr::group_by(data, hour) %>%
  dplyr::summarize(Total = n())

# Show data in a searchable js table
datatable(hourly_data)


library(ggplot2)



# Plot the data by hour
ggplot(hourly_data, aes(hour, Total)) + 
  geom_bar(stat="identity", 
           fill="steelblue", 
           color="red") + 
  ggtitle("Trips Every Hour", subtitle = "aggregated today") + 
  theme(legend.position = "none", 
        plot.title = element_text(hjust = 0.5), 
        plot.subtitle = element_text(hjust = 0.5)) + 
  scale_y_continuous(labels=comma)


##Plotting trips by hour and month
# Aggregate the data by month and hour
month_hour_data <- data %>% group_by(month, hour) %>%  dplyr::summarize(Total = n())

ggplot(month_hour_data, aes(hour, Total, fill=month)) + 
  geom_bar(stat = "identity") + 
  ggtitle("Trips by Hour and Month") + 
  scale_y_continuous(labels = comma)




## Plotting data by trips during every day of the month¶
# Aggregate data by day of the month 
day_data <- data %>% group_by(day) %>% dplyr::summarize(Trips = n())
day_data


# Plot the data for the day
ggplot(day_data, aes(day, Trips)) + 
  geom_bar(stat = "identity", fill = "steelblue") +
  ggtitle("Trips by day of the month") + 
  theme(legend.position = "none") + 
  scale_y_continuous(labels = comma)



# Collect data by day of the week and month

day_month_data <- data %>% group_by(dayofweek, month) %>% dplyr::summarize(Trips = n())
day_month_data


# Plot the above data
ggplot(day_month_data, aes(dayofweek, Trips, fill = month)) + 
  geom_bar(stat = "identity", aes(fill = month), position = "dodge") + 
  ggtitle("Trips by Day and Month") + 
  scale_y_continuous(labels = comma) + 
  scale_fill_manual(values = colors)



## Number of Trips place during months in a year
month_data <- data %>% group_by(month) %>% dplyr::summarize(Total = n())

month_data

ggplot(month_data, aes(month, Total, fill = month)) + 
  geom_bar(stat = "Identity") + 
  ggtitle("Trips in a month") + 
  theme(legend.position = "none") + 
  scale_y_continuous(labels = comma) + 
  scale_fill_manual(values = colors)


#Heatmap visualization of day, hour and month
day_hour_data <- data %>% group_by(day, hour) %>% dplyr::summarize(Total = n())
datatable(day_hour_data)

# Plot a heatmap 

ggplot(day_hour_data, aes(day, hour, fill = Total)) + 
  geom_tile(color = "white") + 
  ggtitle("Heat Map by Hour and Day")



#Plot Heatmap by day and month
# Collect data by month and day

month_day_data <- data %>% group_by(month, day) %>% dplyr::summarize(Trips = n())
month_day_data

ggplot(month_day_data, aes(day, month, fill = Trips)) + 
  geom_tile(color = "white") + 
  ggtitle("Heat Map by Month and Day")

# Plot a heatmap by day of the week and month

ggplot(day_month_data, aes(dayofweek, month, fill = Trips)) + 
  geom_tile(color = "white") + 
  ggtitle("Heat Map by Month and Day")


###Creating a map visualization of rides in NYC
1
# Set Map Constants
min_lat <- 40 
max_lat <- 40.91
min_long <- -74.15
max_long <- -73.7004

ggplot(data, aes(x=Lon, y=Lat)) +
  geom_point(size=1, color = "blue") +
  scale_x_continuous(limits=c(min_long, max_long)) +
  scale_y_continuous(limits=c(min_lat, max_lat)) +
  theme_map() +
  ggtitle("NYC MAP BASED ON UBER RIDES DURING 2014 (APR-SEP)")