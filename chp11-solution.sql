set search_path to salesordersexample;

/* Q1 Display products and the latest date each product was ordered*/

select p.productname ,
(select max(o.orderdate) 
from orders o inner join order_details od 
on o.ordernumber = od.ordernumber 
where  od.productnumber = p.productnumber ) as lastOrder
from products p

/* Q2 List the customers who ordered bikes */

select distinct concat(custfirstname,' ', custlastname) as custName from customers 
where customerid in (
select distinct customerid from orders o 
inner join order_details od 
on o.ordernumber = od.ordernumber
inner join products p 
on od.productnumber = p.productnumber
where p.categoryid = 2
	)

/* Q3 What products have never been ordered */

select productname from products where productnumber not in (
select productnumber from order_details)    