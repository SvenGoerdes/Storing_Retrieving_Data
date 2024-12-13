-- - Business questions:



-- 1.)
--     - Top destinations? @Leonardo Di Caterina
--         - for flights
--         - hotels





-- 2.)
--     - Number of flights per region? @Sven Goerdes -- mabye add additional information like flights per quarter in each city 
Select 
	ct.city_name,
	fr.fl_startplace,
	Count(*) as total_number_of_flights
from LSR.flight_route fr
	left join LSR.city_table ct 
		on fr.fl_startplace = ct.city_id
group by fr.fl_startplace 
	


-- 3.)
--     - Number of customers per country? @Rui Ten jua
select count(*),ctr.country_name from customer_table c inner join zip_table z 
								on c.cust_zip = z.zip_code
                                inner join city_table ct
                                on ct.city_id = z.city_id
                                inner join state_table st
                                on st.state_id = ct.state_id
                                inner join country_table ctr
                                on ctr.country_id = st.country_id
                                group by ctr.country_name




-- 4.) 
--     - Number of customers per age bin? @Sven Goerdes


-- create a common table expression to calculate the age of the customers
with age_cte as (
Select 
	ht.booking_id,
	ib.cust_id,
	ROUND(DATEDIFF(CURRENT_DATE(), ct.cust_birthday )/365 ,0) as age
from LSR.hotel_booking as ht
	
left join LSR.invoice_bookings ib
	on ht.invoice_id = ib.invoice_id
	
left join LSR.customer_table ct 
	on ct.cust_id = ib.cust_id

	
	
	-- from LSR.customer_table ct
)

Select 
	CASE
		WHEN age <= 17 THEN '0-17'
		WHEN age BETWEEN 18 AND 25 THEN '18-25'
		WHEN age BETWEEN 26 AND 35 THEN '26-35'
		WHEN age BETWEEN 36 AND 45 THEN '36-45'
		WHEN age BETWEEN 46 AND 55 THEN '46-55'
		WHEN age BETWEEN 56 AND 65 THEN '56-65'
		WHEN age BETWEEN 66 AND 75 THEN '66-75'
		WHEN age BETWEEN 76 AND 85 THEN '76-85'
		WHEN age BETWEEN 86 AND 95 THEN '86-95'
		ELSE '95+'
	END as age_bin,
	COUNT(DISTINCT(cust_id)) as number_of_customers,
	COUNT(DISTINCT(booking_id)) as number_of_bookings
FROM age_cte
	GROUP BY age_bin;
-- 5.)
--     - Top “Country” where customers are from” in terms of revenue? @Leonardo Di Caterina
--         - Country refers to where the customers is from


-- 6.)
--     - What was the most revenue quarter? @Rui Ten jua