-- specific to postgress , use <schemaname> in mysql

set search_path to salesordersexample;
/* Q1 show me all the information on our employees*/

select * from employees

/* Q2 show me a list of cities, in alphabetical order , where our vendors are located, and include the names of the vendors 
we work with in each city */

select vendcity, vendname
from vendors
order by vendcity