-- create dataset

create database magicmade;

  
-- create table 

CREATE TABLE updated_abandonment_dataset (
  User_ID text,
  User_Location text,
  Gender text,
  Cart_Contents text,
  Cart_Value double DEFAULT NULL,
  Session_Date date,
  Session_Duration int DEFAULT NULL,
  Abandonment_Reason text,
  Purchase_Category text,
  Referral_Medium text,
  Device_Type  text,
  Cart_Status text
) ;


-- load data 

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 9.1\\Uploads\\updated_abandonment_dataset.csv'
INTO TABLE updated_abandonment_dataset
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- (A) EDA - Exploratory Data Analysis




/*  Data Cleaning  */

-- count row

select count(*)
from updated_abandonment_dataset; 

-- Check the Structure of the Table
DESCRIBE updated_abandonment_dataset;

-- Check for Missing Values
SELECT 
    SUM(CASE WHEN User_ID IS NULL THEN 1 ELSE 0 END) AS missing_user_id,
    SUM(CASE WHEN User_Location IS NULL THEN 1 ELSE 0 END) AS missing_user_location,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS missing_gender,
    SUM(CASE WHEN Cart_Contents IS NULL THEN 1 ELSE 0 END) AS missing_cart_contents,
    SUM(CASE WHEN Cart_Value IS NULL THEN 1 ELSE 0 END) AS missing_cart_value,
    SUM(CASE WHEN Session_Date IS NULL THEN 1 ELSE 0 END) AS missing_session_date,
    SUM(CASE WHEN Session_Duration IS NULL THEN 1 ELSE 0 END) AS missing_session_duration,
    SUM(CASE WHEN Abandonment_Reason IS NULL THEN 1 ELSE 0 END) AS missing_abandonment_reason,
    SUM(CASE WHEN Purchase_Category IS NULL THEN 1 ELSE 0 END) AS missing_purchase_category,
    SUM(CASE WHEN Referral_Medium IS NULL THEN 1 ELSE 0 END) AS missing_referral_medium,
    SUM(CASE WHEN Device_Type IS NULL THEN 1 ELSE 0 END) AS missing_device_type,
    SUM(CASE WHEN Cart_Status IS NULL THEN 1 ELSE 0 END) AS missing_cart_status
FROM updated_abandonment_dataset;




/* Location Distribution  */


-- Count Unique Users

SELECT COUNT(DISTINCT User_ID) AS unique_users FROM updated_abandonment_dataset;


-- Count Unique Locations(This helps in understanding where most customer are from)

SELECT User_Location, COUNT(*) AS num_users
FROM updated_abandonment_dataset
GROUP BY User_Location
ORDER BY num_users DESC;

--  State-wise cart Abandonment customer
SELECT 
    User_Location AS State, 
    COUNT(*) AS Abandoned_Users
FROM updated_abandonment_dataset
WHERE Cart_Status = 'Abandoned'
GROUP BY User_Location
ORDER BY Abandoned_Users DESC;

--  State-wise  cart paid  Users

SELECT 
    User_Location AS State, 
    COUNT(*) AS Paid_Users
FROM updated_abandonment_dataset
WHERE Cart_Status = 'Paid'
GROUP BY User_Location
ORDER BY Paid_Users DESC;

 

/* Gender Distribution */


-- no.and percentage of male & female 
SELECT 
    Gender, 
    COUNT(*) AS User_Count, 
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM updated_abandonment_dataset), 2) AS Percentage
FROM updated_abandonment_dataset
GROUP BY Gender;

-- Gender wise  number of card Abandonment user & rate also

select Gender,count(*) as Abandonment_user, 
round (100*count(*)/(select count(*) from updated_abandonment_dataset where  Cart_Status="Abandoned")  , 2 )as percenatage_Abandonment
from updated_abandonment_dataset
where Cart_Status="Abandoned"
group by Gender;


--  Most Common Abandonment Reasons

