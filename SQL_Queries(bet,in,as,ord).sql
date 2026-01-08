-- create 25 example each  of limit, order by, as , between, in			
select * from customer_retention;

select * from dairyproductentry;

select * from ecommerce_orders;

select * from employeesummary;

select * from food_delivery_order;

select * from library_management;

select * from movie_dataset;

select * from patient_appointment;

select * from subscription_services;

select * from travel_booking;

--------------------------------------------------------------
-- Pagination
select * from travel_booking 
order by booking_id
limit 10 offset 0;
--limit 10 offset 10;
--limit 10 offset 20;
--limit 10 offset 30;
--limit 10 offset 40;
--This will show next page everytime you click on any of query

--------------------------------------------------------------

-- Find employees in 'Data Analyst', 'Data Scientist', or 'Analyst' roles 
--with salaries BETWEEN 40,000 and 60,000. Alias first_name AS employee_name, 
--ORDER BY salary ascending, and LIMIT to 5.
select first_name as employee_name,job_role from employeesummary
where job_role in ('Data Analyst','Data Scientist','Analyst')
and salary between 40000 and 60000
order by salary asc
limit 5;

--List 'Office Manager' or 'Assistant Manager' roles with 
--experience BETWEEN 3.0 and 7.0 years. Alias job_role AS manager_title, 
--ORDER BY experience descending, and LIMIT to 3
select first_name, job_role as manager_title from employeesummary
where job_role in ('Office Manager','Assistant Manager')
and experience between 3 and 7
order by experience desc
limit 3

--List 'Machine Learning Engineer', 'Cloud Engineer', or 'Data Scientist' roles 
--where the salary is BETWEEN 80,000 and 120,000. Alias job_role AS tech_specialty, 
--ORDER BY salary descending, and LIMIT to 4.
select first_name, job_role as tech_specialty from employeesummary 
where job_role in ('Machine Learning Engineer','Cloud Engineer','Data Scientist')
and salary between 80000 and 120000
order by salary desc
limit 4;

--Find movies starring 'Arjun Mehta', 'Ethan Rao', or 'Liam Kapoor' with
--ratings BETWEEN 8.0 and 9.0. Alias movie_title AS top_tier_film,
--ORDER BY rating descending, and LIMIT to 2.
select movie_title as top_tier_film from movie_dataset
where actor_name in ('Arjun Mehta','Ethan Rao','Liam Kapoor')
and rating between 8 and 9
order by rating desc
limit 2;

--Filter for films directed by 'Dev Malhotra', 'Aisha Nair', or 'Sanika Joshi' with 
--ratings BETWEEN 7.0 and 7.8. Alias rating AS audience_score, 
--ORDER BY movie_title ascending, and LIMIT to 5.
select movie_title, rating as audience_score from movie_dataset 
where director_name in ('Dev Malhotra', 'Aisha Nair', 'Sanika Joshi')
and rating between 7 and 7.8
order by movie_title asc
limit 5;

--Look for movies featuring 'Samaira Das' or 'Vivaan Jain' with 
--ratings BETWEEN 8.2 and 8.8. Alias actor_name AS lead_talent, 
--ORDER BY rating descending, and LIMIT to 3.
select actor_name as lead_talent from movie_dataset
where actor_name in ('Samaira Das','Vivaan Jain')
and rating between 8.2 and 8.8
order by rating desc
limit 3

-- count last purchase amount between 500 and 1000 having count as only 1
-- order by customer name desc, limit to 5
select customer_name, last_purchase_amount, count(last_purchase_amount) as purchase_count from customer_retention 
where last_purchase_amount between 500 and 1000
group by customer_name, last_purchase_amount
having count(last_purchase_amount) = 1
order by customer_name desc
limit 5

-- max churn score as churn_sc with join date betwee('2023-01-01' and '2024-01-01')
-- and max churn score between 0.1 and 0.5, order by churn_sc desc and limit to 10
select  customer_id, max(churn_score) as churn_sc from customer_retention
where join_date between  '2023-01-01' and '2024-01-01'
group by customer_id
having max(churn_score) between 0.1 and 0.5
order by churn_sc desc
limit 10

--count milk product within 'Paneer','Lassi','Milk' having product count as greater than 1
--order by count of product desc
select gender, product, count(product) as product_count from dairyproductentry
where product in ('Paneer','Lassi','Milk')
group by gender, product
having count(product) >1
order by count(product) desc;

--Retrieve 'Laptop', 'Smartphone', or 'Monitor' orders with amounts BETWEEN 10,000 and 55,000.
--Alias amount AS order_value, ORDER BY amount descending, and LIMIT to 5.
select product_name as order_value, amount from ecommerce_orders 
where product_name in ('Laptop', 'Smartphone', 'Monitor')and amount between 10000 and 55000
order by amount desc
limit 5;

--Search for 'Mouse', 'Keyboard', or 'Charger' orders with quantities BETWEEN 1 and 3. 
--Alias quantity AS units_sold, ORDER BY order_date ascending, and LIMIT to 6.
select  product_name, order_date, quantity as units_sold from ecommerce_orders
where product_name in ('Mouse','Keyboard','Charger') and 
quantity between 1 and 3
order by order_date asc
limit 6;

--Identify orders from 'Aarav', 'Ishika', or 'Vihaan' with amounts BETWEEN 500 and 10,000. 
--Alias customer_name AS shopper, ORDER BY amount ascending, and LIMIT to 4.
select customer_name as shopper, product_name,amount from ecommerce_orders
where customer_name in('Aarav', 'Ishika', 'Vihaan') and amount between 500 and 10000
order by amount asc
limit 4;

