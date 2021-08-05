create table authors(
	id serial not null primary key,
	firstname varchar(20) not null,
	lastname varchar(20) null
);


create table books (
	book_id serial not null primary key,
	name varchar(20),
	price decimal(18),
	author_id int not null references authors(id)
);





insert into authors(firstname) values('Farrux');

insert into books(name, author_id) values('Vaqt',1);









	





