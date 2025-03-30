
-----------------------------------------------------------------------------------------------------
# 1.  No of invoices by Account Execution 

SELECT * FROM invoice;
show databases;
use data1;
SELECT Account_Executive,
       COUNT(invoice_number) AS number_of_invoice
FROM invoice
GROUP BY Account_Executive
ORDER BY Account_Executive DESC;
----------------------------------------------------------------------------------------------------------

#2.Yearly meeting count 

SELECT * FROM meeting;
Show databases;
use data1;

SELECT YEAR(meeting_date) AS meeting_year,
       COUNT(Account_Executive) AS meeting_count 
FROM meeting	
GROUP BY YEAR(meeting_date)
ORDER BY meeting_year DESC;

# We need to add where clause 
# WHERE YEAR(meeting_date) = 2019 and 2020

------------------------------------------------------------------------------------------------------------------------
# 3.  
use data1;
select * from brokerage limit 1;
select * from fees limit 1;
select * from budgets limit 1;
select * from invoice limit 1;

#####KPI 1: No. of Invoice by account Executive#####
select Account_Executive,count(invoice_number) from invoice group by Account_Executive order by count(invoice_number) desc;

######TARGET_BUDGET################
select sum(New_budget) as New_Target,
			sum(Crosssell_bugdet) as CrossSell_Target,
            sum(Renewal_budget) as Renewal_Target from budgets;
      ##################################
      
select round(sum(Amount),2)   from brokerage where income_class="New";
select round(sum(Amount),2) from fees where income_class="New";

select round(sum(a.Amount))+ round(sum(b.Amount),2) from brokerage a,  fees b where a. income_class="New" and  b. income_class="New"; 

#####KPI 3:   ACHIEVEMENT FOR INCOME CLASS   ###############
#insert into achievementab  (achievement ,total) 
select "New" as Achievement,  sum(col1) as total from (
select round(sum(Amount),2) as col1  from brokerage where income_class="New" union
select round(sum(Amount),2) as col1  from fees where income_class="New") as subquery
union
select "Cross Sell" as Achievement,  sum(col1) as total from (
select round(sum(Amount),2) as col1  from brokerage where income_class="Cross Sell" union
select round(sum(Amount),2) as col1  from fees where income_class="Cross Sell") as subquery
union
select "Renewal" as Achievement,  sum(col1) as total from (
select round(sum(Amount),2) as col1  from brokerage where income_class="Renewal" union
select round(sum(Amount),2) as col1  from fees where income_class="Renewal") as subquery;

------------------------------------------------------------------------------------------------------------------

# 4. Stages of Revenue

SELECT * FROM opportunity;

Use data1;
SELECT 
    Stage,
    SUM(revenue_amount) AS TotalRevenue,
    COUNT(*) AS opportunityCount
FROM 
    opportunity
GROUP BY 
    Stage
ORDER BY 
    TotalRevenue DESC;

--------------------------------------------------------------------------------------------------------------

# 5. No of meetings by Account Execution

SELECT * FROM meeting;

Use data1;
SELECT Account_Exe_ID, 
       COUNT(Account_Exe_ID) AS meeting_count
FROM meeting
GROUP BY Account_Exe_ID
ORDER BY meeting_count DESC;

-------------------------------------------------------------------------------------------------------

#6. Top 6 opportunities 

SELECT * FROM opportunity;
 use data1;

SELECT opportunity_id, opportunity_name, revenue_amount
FROM opportunity
ORDER BY revenue_amount DESC
LIMIT 6;



