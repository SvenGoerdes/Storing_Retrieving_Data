    -- Create a trigger to insert calendar date if not availabe for customer_table
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