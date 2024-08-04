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
where pv.WholesalePrice < 100

/*Q5 show me customers and employees who have the same last name*/
select distinct  concat(c.custfirstname,' ',c.custlastname) as custName, concat(e.empfirstname,' ',e.emplastname) as empname
from customers c 
inner join employees e 
on c.custlastname = e.emplastname

/*Q6 show me customers and employees who live in same city*/
select distinct  concat(c.custfirstname,' ',c.custlastname) as custName, concat(e.empfirstname,' ',e.emplastname) as empname
from customers c 
inner join employees e 
on c.custcity = e.empcity

set search_path to entertainmentagencyexample;

/*Q7 Display agents and the engagement dates they booked, sorted by booking start date*/
select concat(a.agtfirstname, ' ', a.agtlastname) as agtName, e.startdate 
from agents a 
inner join engagements e 
on a.agentid = e.agentid
order by e.startdate

/*Q8 List customers and the entertainers they booked*/
select distinct concat(c.custfirstname,' ',c.custlastname) as custName,
en.entStagename
from customers c 
inner join engagements e 
on c.customerid = e.customerid 
inner join entertainers en
on e.entertainerid = en.entertainerid

/* Q9 Find the agents and entertainers who live in the same postal code */
select distinct concat(a.agtfirstname, ' ', a.agtlastname) as agtName, en.entstagename  
from agents a 
inner join entertainers en
on a.agtzipcode = en.entzipcode

set search_path to schoolschedulingexample;

/*Q10 Display buildings and all the classrooms in each building */
select b.buildingcode , classroomid
from buildings b 
inner join class_rooms c 
on b.buildingcode = c.buildingcode

/*Q11 List students and all the classes in which they are currently enrolled */
select distinct concat(studfirstname, ' ', studlastname) as studName,c.classid, sb.subjectname
from students s 
inner join student_schedules ss
on s.studentid = ss.studentid
inner join classes c 
on ss.classid = c.classid
inner join subjects sb
on c.subjectid = sb.subjectid
inner join student_class_status scs
on scs.classstatus = ss.classstatus
where scs.classstatusdescription = 'Enrolled'
order by 1

/* Q12 List the faculty staff and the subject each teaches */
select distinct concat(stffirstname, ' ', stflastname) as stfName , sb.subjectname
from  staff s
inner join faculty_subjects fs 
on s.staffid = fs.staffid
inner join subjects sb
on fs.subjectid = sb.subjectid

/*Q13 Show me the students who have a grade of 85 or better in art 
and who have a grade of 85 or better in any computer course */
select concat(art.studfirstname, ' ', art.studlastname) as sdName 
from ( select  grade, studfirstname, studlastname, studentid
	   from ( select s2.classid, s2.grade, s.studfirstname, s.studlastname, s.studentid
	   from 
	students s 
inner join student_schedules s2
on s.studentid = s2.studentid
) as grade
inner join classes as c 
on grade.classid = c.classid
inner join subjects as sb
	 on c.subjectid = sb.subjectid
where grade >= 85 
   and subjectname like '%Art%') art
   inner join 
   (select grade, studfirstname, studlastname, studentid from ( select s2.classid, s2.grade, s.studfirstname, s.studlastname, s.studentid
	   from 
	students s 
inner join student_schedules s2
on s.studentid = s2.studentid
) as grade
inner join classes as c 
on grade.classid = c.classid
inner join subjects as sb
	 on c.subjectid = sb.subjectid
where grade >= 85 
   and  subjectname like '%computer%') computer
   on art.studentid = computer.studentid

/*Q14 List the bowling teams and all the team members */
select t.teamname, concat(b.bowlerfirstname , ' ', b.bowlerlastname) as bowlers 
from teams t 
inner join bowlers b 
on t.teamid = b.teamid
order by t.teamid

/**Q15 Display the bowlers, the matches they played in, and the bowler game scores */
select distinct concat(b.bowlerfirstname , ' ', b.bowlerlastname) as bowlers , m.matchid, bs.handicapscore
from bowlers b 
inner join bowler_scores bs 
on b.bowlerid = bs.bowlerid
inner join match_games m
on bs.matchid = m.matchid

/*Q16 Find the bowlers who live in the same zip code */
select concat(b1.bowlerfirstname,' ',b1.bowlerlastname) as bowlern1,
concat(b2.bowlerfirstname,' ',b2.bowlerlastname) as bowlern2,
b2.bowlerzip
from bowlers b1 
inner join bowlers b2 
on b1.bowlerzip = b2.bowlerzip
and b1.bowlerid != b2.bowlerid

/*Q17 List all the recipes for salads */
select r.recipetitle from recipes r 
inner join recipe_classes rc
on r.recipeclassid = rc.recipeclassid
where rc.recipeclassdescription = 'Salad'

/*Q18 List all the recipes that contain dairy ingredient */
select distinct r.recipetitle from recipes r 
inner join recipe_ingredients ri
on r.recipeid = ri.recipeid
inner join ingredients i
on ri.ingredientid = i.ingredientid
inner join ingredient_classes ic
on i.ingredientclassid = ic.ingredientclassid
where ic.ingredientclassdescription = 'Dairy'

/** Q19 Find the ingredients that use the same defualt measurement amount */
select *  from(select i.ingredientname, m.measureamountid from 
ingredients i
inner join measurements m
on m.measureamountid = i.measureamountid) a
inner join 
(select i.ingredientname, m.measureamountid from 
ingredients i
inner join measurements m
on m.measureamountid = i.measureamountid) b
on a.measureamountid = b.measureamountid

/* Q20 show me the recipes that have beef and garlic */
select a.recipetitle from (select r.*, i.ingredientname from recipes r 
inner join recipe_ingredients ri
on r.recipeid = ri.recipeid
inner join ingredients i
on ri.ingredientid = i.ingredientid
where i.ingredientname = 'Beef')a
inner join 
(select r.*, i.ingredientname from recipes r 
inner join recipe_ingredients ri
on r.recipeid = ri.recipeid
inner join ingredients i
on ri.ingredientid = i.ingredientid
where i.ingredientname = 'Garlic')b
on a.recipeid = b.recipeid