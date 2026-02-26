CREATE DATABASE churn_analysis;
USE churn_analysis;
CREATE TABLE customers (
    customerID VARCHAR(20),
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(50),
    OnlineSecurity VARCHAR(20),
    OnlineBackup VARCHAR(20),
    DeviceProtection VARCHAR(20),
    TechSupport VARCHAR(20),
    StreamingTV VARCHAR(20),
    StreamingMovies VARCHAR(20),
    Contract VARCHAR(50),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn INT
);

-- select*from customers;
-- select count(*)as total_Customer_count from customers;

-- Q1) Overall Churn Rate

-- select count(*) as total_customers,
-- sum(Churn)As churned_customers,
-- round(sum(Churn)/count(*)*100,2) as churn_rate_percentage
-- from customers;

-- Q2)Churn Rate by Contract Type

-- select Contract,
-- count(*)as total_customers,
-- sum(Churn)as churned_customers,
-- round(sum(churn)/count(*)*100,2)as churn_rate
-- from customers
-- group by Contract
-- order by churn_rate desc;

-- Q3)Revenue Lost Due to Churn

-- select round(sum(MonthlyCharges),2)as monthly_revenue_lost
-- from customers
-- where churn=1;

-- Q4)Churn by Tenure Group (Using CASE)

-- select 
-- 	case
-- 		when tenure<=12 then '0-12 Months'
--         when tenure between 13 and 24 then '13-24 Months'
--         else '24+ Months'
-- 	end as tenure_group,
--     count(*)as total_customers,
--     sum(Churn)As churned_customers,
--     round(sum(Churn)/count(*)*100,2)as churn_rate
-- from customers
-- group by tenure_group
-- order by churn_rate desc;



-- Q5)Customer Charge Ranking Using SQL Window Function

select customerID,MonthlyCharges,
rank()over(order by MonthlyCharges desc)As charge_rank
from customers;
