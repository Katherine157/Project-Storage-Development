create or replace procedure dm.launch_fill_account()
language plpgsql

as $procedure$

declare 
	i_OnDate date := '01.01.2018';
	i int := 1;
	
begin 
	while i <= 31 loop
		
	call ds.fill_account_turnover_f(i_OnDate);

	i := i + 1;
	i_OnDate := i_OnDate + interval '1 DAY';
	
	end loop;

commit;

end; $procedure$

