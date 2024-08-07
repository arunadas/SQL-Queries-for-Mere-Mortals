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

/*Q6 List all entertainers and any engagements they have booked */
select e.entstageName, e2.engagementnumber
from entertainers e 
left join engagements e2 on e.entertainerid = e2.entertainerid

/*Q7 Show me classes that have no students enrolled. */
select * from classes c
left join 
(select c.*,sc.classstatusdescription from classes c 
left join student_schedules s2 on c.classid = s2.classid
inner join student_class_status sc on s2.classstatus = sc.classstatus
where sc.classstatusdescription = 'Enrolled') e
on c.classid = e.classid 
where e.classstatusdescription is null

/*Q8 Display subjects with no faculty assigned */
select * from subjects s
left join 
(select f.*,fs.subjectid from faculty_subjects fs
inner join faculty f on fs.staffid = f.staffid) f
on s.subjectid = f.subjectid 
where f.staffid is null

/*Q9 List students not currently enrolled in any classes */
select * from students s
left join 
(select s.*,sc.classstatusdescription from student_schedules s2 
 inner join students s on s2.studentid = s.studentid
inner join  student_class_status sc on s2.classstatus = sc.classstatus
where sc.classstatusdescription = 'Enrolled') e
on s.studentid= e.studentid 
where e.classstatusdescription is null