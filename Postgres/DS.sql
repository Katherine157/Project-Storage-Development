create table FT_BALANCE_F(
  on_date date not null,
  account_rk int not null,
  currency_rk int,
  balance_out float
);

create table FT_POSTING_F(
  oper_date date not null,
  credit_account_rk int not null,
  debet_account_rk int not null,
  credit_amount float,
  debet_amount float
);

create table MD_ACCOUNT_D(
  data_actual_date date not null,
  data_actual_end_date date not null,
  account_rk int not null,
  account_number varchar(20) not null,
  char_type varchar(1) not null,
  currency_rk int not null,
  currency_code varchar(3) not null
);

create table MD_CURRENCY_D(
  currency_rk int not null,
  data_actual_date date not null,
  data_actual_end_date date,
  currency_code varchar(3),
  code_iso_char varchar(3)
);

create table MD_EXCHANGE_RATE_D(
  data_actual_date date not null,
  data_actual_end_date date,
  currency_rk int not null,
  reduced_cource float,
  code_iso_num varchar(3)
);

create table MD_LEDGER_ACCOUNT_S(
  chapter char(1),
  chapter_name varchar(16),
  section_number int,
  section_name varchar(22),
  subsection_name varchar(21),
  ledger1_account int,
  ledger1_account_name varchar(47),
  ledger_account int not null,
  ledger_account_name varchar(153),
  characteristic char(1),
  is_resident int,
  is_reserve int,
  is_reserved int,
  is_loan int,
  is_reserved_assets int,
  is_overdue int,
  is_interest int,
  pair_account varchar(5),
  start_date date not null,
  end_date date,
  is_rub_only int,
  min_term varchar(1),
  min_term_measure varchar(1),
  max_term varchar(1),
  max_term_measure varchar(1),
  ledger_acc_full_name_translit varchar(1),
  is_revaluation varchar(1),
  is_correct varchar(1)
);

alter table FT_BALANCE_F
add constraint ft_balance_f_pk primary key(on_date, account_rk);

alter table FT_POSTING_F
add constraint ft_posting_f_pk primary key(oper_date, credit_account_rk, debet_account_rk);

alter table MD_ACCOUNT_D
add constraint md_account_d_pk primary key(data_actual_date, account_rk);

alter table MD_CURRENCY_D
add constraint md_currency_d_pk primary key(currency_rk, data_actual_date);

alter table MD_EXCHANGE_RATE_D
add constraint md_exchange_date_d primary key(data_actual_date, currency_rk);

alter table MD_LEDGER_ACCOUNT_S
add constraint md_ledger_account_s_pk primary key(ledger_account, start_date);