SELECT Abandonment_Reason, COUNT(*) AS frequency
FROM updated_abandonment_dataset
WHERE Abandonment_Reason IS NOT NULL AND Abandonment_Reason <> '' and Cart_Status="Abandoned"
GROUP BY Abandonment_Reason
ORDER BY frequency DESC;


-- device wise users data Analysis

SELECT Device_Type, COUNT(*) AS count
FROM updated_abandonment_dataset
GROUP BY Device_Type
ORDER BY count DESC;

-- Which device  seen heighest number of Abandonment Users 

select  Device_Type,count(*) Abandoned_device_users
from updated_abandonment_dataset
where Cart_Status="Abandoned"
group by Device_Type
 order by Abandoned_device_users desc;

-- devices and Abandoment Reasons 

select  Abandonment_Reason, Device_Type , count(*) as Count_Devices_wise_Abandonment_Reason
from updated_abandonment_dataset
where Abandonment_Reason is not null and  Abandonment_Reason <> ''  and  Cart_Status="Abandoned" -- no space between this two comma
group by Abandonment_Reason,Device_Type
order by Device_Type,Count_Devices_wise_Abandonment_Reason desc;


--  Average, Minimum, and Maximum Abandoned Cart Value (USD)


SELECT 
    AVG(Cart_Value) AS Average_Abandoned_Cart_Value,
    MIN(Cart_Value) AS Minimum_Abandoned_Cart_Value,
    MAX(Cart_Value) AS Maximum_Abandoned_Cart_Value
FROM updated_abandonment_dataset
WHERE Cart_Status = 'Abandoned';  



-- total number of abandoned users whose cart value is above the average abandoned cart value

select count( distinct User_ID) as Total_Abandoned_Users_Above_Avg
from updated_abandonment_dataset
where Cart_Value > (
select avg(Cart_Value) 
from  updated_abandonment_dataset
where Cart_Status="Abandoned")  and  Cart_Status="Abandoned";
 
 
 -- total number of abandoned users whose cart value is below  the average abandoned cart value
 
 select count( distinct User_ID) as Total_Abandoned_Users_Above_Avg
from updated_abandonment_dataset
where Cart_Value < (
select avg(Cart_Value) 
from  updated_abandonment_dataset
where Cart_Status="Abandoned")  and  Cart_Status="Abandoned";
 
 
 
 -- Cart Status Distribution

SELECT Cart_Status, COUNT(*) AS count 
FROM updated_abandonment_dataset 
GROUP BY Cart_Status;


-- Average , min , max  Session Duration  (min)

SELECT 
   round( AVG(Session_Duration) , 2) AS avg_duration,
    MIN(Session_Duration) AS min_duration,
    MAX(Session_Duration) AS max_duration
FROM updated_abandonment_dataset;




--  Avg Session Duration vs Cart Abandonment (This helps determine if users with shorter or longer sessions abandon their carts more frequently.)

/*  Meaning of SessionDuration in Cart Abandonment Analysis
SessionDuration refers to the total time a user spends on a website during a single visit.
It is typically measured in seconds or minutes.
Longer session durations may indicate engagement, while very short durations may suggest frustration or quick exits.
Session Duration vs. Cart Abandonment
If SessionDuration is too short, users may be abandoning due to issues like slow load times, lack of interest, or confusion.
If SessionDuration is long but still results in abandonment, users may be hesitant, comparing options, or facing unexpected costs at checkout.
Analyzing session duration in relation to abandonment reasons helps identify friction points in the buying process.*/

SELECT 
    Cart_Status, 
    AVG(Session_Duration) AS avg_duration
FROM updated_abandonment_dataset
GROUP BY Cart_Status;


/*  Session Date:  likely refers to the specific date when a user visited the website or interacted with the shopping platform. */

-- most Common  (Top-10 ) Session Days 

SELECT 
    Session_Date AS shopping_day,
    COUNT(*) AS session_count  
FROM updated_abandonment_dataset  
GROUP BY shopping_day
ORDER BY session_count desc limit 10;

