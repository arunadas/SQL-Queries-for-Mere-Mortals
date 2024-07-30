set search_path to salesordersexample;

/*Q1 List customers and the dates they placed an order, sorted in order date sequences*/
select concat(c.custfirstname, ' ',c.custlastname) as custName,
  o.orderdate as orderDate
from customers c 
inner join orders o 
on c.customerid=o.customerid

/*Q2 List employees and the customers for whom they booked an order*/
select distinct concat(e.empfirstname, ' ',e.emplastname) as empName,
concat(c.custfirstname, ' ',c.custlastname) as custName
from customers c 
inner join orders o 
on c.customerid=o.customerid
inner join employees e 
on o.employeeid = e.employeeid

/*Q3 Display all orders, the products in each order, and the amount owed for each product, in order number sequence.*/
select o.ordernumber , p.productname, od.quantityordered*od.quotedprice as amountOwed
from orders o
inner join order_details od
on o.ordernumber = od.ordernumber
inner join products p 
on od.productnumber = p.productnumber
order by o.ordernumber

/*Q4 Show me the vendors and the products they supply to us for products that cost less than $100*/
select v.vendname, p.productname, p.retailprice
from vendors v 
inner join product_vendors pv
on v.vendorid = pv.vendorid 
inner join products p 
on pv.productnumber = p.productnumber
where p.retailprice < 100