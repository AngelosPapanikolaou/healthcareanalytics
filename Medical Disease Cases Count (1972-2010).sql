/* We are tasked to find the count of each medical disease cases between 1972 and 2010 */


/*the first step is to identify the table we will be working with*/

select *
from cdc_disease_cases
limit 5;

/*First issue is the date format (string format). The first 4 
letters are referencing the year and the last 2 the week of that year.
We need a function to extract the first 4 letters of the string
*/

select disease, count(cases) AS Case_count
from cdc_disease_cases
Where left (epi_week, 4) > 1972
and left (epi_week, 4) < 2011
group by disease;

/* we can then visualize the results in Tableau, Power Bi 
or Python */