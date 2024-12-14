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


    -- Insert the date if it doesn't exist
    IF invoice_exists = 0 THEN
        INSERT INTO invoice_bookings (invoice, booking_id, cust_id, booking_type)
        VALUES (NEW.invoice_id, 
                NEW.booking_id,
                NEW.cust_id,
                'flight');

    END IF;

END$$




DELIMITER;



-- Create a trigger to insert invoice if not availabe for invoice_bookings
DELIMITER $$
CREATE TRIGGER insert_invoice_hotel
BEFORE INSERT ON hotel_booking
FOR EACH ROW
BEGIN

    -- Declare a variable to check if the date exists
    DECLARE invoice_id INT;
	
	-- Check if the date exists in the calendar table
    SELECT COUNT(*) INTO invoice_exists
    FROM invoice_bookings
    WHERE invoice_id = NEW.invoice_id;


    -- Insert the date if it doesn't exist
    IF invoice_exists = 0 THEN
        INSERT INTO invoice_bookings (invoice, booking_id, cust_id, booking_type)
        VALUES (NEW.invoice_id, 
                NEW.booking_id,
                NEW.cust_id,
                'flight');

    END IF;

END$$




DELIMITER;



