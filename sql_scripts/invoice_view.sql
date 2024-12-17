
drop view if exists invoice_flights;

CREATE VIEW invoice_flights AS 
SELECT
	"LSR" as company_name,
    "Rua das Ameixoeiras 14, Campolide" as company_street,
    "suporte@lsr.pt" as email,
    "lsr.pt" as website,
	ib.invoice_id,
    ib.booking_type,
    ib.booking_id,
	ct.cust_first_name,
    ct.cust_last_name,
    ct.cust_address,
    ct.cust_zip,
    cit.city_name,
    st.state_name,
    cntr.country_name,
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
		JOIN flight_booking fb
        ON ib.invoice_id = fb.invoice_id AND ib.booking_id = fb.booking_id
        
        ;

drop view if exists invoice_hotel;

CREATE VIEW invoice_hotel AS 
SELECT
	"LSR" as company_name,
    "Rua das Ameixoeiras 14, Campolide" as company_street,
    "suporte@lsr.pt" as email,
    "lsr.pt" as website,
	ib.invoice_id,
    ib.booking_type,
    ib.booking_id,
	ct.cust_first_name,
    ct.cust_last_name,
    ct.cust_address,
    ct.cust_zip,
    cit.city_name,
    st.state_name,
    cntr.country_name,
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
        ON ib.invoice_id = fb.invoice_id AND ib.booking_id = fb.booking_id
        
        ;
  
    

select * from lsr.invoice_flights;
select * from lsr.invoice_hotel;
