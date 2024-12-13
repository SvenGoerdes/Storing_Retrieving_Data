-- check 
DELIMITER $$

CREATE TRIGGER update_flight_booking
AFTER UPDATE ON flight_booking
FOR EACH ROW
BEGIN
    -- Check if the `booking_date` does not exist in the `calendar` table
    IF NOT EXISTS (
        SELECT 1 FROM calendar WHERE calendar.cal_date = NEW.booking_date 
    ) THEN
        -- Insert the row into the `calendar` table if the `cal_date` does not exist
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (
            NEW.booking_date,
            YEAR(NEW.booking_date),
            MONTH(NEW.booking_date),
            DAY(NEW.booking_date),
            QUARTER(NEW.booking_date)
        );
    END IF;
    IF NOT EXISTS (SELECT 1 FROM calendar WHERE cal_date = NEW.flight_start_date) THEN
        INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter)
        VALUES (
            NEW.flight_start_date,
            YEAR(NEW.flight_start_date),
            MONTH(NEW.flight_start_date),
            DAY(NEW.flight_start_date),
            QUARTER(NEW.flight_start_date)
        );
    END IF;
    
END$$

DELIMITER ;


-- dont have 3. nov im calendar 
-- Trigger gets activated 