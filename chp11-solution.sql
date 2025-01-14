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

set search_path to entertainmentagencyexample;

/* Q4 Show me all entertainers and the count of each entertainers engagement */

select entstagename , ( select count(engagementnumber) from engagements eg where eg.entertainerid = e.entertainerid) 
from entertainers e

/* Q5 List customers who have booked entertainers who play country or country rock */
SELECT CONCAT(CUSTFIRSTNAME,

								' ',
								CUSTLASTNAME) AS CUSTNAME
FROM CUSTOMERS
WHERE CUSTOMERID in
		(SELECT DISTINCT EG.CUSTOMERID
			FROM MUSICAL_STYLES MS
			INNER JOIN ENTERTAINER_STYLES ES ON MS.STYLEID = ES.STYLEID
			INNER JOIN ENTERTAINERS E ON ES.ENTERTAINERID = E.ENTERTAINERID
			INNER JOIN ENGAGEMENTS EG ON E.ENTERTAINERID = EG.ENTERTAINERID
			WHERE MS.STYLENAME like 'Country%')


/* Q6 Find the entertainers who played engagements for customers Berg or Hallmark */

select distinct e.entstagename from engagements eg 
inner join entertainers e 
on eg.entertainerid = e.entertainerid
where eg.customerid in (
select customerid from customers
where custlastname in ('Berg', 'Hallmark'))            

/*using some */
select entstagename from entertainers  
where entertainerid = some 
(select eg.entertainerid from customers c
inner join engagements eg 
on eg.customerid = c.customerid
where c.custlastname = 'Berg' 
 or c.custlastname = 'Hallmark'
)

/*using any */
select entstagename from entertainers  
where entertainerid = any 
(select eg.entertainerid from customers c
inner join engagements eg 
on eg.customerid = c.customerid
where c.custlastname = 'Berg' 
 or c.custlastname = 'Hallmark'
)

/* Q7 Display agents who haven't booked an entertainer */

select concat(agtfirstname,' ', agtlastname) as agtName 
from agents 
where agentid not in ( select agentid from engagements)

SET SEARCH_PATH TO schoolschedulingexample;

/* Q8 List all staff members and the count of classes each teaches */

select concat(stffirstname , ' ' , stflastname) as staffName , 
(select count(f.classid) AS classCount from faculty_classes f 
where f.staffid = s.staffid)
from staff s

/* Q9 Display students enrolled in a class on Tuesday */

select concat(studfirstname , ' ' , studlastname) as staffName
from students where studentid in 
(select studentid from student_schedules s
 inner join classes c
 on s.classid = c.classid
and c.tuesdayschedule = 1)


/* Q10 List the subjects taught on wednesday */

select subjectName
from subjects where subjectid in 
(select subjectid from classes 
 where wednesdayschedule = 1)