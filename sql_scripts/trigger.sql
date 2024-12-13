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

