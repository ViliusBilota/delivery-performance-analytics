-- A. Operational Performance (Logistics KPIs)
-- 1. What is the average delivery time (in days) across all shipments?

select round(avg(datediff(delivered_date, shipped_date)),0) as average_delivery_time 
from shipments;

-- The result has no decimal places because a delivery cannot occur in ‘half a day’ when measured by calendar dates. You either receive the shipment on one day or the next, so the difference between dates is always a whole number of days.

-- 2. How many shipments were delivered on time vs delayed?

select delivery_status, count(*) as shipment_count, round(count(*)*100/ ( select count(*) from shipments), 0 ) as percentage
from shipments
group by delivery_status;

-- Counts how many shipments were delivered on time versus delayed and calculates the percentage of each out of the total number of shipments.

-- 3. What is the average delivery time for each shipment_type?

select shipment_type, round(avg(datediff(delivered_date, shipped_date)),2) as average_delivery_time 
from shipments
group by shipment_type;

-- Average delivery time per shipment_type, rounded to 2 decimals to highlight differences.

-- 4. Which origin_center has the fastest average delivery time?

select origin_center, round(avg(datediff(delivered_date, shipped_date)),2) as average_delivery_time
from shipments
group by origin_center
order by average_delivery_time desc
limit 1;

-- Identifies the origin_center with the fastest average delivery time. Uses ORDER BY average_delivery_time ASC to sort from fastest to slowest and LIMIT 1 to return only the single center with the shortest average delivery time.

-- 5. What is the distribution of delivery delays (in days) by destination_region?

select destination_region, round(avg(datediff(delivered_date, shipped_date)),0) as delivery_delay
from shipments
group by destination_region;

-- Calculates the average delivery delay per destination_region. Based on the data, the delay is the same across all regions.

-- 6. How does delivery time vary between shipments marked as holiday season vs non-holiday season?

select is_holiday_season, round(avg(datediff(delivered_date, shipped_date)),2) as average_delivery_time
from shipments
group by is_holiday_season;

-- Deliveries are slightly faster during holidays by 0.11 days, possibly due to extra staff or express shipping.

-- 7. Identify the top 5 shipments with the longest delivery times and their reasons for delay.

select shipment_id, datediff(delivered_date,shipped_date) as delivery_time, delay_reason
from shipments
order by delivery_time desc
limit 5;

-- Top 5 shipments by delivery time; max is 9 days, more shipments share this max but only 5 are displayed.

-- 8. Is there a correlation between shipment weight and delivery time?

select 
	case 
		when weight_grams <1000 then 'Light'
        when weight_grams between 1000 and 3000 then 'Medium'
        else 'Heavy'
	end as weight_category,
    round(avg(datediff(delivered_date, shipped_date)),2) as average_delivery_time
from shipments
group by weight_category;    

-- Avg delivery time by weight category; differences are minimal, suggesting little correlation with weight.

-- 9. Suggest three key KPIs to monitor delivery performance based on this dataset and explain why.
-- Average delivery time because it hows how long shipments take on average; helps identify slow routes or inefficient processes.
-- On-time delivery rate because it measures reliability of deliveries and overall operational performance.
-- Delayed shipments by region because it hightlights problem regions with frequent delays and helps prioritize operation improvements.

-- 10. What percentage of shipments had 'None' as delivery_reason and what does this imply?

select 
	case 
		when delivery_status = 'None' then 'Parcel lost'
        else 'Parcel on track to be delivered'
    end as parcel_status, 
    count(*) as shipment_count, round(count(*)*100/(select count(*) from shipments), 2) as percentage
from shipments
group by parcel_status;    

-- All shipments are on track to be delivered (1831 shipments, 100%). It indicates that there are no lost parcels or missing delivery reasons in the dataset.

-- 11. How many shipments were created but never shipped or delivered?

select count(*) as amount_of_shipments
from shipments
where shipped_date is null and delivered_date is null;

-- Counts shipments that were created but never shipped or delivered. Ensures both shipped_date and delivered_date are NULL.

-- 12. What is the average distance_km for delayed vs on-time shipments?

select delivery_status, round(avg(distance_km), 2)
from shipments
group by delivery_status;

-- Avg distance for Delivered vs Delayed shipments; minimal difference, indicating distance has little effect on delays.

-- 13. Analize the trend of customer_rating over time? Is satisfaction improving or declining?

select month(delivered_date) as month, avg(customer_rating) as average_rating
from shipments
group by month(delivered_date)
order by month(delivered_date) asc; 

-- Monthly average customer ratings show fluctuations, with no clear trend of improvement or decline.
