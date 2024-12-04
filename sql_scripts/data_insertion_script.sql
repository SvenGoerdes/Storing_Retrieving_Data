 USE LSR;

-- Insert data into country_table
INSERT INTO country_table (country_id, country_name) VALUES
    ('PT000001', 'Portugal'),
    ('IT000001', 'Italy'),
    ('DE000001', 'Germany'),
    ('ME000001', 'Middle-earth'),  -- Fictional country
    ('AT000001', 'Atlantis');  -- Imaginary country

-- Insert data into state_table
INSERT INTO state_table (state_id, state_name, country_id) VALUES
    ('PTST0001', 'Lisbon District', 'PT000001'),
    ('ITST0001', 'Lombardy', 'IT000001'),
    ('DEST0001', 'Bavaria', 'DE000001'),
    ('MEST0002', 'Rohan', 'ME000001'),  -- Fictional state
    ('MEST0001', 'Gondor', 'ME000001'),  -- Fictional state
    ('ATST0001', 'Atlantic Province', 'AT000001');  -- Imaginary state

-- Insert data into city_table
INSERT INTO city_table (city_id, city_name, state_id) VALUES
    ('PTCT0001', 'Lisbon', 'PTST0001'),
    ('ITCT0001', 'Milan', 'ITST0001'),
    ('DECT0001', 'Munich', 'DEST0001'),
    ('ATCT0001', 'Atlantic City', 'ATST0001'),  -- Imaginary city
    ('MECT0001', 'Minas Tirith', 'MEST0001'),  -- Fictional city
    ('MECT0002', 'Edoras', 'MEST0002'),  -- Edoras Fictional city
    ('MECT0003', 'Helms Deep', 'MEST0002'),  -- Helms Deep, Fictional city
    ('MECT0004', 'Hobbiton', 'MEST0001'),  -- Bag End, fictional city
    ('MECT0005', 'Lonely Mountain', 'MEST0001'),  -- Lonely Mountain, fictional city
    ('MECT0006', 'Mirkwood', 'MEST0001'),  -- Mirkwood Woods, fictional city
    ('MECT0007', 'Orthanc', 'MEST0001'),  -- Orthanc Tower, fictional city
    ('MECT0008', 'Ithilien', 'MEST0001'),  -- Ithilien Outpost, fictional city
    ('MECT0009', 'Lothlórien', 'MEST0001'),  -- Lothlórien Forest, fictional city
    ('MECT0010', 'Rivendell', 'MEST0001'),  -- Rivendell Valley, fictional city
    ('MECT0011', 'Isengard', 'MEST0001'),  -- Isengard Tower, fictional city
    ('MECT0012', 'Rhosgobel', 'MEST0001'),  -- Rhosgobel, Mirkwood, fictional city
    ('MECT0013', 'Meduseld', 'MEST0002'),  -- Meduseld, Edoras, fictional city
    ('MECT0014', 'Dale', 'MEST0001'),  -- Dale Town, fictional city
    ('MECT0015', 'Misty Mountains', 'MEST0001'),  -- Misty Mountains Cave, fictional city
    ('MECT0016', 'Iron Hills', 'MEST0001');  -- Iron Hills, fictional city

