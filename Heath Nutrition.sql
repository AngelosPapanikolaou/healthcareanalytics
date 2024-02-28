/* We are tasked to find the most valuable indicator of Health nutrition 
population for each country in 2007.*/

/*the first step is to identify the table we will be working with*/

select *
from health_nutrition_population
limit 5;

/* With the data provided we can see that the indicator value 
is a DOUBLE datatype and the year is in a DATETIME format.
We will use the function YEAR to exctract the year format. */

select country_name, max(value),
(
select indicator_name
from health_nutrition_population m2
where max(m1.value) = m2.value
limit 1
) as Indicator_desc
from health_nutrition_population m1
where year(year) = 2007
group by country_name;


/* This is a subquery that is selecting the indicator_name from the 
health_nutrition_population table where the maximum value from the outer query equals the value in the subquery. 
The LIMIT 1 clause ensures that only one record is returned. The result of this 
subquery is given the alias Indicator_desc */

/* we can then visualize the results in Tableau, Power Bi 
or Python */