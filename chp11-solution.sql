set search_path to salesordersexample;

/* Display products and the latest date each product was ordered*/

select p.productname ,
(select max(o.orderdate) 
from orders o inner join order_details od 
on o.ordernumber = od.ordernumber 
where  od.productnumber = p.productnumber ) as lastOrder
from products p