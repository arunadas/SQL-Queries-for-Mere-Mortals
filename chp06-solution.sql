set search_path to salesordersexample;

/*Q1 Give me the names of all vendors based in Ballard, Bellevue, and Redmond*/
select vendname from vendors
where vendcity IN ( 'Bellevue', 'Ballard', 
				   'Redmond')

/*Q2 Show me an alphabetize list of products with a retail price of $125.00 or more */
select productname, retailprice from products
where retailprice >= 125
order by productname

/*Q3 Which vendor we worked with that don't have web site? */
select vendname from vendors
where vendwebpage is null
order by vendname

set search_path to entertainmentagencyexample;

/**Q4 Let me see a list of all engagements that occurred during october 2017 */
select * from engagements
where startdate >= '2017-10-01'
and enddate <= '2017-10-31'

/**Q5 show me any engagements in oct 2017 that start bet noon and 5 pm */
select * from engagements
where startdate >= '2017-10-01'
and enddate <= '2017-10-31'
and starttime between  '12:00:00' and '17:00:00'

/*Q6 List all the engagements that start and end on the same day */
select * from engagements
where startdate = enddate

set search_path to schoolschedulingexample;

/*Q7 Show me which staff members use a post office Box as their address */
select concat(stffirstname,' ',stflastname) as staffMember,stfstreetaddress  from staff
where stfstreetaddress like '%PO Box%'

/*Q8 Can you show me which students live outside of the pacific Northwest */
select concat(studfirstname,' ',studlastname) as students from students
where studstate not in ('WA','OR')

/*Q9 List all the subjects that have a subject code starting 'MUS' */
select subjectname from subjects
where subjectcode like 'MUS%'

/**Q10 Produce a list of ID numbers all the Associate Professors who are employed full time*/
select staffid from faculty
where title = 'Associate Professor'
and status = 'Full Time'

set search_path to bowlingleagueexample;

/*Q11 Give me a list of the tournaments held during September 2017*/
select * from tournaments
where tourneydate between '2017-09-01' and '2017-09-30'

/*Q12 What are the tournament schedules for Bolero, Red Rooster, and Thunderbird Lanes ?*/
select * from tournaments
where tourneylocation like '%Bolero%' or tourneylocation like '%Red Rooster%'
or tourneylocation like '%Thunderbird%'

/*Q13 List the bowlers who live on the Eastside and who are in team 5,6,7, or 8*/
select concat(bowlerfirstname,' ',bowlerlastname) as bowlername from bowlers
where bowlercity in ('Bellevue', 'Duvall', 'Redmond','Woodinville')
and teamid between 5 and 8

set search_path to recipesexample;

/*Q14 List all recipes that are main courses (recipe class is 1) and that have notes*/
select * from recipes
where recipeclassid = 1
and notes is not null

/*Q15 Display the first five recipes*/
select * from recipes
order by recipeid 
limit 5