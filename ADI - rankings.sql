/* We are tasked to find how the percentile ADI changes for U.S. states from 
2018 to 2020.*/

/*the first step is to identify the table we will be working with*/

select *
from health_nutrition_population
limit 5;

/* No further steps to filter by year, since the data provided have the dates from 2018 
to 2020. 
We will need an AVG calculation on the ADI column */

select state_fips_code, state, year,
    avg(area_deprivation_index_percent) as mean_adi
from adi_rankings
group by year, state_fips_code, state
order by state_fips_code, year;


/* we can then visualize the results in Tableau, Power Bi 
or Python */