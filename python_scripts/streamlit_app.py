import streamlit as st
from datetime import date
import random 

import pandas as pd 
import mysql.connector
from mysql.connector import Error

def rum_mysql_string(sql_query):
    connection = None
    try:
        # Establish a connection to the local MySQL instance
        connection = mysql.connector.connect(
            host='localhost',
            user='root',  # replace with your MySQL username
            password='12345678'  # replace with your MySQL password
        )
        if connection.is_connected():
            print("Successfully connected to MySQL server")
                    # Get a cursor to execute the script
            cursor = connection.cursor()

            cursor.execute(sql_query)
            result = cursor.fetchall()

        connection.commit()
        print("Script executed successfully.")
    except Error as e:
        print(f"Error: '{e}'")

    finally:
        if connection and connection.is_connected():
            if 'cursor' in locals():
                cursor.close()
            connection.close()
            print("MySQL connection is closed")

    return result

def upload_booking_to_db(new_invoice, cust_id, new_booking, booking_type, booking_date, start_date, end_date, booking_price, hotel_route_id):
    connection = None
    try:
        # Establish a connection to the local MySQL instance
        connection = mysql.connector.connect(
            host='localhost',
            user='root',  # replace with your MySQL username
            password='12345678'  # replace with your MySQL password
        )
        if connection.is_connected():
            print("Successfully connected to MySQL server")
                    # Get a cursor to execute the script
            cursor = connection.cursor()

            cursor.execute(f"USE LSR") # use the LSR database

            # Insert  the new booking into the invoice_bookings table
            cursor.execute(f"INSERT INTO invoice_bookings (invoice_id, booking_id, cust_id, booking_type) VALUES ('{new_invoice}', '{new_booking}', '{cust_id}', '{booking_type}')")

            # Insert the new booking into the corresponding table if hotel
            if booking_type == 'Hotel':
                cursor.execute(f"""INSERT INTO hotel_booking (invoice_id, booking_id, booking_date, booking_price, hotel_id, hotel_start_date, hotel_end_date) VALUES
                                ('{new_invoice}', '{new_booking}', '{booking_date}', '{booking_price}', '{hotel_route_id}', '{start_date}', '{end_date}')""")
            
            # Insert the new booking into the corresponding table if flight
            if booking_type == 'Flight':


                # Insert two times for both flights
                cursor.execute(f"""INSERT INTO flight_booking (invoice_id, booking_id, booking_date, booking_price, flight_start_date, route_id) VALUES
                            ('{new_invoice}', '{new_booking}', '{booking_date}', '{booking_price}', '{start_date}', '{hotel_route_id}')""")
                
                cursor.execute(f"""INSERT INTO flight_booking (invoice_id, booking_id, booking_date, booking_price, flight_start_date, route_id) VALUES
                            ('{new_invoice}', '{new_booking}', '{booking_date}', '{booking_price}', '{end_date}', '{hotel_route_id}')""")


        connection.commit()
        print("Script executed successfully.")
    except Error as e:
        print(f"Error: '{e}'")

    finally:
        if connection and connection.is_connected():
            if 'cursor' in locals():
                cursor.close()
            connection.close()
            print("MySQL connection is closed")







hotel_sql = """Select 
                    h.hotel_name,
                    c.city_name,
                    h.hotel_id
                from LSR.hotel as h

                left join LSR.city_table as c 
                    on h.city_id = c.city_id"""

# query the hotels
hotels = rum_mysql_string(hotel_sql)
# hotels = [(hotel[0] + ' in ' + hotel[1]) for hotel in hotels]

# create a dicitonary with (hotel[0] + ' in ' + hotel[1]) as key and hotel_id as value
hotel_id_dict = dict((hotel[0] + ' in ' + hotel[1], hotel[2]) for hotel in hotels)

# select the flight routes from the database with the city names and the route_id
flights_sql = """Select 
                    ctstart.city_name as flight_startplace, 
                    ctend.city_name as flight_endplace,
                    flight_route.route_id
            
                from LSR.flight_route 
                
                left join LSR.city_table as ctstart
                    on flight_route.fl_startplace = ctstart.city_id

                left join LSR.city_table as ctend 
                    on flight_route.fl_startplace = ctend.city_id"""


