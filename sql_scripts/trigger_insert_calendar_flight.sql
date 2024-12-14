    -- Create a trigger to insert calendar date if not availabe for customer_table
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



