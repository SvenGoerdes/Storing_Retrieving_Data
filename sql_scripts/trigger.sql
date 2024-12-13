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

