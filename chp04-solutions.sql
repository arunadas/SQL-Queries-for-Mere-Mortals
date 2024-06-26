-- specific to postgress , use <schemaname> in mysql

set search_path to salesordersexample;
/* Q1 show me all the information on our employees*/

select * from employees

/* Q2 show me a list of cities, in alphabetical order , where our vendors are located, and include the names of the vendors 
we work with in each city */

select vendcity, vendname
from vendors
order by vendcity

set search_path to entertainmentagencyexample;

/* Q3 Give me the names and phone numbers of all our agents, and list them in last name/first name order*/
select concat(agtfirstname,' ',agtlastname) as agent_name,
agtphonenumber
from agents
order by agtlastname, agtfirstname;

/* Q4 Give me the information on all our engagements */
select * from engagements;

/*Q5 List all engagements and their associated start dates. Sort the records by date 
in descending order and by engagement in ascending order.*/

select engagementnumber, startdate from engagements
order by startdate desc , engagementnumber;

/*Q6 Show me a complete list of all the subjects we offer*/
select subjectname from subjects;

/*Q7 What kinds of titles are associated with our faculty?*/
select distinct title  from faculty;

/*Q8 List the names and phone numbers of all our staff, and sort them by last name and first name*/
select concat(stffirstname,' ',stflastname) as stname,
stfphonenumber from staff
order by stflastname , stffirstname;

/*Q9 List all of the teams in alphabetical order*/
select * from teams
order by teamname;

/*Q10 show me all the bowling score information for each of our members*/
select * from bowler_scores;

/*Q11 Show me a list of bowlers and their addresses, and sort it in alphabetical order*/
select concat(bowlerfirstname,' ',bowlerlastname) as bowlername,
bowleraddress from bowlers
order by bowlername;

/*Q12 show me a list of all the ingredients we currently keep track of*/
set search_path to recipesexample;

select distinct ingredientname from ingredients;

select * from ingredients;