SELECT doctor_name
	FROM doctor NATURAL JOIN study -- it is needed to have the information on study joined with the information on doctor
	WHERE manufacturer = "Philips" AND description LIKE "%X-ray%" AND datediff(current_date, study_date) <= 7
	-- the manufaturer must be Philips, the description must contain the word X-ray and the difference in days between
	-- the dates must be less or equal to 7;
	GROUP BY doctor_id HAVING count(doctor_id) >= ALL (SELECT count(doctor_id) -- grouping by doctor_id in order to count 
							   			   -- the number of studys that a doctor performed
	FROM study
	WHERE manufacturer = "Philips" AND description LIKE "%X-ray%" AND datediff(current_date, study_date) <= 7
	GROUP BY doctor_id HAVING count(doctor_id))
