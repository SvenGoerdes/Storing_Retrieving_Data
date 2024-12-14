import streamlit as st
from datetime import date

# Hardcoded lists for demonstration purposes.
hotels = ["Lisbon Grand Hotel", "Milan Luxury Suites", "Munich Comfort Inn", "Minas Tirith White Tree Hotel"]
flights = ["Lisbon -> Milan (ROUTE001)", "Munich -> Atlantic (ROUTE002)", "Milan -> Munich (ROUTE003)", "Lisbon -> Munich (ROUTE004)"]

st.title("Travel Booking App")

# Step 1: Select booking type
booking_type = st.radio("What would you like to book?", ("Hotel", "Flight"))

# Step 2: Choose from the list of available hotels/flights
if booking_type == "Hotel":
    selection = st.selectbox("Select a hotel:", hotels)
else:
    selection = st.selectbox("Select a flight route:", flights)

# Step 3: Select time duration (start and end dates)
start_date = st.date_input("Start Date", value=date.today())
end_date = st.date_input("End Date", value=date.today())

if end_date < start_date:
    st.error("End date cannot be before start date.")

# Step 4: Name and Surname
name = st.text_input("First Name")
surname = st.text_input("Last Name")

# Step 5: Submit button
if st.button("Book Now"):
    if not name or not surname:
        st.error("Please enter both your first name and last name.")
    elif end_date < start_date:
        st.error("Please select a valid date range.")
    else:
        st.success(f"Thank you {name} {surname}! Your {booking_type.lower()} booking for '{selection}' from {start_date} to {end_date} has been recorded.")