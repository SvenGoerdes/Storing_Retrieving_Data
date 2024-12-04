 USE LSR;

-- Insert data into country_table
INSERT INTO country_table (country_id, country_name) VALUES
    ('PT000001', 'Portugal'),
    ('IT000001', 'Italy'),
    ('DE000001', 'Germany'),
    ('AT000001', 'Atlantis');  -- Imaginary country

-- Insert data into state_table
INSERT INTO state_table (state_id, state_name, country_id) VALUES
    ('PTST0001', 'Lisbon District', 'PT000001'),
    ('ITST0001', 'Lombardy', 'IT000001'),
    ('DEST0001', 'Bavaria', 'DE000001'),
    ('ATST0001', 'Atlantic Province', 'AT000001');  -- Imaginary state

-- Insert data into city_table
INSERT INTO city_table (city_id, city_name, state_id) VALUES
    ('PTCT0001', 'Lisbon', 'PTST0001'),
    ('ITCT0001', 'Milan', 'ITST0001'),
    ('DECT0001', 'Munich', 'DEST0001'),
    ('ATCT0001', 'Atlantic City', 'ATST0001');  -- Imaginary city

-- Insert data into zip_table
INSERT INTO zip_table (zip_code, city_id) VALUES
    ('10000', 'PTCT0001'),
    ('20000', 'ITCT0001'),
    ('30000', 'DECT0001'),
    ('40000', 'ATCT0001');

-- Insert data into calendar
-- Assuming dates from 20230101 to 20230110
INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter) VALUES
    
    ('19800101', '1980', '01', '01', '1'),
    ('19850202', '1985', '02', '02', '1'),
    ('19900303', '1990', '03', '03', '1'),
    ('19950404', '1995', '04', '04', '1'),
    ('20230101', '2023', '01', '01', '1'),
    ('20230102', '2023', '01', '02', '1'),
    ('20230103', '2023', '01', '03', '1'),
    ('20230104', '2023', '01', '04', '1'),
    ('20230105', '2023', '01', '05', '1'),
    ('20230106', '2023', '01', '06', '1'),
    ('20230107', '2023', '01', '07', '1'),
    ('20230108', '2023', '01', '08', '1'),
    ('20230109', '2023', '01', '09', '1'),
    ('20230110', '2023', '01', '10', '1');
    

-- Insert data into customer_table
INSERT INTO customer_table (cust_id, cust_first_name, cust_last_name, cust_address, cust_zip, cust_birthday) VALUES
    ('CUST0001', 'John', 'Doe', '123 Main St', '10000', '19800101'),
    ('CUST0002', 'Maria', 'Rossi', '456 Elm St', '20000', '19850202'),
    ('CUST0003', 'Hans', 'Schmidt', '789 Oak St', '30000', '19900303'),
    ('CUST0004', 'Alice', 'Wonderland', '101 Ocean Ave', '40000', '19950404');

-- Insert data into hotel
INSERT INTO hotel (hotel_id, hotel_name, city_id) VALUES
    ('HOTEL001', 'Lisbon Grand Hotel', 'PTCT0001'),
    ('HOTEL002', 'Milan Luxury Suites', 'ITCT0001'),
    ('HOTEL003', 'Munich Comfort Inn', 'DECT0001'),
    ('HOTEL004', 'Atlantic Ocean Resort', 'ATCT0001');

-- Insert data into invoice_bookings
INSERT INTO invoice_bookings (invoice_id, booking_id, booking_type) VALUES
    ('INV0001', 'BOOK0001', 'Hotel'),
    ('INV0002', 'BOOK0002', 'Flight'),
    ('INV0003', 'BOOK0003', 'Hotel'),
    ('INV0004', 'BOOK0004', 'Flight');

-- Insert data into hotel_booking
INSERT INTO hotel_booking (invoice_id, booking_id, booking_date, booking_price, hotel_id, hotel_start_date, hotel_end_date) VALUES
    ('INV0001', 'BOOK0001', '20230102', 150.00, 'HOTEL001', '20230103', '20230105'),
    ('INV0003', 'BOOK0003', '20230104', 200.00, 'HOTEL003', '20230105', '20230107');

-- Insert data into flight_route
INSERT INTO flight_route (route_id, fl_startplace, fl_endplace) VALUES
    ('ROUTE001', 'PTCT0001', 'ITCT0001'),
    ('ROUTE002', 'DECT0001', 'ATCT0001');

-- Insert data into flight_booking
INSERT INTO flight_booking (invoice_id, booking_id, booking_date, booking_price, flight_start_date, route_id) VALUES
    ('INV0002', 'BOOK0002', '20230102', 120.50, '20230103', 'ROUTE001'),
    ('INV0004', 'BOOK0004', '20230105', 180.75, '20230106', 'ROUTE002');
