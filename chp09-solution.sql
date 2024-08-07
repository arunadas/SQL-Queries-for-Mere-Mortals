set search_path to salesordersexample;

/*Q1 Show me customers who have never ordered a helmet */
select concat(c.custfirstname,' ', c.custlastname) as customerName
from customers c 
left join 
(select distinct o.customerid from
orders o 
inner join order_details od on o.ordernumber = od.ordernumber
inner join products p on od.productnumber = p.productnumber
where p.productname like '%Helmet%' ) helmet 
on c.customerid = helmet.customerid
where helmet.customerid is null

/*Q2 Display customers who have no sales rep (employees) in the same zip code */
select concat(c.custfirstname,' ', c.custlastname) as customerName
from customers c 
left join employees e on c.custzipcode = e.empzipcode
where e.employeeid is null

/*Q3 List all products and the dates for any orders */
select p.productname,p.productnumber, o.orderdate 
from products p 
left join 
(select distinct od.productnumber , o.orderdate from order_details od 
inner join orders o on od.ordernumber = o.ordernumber ) o
on p.productnumber = o.productnumber 

/*Q4 Display agents who haven't booked an entertainer */
select concat(agtfirstname, ' ',agtlastname) as agtName
from agents a 
left join engagements e on a.agentid = e.agentid
where e.agentid is null

/*Q5 List customers with no bookings */
select concat(custfirstname, ' ',custlastname) as agtName
from customers c 
left join engagements e on c.customerid = e.customerid
where e.customerid is null