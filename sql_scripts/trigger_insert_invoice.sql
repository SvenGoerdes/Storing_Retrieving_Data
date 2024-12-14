
-- THIS IS REDUNDANT WE NEED TO INSERT INVOICE BEFORE FLIGHT OR HOTEL BOOKING


-- Create a trigger to insert invoice if not availabe for invoice_bookings
DELIMITER $$
CREATE TRIGGER insert_invoice_flight
BEFORE INSERT ON flight_booking
FOR EACH ROW
BEGIN

    -- Declare a variable to check if the date exists
    DECLARE invoice_exists INT;
	
	-- Check if the date exists in the calendar table
    SELECT COUNT(*) INTO invoice_exists
    FROM invoice_bookings
    WHERE invoice_id = NEW.invoice_id;

	-- Get customer 
	Select cust_id INTO cust_insert from customer_table 
	where cust_id = NEW.cust_id;

    -- Insert the date if it doesn't exist
    IF invoice_exists = 0 THEN
        INSERT INTO invoice_bookings (invoice, booking_id, cust_id, booking_type)
        VALUES (NEW.invoice_id, 
                NEW.booking_id,
                NEW.cust_id,
                'flight');

    END IF;

END$$




-- DELIMITER;



-- -- Create a trigger to insert invoice if not availabe for invoice_bookings
-- DELIMITER $$
-- CREATE TRIGGER insert_invoice_hotel
-- BEFORE INSERT ON hotel_booking
-- FOR EACH ROW
-- BEGIN

--     -- Declare a variable to check if the date exists
--     DECLARE invoice_id INT;
--     DECLARE cust_insert VARCHAR(8);
	
-- 	-- Check if the date exists in the calendar table
--     SELECT COUNT(*) INTO invoice_exists
--     FROM invoice_bookings
--     WHERE invoice_id = NEW.invoice_id;
    
--     -- how do we fix this?
-- 	Select cust_id INTO cust_insert from customer_table 
-- 		where  = NEW.cust_id;

--     -- Insert the date if it doesn't exist
--     IF invoice_exists = 0 THEN
--         INSERT INTO invoice_bookings (invoice, booking_id, cust_id, booking_type)
--         VALUES (NEW.invoice_id, 
--                 NEW.booking_id,
--                 cust_insert,
--                 'flight');

--     END IF;

-- END$$


-- Error Code: 1054. Unknown column 'cust_id' in 'NEW'
