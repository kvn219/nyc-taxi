-- ********************Task 2 a *******************
SELECT fare_amount AS amount, COUNT(*) AS num_trips
FROM alltrips 
GROUP BY fare_amount; 

-- ********************Task 2 b *******************
SELECT COUNT(fare_amount) AS num_trips_less_than_10_dollars
FROM alltrips 
WHERE fare_amount<10;

-- ********************Task 2 c *******************
SELECT passenger_count AS number_of_passengers, count(passenger_count) AS num_trips
FROM alltrips 
GROUP BY passenger_count;

-- ********************Task 2 d *******************
SELECT DAYOFWEEK(pickup_datetime) AS day, sum(total_amount) AS total_revenue
FROM alltrips 
GROUP BY DAYOFWEEK(pickup_datetime);

-- ********************Task 2 e *******************
SELECT DISTINCT medallion, COUNT(pickup_datetime) AS total_num_trips
FROM alltrips 
GROUP BY medallion;