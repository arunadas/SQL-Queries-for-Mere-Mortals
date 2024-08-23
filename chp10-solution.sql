set search_path to salesordersexample;

/*Q1 list the customers who ordered a helmet together with the vendors who provide helmets */

/*Q1 list the customers who ordered a helmet together with the vendors who provide helmets */
select  concat(custfirstname,' ', custlastname) as customers , p.productname, 'customer' as rowid from customers c
inner join orders o  
on c.customerid = o.customerid 
inner join order_details od 
on o.ordernumber = od.ordernumber
inner join products p 
on p.productnumber = od.productnumber
where p.productname like '%Helmet%'

union  

select  vendname, p.productname, 'vendor' as rowid from vendors v
inner join product_vendors pv  
on v.vendorid = pv.vendorid
inner join products p 
on p.productnumber = pv.productnumber
where p.productname like '%Helmet%'

set search_path to entertainmentagencyexample;

/*Q2 Display a combined list of customers and entertainers */
select  concat(custfirstname,' ', custlastname) as customers , 'customer' as rowid from customers 

union  

select  entstagename,  'entertainer' as rowid from entertainers 