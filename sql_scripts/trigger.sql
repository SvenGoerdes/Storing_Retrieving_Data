-- check 
CREATE TRIGGER 
AFTER UPDATE ON flight_booking
FOR EACH ROW
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM calendar WHERE calendar.cal_date = :NEW.cal_date
    ) THEN
        -- Insert the row into new_table if the ID does not exist
        INSERT INTO calendar (cal_date, date_year, date_month,date_quarter)
        VALUES (:NEW.cal_date, YEAR(:NEW.cal_date), MONTH(:NEW.cal_date),DAY(:NEW.cal_date),QUARTER(:NEW.cal_date));
    END IF;
END;


-- dont have 3. nov im calendar 
-- Trigger gets activated 