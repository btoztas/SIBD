delimiter $$
create function overlap(name varchar(255),name2 varchar(255))
	returns varchar(255)
begin

	declare counter int;
	declare counter2 int;
	declare counter3 int;
	declare counter4 int;
	declare limit1 int;
	declare limit2 int;
	declare x1,x2,y1,y2 float(10,2);
	declare x1_2,x2_2,y1_2,y2_2 float(10,2);
	
	declare my_cursor cursor for select a.x1,a.x2,a.y1,a.y2 from region as a,series as b where b.series_id = a.series_id and b.series_name = name;
	
	declare my_cursor2 cursor for select a.x1,a.x2,a.y1,a.y2 from region as a,series as b where b.series_id = a.series_id and b.series_name = name2;

	select Count(*) into limit2 from region as a,series as b where b.series_id = a.series_id and b.series_name = name2;
	select Count(*) into limit1 from region as a,series as b where b.series_id = a.series_id and b.series_name = name;

	set counter = 0;
	set counter2 = 0;
	


	open my_cursor;

	while counter < limit1 do
		fetch my_cursor into x1,x2,y1,y2;
		set counter = counter +1;
		
		
		select Count(*) into counter2 from region as a,series as b 
		where b.series_id = a.series_id and b.series_name = name2 
		and a.x1 <=x2 and a.x1>=x1
		and ((a.y2>=y1 and a.y2<=y2) or (a.y1>=y1 and a.y1<=y2));
		/*laterais e verticais tendo x1 como referencia de posicao*/

		if counter2 > 0 then
			return "TRUE";
		end if;

		select Count(*) into counter2 from region as a,series as b 
		where b.series_id = a.series_id and b.series_name = name2 
		and a.x2 <=x2 and a.x2>=x1
		and ((a.y2>=y1 and a.y2<=y2) or (a.y1>=y1 and a.y1<=y2));	

		/*laterais e verticais tendo x2 como referencia*/

		if counter2 > 0 then
			return "TRUE";
		end if;
		
		select Count(*) into counter2 from region as a,series as b 
		where b.series_id = a.series_id and b.series_name = name2 
		and a.x1 <=x1 and a.x2>=x2
		and ((a.y2>=y1 and a.y2<=y2) or (a.y1>=y1 and a.y1<=y2));
		/*esta e a proxima para aquelas intersecç~oes laterais manhosas*/

		if counter2 > 0 then
			return "TRUE";
		end if;

		select Count(*) into counter2 from region as a,series as b 
		where b.series_id = a.series_id and b.series_name = name2 
		and a.y1 <=y1 and a.y2>=y2
		and ((a.x2>=x1 and a.x2<=x2) or (a.x1>=x1 and a.x1<=x2));

		if counter2 > 0 then
			return "TRUE";
		end if;

		select Count(*) into counter2 from region as a,series as b 
		where b.series_id = a.series_id and b.series_name = name2 
		and a.x1 <=x1 and a.x2>=x2 and a.y1<=y1 and a.y2>=y2;
		/*quando uma regiao engloba a outra*/

		if counter2 > 0 then
			return "TRUE";
		end if;


	end while;

	return "FALSE";
				

end$$
delimiter ;