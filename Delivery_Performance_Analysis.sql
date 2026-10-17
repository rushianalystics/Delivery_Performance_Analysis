-- Q1. Find the total number of deliveries in the dataset.

select count(*) as total_delivery
from delivery_data;

-- 2) Find the number of delayed deliveries.

SELECT COUNT(*) AS total_delayed_delivery
FROM delivery_data
WHERE `delayed` = 1;

-- 3) Find the total number of on-time deliveries.

SELECT COUNT(*) AS On_time_delivery
FROM delivery_data
WHERE `delayed` = 0;

-- 4)Find the number of deliveries for each delivery_status.

select delivery_status , count(*) as number_delivery_status
from delivery_data
group by delivery_status;

-- 5)Find the average delivery time for all deliveries.

select avg(delivery_time_hours) as avg_delivery_time 
from delivery_data

-- 6)Find the average delivery time for delayed deliveries.

select AVG(delivery_time_hours) AS avg_delayed_delivery
FROM delivery_data
WHERE `delayed` = 1;

-- 7)Find the average delivery time for on-time deliveries.

select avg(delivery_time_hours) as on_times_deliveries
from delivery_data
where `delayed` = 0;

-- 8)Find the average actual delivery time and average expected delivery time.

select avg(delivery_time_hours) as actual_delivery_time , 
avg(expected_time_hours) as expected_delivery_time
from delivery_data;
    
-- 9)Find the average delivery time difference between actual and expected time.

select avg(delivery_time_hours - expected_time_hours) as difference_actual_expected_time
from delivery_data;

-- 10)Find the average delivery time by region.

select avg(delivery_time_hours) as avg_delivery_time , region
from delivery_data
group by region;

-- 11)Find the number of delayed deliveries for each region.

select count(*) as delayed_deliveries , region
from delivery_data
where `delayed` = 1
group by region;

-- 12)Find the average delivery time for each delivery partner.

select avg(delivery_time_hours) as avg_delivery_time , delivery_partner
from delivery_data
group by delivery_partner;

-- 13)Find the number of delayed deliveries for each delivery partner.

select count(*) as number_of_delay_delivery , delivery_partner
from delivery_data
where `delayed` = 1
group by delivery_partner;

-- 14)Find the average delivery rating for each delivery partner.

select avg(delivery_rating) as avg_delivery_rating , delivery_partner
from delivery_data
group by delivery_partner;

-- 15)Find the average delivery time for each vehicle type.

select avg(delivery_time_hours) as avg_delivery_time , vehicle_type
from delivery_data
group by vehicle_type;

-- 17)Find the number of delayed deliveries for each vehicle type.

select count(*) as number_of_delayed_deliveries , vehicle_type
from delivery_data
where `delayed` = 1
group by vehicle_type;

-- 18)Find the average delivery time for each delivery mode.

select avg(delivery_time_hours) as avg_delivery_time , delivery_mode
from delivery_data
group by delivery_mode;

-- 19)Find the number of delayed deliveries for each delivery mode.

select count(*) as number_of_delay_deliveries , delivery_mode
from delivery_data
where `delayed` = 1
group by delivery_mode;

-- 19)Find the average delivery time for each weather condition.

select avg(delivery_time_hours) as avg_delivery_time , weather_condition
from delivery_data
group by weather_condition;

-- 20)Find the number of delayed deliveries for each weather condition.

select count(*) as number_of_delayed_deliveries , weather_condition
from delivery_data
where `delayed` = 1
group by weather_condition;

-- 21) Find the average delivery rating for each weather condition.

select avg(delivery_rating) as avg_delivery_rating , weather_condition
from delivery_data
group by weather_condition;

-- 22)Find the average delivery time for each package type.

select avg(delivery_time_hours) as avg_delivery_time , package_type
from delivery_data
group by package_type;

-- 23)Find the number of delayed deliveries for each package type.

select count(*) as number_of_delayed_deliveries , package_type
from delivery_data
where `delayed` = 1
group by package_type;

-- 24)Find the average delivery cost for each delivery mode

select avg(delivery_cost) as avg_delivery_cost , delivery_mode
from delivery_data
group by delivery_mode;

