install.packages('tidyverse')
install.packages('lubridate')
install.packages('ggplot2')

library(tidyverse)  #helps wrangle data
library(lubridate)  #helps wrangle date attributes
library(ggplot2)   #helps in data visualization

#Data contained in "C:/Users/Adam/Documents/Cyclistic_R_Analysis/Cyclistic Data/"
#Reading in each .csv file

#Read in January Data
jan_2021 <- read_csv("C:/Users/Adam/Documents/Cyclistic_R_Analysis/Cyclistic Data/January_2021.csv", 
                         col_types = cols(started_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                          ended_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                          start_lat = col_character(), start_lng = col_character(), 
                                          start_station_id = col_character(), end_station_id = col_character(),
                                          end_lat = col_character(), end_lng = col_character()))

#Read in February Data
feb_2021 <- read_csv("C:/Users/Adam/Documents/Cyclistic_R_Analysis/Cyclistic Data/February_2021.csv", 
                     col_types = cols(started_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      ended_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      start_lat = col_character(), start_lng = col_character(), 
                                      start_station_id = col_character(), end_station_id = col_character(),
                                      end_lat = col_character(), end_lng = col_character()))

#Read in March Data
mar_2021 <- read_csv("C:/Users/Adam/Documents/Cyclistic_R_Analysis/Cyclistic Data/March_2021.csv", 
                     col_types = cols(started_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      ended_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      start_lat = col_character(), start_lng = col_character(), 
                                      start_station_id = col_character(), end_station_id = col_character(),
                                      end_lat = col_character(), end_lng = col_character()))

#Read in April Data
apr_2020 <- read_csv("C:/Users/Adam/Documents/Cyclistic_R_Analysis/Cyclistic Data/April_2020.csv", 
                     col_types = cols(started_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      ended_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      start_lat = col_character(), start_lng = col_character(), 
                                      start_station_id = col_character(), end_station_id = col_character(),
                                      end_lat = col_character(), end_lng = col_character()))

#Read in May Data
may_2020 <- read_csv("C:/Users/Adam/Documents/Cyclistic_R_Analysis/Cyclistic Data/May_2020.csv", 
                     col_types = cols(started_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      ended_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      start_lat = col_character(), start_lng = col_character(), 
                                      start_station_id = col_character(), end_station_id = col_character(),
                                      end_lat = col_character(), end_lng = col_character()))

#Read in June Data
jun_2020 <- read_csv("C:/Users/Adam/Documents/Cyclistic_R_Analysis/Cyclistic Data/June_2020.csv", 
                     col_types = cols(started_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      ended_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      start_lat = col_character(), start_lng = col_character(), 
                                      start_station_id = col_character(), end_station_id = col_character(),
                                      end_lat = col_character(), end_lng = col_character()))

#Read in July Data
jul_2020 <- read_csv("C:/Users/Adam/Documents/Cyclistic_R_Analysis/Cyclistic Data/July_2020.csv", 
                     col_types = cols(started_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      ended_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      start_lat = col_character(), start_lng = col_character(), 
                                      start_station_id = col_character(), end_station_id = col_character(),
                                      end_lat = col_character(), end_lng = col_character()))

#Read in August Data
aug_2020 <- read_csv("C:/Users/Adam/Documents/Cyclistic_R_Analysis/Cyclistic Data/August_2020.csv", 
                     col_types = cols(started_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      ended_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      start_lat = col_character(), start_lng = col_character(), 
                                      start_station_id = col_character(), end_station_id = col_character(),
                                      end_lat = col_character(), end_lng = col_character()))

#Read in September Data
sep_2020 <- read_csv("C:/Users/Adam/Documents/Cyclistic_R_Analysis/Cyclistic Data/September_2020.csv", 
                     col_types = cols(started_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      ended_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      start_lat = col_character(), start_lng = col_character(), 
                                      start_station_id = col_character(), end_station_id = col_character(),
                                      end_lat = col_character(), end_lng = col_character()))

#Read in October Data
oct_2020 <- read_csv("C:/Users/Adam/Documents/Cyclistic_R_Analysis/Cyclistic Data/October_2020.csv", 
                     col_types = cols(started_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      ended_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      start_lat = col_character(), start_lng = col_character(),
                                      start_station_id = col_character(), end_station_id = col_character(),
                                      end_lat = col_character(), end_lng = col_character()))

#Read in November Data
nov_2020 <- read_csv("C:/Users/Adam/Documents/Cyclistic_R_Analysis/Cyclistic Data/November_2020.csv", 
                     col_types = cols(started_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      ended_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      start_lat = col_character(), start_lng = col_character(), 
                                      start_station_id = col_character(), end_station_id = col_character(),
                                      end_lat = col_character(), end_lng = col_character()))

