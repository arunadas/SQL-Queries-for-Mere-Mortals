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