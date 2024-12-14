DELIMITER $$
CREATE TRIGGER update_rooms_on_insert
BEFORE INSERT ON hotel_booking
FOR EACH ROW
BEGIN
    -- Decrease rooms_available for the hotel being booked
    UPDATE hotel
    SET rooms_available = rooms_available - 1,
        time_stamp = CURRENT_TIMESTAMP
    WHERE hotel_id = NEW.hotel_id;
END $$
DELIMITER ;

DELIMITER $$

CREATE TRIGGER update_rooms_and_timestamp
AFTER UPDATE ON hotel_booking
FOR EACH ROW
BEGIN
    -- Check if hotel_id has actually changed
    IF OLD.hotel_id != NEW.hotel_id THEN
        -- Decrease rooms_available for the old hotel
        IF OLD.hotel_id IS NOT NULL THEN
            UPDATE hotel
            SET rooms_available = rooms_available + 1,
                time_stamp = CURRENT_TIMESTAMP
            WHERE hotel_id = OLD.hotel_id;
        END IF;

        -- Decrease rooms_available for the new hotel
        IF NEW.hotel_id IS NOT NULL THEN
            UPDATE hotel
            SET rooms_available = rooms_available - 1,
                time_stamp = CURRENT_TIMESTAMP
            WHERE hotel_id = NEW.hotel_id;
        END IF;
    END IF;
END $$

DELIMITER ;


-- 2. Create a trigger for flight_booking insert
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

-- 3. Create a trigger for hotel_booking insert
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


-- 4. Create triggers for updating the calendar date (for hotel_booking, flight_booking, customer_table)
    -- Create a trigger to insert calendar date if not availabe for hotel_booking
DELIMITER $$
CREATE TRIGGER insert_calendar_date_hotel
BEFORE INSERT ON hotel_booking
FOR EACH ROW 
BEGIN

    IF NEW.booking_date NOT IN (SELECT cal_date FROM calendar) THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (NEW.booking_date, YEAR(NEW.booking_date), MONTH(NEW.booking_date), DAY(NEW.booking_date), QUARTER(NEW.booking_date));
    END IF;
    
    IF NEW.hotel_start_date NOT IN (SELECT cal_date FROM calendar) THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (NEW.hotel_start_date, YEAR(NEW.hotel_start_date), MONTH(NEW.hotel_start_date), DAY(NEW.hotel_start_date), QUARTER(NEW.hotel_start_date));
    END IF;
    
    IF NEW.hotel_end_date NOT IN (SELECT cal_date FROM calendar) THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (NEW.hotel_start_date, YEAR(NEW.hotel_start_date), MONTH(NEW.hotel_start_date), DAY(NEW.hotel_start_date), QUARTER(NEW.hotel_start_date));
    END IF;


    
END$$


DELIMITER; 

    -- Create a trigger to insert calendar date if not availabe for flight_booking
DELIMITER $$
CREATE TRIGGER insert_calendar_date_flight
BEFORE INSERT ON flight_booking
FOR EACH ROW 
BEGIN

    IF NEW.booking_date NOT IN (SELECT cal_date FROM calendar) THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (NEW.booking_date, YEAR(NEW.booking_date), MONTH(NEW.booking_date), DAY(NEW.booking_date), QUARTER(NEW.booking_date));
    END IF;
    
    IF NEW.flight_start_date NOT IN (SELECT cal_date FROM calendar) THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (NEW.flight_start_date, YEAR(NEW.flight_start_date), MONTH(NEW.flight_start_date), DAY(NEW.flight_start_date), QUARTER(NEW.flight_start_date));
    END IF;
        
END$$
DELIMITER; 

    -- Create a trigger to insert calendar date if not availabe for customer_table
DELIMITER $$
CREATE TRIGGER insert_calendar_date_customer
BEFORE INSERT ON customer_table
FOR EACH ROW 
BEGIN

    IF NEW.cust_birthday NOT IN (SELECT cal_date FROM calendar) THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (NEW.cust_birthday, YEAR(NEW.cust_birthday), MONTH(NEW.cust_birthday), DAY(NEW.cust_birthday), QUARTER(NEW.cust_birthday));
    END IF;

END$$

DELIMITER; 