--  Month wise Session days count

SELECT 
    MONTH(Session_Date) AS shopping_month,  
    COUNT(*) AS session_day_count  
FROM updated_abandonment_dataset  
GROUP BY  shopping_month  
ORDER BY session_day_count desc ;

--  daily Cart Abandonment trend

SELECT 
    DATE(Session_Date) AS session_day,
    COUNT(*) AS cart_count  
FROM updated_abandonment_dataset  
where Cart_Status="Abandoned"
GROUP BY session_day, Cart_Status  
ORDER BY session_day ASC;


-- monthly cart abandonment trend 
SELECT 
    month(Session_Date) AS session_month,
    COUNT(*) AS Abandoned_cart_count 
FROM updated_abandonment_dataset  
where Cart_Status="Abandoned"
GROUP BY session_month, Cart_Status  
ORDER BY Abandoned_cart_count desc;


-- monthly cart  paid And Abandoned rate 

SELECT 
    month(Session_Date) AS month,
    sum(CASE WHEN Cart_Status = 'Abandoned' THEN 1 END) AS abandoned_carts,
    sum(CASE WHEN Cart_Status = 'Paid' THEN 1 END) AS paid_carts,
    (sum(CASE WHEN Cart_Status = 'Abandoned' THEN 1 END) * 100.0 / COUNT(*)) AS abandonment_rate,
    (sum(CASE WHEN Cart_Status = 'Paid' THEN 1 END) * 100.0 / COUNT(*)) AS Paid_rate
FROM updated_abandonment_dataset  
GROUP BY month
ORDER BY abandonment_rate desc;


-- Correlation Between Cart Value and Abandonment
 SELECT 
    Cart_Status, 
   round( AVG(Cart_Value),2) AS avg_cart_value
FROM updated_abandonment_dataset
GROUP BY Cart_Status;


-- Top Referral Mediums

select Referral_Medium, COUNT(*) AS count
FROM updated_abandonment_dataset
GROUP BY Referral_Medium
ORDER BY count DESC;


-- Which Referral medium seen heighest number of Abandonment Users 

select  Referral_Medium,count(*) as Abandoned_user
from updated_abandonment_dataset
where Cart_Status="Abandoned"
group by Referral_Medium
order by Abandoned_user desc;

-- purchase category wise Total users analysis

select Purchase_Category, count(*) as Total_users
from updated_abandonment_dataset
group by Purchase_Category
order by  Total_users desc;

-- purchase category And  Total cart value ($)

select Purchase_Category, round(sum(Cart_Value) ,2)as total_cart_value
from updated_abandonment_dataset
group by Purchase_Category
order by  total_cart_value desc;


-- purchase category wise Abandonded users

select Purchase_Category, count(*) as Abandoned_users
from updated_abandonment_dataset
where Cart_Status="Abandoned" 
group by Purchase_Category
order by  Abandoned_users desc;

--  purchase category wise Abandoned cart value ($)

select Purchase_Category, round(sum(Cart_Value) ,2)as Abandoned_cart_value
from updated_abandonment_dataset
where Cart_Status="Abandoned"
group by Purchase_Category
order by  Abandoned_cart_value desc;

-- purchase category wise paid users

select Purchase_Category, count(*) as Paid_users
from updated_abandonment_dataset
where Cart_Status="Paid" 
group by Purchase_Category
order by  Paid_users desc;


-- purcahse category wise paid cart value($)

select Purchase_Category, round(sum(Cart_Value) ,2)as paid_cart_value
from updated_abandonment_dataset
where Cart_Status="Paid"
group by Purchase_Category
order by  paid_cart_value desc;


--  users cart content  analysis

select Cart_Contents , count(*) as total_users
from updated_abandonment_dataset
group by Cart_Contents
order by total_users desc ;

-- most abadoned cart content category

select Cart_Contents , count(*) as abandoned_cart
from updated_abandonment_dataset
where Cart_Status="Abandoned"
group by Cart_Contents
order by abandoned_cart desc;

