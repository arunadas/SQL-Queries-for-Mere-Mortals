set search_path to salesordersexample;

/* Q1 What if we adjusted each product price by reducing it 5 percent */
select retailprice as orginalPrice, 
       round((retailprice - (5/100.0)*retailprice)) as adjustedPrice from products;

/* Q2 Show me a list of orders made by each customer in descending date order*/  
select customerid, ordernumber, orderdate 
from orders
order by 
customerid, orderdate desc

/*Q3 compile a complete list of vendor names, addresses, and phone numbers in vendor name order*/
select vendname, vendstreetaddress, vendcity, vendstate, vendzipcode,vendphonenumber
from vendors
order by vendname asc

set search_path to entertainmentagencyexample;

/*Q4 Give me the names of all our customers by city */
select custfirstname, custlastname,custcity from customers
order by custcity

/*Q5 List all entertainers and their web sites */
select entstagename, entemailaddress from entertainers

/*Q6 Show the date of each agents first six-month performance review */
select datehired, datehired + INTERVAL '6 months' AS per_date from agents

set search_path to schoolschedulingexample;

/*Q7 Give me a list of staff members, and show them in descending order of salary */
select stffirstname, stflastname, salary from staff
order by salary desc

/*Q8 can you give me a staff member phone list */
select stfphonenumber from staff

/*Q9 list the name of all our students, and order them by the cities they live in  */
select studfirstname, studlastname, studcity from students
order by studcity

set search_path to bowlingleagueexample;

/*Q10 show next year's tournament date for each tournament location  */
select tourneydate + INTERVAL '365 days' as next_yr_date, * from tournaments

/*Q11 list the name and phone number for each member of the league  */
select bowlerfirstname, bowlerlastname, bowlerphonenumber from bowlers