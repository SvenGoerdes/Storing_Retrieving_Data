------ CALENDER UPDATE TRIGGERS ------
-- 1. Create a trigger to insert calendar date if not availabe for customer_table
DELIMITER $$
CREATE TRIGGER insert_calendar_date_customer
BEFORE UPDATE ON customer_table
FOR EACH ROW 
BEGIN

    -- Declare a variable to check if the date exists
    DECLARE date_exists INT;
	
	-- Check if the date exists in the calendar table
    SELECT COUNT(*) INTO date_exists
    FROM calendar
    WHERE cal_date = NEW.cust_birthday;


    -- Insert the date if it doesn't exist
    IF date_exists = 0 THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (NEW.cust_birthday, 
                YEAR(NEW.cust_birthday), 
                MONTH(NEW.cust_birthday), 
                DAY(NEW.cust_birthday), 
                QUARTER(NEW.cust_birthday));

    END IF;

END$$

-- 2. Create a trigger to insert calendar date if not availabe for customer_table
DELIMITER $$
CREATE TRIGGER insert_calendar_date_flight
BEFORE UPDATE ON flight_booking
FOR EACH ROW 
BEGIN

    -- Declare a variable to check if the date exists for 
    DECLARE date_exists INT;
	
	-- Check if the date exists in the calendar table
    SELECT COUNT(*) INTO date_exists
    FROM calendar
    WHERE cal_date = NEW.booking_date;


    -- Insert the date if it doesn't exist
    IF date_exists = 0 THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (NEW.booking_date, 
                YEAR(NEW.booking_date), 
                MONTH(NEW.booking_date), 
                DAY(NEW.booking_date), 
                QUARTER(NEW.booking_date));

    END IF;

	
	-- Check if the date exists in the calendar table
    SELECT COUNT(*) INTO date_exists
    FROM calendar
    WHERE cal_date = NEW.flight_start_date;


    -- Insert the date if it doesn't exist
    IF date_exists = 0 THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (NEW.flight_start_date, 
                YEAR(NEW.flight_start_date), 
                MONTH(NEW.flight_start_date), 
                DAY(NEW.flight_start_date), 
                QUARTER(NEW.flight_start_date));

    END IF;
    
END$$

-- 3. Create a trigger to insert calendar date if not availabe for customer_table
DELIMITER $$
CREATE TRIGGER insert_calendar_date_hotel
BEFORE UPDATE ON hotel_booking
FOR EACH ROW 
BEGIN

    -- Declare a variable to check if the date exists for 
    DECLARE date_exists INT;
	
	-- Check if the date exists in the calendar table
    SELECT COUNT(*) INTO date_exists
    FROM calendar
    WHERE cal_date = NEW.booking_date;


    -- Insert the date if it doesn't exist
    IF date_exists = 0 THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (NEW.booking_date, 
                YEAR(NEW.booking_date), 
                MONTH(NEW.booking_date), 
                DAY(NEW.booking_date), 
                QUARTER(NEW.booking_date));

    END IF;

	
	-- Check if the date exists in the calendar table
    SELECT COUNT(*) INTO date_exists
    FROM calendar
    WHERE cal_date = NEW.hotel_start_date;


    -- Insert the date if it doesn't exist
    IF date_exists = 0 THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (NEW.hotel_start_date, 
                YEAR(NEW.hotel_start_date), 
                MONTH(NEW.hotel_start_date), 
                DAY(NEW.hotel_start_date), 
                QUARTER(NEW.hotel_start_date));

    END IF;


	-- Check if hotel_end_date exists in the calendar table
    SELECT COUNT(*) INTO date_exists
    FROM calendar
    WHERE cal_date = NEW.hotel_end_date;

    -- Insert the date if it doesn't exist
    IF date_exists = 0 THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (NEW.hotel_end_date, 
                YEAR(NEW.hotel_end_date), 
                MONTH(NEW.hotel_end_date), 
                DAY(NEW.hotel_end_date), 
                QUARTER(NEW.hotel_end_date));

    END IF;
    
END$$


 ------- LOG TABLES TRIGGERS ------
-- 4. Create a trigger for flight_booking insert for log table
-- This trigger fires after a new row is inserted into flight_booking
DELIMITER $$
CREATE TRIGGER flight_booking_insert_log
AFTER INSERT ON flight_booking
FOR EACH ROW
BEGIN
    INSERT INTO booking_log (booking_id, invoice_id, booking_type, booking_date, booking_price)
    VALUES (NEW.booking_id, NEW.invoice_id, 'Flight', NEW.booking_date, NEW.booking_price);