-- Insert data into zip_table
INSERT INTO zip_table (zip_code, city_id) VALUES
    ('10000', 'PTCT0001'),
    ('20000', 'ITCT0001'),
    ('30000', 'DECT0001'),
    ('40000', 'ATCT0001'),
    ('50000', 'MECT0001'),  -- Minas Tirith
    ('70000', 'MECT0003'),  -- Helm's Deep
    ('80000', 'MECT0001'),  -- Bag End, Hobbiton
    ('80001', 'MECT0001'),  -- Bagshot Row, Hobbiton
    ('90000', 'MECT0001'),  -- Lonely Mountain
    ('90001', 'MECT0002'),  -- Mirkwood Woods
    ('90002', 'MECT0001'),  -- Orthanc Tower
    ('50001', 'MECT0001'),  -- Minas Tirith Citadel
    ('50002', 'MECT0001'),  -- Ithilien Outpost
    ('90003', 'MECT0001'),  -- Erebor Mountain
    ('90004', 'MECT0002'),  -- Lothlórien Forest
    ('90005', 'MECT0002'),  -- Rivendell Valley
    ('90006', 'MECT0002'),  -- Rivendell Manor
    ('90007', 'MECT0002'),  -- Isengard Tower
    ('90008', 'MECT0002'),  -- Rhosgobel, Mirkwood
    ('70001', 'MECT0003'),  -- Meduseld, Edoras
    ('70002', 'MECT0003'),  -- Edoras Stables
    ('90009', 'MECT0002'),  -- Rivendell Woods
    ('90010', 'MECT0002'),  -- Lothlórien Grove
    ('90011', 'MECT0001'),  -- Dale Town
    ('90012', 'MECT0002'),  -- Mirkwood Palace
    ('90013', 'MECT0003'),  -- Misty Mountains Cave
    ('90014', 'MECT0002'),  -- Lothlórien Border
    ('90015', 'MECT0001'),  -- Lonely Mountain Chamber
    ('90016', 'MECT0002');  -- Iron Hills

-- Insert data into calendar
-- Assuming dates from 20230101 to 20230110
-- Insert data into calendar
INSERT INTO calendar (cal_date, date_year, date_month, date_day, date_quarter) VALUES
    ('19720301', '1972', '03', '01', '1'),
    ('19800101', '1980', '01', '01', '1'),
    ('19850202', '1985', '02', '02', '1'),
    ('19800715', '1980', '07', '15', '3'),
    ('19900303', '1990', '03', '03', '1'),
    ('19950404', '1995', '04', '04', '1'),
    ('19680922', '1968', '09', '22', '3'),
    ('19690406', '1969', '04', '06', '2'),
    ('19700220', '1970', '02', '20', '1'),
    ('19611015', '1961', '10', '15', '4'),
    ('19500101', '1950', '01', '01', '1'),
    ('19710912', '1971', '09', '12', '3'),
    ('19730715', '1973', '07', '15', '3'),
    ('19591023', '1959', '10', '23', '4'),
    ('19310922', '1931', '09', '22', '3'),
    ('19120614', '1912', '06', '14', '2'),
    ('19051120', '1905', '11', '20', '4'),
    ('19780812', '1978', '08', '12', '3'),
    ('19400212', '1940', '02', '12', '1'),
    ('19451010', '1945', '10', '10', '4'),
    ('19601101', '1960', '11', '01', '4'),
    ('19710610', '1971', '06', '10', '2'),
    ('19010915', '1901', '09', '15', '3'),
    ('19030518', '1903', '05', '18', '2'),
    ('19740304', '1974', '03', '04', '1'),
    ('19060921', '1906', '09', '21', '3'),
    ('19431122', '1943', '11', '22', '4'),
    ('19641109', '1964', '11', '09', '4'),
    ('19571119', '1957', '11', '19', '4'),
    ('19530923', '1953', '09', '23', '3'),
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
    ('CUST0004', 'Alice', 'Wonderland', '101 Ocean Ave', '40000', '19950404'),
    ('CUST0005', 'Aragorn', 'Son of Arathorn', 'Minas Tirith Street', '50000', '19720301'),
    ('CUST0006', 'Eowyn', 'Shieldmaiden', 'Helms Deep Fortress', '70000', '19800715'),
    ('CUST0007', 'Frodo', 'Baggins', 'Bag End, Hobbiton', '80000', '19680922'),
    ('CUST0008', 'Samwise', 'Gamgee', '3 Bagshot Row, Hobbiton', '80001', '19690406'),
    ('CUST0009', 'Gimli', 'Son of Gloin', 'Lonely Mountain Street', '90000', '19700220'),
    ('CUST0010', 'Legolas', 'Greenleaf', 'Mirkwood Woods', '90001', '19611015'),
    ('CUST0011', 'Gandalf', 'The Grey', 'Orthanc Tower', '90002', '19500101'),
    ('CUST0012', 'Boromir', 'Son of Denethor', 'Minas Tirith Citadel', '50001', '19710912'),
    ('CUST0013', 'Faramir', 'Captain of Gondor', 'Ithilien Outpost', '50002', '19730715'),
    ('CUST0014', 'Thorin', 'Oakenshield', 'Erebor Mountain', '90003', '19591023'),
    ('CUST0015', 'Bilbo', 'Baggins', 'Bag End, Hobbiton', '80000', '19310922'),
    ('CUST0016', 'Galadriel', 'Lady of Light', 'Lothlórien Forest', '90004', '19120614'),
    ('CUST0017', 'Elrond', 'Half-elven', 'Rivendell Valley', '90005', '19051120'),
    ('CUST0018', 'Arwen', 'Undómiel', 'Rivendell Manor', '90006', '19780812'),
    ('CUST0019', 'Saruman', 'The White', 'Isengard Tower', '90007', '19400212'),
    ('CUST0020', 'Radagast', 'The Brown', 'Rhosgobel, Mirkwood', '90008', '19451010'),
    ('CUST0021', 'Théoden', 'King of Rohan', 'Meduseld, Edoras', '70001', '19601101'),
    ('CUST0022', 'Éomer', 'Marshal of the Mark', 'Edoras Stables', '70002', '19710610'),
    ('CUST0023', 'Glorfindel', 'Elf Lord', 'Rivendell Woods', '90009', '19010915'),
    ('CUST0024', 'Celeborn', 'Lord of Lothlórien', 'Lothlórien Grove', '90010', '19030518'),
    ('CUST0025', 'Bard', 'The Bowman', 'Dale Town', '90011', '19740304'),
    ('CUST0026', 'Thranduil', 'King of Mirkwood', 'Mirkwood Palace', '90012', '19060921'),
    ('CUST0027', 'Gollum', 'Smeagol', 'Misty Mountains Cave', '90013', '19431122'),
    ('CUST0028', 'Haldir', 'Warden of Lothlórien', 'Lothlórien Border', '90014', '19641109'),
    ('CUST0029', 'Balin', 'Dwarf of Erebor', 'Lonely Mountain Chamber', '90015', '19571119'),
    ('CUST0030', 'Dáin', 'Ironfoot', 'Iron Hills', '90016', '19530923');

    

