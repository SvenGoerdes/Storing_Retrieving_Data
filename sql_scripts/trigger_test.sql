-- Scripts to test out triggers


--  CALENDER Triggers
-- customer_table cust_birthday 
UPDATE customer_table SET cust_birthday = '20241001' WHERE cust_id = 'CUST0001';
-- flight_booking booking_date DONE , flight_start_date DONE

UPDATE flight_booking SET booking_date = '20241002' WHERE invoice_id = 'INV0001';
UPDATE flight_booking SET flight_start_date = '20241003' WHERE invoice_id = 'INV0001';

-- hotel_booking booking_date , hotel_start_date , hotel_end_date
UPDATE hotel_booking SET booking_date = '20241004' WHERE booking_id = 'BOKH0001'; -- change booking_id once done 
UPDATE hotel_booking SET hotel_start_date = '20241005' WHERE booking_id = 'BOKH0001'; -- change booking_id once done 
UPDATE hotel_booking SET hotel_end_date = '20241006' WHERE booking_id = 'BOKH0001'; -- change booking_id once done 


-- LOG TABLE Triggers 
-- flight_booking 
-- (invoice_id, booking_id, cust_id, booking_type)
INSERT INTO inv_book_match  VALUES ('INV0028', 'BOKF0030', 'CUST0001', 'Flight');
INSERT INTO flight_booking VALUES ('INV0028', 'BOKF0030', '20240103', 1000.00, '20240103', 'ROUTE055');


-- hotel_booking 
INSERT INTO inv_book_match  VALUES ('INV0029', 'BOKH0030', 'CUST0001', 'Hotel');
INSERT INTO hotel_booking VALUES ('INV0029', 'BOKH0030', '20240103', 150.00, 'HOTEL001', '20240104', '20240110');




