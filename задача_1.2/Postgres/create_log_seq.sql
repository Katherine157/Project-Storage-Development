create table dm.lg_messages ( 	
		record_id int,
		date_time date,
		pid int,
		message text,
		message_type text,
		usename text, 
		datname text, 
		client_addr text, 
		application_name text,
		backend_start text
    );


create sequence dm.seq_lg_messages increment 1 start 3 