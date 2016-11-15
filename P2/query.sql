select doctor_name
	from doctor natural join study
	where manufacturer = "Philips" and description like "%X-ray%" and datediff(current_date, study_date) < 7
	group by doctor_id having count(doctor_id) >= all (select count(doctor_id)
	from study
	where manufacturer = "Philips" and description like "%X-ray%" and datediff(current_date, study_date) < 7
	group by doctor_id having count(doctor_id))
