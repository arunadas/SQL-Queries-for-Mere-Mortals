set search_path to salesordersexample;

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


/*Q3 Produce a list of customers who like contemporay music together with a 
list of entertainers who play contempory music*/
select  concat(custfirstname,' ', custlastname) as customers , 'customer' as rowid from customers c
inner join musical_preferences mp 
on c.customerid = mp.customerid 
inner join musical_styles ms
on mp.styleid = ms.styleid
and stylename = 'Contemporary'

union  

select  entstagename,  'entertainer' as rowid from entertainers e
inner join entertainer_styles es 
on e.entertainerid = es.entertainerid 
inner join musical_styles ms
on es.styleid = ms.styleid
and stylename = 'Contemporary'

set search_path to schoolschedulingexample;

/*Q4 Create a mailing list for students and staff, sorted by zip code */
select  concat(studfirstname, ' ', studlastname) as name ,studzipcode as zipcode, 'student' as type
from students s 

union  

select  concat(stffirstname, ' ', stflastname) as name ,stfzipcode as zipcode, 'staff' as type
from staff s 
order by zipcode

set search_path to bowlingleagueexample;

/*Q5 Find the bowlers who had a raw score of 165 or better at Thunder bird Lanes combined with bowlers who had a raw score of 150
or better at Bolero Lanes*/
select t.tourneylocation, concat(bowlerfirstname, ' ', bowlerlastname) as bowlerName , bs.rawscore
from bowlers b 
inner join bowler_scores bs 
on b.bowlerid = bs.bowlerid
inner join match_games mg 
on bs.matchid = mg.matchid 
inner join tourney_matches tm
on mg.matchid = tm.matchid
inner join tournaments t 
on tm.tourneyid = t.tourneyid
where bs.rawscore > 165 
and t.tourneylocation = 'Thunderbird Lanes'

union  

select t.tourneylocation, concat(bowlerfirstname, ' ', bowlerlastname) as bowlerName , bs.rawscore
from bowlers b 
inner join bowler_scores bs 
on b.bowlerid = bs.bowlerid
inner join match_games mg 
on bs.matchid = mg.matchid 
inner join tourney_matches tm
on mg.matchid = tm.matchid
inner join tournaments t 
on tm.tourneyid = t.tourneyid
where bs.rawscore > 150 
and t.tourneylocation = 'Bolero Lanes'

/* same with where clause*/
select t.tourneylocation, concat(bowlerfirstname, ' ', bowlerlastname) as bowlerName , bs.rawscore
from bowlers b 
inner join bowler_scores bs 
on b.bowlerid = bs.bowlerid
inner join tourney_matches tm
on bs.matchid = tm.matchid
inner join tournaments t 
on tm.tourneyid = t.tourneyid
where (bs.rawscore > 165 
and t.tourneylocation = 'Thunderbird Lanes')
or (bs.rawscore > 150 
and t.tourneylocation = 'Bolero Lanes')


set search_path to recipesexample;

/*Display a list of the ingredients and their default measurement amounts together 
with ingredients used in recipes and the measurement amount for each receipe*/

select ingredientname , measurementdescription , 'Ingredient' as type
from ingredients i inner join measurements m 
on i.measureamountid = m.measureamountid

union 

select ingredientname , measurementdescription , 'Recipe' as Type
from ingredients i inner join recipe_ingredients ri 
on i.ingredientid = ri.ingredientid 
inner join measurements m 
on ri.measureamountid = m.measureamountid
