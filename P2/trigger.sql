DELIMITER $$

create trigger check_doctor before insert on study
for each row
begin
	if (new.doctor_id in(
	select doctor_id
	from request
	where request_number = new.request_number)) then
		call erro();
	end if;
	/*select request.appointment_date into request_date from request where request_number = new.request_number;*/
	if ((select datediff(new.study_date, request.appointment_date)
	from request
	where request_number = new.request_number) < 0) then
		call erro();
	end if;
end $$

DELIMITER ;