# query the flights 
flight_touples = rum_mysql_string(flights_sql)
# create a list of strings with the flight routes
flight_routes_list = [(flight[0] + ' --> ' + flight[1] + ' | ' +  flight[2]) for flight in flight_touples]
flight_routes_dict = dict((flight[0] + ' --> ' + flight[1], flight[2]) for flight in flight_touples)




# create me a random pricelist with 20 entries 
price_list = [random.randint(100, 1000) for _ in range(20)]
random_prices_hotel = [random.choice(price_list) for _ in range(len(hotels))]

# crate a dicitonary out of this with the flight_routes_list as keys and the random_prices_hotel as values
random_prices_flight = [random.choice(price_list) for _ in range(len(flight_routes_list))]

# Create a dictionary from the flight_routes_list as keys and random_prices_flight as values
flight_route_price_dict = dict(zip(flight_routes_list, random_prices_flight))

# Hardcoded lists for demonstration purposes.



st.title("Travel Booking App")

# Step 1: Select booking type
booking_type = st.radio("What would you like to book?", ("Hotel", "Flight"))

# Step 2: Choose from the list of available hotels/flights
if booking_type == "Hotel":
    selection = st.selectbox("Select a hotel:", list(hotel_id_dict.keys()))
else:
    selection = st.selectbox("Select a flight route:", flight_routes_list)

# Step 3: Select time duration (start and end dates)
start_date = st.date_input("Start Date", value=date.today())
if start_date < date.today():
    st.error("Start date cannot be in the past.")
end_date = st.date_input("End Date", value=date.today())

if end_date < start_date:
    st.error("End date cannot be before start date.")

# Step 4: Name and Surname
name = st.text_input("First Name")
surname = st.text_input("Last Name")
cust_id = st.text_input("Enter your Customer ID")

if booking_type == "Hotel":

    duration = (end_date - start_date).days
    price = random_prices_hotel[list(hotel_id_dict.keys()).index(selection)] * duration
    st.write(f"Price: {price}")
else:
    st.write(f"Price: {flight_route_price_dict[selection]}")

# Step 5: Submit button
if st.button("Book Now"):
    if not name or not surname:
        st.error("Please enter both your first name and last name.")
    elif end_date < start_date:
        st.error("Please select a valid date range.")
    else:
        


        # transform start_date into YYYYMMDD forat 
        start_date = start_date.strftime("%Y%m%d")
        end_date = end_date.strftime("%Y%m%d")

        # upload the data to the database



        # get highest booking_id from the database and create a new booking_id based on that
        sql_query = "Select max(booking_id) from LSR.invoice_bookings"

        invoice_id = rum_mysql_string(sql_query)[0][0]
        new_booking = 'BOOK' + str(int(invoice_id[4:]) + 1)



        # get highest booking_id from the database and create a new hotel_id based on that
        sql_query = "Select max(invoice_id) from LSR.invoice_bookings"

        invoice_id = rum_mysql_string(sql_query)[0][0]
        new_invoice = 'INV' + str(int(invoice_id[4:]) + 1)

        # get the hotel_id from the hotel_id_dict
        if booking_type == 'Hotel':
            hotel_id = hotel_id_dict[selection]
        if booking_type == 'Flight':
            route_id = flight_routes_dict[selection]



        # def upload_booking_to_db(new_invoice, cust_id, new_booking, booking_type, booking_date, start_date, end_date, booking_price, hotel_id)

        # def upload_booking_to_db(new_invoice, cust_id, new_booking, booking_type, booking_date, start_date, end_date, booking_price, hotel_id):

        if booking_type == 'Hotel':
            upload_booking_to_db(new_invoice, cust_id, new_booking, booking_type, date.today().strftime("%Y%m%d"), start_date, end_date, price, hotel_id)
        else:
            upload_booking_to_db(new_invoice, cust_id, new_booking, booking_type, date.today().strftime("%Y%m%d"), start_date, end_date, price, hotel_id = 'none')

        st.success(f"Thank you {name} {surname}! Your {booking_type.lower()} booking for '{selection}' from {start_date} to {end_date} has been recorded.")