#Read in December Data
dec_2020 <- read_csv("C:/Users/Adam/Documents/Cyclistic_R_Analysis/Cyclistic Data/December_2020.csv", 
                     col_types = cols(started_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      ended_at = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                      start_lat = col_character(), start_lng = col_character(),
                                      start_station_id = col_character(), end_station_id = col_character(),
                                      end_lat = col_character(), end_lng = col_character()))

#Combine all data frames into a singular data frame named master_df
master_table <- bind_rows(jan_2021, feb_2021, mar_2021, apr_2020, may_2020, jun_2020, jul_2020, aug_2020, sep_2020, oct_2020, nov_2020, dec_2020)

#Make a data frame with master_table
master_df <- master_table

#Basic data summary
colnames(master_df) #Return number of columns with respective column names
nrow(master_df) #Return number of rows
summary(master_df) #Overview of the data. Easy way to check that data types are working properly. For example, I can see that the started_at and ended_at min's and max's make sense

#Data was cleaned during Plan phase. Below is checking the consistency of some of the rows to ensure the data is clean as well as making the data more readable. 

#Changed names of classic_bike, electric_bike, and docked_bike for neatness
master_df <- master_df %>%
  mutate(rideable_type = recode(rideable_type
        ,"classic_bike" = "classic"
        ,"electric_bike" = "electric"
        ,"docked_bike" = "docked"))

#Changed day of week from number representation to respective name for readability
master_df <- master_df %>%
  mutate(day_of_week = recode(day_of_week
                                ,"1" = "Sunday"
                                ,"2" = "Monday"
                                ,"3" = "Tuesday"
                                ,"4" = "Wednesday"
                                ,"5" = "Thursday"
                                ,"6" = "Friday"
                                ,"7" = "Saturday"
                              ))

master_df %>% distinct(member_casual) #Should return member, casual
master_df %>% distinct(rideable_type) #Should return classic, electric, docked
master_df %>% distinct(day_of_week) #Should return 1-7 (1 being Sunday, 7 being Saturday)

#Below is additional analysis done on the Cyclistic data. Some of the analysis will be a repeat of what was done in SQL. 

mean(master_df$ride_length_seconds) #Return average ride length in seconds
median(master_df$ride_length_seconds) #Return median ride length in seconds
max(master_df$ride_length_seconds) #Return longest ride in seconds
min(master_df$ride_length_seconds) #Return shortest ride in seconds
summary(master_df$ride_length_seconds) #Returns broad summary of the ride_length_seconds column

#Order master_df by the days of the week so that aggregate prints nicely
master_df$day_of_week <- ordered(master_df$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
aggregate(master_df$ride_length_seconds ~ master_df$member_casual + master_df$day_of_week, FUN = mean)

#Calculate the number of rides for each day of the week comparing casual and member memberships
master_df %>% 
  mutate(day_of_week = wday(started_at, label = TRUE)) %>%  #creates weekday field using wday()
  group_by(member_casual, day_of_week) %>%  #groups by usertype and weekday
  summarise(number_of_rides = n()	#calculates the number of rides
            ,average_duration = mean(ride_length_seconds)) %>% # calculates the average duration
  arrange(member_casual, day_of_week) # sorts

#Plot the number of rides for each day of the week comparing casual and member memberships
master_df %>% 
  mutate(day_of_week = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, day_of_week) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length_seconds)) %>% 
  arrange(member_casual, day_of_week)  %>% 
  ggplot(aes(x = day_of_week, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge") +
  scale_y_continuous(name="Number of Rides", labels = scales::comma)+
  labs(title = "Member vs Casual: Number of Rides for Each Day of the Week", x = "Day of the Week")+ 
  guides(fill=guide_legend(title="Membership Type"))

#Plot the average duration of rides for each day of the week comparing casual and member memberships
master_df %>% 
  mutate(day_of_week = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, day_of_week) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length_seconds)) %>% 
  arrange(member_casual, day_of_week)  %>% 
  ggplot(aes(x = day_of_week, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge")+
  labs(title = "Member vs Casual: Trip Duration for Each Day of the Week", x = "Day of the Week", y = "Average Trip Duration (Seconds)")+ 
  guides(fill=guide_legend(title="Membership Type"))

#Exporting the master_df for further analysis in Tableau
write.csv(master_df,"C:\\Users\\Adam\\Documents\\Cyclistic_R_Analysis\\Cyclistic Data\\master_df.csv", row.names = TRUE )
