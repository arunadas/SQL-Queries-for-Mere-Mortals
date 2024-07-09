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