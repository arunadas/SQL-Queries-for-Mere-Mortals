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