-- most abandoned content categories cart value

SELECT Cart_Contents, ROUND(SUM(Cart_Value), 2) AS total_abandoned_cart_value
FROM updated_abandonment_dataset
WHERE Cart_Status = "Abandoned"
GROUP BY Cart_Contents
ORDER BY total_abandoned_cart_value DESC;


-- purchase category wise Abandonment Reason

SELECT 
    Purchase_Category, 
    Abandonment_Reason, 
    COUNT(*) AS abandonment_count
FROM updated_abandonment_dataset
WHERE Cart_Status = "Abandoned"  and Abandonment_Reason <> ''
GROUP BY Purchase_Category, Abandonment_Reason
ORDER BY Purchase_Category,abandonment_count DESC;

--  purchase category wise main abandonment reason affect most 

with cte as (
SELECT 
    Purchase_Category, 
    Abandonment_Reason, 
    COUNT(*) AS abandonment_count,rank()over(partition by Purchase_Category order by COUNT(*) desc) as rank_
FROM updated_abandonment_dataset
WHERE Cart_Status = "Abandoned"  and Abandonment_Reason <> ''
GROUP BY Purchase_Category, Abandonment_Reason)

select Purchase_Category,Abandonment_Reason
from cte
where rank_=1;

-- cart contents wise abandonment reason

SELECT 
    Cart_Contents, 
    Abandonment_Reason, 
    COUNT(*) AS abandonment_count 
FROM updated_abandonment_dataset
WHERE Cart_Status = "Abandoned"  and Abandonment_Reason <> ''
GROUP BY Cart_Contents, Abandonment_Reason
ORDER BY Cart_Contents,abandonment_count DESC;


-- cart contents wise main abandonment reason affect most 

with cte as (SELECT Cart_Contents, Abandonment_Reason, COUNT(*) AS abandonment_count ,
rank()over(partition by Cart_Contents order by COUNT(*)  desc) as rank_
FROM updated_abandonment_dataset
WHERE Cart_Status = "Abandoned"  and Abandonment_Reason <> ''
GROUP BY Cart_Contents, Abandonment_Reason
ORDER BY Cart_Contents,abandonment_count DESC)

select Cart_Contents,Abandonment_Reason
from cte
where rank_=1;


--   (B) usiness Overview/Problem  :



--  Total Potential Revenue Lost Due to Abandonment

SELECT 
    SUM(Cart_Value) AS potential_revenue_lost
FROM updated_abandonment_dataset
WHERE Cart_Status = 'Abandoned';

-- percentage of possible revenue lost due to Abandonment

select sum(Cart_Value)as possible_lost_revenue, 
round(100*sum(Cart_Value)/(select sum(Cart_Value)as total_possible_revenue from updated_abandonment_dataset) , 2) as percentage_lost_revenue
from updated_abandonment_dataset
where Cart_Status="Abandoned";


--  Revenue Loss by Purchase Category(This identifies which product categories contribute most to lost revenue)
SELECT 
    Purchase_Category, 
    SUM(Cart_Value) AS revenue_lost
FROM updated_abandonment_dataset
WHERE Cart_Status = 'Abandoned'
GROUP BY Purchase_Category
ORDER BY revenue_lost DESC;


-- revenue loss by cart Contents Category (This identifies which cart contents category contribute most to lost revenue)

SELECT 
    Cart_Contents, 
    SUM(Cart_Value) AS revenue_lost
FROM updated_abandonment_dataset
WHERE Cart_Status = 'Abandoned'
GROUP BY Cart_Contents
ORDER BY revenue_lost DESC;


-- Peak Day for Cart Abandonment

SELECT 
    Session_Date AS Abandonment_Day, 
    COUNT(*) AS Abandonment_Count
FROM updated_abandonment_dataset
WHERE Cart_Status = 'Abandoned'
GROUP BY Abandonment_Day
ORDER BY Abandonment_Count DESC;