END$$
DELIMITER ;

-- 5. Create a trigger for hotel_booking insert for log table
-- This trigger fires after a new row is inserted into hotel_booking
DELIMITER $$
CREATE TRIGGER hotel_booking_insert_log
AFTER INSERT ON hotel_booking
FOR EACH ROW
BEGIN
    INSERT INTO booking_log (booking_id, invoice_id, booking_type, booking_date, booking_price)
    VALUES (NEW.booking_id, NEW.invoice_id, 'Hotel', NEW.booking_date, NEW.booking_price);
END$$
DELIMITER ;





----- CALENDER INSERTION TRIGGERS ------
-- 6. Create a trigger to insert calendar date if not availabe for customer_table
DELIMITER $$
CREATE TRIGGER insert_calendar_date_customer
BEFORE INSERT ON customer_table
FOR EACH ROW 
BEGIN

    -- Declare a variable to check if the date exists
    DECLARE date_exists INT;
	
	-- Check if the date exists in the calendar table
    SELECT COUNT(*) INTO date_exists
    FROM calendar
    WHERE cal_date = NEW.cust_birthday;


    -- Insert the date if it doesn't exist
    IF date_exists = 0 THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (NEW.cust_birthday, 
                YEAR(NEW.cust_birthday), 
                MONTH(NEW.cust_birthday), 
                DAY(NEW.cust_birthday), 
                QUARTER(NEW.cust_birthday));

    END IF;

END$$





    -- 7. Create a trigger to insert calendar date if not availabe for customer_table
DELIMITER $$
CREATE TRIGGER insert_calendar_date_flight
BEFORE INSERT ON flight_booking
FOR EACH ROW 
BEGIN

    -- Declare a variable to check if the date exists for 
    DECLARE date_exists INT;
	
	-- Check if the date exists in the calendar table
    SELECT COUNT(*) INTO date_exists
    FROM calendar
    WHERE cal_date = NEW.booking_date;


    -- Insert the date if it doesn't exist
    IF date_exists = 0 THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (NEW.booking_date, 
                YEAR(NEW.booking_date), 
                MONTH(NEW.booking_date), 
                DAY(NEW.booking_date), 
                QUARTER(NEW.booking_date));

    END IF;

	
	-- Check if the date exists in the calendar table
    SELECT COUNT(*) INTO date_exists
    FROM calendar
    WHERE cal_date = NEW.flight_start_date;


    -- Insert the date if it doesn't exist
    IF date_exists = 0 THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (NEW.flight_start_date, 
                YEAR(NEW.flight_start_date), 
                MONTH(NEW.flight_start_date), 
                DAY(NEW.flight_start_date), 
                QUARTER(NEW.flight_start_date));

    END IF;
    
END$$


    -- 8. Create a trigger to insert calendar date if not availabe for customer_table
DELIMITER $$
CREATE TRIGGER insert_calendar_date_hotel
BEFORE INSERT ON hotel_booking
FOR EACH ROW 
BEGIN

    -- Declare a variable to check if the date exists for 
    DECLARE date_exists INT;
	
	-- Check if the date exists in the calendar table
    SELECT COUNT(*) INTO date_exists
    FROM calendar
    WHERE cal_date = NEW.booking_date;


    -- Insert the date if it doesn't exist
    IF date_exists = 0 THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (NEW.booking_date, 
                YEAR(NEW.booking_date), 
                MONTH(NEW.booking_date), 
                DAY(NEW.booking_date), 
                QUARTER(NEW.booking_date));

    END IF;

	
	-- Check if the date exists in the calendar table
    SELECT COUNT(*) INTO date_exists
    FROM calendar
    WHERE cal_date = NEW.hotel_start_date;


    -- Insert the date if it doesn't exist
    IF date_exists = 0 THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (NEW.hotel_start_date, 
                YEAR(NEW.hotel_start_date), 
                MONTH(NEW.hotel_start_date), 
                DAY(NEW.hotel_start_date), 
                QUARTER(NEW.hotel_start_date));

    END IF;


	-- Check if hotel_end_date exists in the calendar table
    SELECT COUNT(*) INTO date_exists
    FROM calendar
    WHERE cal_date = NEW.hotel_end_date;

    -- Insert the date if it doesn't exist
    IF date_exists = 0 THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (NEW.hotel_end_date, 
                YEAR(NEW.hotel_end_date), 
                MONTH(NEW.hotel_end_date), 
                DAY(NEW.hotel_end_date), 
                QUARTER(NEW.hotel_end_date));

    END IF;
    
END$$


