create table users (
	user_id int generated always as identity,
	username character varying(20) not null,
	password character varying(60) not null,
	firstname character varying(20) not null,
	lastname character varying(20) null,
	birth date null,
	gender smallint,
	is active bool default true
);


create table attendance (
	attendance_id int generated by default as identity
);