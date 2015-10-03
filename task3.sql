-- ********************Task 3 a *******************
SELECT DISTINCT medallion, (count(pickup_datetime)-count(DISTINCT pickup_datetime)) AS num_trips_at_same_time
FROM     alltrips
GROUP BY medallion
ORDER BY num_trips_at_same_time;

#3a – My findings suggest that a small number of taxis have a high amount of duplicate trips based on pickup date time given the one-week span. 

-- ********************Task 3 b *******************
SELECT DISTINCT medallion, (
COUNT(IF(dropoff_latitude = 0  
AND dropoff_longitude = 0  
AND pickup_longitude = 0  
AND pickup_latitude = 0, 1, NULL)) /
COUNT(pickup_datetime) * 100
) AS percentage_of_trips_no_gps
FROM alltrips 
GROUP BY medallion
ORDER BY percentage_of_trips_no_gps;

-- ********************Task 3 c *******************
SELECT DISTINCT hack_license,
         COUNT(DISTINCT medallion) AS num_taxis
FROM     alltrips
GROUP BY hack_license
HAVING   COUNT(DISTINCT medallion)
ORDER BY num_taxis;
#3c - My findings suggest some drivers/hack license drive an astronomically high number of different taxis given the one-week span.