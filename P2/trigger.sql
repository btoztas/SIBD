DELIMITER $$

DROP TRIGGER IF EXISTS check_doctor;
CREATE TRIGGER check_doctor BEFORE INSERT ON study -- before insert in order to prevent the insertion
FOR EACH ROW
BEGIN

	IF (new.doctor_id IN( -- if there is any doctor with the new doctor_id that 
	SELECT doctor_id      -- is already in the request table with a respective request number
	FROM request          -- that is the same as the new request number
	WHERE request_number = new.request_number)) THEN
		call erro(); -- generate SQL error
	END IF;


	IF ((select datediff(new.study_date, request.appointment_date) -- if the difference between the new date and
	FROM request                                                   -- and the date of the respective request
	WHERE request_number = new.request_number) < 0) THEN           -- is less than zero 
		call erro(); -- generate SQL error
	END IF;
END $$

DELIMITER ;
