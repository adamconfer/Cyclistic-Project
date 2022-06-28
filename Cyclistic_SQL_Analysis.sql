/*
Author: Adam Confer
Date: 6/22/2022
Description: The queries below were used to find trends and analyze one year of bicycle trip data provided by Cyclistic. The 
queries were written to help answer: "In what ways do members and casual riders use Cyclistic bikes differently?"
*/

-- Combines all of the data for each month into a table called master_table 
SELECT * 
	INTO master_table
FROM
(
SELECT * 
FROM CyclisticDatabase.dbo.January_2021
UNION ALL

SELECT * 
FROM CyclisticDatabase.dbo.February_2021
UNION ALL

SELECT * 
FROM CyclisticDatabase.dbo.March_2021
UNION ALL

SELECT * 
FROM CyclisticDatabase.dbo.April_2020
UNION ALL

SELECT * 
FROM CyclisticDatabase.dbo.May_2020
UNION ALL

SELECT * 
FROM CyclisticDatabase.dbo.June_2020
UNION ALL

SELECT * 
FROM CyclisticDatabase.dbo.July_2020
UNION ALL

SELECT * 
FROM CyclisticDatabase.dbo.August_2020
UNION ALL

SELECT * 
FROM CyclisticDatabase.dbo.September_2020
UNION ALL

SELECT * 
FROM CyclisticDatabase.dbo.October_2020
UNION ALL

SELECT * 
FROM CyclisticDatabase.dbo.November_2020
UNION ALL

SELECT * 
FROM CyclisticDatabase.dbo.December_2020
)a



-- Create a temp table that has the total number of trips for each membership type
SELECT 
	member_casual AS membership_type, 
	COUNT(member_casual) AS num_of_membership
INTO  #num_each_membership_table
FROM 
	CyclisticDatabase.dbo.master_table
GROUP BY 
	member_casual



-- Calculates the number of each membership and displays it as a percentage of the total
SELECT 
	membership_type, num_of_membership, 
	ROUND((num_of_membership * 100.00) / (SELECT SUM(num_of_membership) FROM #num_each_membership_table), 4) AS percent_of_total
FROM 
	#num_each_membership_table



-- Calculate the average ride time
SELECT 
	 AVG(ride_length_seconds) AS average_ride_length_seconds
FROM
	dbo.master_table




--Calculate the maximum ride length
SELECT 
	MAX(ride_length_seconds) AS longest_ride_seconds,
	ROUND(((MAX(ride_length_seconds))/60.0/60.0),3) AS longest_ride_hours
FROM 
	dbo.master_table



--Calculate the minimum ride length
SELECT 
	MIN(ride_length_seconds) AS shortest_ride_seconds
FROM 
	dbo.master_table



--Calculate the most common (MODE) ride length
SELECT TOP 1 
	ride_length_seconds AS MODE_ride_length
FROM 
	dbo.master_table
GROUP BY ride_length_seconds
ORDER BY COUNT(*) DESC



--Calculate the average ride length for "casual" and "member" types
SELECT
	member_casual AS member_type, 
	AVG(ride_length_seconds) AS average_ride_length_seconds
FROM 
	dbo.master_table
GROUP BY member_casual



--Create table that contains the day name and number as determined by excel WEEKDAY function (1 for Sunday, 7 for Saturday) 
CREATE TABLE day_of_week_table (
	day_of_week_name varchar(255),
	day_of_week_num tinyint
)



--Insert values into the day_of_week_table 
INSERT INTO day_of_week_table(day_of_week_name, day_of_week_num)
VALUES
('Sunday', 1),
('Monday', 2),
('Tuesday', 3),
('Wednesday', 4),
('Thursday', 5),
('Friday', 6),
('Saturday', 7);



-- Calculate the average ride length by day 
SELECT 
	day_of_week, day_of_week_name, 
	AVG(ride_length_seconds) AS average_ride_length_seconds
FROM 
	dbo.master_table masterT
JOIN dbo.day_of_week_table dayT
ON masterT.day_of_week = dayT.day_of_week_num
GROUP BY day_of_week, day_of_week_name
ORDER BY day_of_week ASC



-- Calculate the average ride length by day and membership type
SELECT 
	member_casual AS membership_type, 
	day_of_week_name, 
	AVG(ride_length_seconds) AS average_ride_length_seconds
FROM 
	dbo.master_table masterT
JOIN dbo.day_of_week_table dayT
ON masterT.day_of_week = dayT.day_of_week_num
GROUP BY day_of_week, member_casual, day_of_week_name
ORDER BY day_of_week ASC



-- Calculate number of trips for each membership type
SELECT 
	member_casual, 
	COUNT(ride_id) AS num_of_trips
FROM 
	dbo.master_table
GROUP BY member_casual



-- Calculate number of trips for each membership type for each day of the week
SELECT 
	member_casual, 
	day_of_week, 
	day_of_week_name, COUNT(ride_id) AS num_of_trips
FROM 
	dbo.master_table masterT
JOIN dbo.day_of_week_table dayT
ON masterT.day_of_week = dayT.day_of_week_num
GROUP BY day_of_week, member_casual, day_of_week_name
ORDER BY num_of_trips DESC



--Calculate number of trips for casual members for each day of the week (with percentage shown)
SELECT 
	member_casual AS membership_type, 
	day_of_week_name, 
	COUNT(ride_id) AS num_of_trips, (COUNT(ride_id)*100.00)/(SELECT COUNT(ride_id) FROM dbo.master_table WHERE member_casual = 'casual') AS num_of_trips_percentage,
	AVG(ride_length_seconds)/60 AS trip_duration_minutes
FROM 
	dbo.master_table masterT
JOIN dbo.day_of_week_table dayT
ON masterT.day_of_week = dayT.day_of_week_num
WHERE member_casual = 'casual'
GROUP BY day_of_week_name, member_casual
ORDER BY num_of_trips DESC



--Calculate number of trips for members for each day of the week (with percentage shown)
SELECT 
	member_casual AS membership_type, 
	day_of_week_name, 
	COUNT(ride_id) AS num_of_trips, (COUNT(ride_id)*100.00)/(SELECT COUNT(ride_id) FROM dbo.master_table WHERE member_casual = 'member') AS num_of_trips_percentage,
	AVG(ride_length_seconds)/60 AS trip_duration_minutes

FROM 
	dbo.master_table masterT
JOIN dbo.day_of_week_table dayT
ON masterT.day_of_week = dayT.day_of_week_num
WHERE member_casual = 'member'
GROUP BY day_of_week_name, member_casual
ORDER BY num_of_trips DESC