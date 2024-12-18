
--  VIEWS

drop view if exists invoice_details;

CREATE VIEW invoice_details AS 
SELECT

	ib.invoice_id,
    ib.booking_type,
    ib.booking_id,
	ct.cust_first_name,
    ct.cust_last_name,
	 fb.booking_date,
     fb.booking_price
     
	FROM 
		inv_book_match ib
		join customer_table ct
		on ib.cust_id = ct.cust_id
        join zip_table zt
        on zt.zip_code = ct.cust_zip
        join city_table cit
        on zt.city_id = cit.city_id
		JOIN flight_booking fb
        ON ib.invoice_id = fb.invoice_id AND ib.booking_id = fb.booking_id
        
union all

SELECT
	ib.invoice_id,
    ib.booking_type,
    ib.booking_id,
	ct.cust_first_name,
    ct.cust_last_name,
	 fb.booking_date,
     fb.booking_price
     
	FROM 
		inv_book_match ib
		join customer_table ct
		on ib.cust_id = ct.cust_id
        join zip_table zt
        on zt.zip_code = ct.cust_zip
        join city_table cit
        on zt.city_id = cit.city_id
        join state_table st 
        on cit.state_id = st.state_id
        join country_table cntr 
        on st.country_id = cntr.country_id
		JOIN hotel_booking fb
        ON ib.invoice_id = fb.invoice_id AND ib.booking_id = fb.booking_id;
  
    
    
    
    
drop view if exists invoice_head;
Create VIEW invoice_head as
SELECT
    "LSR" AS company_name,
    "Rua das Ameixoeiras 14, Campolide" AS company_street,
    "suporte@lsr.pt" AS email,
    "lsr.pt" AS website,
    CURDATE() AS date_of_issue,
    ib.invoice_id,
    MAX(ct.cust_first_name) AS cust_first_name,
    MAX(ct.cust_last_name) AS cust_last_name,
    MAX(ct.cust_address) AS cust_address,
    MAX(ct.cust_zip) AS cust_zip,
    MAX(cit.city_name) AS city_name,
    MAX(st.state_name) AS state_name,
    MAX(cntr.country_name) AS country_name,
    ROUND(SUM(IFNULL(hb.booking_price,0)) + SUM(IFNULL(fb.booking_price,0)), 2) AS total_booking_price

FROM 
    inv_book_match ib
    JOIN customer_table ct
        ON ib.cust_id = ct.cust_id
    JOIN zip_table zt
        ON zt.zip_code = ct.cust_zip
    JOIN city_table cit
        ON zt.city_id = cit.city_id
    JOIN state_table st 
        ON cit.state_id = st.state_id
    JOIN country_table cntr 
        ON st.country_id = cntr.country_id
	LEFT JOIN flight_booking fb
        ON ib.invoice_id = fb.invoice_id AND ib.booking_id = fb.booking_id
    LEFT JOIN hotel_booking hb
        ON ib.invoice_id = hb.invoice_id AND ib.booking_id = hb.booking_id
    
GROUP BY
    ib.invoice_id;
