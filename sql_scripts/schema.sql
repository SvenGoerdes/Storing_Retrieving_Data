DROP SCHEMA IF EXISTS LSR;
CREATE SCHEMA IF NOT EXISTS LSR;

USE LSR;

CREATE TABLE IF NOT EXISTS country_table (
    country_id varchar(8) NOT NULL,
    country_name varchar(30) NOT NULL,
    PRIMARY KEY (country_id)
);

CREATE TABLE IF NOT EXISTS state_table (
    state_id varchar(8) NOT NULL,
    state_name varchar(30) NOT NULL,
    country_id varchar(8) NOT NULL,
    PRIMARY KEY (state_id),
    FOREIGN KEY (country_id) REFERENCES country_table(country_id)
);

CREATE TABLE IF NOT EXISTS city_table (
    city_id varchar(8) NOT NULL,
    city_name varchar(30) NOT NULL,
    state_id varchar(8) NOT NULL,
    PRIMARY KEY (city_id),
    FOREIGN KEY (state_id) REFERENCES state_table(state_id)
);

CREATE TABLE IF NOT EXISTS zip_table (
  zip_code varchar(5) NOT NULL,
  city_id varchar(8) NOT NULL,
  PRIMARY KEY (zip_code),
  FOREIGN KEY (city_id) REFERENCES city_table(city_id)
);

CREATE TABLE IF NOT EXISTS hotel (
    hotel_id varchar(8) NOT NULL,
    hotel_name varchar(255) NOT NULL,
    city_id varchar(8) NOT NULL,
    rooms_available INT NOT NULL,
    time_stamp varchar(20) NOT NULL,
    PRIMARY KEY (hotel_id),
    FOREIGN KEY (city_id) REFERENCES city_table(city_id)
);

CREATE TABLE IF NOT EXISTS invoice_bookings (
    invoice_id varchar(8),
    booking_id varchar(8) NOT NULL,
    booking_type varchar(8) NOT NULL, 
    PRIMARY KEY (invoice_id, booking_id)
);

CREATE TABLE IF NOT EXISTS calendar (
    cal_date varchar(8) NOT NULL,
    date_year varchar(4) NOT NULL,
    date_month varchar(2) NOT NULL,
    date_day varchar(2) NOT NULL,
    date_quarter varchar(4) NOT NULL,
    PRIMARY KEY (cal_date)
);

CREATE TABLE IF NOT EXISTS hotel_booking (
    invoice_id varchar(8) NOT NULL,
    booking_id varchar(8) NOT NULL,
    booking_date varchar(8) NOT NULL,
    booking_price FLOAT DEFAULT NULL,
    hotel_id varchar(8) NOT NULL,
    hotel_start_date varchar(8) NOT NULL,
    hotel_end_date varchar(8) NOT NULL,
    PRIMARY KEY (booking_id),
    FOREIGN KEY (invoice_id, booking_id) REFERENCES invoice_bookings(invoice_id, booking_id),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id),
    FOREIGN KEY (booking_date) REFERENCES calendar(cal_date),
    FOREIGN KEY (hotel_start_date) REFERENCES calendar(cal_date),
    FOREIGN KEY (hotel_end_date) REFERENCES calendar(cal_date)
);

CREATE TABLE IF NOT EXISTS flight_route (
    route_id varchar(8) NOT NULL,
    fl_startplace varchar(8) NOT NULL,
    fl_endplace varchar(8) NOT NULL,
    PRIMARY KEY (route_id),
    FOREIGN KEY (fl_startplace) REFERENCES city_table(city_id),
    FOREIGN KEY (fl_endplace) REFERENCES city_table(city_id)

);

CREATE TABLE IF NOT EXISTS flight_booking (
    invoice_id varchar(8) NOT NULL,
    booking_id varchar(8) NOT NULL,
    booking_date varchar(8) NOT NULL,
    booking_price FLOAT DEFAULT NULL,
    flight_start_date varchar(8) NOT NULL,
    route_id varchar(8) NOT NULL, 
    PRIMARY KEY (booking_id),
    FOREIGN KEY (invoice_id,booking_id) REFERENCES invoice_bookings(invoice_id,booking_id),
    FOREIGN KEY (route_id) REFERENCES flight_route(route_id),
    FOREIGN KEY (booking_date) REFERENCES calendar(cal_date),
    FOREIGN KEY (flight_start_date) REFERENCES calendar(cal_date)
    
);
-- customer table containing customer information
CREATE TABLE IF NOT EXISTS customer_table(
    cust_id varchar(8) NOT NULL,
    cust_first_name varchar(20) NOT NULL,
    cust_last_name varchar(20) NOT NULL,
    cust_address TEXT NOT NULL,
    cust_zip varchar(5) NOT NULL,
    cust_birthday varchar(8) NOT NULL,
    PRIMARY KEY (cust_id),
    FOREIGN KEY (cust_zip) REFERENCES zip_table(zip_code),
    FOREIGN KEY (cust_birthday) REFERENCES calendar(cal_date)
);

-- log table containing information about booking metadata
CREATE TABLE IF NOT EXISTS booking_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    log_timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    booking_id VARCHAR(50) NOT NULL,
    invoice_id VARCHAR(50) NOT NULL,
    booking_type ENUM('Hotel','Flight') NOT NULL,
    booking_date DATE NOT NULL,
    booking_price DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;


