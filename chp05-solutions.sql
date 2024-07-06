set search_path to salesordersexample;

/* What if we adjusted each product price by reducing it 5 percent */
select retailprice as orginalPrice, 
       round((retailprice - (5/100.0)*retailprice)) as adjustedPrice from products;