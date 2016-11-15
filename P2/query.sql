SELECT doctor_name
	FROM doctor NATURAL JOIN study
	WHERE manufacturer = "Philips" AND description LIKE "%X-ray%" AND datediff(current_date, study_date) < 7
	GROUP BY doctor_id HAVING count(doctor_id) >= ALL (SELECT count(doctor_id)
	FROM study
	WHERE manufacturer = "Philips" AND description LIKE "%X-ray%" AND datediff(current_date, study_date) < 7
	GROUP BY doctor_id HAVING count(doctor_id))
