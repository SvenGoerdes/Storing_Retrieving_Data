-- Scripts to test out triggers


--  CALENDER Triggers
-- customer_table cust_birthday 
UPDATE customer_table SET cust_birthday = '20240101' WHERE cust_id = 'CUST0041';
-- flight_booking booking_date DONE , flight_start_date DONE

UPDATE flight_booking SET booking_date = '20240103' WHERE invoice_id = 'INV0002';
UPDATE flight_booking SET flight_start_date = '20240104' WHERE invoice_id = 'INV0002';

-- hotel_booking booking_date , hotel_start_date , hotel_end_date
UPDATE hotel_booking SET booking_date = '20240104' WHERE booking_id = 'BOOK0001'; -- change booking_id once done 
UPDATE hotel_booking SET hotel_start_date = '20240105' WHERE booking_id = 'BOOK0001'; -- change booking_id once done 
UPDATE hotel_booking SET hotel_end_date = '20240106' WHERE booking_id = 'BOOK0001'; -- change booking_id once done 


-- LOG TABLE Triggers 
-- flight_booking 
-- (invoice_id, booking_id, cust_id, booking_type)
INSERT INTO inv_book_match  VALUES ('INV0005', 'BOOK0005', 'CUST0001', 'Flight');
INSERT INTO flight_booking VALUES ('INV0003', 'BOOK0005', '20240103', 1000.00, '20240103', 'ROUTE001');

-- hotel_booking 
INSERT INTO inv_book_match  VALUES ('INV0006', 'BOOK0006', 'CUST0001', 'Hotel');
INSERT INTO hotel_booking VALUES ('INV0006', 'BOOK0006', '20230102', 150.00, 'HOTEL001', '20230103', '20230105'),




