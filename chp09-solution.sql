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