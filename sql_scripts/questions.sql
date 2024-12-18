-- - Business questions:



-- 1.)
--     - Top destinations? @Leonardo Di Caterina
--         - for flights
--         - hotels

		select city_name,count(*)  from flight_booking fb 
								inner join flight_route r on fb.route_id = r.route_id 
								inner join city_table ct on r.fl_endplace = ct.city_id
								group by city_name
								order by count(*) desc;
								
		-- hotel

		select city_name,count(*) from hotel_booking hb 
								inner join hotel r on hb.hotel_id = r.hotel_id 
								inner join city_table ct on r.city_id = ct.city_id
								group by city_name
								order by count(*) desc;




-- 2.)
--     - Number of flights per city?
Select 
	ct.city_name,	
	fr.fl_startplace,
	Count(*) as total_number_of_flights
from LSR.flight_booking flight_booking
	left join LSR.flight_route fr 
		on flight_booking.route_id = fr.route_id

	left join LSR.city_table ct 
		on fr.fl_startplace = ct.city_id
group by fr.fl_startplace
order by total_number_of_flights desc;
	


-- 3.)
--     - Number of customers per country? 
select 

	ctr.country_name, 
	count(*) as customers_per_country
	
from customer_table c 
inner join zip_table z 
	on c.cust_zip = z.zip_code
inner join city_table ct
    on ct.city_id = z.city_id
inner join state_table st
    on st.state_id = ct.state_id
inner join country_table ctr
    on ctr.country_id = st.country_id

    group by ctr.country_name;




-- 4.) 
--     - Number of customers and bookings per age bin?


-- create a common table expression to calculate the age of the customers
with age_cte as (
Select 
	ht.booking_id,
	ib.cust_id,
	ROUND(DATEDIFF(CURRENT_DATE(), ct.cust_birthday )/365 ,0) as age
from LSR.hotel_booking as ht
	
left join LSR.inv_book_match ib
	on ht.invoice_id = ib.invoice_id
	
left join LSR.customer_table ct 
	on ct.cust_id = ib.cust_id

	
	
	
)
-- Select from the cte
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
	GROUP BY age_bin
ORDER BY number_of_customers DESC;



-- 5.)
--     - What was the most revenue quarter for hotels and flights? @Rui Ten jua

-- hotels bookings

select  date_year, date_quarter,
	round(sum(booking_price),2) as revenue from hotel_booking hb 
	inner join calendar c 
		on hb.booking_date = c.cal_date group by date_year , date_quarter
ORDER BY  revenue DESC;

-- flight bookings 
select  date_year, date_quarter,
	round(sum(booking_price),2) as reveneu from flight_booking hb 
	inner join calendar c 
		on hb.booking_date = c.cal_date group by date_year , date_quarter
order by reveneu desc;