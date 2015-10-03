
-- ********************Task 1 *******************
#Optimizing strategy 

CREATE TABLE trips_tbl LIKE trips;
INSERT trips_tbl SELECT * 
FROM trips
ORDER BY pickup_datetime, hack_license, medallion, vendor_id 
DESC;

-- INDEX
ALTER TABLE trips_tbl add column trip_id INT NOT NULL AUTO_INCREMENT FIRST, ADD primary KEY trip_id(trip_id);

-- COPY OF TABLE
CREATE TABLE fares_tbl LIKE fares; 
INSERT fares_tbl SELECT * 
FROM fares
ORDER BY pickup_datetime, hack_license, medallion, vendor_id 
DESC;

-- INDEX
ALTER TABLE fares_tbl add column trip_id INT NOT NULL AUTO_INCREMENT FIRST, ADD primary KEY trip_id(trip_id);

-- ALLTRIPS TABLE
CREATE TABLE alltrips AS (SELECT trips_tbl.*, fares_tbl.payment_type, fares_tbl.fare_amount, fares_tbl.surcharge, fares_tbl.mta_tax, fares_tbl.tip_amount, fares_tbl.tolls_amount, fares_tbl.total_amount 
FROM trips_tbl 
INNER JOIN fares_tbl 
ON trips_tbl.trip_id=fares_tbl.trip_id);

-- DROPPING EXTRA TABLES
DROP table trips_tbl;
DROP table fares_tbl;

-- PRIMARY KEY
ALTER TABLE alltrips 
ADD primary KEY trip_id(trip_id);

-- INDEX
ALTER TABLE alltrips 
ADD INDEX trip_index (medallion, pickup_datetime);

--  INDEX
ALTER TABLE alltrips
ADD INDEX trip_amount_index (medallion, pickup_datetime, fare_amount);