-- 25)Find the average delivery cost for each delivery partner.

select avg(delivery_cost) as avg_delivery_cost , delivery_partner
from delivery_data
group by delivery_partner;

-- 26)Find the average delivery cost for each vehicle type.

select avg(delivery_cost) as avg_delivery_cost , vehicle_type
from delivery_data
group by vehicle_type;

-- 27)Find the average delivery rating for each vehicle type.

select avg(delivery_rating) as avg_delivery_rating , vehicle_type
from delivery_data
group by vehicle_type;

-- 28)Find the average delivery time for each delivery status.

select avg(delivery_time_hours) as avg_delivery_time , delivery_status
from delivery_data
group by delivery_status;

-- 29)Find the average distance travelled for each delivery mode.

select avg(distance_km) as avg_distance_travelled , delivery_mode
from delivery_data
group by delivery_mode;

-- 30)Find the average package weight for each package type.

select avg(package_weight_kg) as avg_package_weight , package_type
from delivery_data
group by package_type;

-- 31)Find the average package weight for each delivery mode

select avg(package_weight_kg) as avg_package_weight , delivery_mode
from delivery_data
group by delivery_mode;

-- 32)Find the average delivery rating for each package type.

select avg(delivery_rating) as avg_delivery_rating , package_type
from delivery_data
group by package_type;

-- 33)Find the average delivery cost for each package type.

select avg(delivery_cost) as avg_delivery_cost , package_type
from delivery_data
group by package_type;

-- 34)Find the average distance travelled for each package type.

select avg(distance_km) as avg_distance_travelled , package_type
from delivery_data
group by package_type;

-- 35)Find the average delivery cost for each region.

select avg(delivery_cost) as avg_delivery_cost , region
from delivery_data
group by region;

-- 36)Find the average delivery rating for each region.

select avg(delivery_rating) as avg_delivery_rating , region
from delivery_data
group by region;

-- 37)Find the number of deliveries for each delivery partner, along with the number of delayed deliveries.

SELECT delivery_partner,
       COUNT(*) AS total_deliveries,
       SUM(CASE WHEN `delayed` = 1 THEN 1 ELSE 0 END) AS delayed_deliveries
FROM delivery_data
GROUP BY delivery_partner;

-- 38)Find the delay percentage for each delivery partner.

select delivery_partner , 
	   sum(`delayed` = 1) as total_delayed_delivery,
       count(*) as total_delivery,
       (sum(`delayed` = 1) /count(*)) * 100 as delayed_percentage
from delivery_data
group by delivery_partner;

-- 39)Find the delay percentage for each region.

select region,
       sum(`delayed` = 1) as total_delayed_deliveries,
       count(*) as total_deliveries,
       (sum(`delayed` = 1) / count(*)) * 100 as delayed_percentage_region
from delivery_data
group by region;

-- 40)Find the delay percentage for each delivery mode.

select delivery_mode,
       sum(`delayed` = 1) as total_delayed_deliveries,
       count(*) as total_deliveries,
       (sum(`delayed` = 1) / count(*)) * 100 as delayed_percentage_delivery_mode
from delivery_data
group by delivery_mode;

-- 41)Find the delay percentage for each vehicle type.

select vehicle_type,
       sum(`delayed` = 1) as total_delayed_deliveries,
       count(*) as total_deliveries,
       (sum(`delayed` = 1) / count(*)) * 100 as delayed_percentage_vehicle_type
from delivery_data
group by vehicle_type;

-- 42)Find the delay percentage for each weather condition.

select weather_condition,
       sum(`delayed` = 1) as total_delayed_deliveries,
       count(*) as total_deliveries,
       (sum(`delayed` = 1) / count(*)) * 100 as delayed_percentage_weather_condition
from delivery_data
group by weather_condition;

-- 43)Find the delay percentage for each package type.

select package_type,
       sum(`delayed` = 1) as total_delayed_deliveries,
       count(*) as total_deliveries,
       (sum(`delayed` = 1) / count(*)) * 100 as delayed_percentage_package_type
from delivery_data
group by package_type;

-- 44)Find the average delivery time for delayed and on-time deliveries for each delivery mode.

