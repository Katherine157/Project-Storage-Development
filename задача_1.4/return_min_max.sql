create or replace function dm.return_min_max (i_date date, out oper_dt date, out min_credit float8, out max_credit float8, out min_debet float8, out max_debet float8)
returns setof record as $$

begin
	
	return query
	select oper_date, min(credit_amount) as min_credit_amount, max(credit_amount) as max_credit_amount, min(debet_amount) as min_debet_amount, max(debet_amount) as max_debet_amount
	from ds.ft_posting_f
	where oper_date = i_date
	group by oper_date;

end;

$$ language plpgsql;

select * from dm.return_min_max ('09.01.2018')




