/* we are tasked to find each country's growth rate througout the years*/

/*the first step is to identify the table we will be working with*/

select *
from country_population_growth_rate
limit 5;

/* The issue is that the years are not in a year format but date format.
We need a function that can get us the YEAR. */

select country_name, year(year), 
((crude_birth_rate - crude_death_rate) /1000) * 100 as Natutral_Growth
from country_population_growth_rate;


/* the formula ((crude_birth_rate - crude_death_rate) / 1000 ) * 100 represents the natural
growth rate per country's population. */

/* we can then visualize the results in Tableau, Power Bi 
or Python */