select delivery_mode ,
       avg(case when `delayed` = 1 then delivery_time_hours end ) as avg_delayed_delivery_time,
       avg(case when `delayed` = 0 then delivery_time_hours end ) as avg_on_time_delivery_time
from delivery_data
group by delivery_mode;

-- 45)Find the average delivery time for delayed and on-time deliveries for each delivery partner.

select delivery_partner ,
       avg(case when `delayed` = 1 then delivery_time_hours end ) as avg_delayed_delivery_partner,
       avg(case when `delayed` = 0 then delivery_time_hours end ) as avg_on_time_delivery_partner
from delivery_data
group by delivery_partner;

-- 46)Find the average delivery cost for delayed and on-time deliveries for each delivery partner.

select delivery_partner ,
      avg(case when `delayed` = 1 then delivery_cost end ) as delayed_delivery_cost,
       avg(case when `delayed` = 0 then delivery_cost end ) as on_time_delivery_cost
from delivery_data
group by delivery_partner;

-- 47)Find the average delivery rating for delayed and on-time deliveries for each delivery partner.

select delivery_partner,
	  avg(case when `delayed` = 1 then delivery_rating end ) as deleayed_delivery_rating,
       avg(case when `delayed` = 0 then delivery_rating end ) as on_time_delivery_rating
from delivery_data
group by delivery_partner;

-- 48)Find the average distance travelled for delayed and on-time deliveries for each delivery partner.

select delivery_partner,
	  avg(case when `delayed` = 1 then distance_km end ) as deleayed_delivery_distance_travelled,
	  avg(case when `delayed` = 0 then distance_km end ) as on_time_delivery_distance_travelled
from delivery_data
group by delivery_partner;

-- 49)Find the average package weight for delayed and on-time deliveries for each delivery partner.

select delivery_partner,
	  avg(case when `delayed` = 1 then package_weight_kg end ) as deleayed_delivery_package_weight_kg,
	  avg(case when `delayed` = 0 then package_weight_kg end ) as on_time_delivery_package_weight_kg
from delivery_data
group by delivery_partner;

-- 50)Find the average difference between actual delivery time and expected delivery time for each delivery partner.

select delivery_partner,
avg(delivery_time_hours - expected_time_hours) as difference_actaul_expected_delivery
from delivery_data
group by delivery_partner;

-- 51)Find the delay percentage for each delivery status.

SELECT 
    delivery_status,
    SUM(`delayed` = 1) AS delayed_delivery,
    COUNT(*) AS total_delivery,
    (SUM(`delayed` = 1) / COUNT(*)) * 100 AS delayed_percentage
FROM
    delivery_data
GROUP BY delivery_status;

-- 52)Find the delivery partners whose average delivery time is greater than the overall average delivery time.

select delivery_partner, avg(delivery_time_hours) as avg_delivery_time
from delivery_data
group by delivery_partner
having avg(delivery_time_hours) > (select avg(delivery_time_hours) from delivery_data);

-- 53)Find the delivery partner with the highest average delivery time.

select delivery_partner , avg(delivery_time_hours) as avg_delivery_time
from delivery_data
group by delivery_partner
order by avg_delivery_time desc
limit 1;

-- 54)Find the delivery partner with the highest delay percentage.

SELECT 
    delivery_partner,
    SUM(`delayed` = 1) AS delayed_delivery,
    COUNT(*) AS total_delivery,
    (SUM(`delayed` = 1) / COUNT(*)) * 100 AS high_delayed_percentage
FROM
    delivery_data
GROUP BY delivery_partner
order by (SUM(`delayed` = 1) / COUNT(*)) * 100 desc
limit 1;

-- 55)Find the top 3 delivery partners based on average delivery rating.

WITH partner_rating AS (
    SELECT delivery_partner,
           AVG(delivery_rating) AS avg_delivery_rating
    FROM delivery_data
    GROUP BY delivery_partner
)
SELECT delivery_partner,
       avg_delivery_rating
FROM (
    SELECT *,
           DENSE_RANK() OVER (ORDER BY avg_delivery_rating DESC) AS rnk
    FROM partner_rating
) AS A
WHERE rnk <= 3;