-- Peak Month for Cart Abandonment

SELECT 
    MONTH(Session_Date) AS Abandonment_Month, 
    COUNT(*) AS Abandonment_Count
FROM updated_abandonment_dataset
WHERE Cart_Status = 'Abandoned'
GROUP BY Abandonment_Month
ORDER BY Abandonment_Count DESC;

-- peack month for cart paid
SELECT 
    MONTH(Session_Date) AS Paid_Month, 
    COUNT(*) AS Paid_Count
FROM updated_abandonment_dataset
WHERE Cart_Status = 'Paid'
GROUP BY Paid_Month
ORDER BY Paid_Count DESC;

-- session duration and amendement  (overall)

select Session_Duration,count(*) as Abandonment
from updated_abandonment_dataset
where Cart_Status="Abandoned"
group by Session_Duration 
order by Abandonment desc;


--  Impact of Session Duration on Abandonment (range)

SELECT 
    CASE 
        WHEN Session_Duration BETWEEN 5 AND 20 THEN '5-20 (Very Short)'
        WHEN Session_Duration BETWEEN 21 AND 40 THEN '21-40 (Short)'
        WHEN Session_Duration BETWEEN 41 AND 60 THEN '41-60 (Medium)'
        WHEN Session_Duration BETWEEN 61 AND 80 THEN '61-80 (Long)'
        ELSE '81-120 (Very Long)'
    END AS Session_Duration_Range,
    COUNT(*) AS Abandoned_Carts
FROM updated_abandonment_dataset
WHERE Cart_Status = "Abandoned"
GROUP BY Session_Duration_Range
ORDER BY Abandoned_Carts DESC;


-- Abandonment rate & cart value  (overall)

select Cart_Value ,count(*) as abandonment
from updated_abandonment_dataset
where Cart_Status="Abandoned"
group by Cart_Value
order by abandonment desc;


-- impact of cart value in  cart abandonment 

SELECT 
    CASE 
        WHEN Cart_Value BETWEEN 20.04 AND 99.99 THEN '20.04 - 99.99'
        WHEN Cart_Value BETWEEN 100.00 AND 199.99 THEN '100.00 - 199.99'
        WHEN Cart_Value BETWEEN 200.00 AND 299.99 THEN '200.00 - 299.99'
        WHEN Cart_Value BETWEEN 300.00 AND 399.99 THEN '300.00 - 399.99'
        WHEN Cart_Value BETWEEN 400.00 AND 499.91 THEN '400.00 - 499.91'
        ELSE '500+'
    END AS Cart_Value_Range,
    COUNT(*) AS Total_Carts_Abandonment
FROM updated_abandonment_dataset
WHERE Cart_Value IS NOT NULL
GROUP BY Cart_Value_Range
ORDER by Total_Carts_Abandonment desc;



-- Abandonment Rate by Cart Value (range)

SELECT 
    CASE 
        WHEN Cart_Value BETWEEN 20.04 AND 99.99 THEN '20.04 - 99.99'
        WHEN Cart_Value BETWEEN 100.00 AND 199.99 THEN '100.00 - 199.99'
        WHEN Cart_Value BETWEEN 200.00 AND 299.99 THEN '200.00 - 299.99'
        WHEN Cart_Value BETWEEN 300.00 AND 399.99 THEN '300.00 - 399.99'
        WHEN Cart_Value BETWEEN 400.00 AND 499.91 THEN '400.00 - 499.91'
        ELSE '500+'
    END AS Cart_Value_Range,
    COUNT(*) AS Total_Carts,
    SUM(CASE WHEN Cart_Status = 'Abandoned' THEN 1 ELSE 0 END) AS Abandoned_Carts,
    ROUND(100.0 * SUM(CASE WHEN Cart_Status = 'Abandoned' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Abandonment_Rate
FROM updated_abandonment_dataset
WHERE Cart_Value IS NOT NULL
GROUP BY Cart_Value_Range
ORDER by Abandonment_Rate desc;

















