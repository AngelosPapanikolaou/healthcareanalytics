/* For this project, we are going to come up with a flu shots dashboard for 2022 with
the following informations

1) Total % of patients getting flu shots arranged by:
	a: Age
    b: Race
    c: County (on a Map)
    d: Overall
2) Running Total of Flu shots over the course of 2022
3) Total number of Flu shots given to 2022
4) A list of Patients that show wether of not they received the Flu shots

Requirements:

Patients must have been "Active at our hospital"
*/

WITH active_patients AS
(
     SELECT DISTINCT patient
	 FROM encounters AS e
	 JOIN patients AS pat
	   ON e.patient = pat.id
	 WHERE START BETWEEN '2020-01-01 00:00' and '2022-12-31 23:59'
       AND pat.deathdate IS null
       AND EXTRACT(EPOCH FROM age('2022-12-31', pat.birthdate)) / 2592000 >= 6
),

flu_shot_2022 AS		
(
SELECT patient, MIN(date) AS earliest_flu_shot_2022 
FROM immunizations
WHERE code = '5302' 
  AND date BETWEEN '2022-01-01 00:00' AND '2022-12-31 23:59'
GROUP BY patient 
)  

SELECT pat.birthdate,
       pat.race,
	   pat.gender,
	   EXTRACT(YEAR FROM age('2022-12-31', pat.birthdate)) AS age,
	   pat.county,
	   pat.id,
	   pat.first,
	   pat.last,
	   flu.earliest_flu_shot_2022,
	   flu.patient,
	   CASE WHEN flu.patient IS NOT null THEN 1
	   ELSE 0
	   END AS flu_shot_2022
FROM patients AS pat
LEFT JOIN flu_shot_2022 AS flu
  ON pat.id = flu.patient
WHERE 1=1
  AND pat.id in(SELECT patient FROM active_patients)
  