-- Insert data into hotel
INSERT INTO hotel (hotel_id, hotel_name, city_id) VALUES
    ('HOTEL001', 'Lisbon Grand Hotel', 'PTCT0001'),
    ('HOTEL002', 'Milan Luxury Suites', 'ITCT0001'),
    ('HOTEL003', 'Munich Comfort Inn', 'DECT0001'),
    ('HOTEL004', 'Atlantic Ocean Resort', 'ATCT0001'),
    ('HOTEL005', 'Minas Tirith White Tree Hotel', 'MECT0001'),  -- Minas Tirith
    ('HOTEL006', 'Helms Deep Rock Lodge', 'MECT0003'),  -- Helm's Deep
    ('HOTEL007', 'Hobbiton Shire Resthouse', 'MECT0004'),  -- Hobbiton
    ('HOTEL008', 'Lonely Mountain Treasure Inn', 'MECT0005'),  -- Lonely Mountain
    ('HOTEL009', 'Mirkwood Elven Suites', 'MECT0006'),  -- Mirkwood
    ('HOTEL010', 'Orthanc Tower Stay', 'MECT0007'),  -- Orthanc
    ('HOTEL011', 'Ithilien Forest Retreat', 'MECT0008'),  -- Ithilien
    ('HOTEL012', 'Lothlórien Golden Leaf Lodge', 'MECT0009'),  -- Lothlórien
    ('HOTEL013', 'Rivendell Valley Resort', 'MECT0010'),  -- Rivendell
    ('HOTEL014', 'Isengard White Tower Hotel', 'MECT0011'),  -- Isengard
    ('HOTEL015', 'Rhosgobel Woodland Inn', 'MECT0012'),  -- Rhosgobel
    ('HOTEL016', 'Meduseld Golden Hall Lodge', 'MECT0013'),  -- Meduseld
    ('HOTEL017', 'Dale Town Riverside Stay', 'MECT0014'),  -- Dale
    ('HOTEL018', 'Misty Mountains Cave Lodge', 'MECT0015'),  -- Misty Mountains
    ('HOTEL019', 'Iron Hills Dwarven Inn', 'MECT0016');  -- Iron Hills
    
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
