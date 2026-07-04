# total number of rows
SELECT COUNT(*) AS total_rows
FROM bookings;

#1 Retrieve all successful bookings:
Create View  Booking_Status As
SELECT * FROM bookings
WHERE Booking_Status = 'Success';

# 2. Find the average ride distance for each vehicle type:
Create View ride_distance_for_each_vehicle As
SELECT vehicle_type,
AVG(Ride_Distance) AS average_ride_distance
FROM bookings
GROUP BY vehicle_type;

Select * from ride_distance_for_each_vehicle; 

# 3. Get the total number of cancelled rides by customers:
Create View canceled_rides_by_customer As 
SELECT COUNT(*) FROM bookings
WHERE Booking_Status = 'Canceled by Customer';

Select * from canceled_rides_by_customer; 

#4. List the top 5 customers who booked the highest number of rides:
Create View top_5_customers AS
SELECT customer_id, COUNT(*) AS total_rides
FROM bookings
GROUP BY customer_id
ORDER BY total_rides DESC
LIMIT 5;

Select * from top_5_customers;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Canceled_Rides_by_Driver_P_C_issue As 
Select Count(*) From bookings 
Where Canceled_Rides_by_Driver ="Personal & Car related issue";

Select * from Canceled_Rides_by_Driver_P_C_issue;

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Min_Max_Rating AS
SELECT MAX(Driver_Ratings) as max_rating, 
MIN(Driver_Ratings) as min_rating
FROM bookings
WHERE vehicle_type = 'Prime Sedan';

Select * from Min_Max_Rating;

# 7. Retrieve all rides where payment was made using UPI:
Create View UPI_payment as
Select * from bookings
Where Payment_Method ="UPI";

Select * from UPI_payment;

#8. Find the average customer rating per vehicle type:
Create View Avg_cust_Rating AS 
SELECT vehicle_type, AVG(customer_rating) AS average_customer_rating
FROM bookings
GROUP BY vehicle_type;

Select * from  Avg_cust_Rating;

# 9. Calculate the total booking value of rides completed successfully:
Create View Total_successful_ride_value as
SELECT SUM(Booking_Value) AS total_booking_value
FROM bookings
WHERE Booking_Status = 'Success';

Select * from Total_successful_ride_value;

# 10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason as
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';

Select * from Incomplete_Rides_Reason;

SELECT 
    '[' + Booking_Status + ']' AS Status,
    COUNT(*) AS Total
FROM bookings
GROUP BY Booking_Status;
