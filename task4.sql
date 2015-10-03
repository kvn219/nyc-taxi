
-- ********************Task 4 a *******************
SELECT M.vehicle_type AS vehicle_type, COUNT(A.pickup_datetime) AS total_trips, SUM(A.total_amount) AS total_revenue, ( 100 * SUM(A.tip_amount)/SUM(A.total_amount)) AS avg_tip_percentage  
FROM alltrips A, medallions M
WHERE A.medallion = M.medallion
GROUP BY M.vehicle_type;

-- ********************Task 4 b *******************
SELECT M.medallion_type AS medallion_type, 
COUNT(A.pickup_datetime) AS total_trips, 
SUM(A.total_amount) AS total_revenue, 
(SUM(A.tip_amount)/SUM(A.total_amount)*100) AS avg_tip_percentage
FROM alltrips A, medallions M
WHERE A.medallion = M.medallion
GROUP BY M.medallion_type;

-- ********************Task 4 c *******************
SELECT M.agent_name AS top_ten_revenue_agent,
SUM(A.total_amount) AS total_revenue
FROM alltrips A, medallions M
WHERE A.medallion = M.medallion
GROUP BY M.agent_name
ORDER BY total_revenue DESC
LIMIT 10;