--Find 'Scheduled' appointments for patients BETWEEN 20 and 35 years old assigned
--to 'Dr. Sharma' or 'Dr. Patel'. Alias age AS patient_age, ORDER BY age ascending,
--and LIMIT to 5.
select * from patient_appointment;
select patient_name, age as patient_age,status from patient_appointment
where status = 'Scheduled' and
age between 20 and 35 and 
doctor_assigned in ('Dr. Sharma' , 'Dr. Patel')
order by age asc
limit 5;

--Find active customers with purchase amounts BETWEEN 600 and 1300 who
--joined IN ('2022-05-09', '2023-03-20', '2023-03-29'). 
--Alias last_purchase_amount AS recent_spend, ORDER BY join_date ascending, and LIMIT to 5.
select customer_id, customer_name, last_purchase_amount as recent_spend from customer_retention
where last_purchase_amount between 600 and 1300 and
join_date in('2022-05-09', '2023-03-20', '2023-03-29')
order by join_date asc
limit 5
;


--Find customers with churn scores BETWEEN 0.1 and 0.3 with names like 'Ishaan', 'Aadi', or 'Omkar'.
--Alias customer_name AS loyal_customer, ORDER BY customer_id descending, and LIMIT to 3.
select customer_name as loyal_customer, churn_score from customer_retention
where churn_score between 0.1 and 0.3
and customer_name like 'Ishaan%'or
customer_name like 'Aadi%' or
customer_name like 'Omkar%'
order by customer_id desc
;

--Find 'Delivered' orders from 'SpiceHub' or 'Burger House' with totals BETWEEN 150 and 500.
--Alias restaurant_name AS partner_eatery, ORDER BY total_amount descending, and LIMIT to 5.
select customer_name, restaurant_name as partner_eatery, total_amount, order_status from food_delivery_order
where order_status = 'Delivered' and
total_amount between 150 and 500
order by total_amount desc
limit 5;


--Dining Preferences: List 'Pending' orders for 'Sara', 'Anaya', or 'Arjun' with 
--totals BETWEEN 100 and 450. Alias customer_name AS patron, ORDER BY order_time ascending, 
--and LIMIT to 4.
select customer_name as patron,total_amount, order_status from food_delivery_order
where total_amount between 100 and 450
order by order_time asc
limit 4;


--Dairy Inventory: In dairy_product, find 'Male' customers buying 'Paneer', 'Cheese', or 'Milk' 
--with quantities BETWEEN 2 and 4. Alias product AS dairy_item, ORDER BY quantity descending,
--and LIMIT to 10.
select gender, product as dairy_item from dairyproductentry
where product in ('Paneer','Cheese','Milk','Yogurt')
and quantity between 2 and 4
order by quantity desc
limit 10;


--Sweet Treat Demand: List customers buying 'Rasgulla' or 'Rasmalai' 
--with quantities BETWEEN 3 and 6. Alias quantity AS volume, ORDER BY last_name ascending,
--and LIMIT to 5.
select first_name,product, quantity as volume from dairyproductentry
where product in ('Rasgulla','Rasmalai') and 
quantity between 3 and 6
order by last_name asc
limit 5;


--Book Loan Tracking: Find books with IDs BETWEEN 1 and 30 loaned to members IN (201, 205, 209).
--Alias book_title AS inventory_title, ORDER BY loan_date ascending, and LIMIT to 5.
select book_id, book_title as inventory_title from library_management
where book_id between 1 and 30
and member_id in(201,205,209)
order by loan_date asc
limit 5;


--Literary Search: Search for books by 'Aarav Mehta', 'Kabir Shah', or 'Riya Kapoor' 
--with IDs BETWEEN 1 and 15. Alias author_name AS novelist, ORDER BY book_id descending,
--and LIMIT to 3.
select book_id,author_name as novelist from library_management
where author_name in ('Aarav Mehta', 'Kabir Shah', 'Riya Kapoor')and
book_id between 1 and 15
order by book_id desc
limit 3;


--Unreturned Assets: Identify books not yet returned (is_returned = False) loaned 
--BETWEEN '2023-01-01' and '2023-03-31' for authors IN ('Aanya Patel', 'Ishaan Khurana'). 
--Alias loan_date AS checkout_date, ORDER BY loan_date ascending, and LIMIT to 2.
select book_id, book_title, loan_date as checkout_date, is_returned from library_management where 
is_returned = 'False' and loan_date between '2023-01-01' and '2023-03-31' and
author_name in ('Aanya Patel','Ishaan Khurana')
order by loan_date asc 
limit 2;


--Subscriptions & Revenue (File: subscription_servi)
--Premium Tier Review: Find 'Premium' or 'Standard' users with monthly fees BETWEEN 299 and 499. 
--Alias user_name AS account_holder, ORDER BY monthly_fee descending, and LIMIT to 5.
select user_name as account_holder, plan, monthly_fee from subscription_services
where monthly_fee between 299 and 499 and
plan in ('Premium','Standard') 
order by monthly_fee desc
limit 5;


--Growth Analysis: Search for 'Basic' active users who started BETWEEN '2024-01-01' and '2024-04-01'.
--Alias plan AS service_level, ORDER BY start_date ascending, and LIMIT to 10.
select id,plan as service_level from subscription_services
where plan = 'Basic' and 
start_date between '2024-01-01' and '2024-04-01'
order by start_date asc
limit 10;


--Subscriber Revenue: Find subscribers IN ('Meera Nair', 'Anaya Verma', 'Rhea Kapoor') 
--with fees BETWEEN 400 and 600. Alias monthly_fee AS revenue_per_user, 
--ORDER BY user_name ascending, and LIMIT to 3.
select user_name, monthly_fee as revenue_per_user from subscription_services
where user_name in('Meera Nair', 'Anaya Verma', 'Rhea Kapoor') and 
monthly_fee between 400 and 600
order by user_name asc
limit 3;