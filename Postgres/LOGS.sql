create table logs(
datetime_change timestamp default now(),
"source" varchar(50),
datetime_action date,
"action" varchar(50))
