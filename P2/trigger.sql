DELIMITER $$

CREATE TRIGGER check_doctor BEFORE INSERT ON study
FOR EACH ROW
BEGIN
	IF (new.doctor_id IN(
	SELECT doctor_id
	FROM request
	WHERE request_number = new.request_number)) THEN
		call erro();
	END IF;
	/*select request.appointment_date into request_date FROM request WHERE request_number = new.request_number;*/
	IF ((select datediff(new.study_date, request.appointment_date)
	FROM request
	WHERE request_number = new.request_number) < 0) THEN
		call erro();
	END IF;
END $$

DELIMITER ;
