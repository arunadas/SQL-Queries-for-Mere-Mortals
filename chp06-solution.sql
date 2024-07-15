set search_path to salesordersexample;

/*Q1 Give me the names of all vendors based in Ballard, Bellevue, and Redmond*/
select vendname from vendors
where vendcity IN ( 'Bellevue', 'Ballard', 
				   'Redmond')