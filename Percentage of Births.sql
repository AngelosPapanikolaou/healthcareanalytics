/* We are tasked to find the percentage of each source of payment */

/*the first step is to identify the table we will be working with*/

select *
from births
limit 5;

/* The issue is with the source of payment. It is in text format and the births are
calculated per Country. We will need to GROUP BY that column. Afterwards, we need to find how many births
each source of payment category has with a SUM function. Then we can find the percentage
of each payment by finding the entire amount of births in a SubQuery, dividing it by amount of 
each Source of payment and multiplying it by 100 */

select Source_of_Payment, sum(births) /
(
select sum(births)
from births
) * 100 as Percentage_of_Births
from births
group by Source_of_payment

/* we can then visualize the results in Tableau, Power Bi 
or Python */