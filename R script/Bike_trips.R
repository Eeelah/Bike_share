# goggle capstone project
# Author: Emmanuela Afoma Okafor


#install and load packages for data analysis and visualization
install.packages("tidyverse")
install.packages("janitor")
install.packages("ggplot2")
install.packages("lubridate")
install.packages("readr")
install.packages("data.table")
install.packages("dplyr")
install.packages("tidyr")

library("tidyverse")
library("janitor")
library("ggplot2")
library("lubridate")
library("readr")
library("data.table")
library("dplyr")
library("tidyr")


#load the data---data set used are comma separated  files that are already summarized  in sqlite
df1 <- read.csv("file1.csv")
df2 <- read.csv("file2.csv")
df3 <- read.csv("file3.csv")
df4 <- read.csv("file4.csv")
df5 <- read.csv("file5.csv")
df6 <- read.csv("file6.csv")
df7 <- read.csv("file7.csv")
df8 <- read.csv("file8.csv")
df9 <- read.csv("file9.csv")
df10 <- read.csv("file10.csv")
df11 <- read.csv("file11.csv")
df12 <- read.csv("file12.csv")


#combine all 12 data set into a single dataframe called merged_ride
all_trip<- rbind(df1,df2,df3,df4,df5,df6,df7,df8,df9,df10,df11,df12)


#Data Cleaning:
#Remove null values from all_trip and rename columns for better readability
#Columns that are beyond the scope of the project were removed
#After removing all NA values from the  dataframe, we are left with 8564 rows of data. The proportion of missing data amounts to 0.17%.

all_trip <- na.omit(all_trip) %>%
  rename(ride_type = rideable_type,
         start_time = started_at,
         end_time = ended_at,
         customer_type = member_casual,
         number_of_ride = count.ride_id.)

#After removing all null values, our data set now has 8564 rows from 8579 rows. the Null values amounts to 0.17% of total dataset

#Data Transformation:  Here we will convert start time and end time char object to datetime object so as to create and calculate a new variable trip duration
#create new variable year
#create a new variable month
#create a new variable weekday
#create a new variable start_hour
#create a new variable trip_duration. This variables will come handy for performing data aggregation.


all_trip$start_time <- lubridate::ymd_hms(all_trip$start_time)
all_trip$end_time <- lubridate::ymd_hms(all_trip$end_time)
all_trip$year <-lubridate::year(all_trip$start_time)
all_trip$month <-lubridate::month(all_trip$start_time, label =   TRUE, abbr = FALSE)
all_trip$weekday <-lubridate::wday(all_trip$start_time,label = TRUE, abbr = FALSE)
all_trip$trip_duration <- (as.double(difftime(all_trip$end_time,all_trip$start_time)))/60


#Exploratory data Analysis : checking count of distinct values of customer_type and statistical summary of trip_duration for all trip types
table(all_trip$customer_type)
summary(all_trip$trip_duration)


#Exploratory data Analysis: checking the total Number of rides and percentage per customer type
all_trip %>%
  group_by(customer_type)%>%
  summarise( number_of_ride = n()) %>%
  mutate(number_of_ride / sum(number_of_ride) * 100)
# casual riders make up about 43.4 % of total riders while annual members make up about 56.6% of total riders.


#Aggregating total trip duration by customer type
all_trip %>%
  group_by(customer_type) %>%
  summarise(min_trip_duration = min(trip_duration), max_trip_duration = max(trip_duration), median_trip_duration = median(trip_duration),
            mean_trip_duration = mean(trip_duration))
#the mean trip duration of casual riders is more than twice the mean trip duration of member riders.
#which suggets that the casual riders go on  a long road trip than the member riders


#statistics of total trip duration by customer type and by bike type
all_trip %>%
  group_by(customer_type,ride_type) %>%
  summarise(min_trip_duration = min(trip_duration), max_trip_duration = max(trip_duration), 
            mean_trip_duration = mean(trip_duration))
# The docked bike type is more popular among the casual riders with average trip duration of 208 minutes while the classic bike type is preferred among the annual riders with average trip duration of 16 minutes.


#statistics of total rides by weekday and customer type
all_trip %>%
  group_by(customer_type, weekday) %>%
  summarise(number_of_ride = n(), mean_trip_duration = mean(trip_duration)) %>%
  arrange(customer_type, desc(number_of_ride))
# Casual riders use bike share service more during the weekends (Saturday and Sunday). On average, the trip duration are 49.8 mins and 96.7 mins, while annual members use them consistently over the entire weekday.


#statistics of total rides by month and customer type
all_trip %>%
  group_by(customer_type, month) %>%
  summarise(number_of_ride = n()) %>%
  arrange(customer_type,desc(number_of_ride))
#Here casual riders ride more during August


#statistics of Average trip duration by month and customer type 
all_trip %>%
  group_by(customer_type, month) %>%
  summarise( mean_trip_duration = mean(trip_duration)) %>%
  arrange(customer_type,desc(mean_trip_duration))
#on Average casual rides rides more at June with 92.4 mins average trip duration, whilst the member users rides less on 30 mins on average across all months


#Data Visualization 1
#Total number of Trips by customer type
all_trip %>%
  ggplot(aes(x = customer_type, y = number_of_ride, width = 0.5, fill = customer_type)) +
  labs(title = "Total number of rides by customer type",
       y = "number of rides") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE)) +
  geom_col()


#Data Visualization 2
#Average number of Trips by customer type
all_trip %>%
  group_by(customer_type, number_of_ride) %>%
  summarise(avg_num_ride = mean(number_of_ride)) %>%
  ggplot(aes(x = customer_type, y = number_of_ride, width = 0.5, fill = customer_type)) +
  labs(title = "Average rides by customer type",
       y = "Avg. rides by customer type") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE)) +
  geom_col()


#Data Visualization 3
#Total number of Trips by ride type
all_trip %>%
  ggplot(aes(x = ride_type, y = number_of_ride, width = 0.5, fill = customer_type)) +
  labs(title = "Total number of rides by ride type",
       y = "number of rides") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE)) +
  geom_col(position = "stack")


#Data visuaization 4
#Average trip duration by weekday by customer type
all_trip %>%
  group_by(customer_type, weekday) %>%
  summarise(Avg_trip_duration = mean(trip_duration)) %>%
  ggplot(aes(x = weekday, y = Avg_trip_duration, width = 0.5, fill = customer_type)) +
  labs(title = "Average trip duration by weekday and customer type",
       y = "avg.trip duration") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE)) +
  geom_col(position = "dodge")


#Data visualization 5
#Average trip duration by month by customer type
all_trip %>%
  group_by(customer_type, month) %>%
  summarise(Avg_trip_duration = mean(trip_duration)) %>%
  ggplot(aes(x = month, y = Avg_trip_duration, width = 0.5, fill = customer_type)) +
  labs(title = "Average trip duration by month and customer type",
       y = "avg.trip duration") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE)) +
  geom_col(position = "dodge")



