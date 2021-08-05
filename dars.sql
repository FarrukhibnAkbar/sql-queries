create or replace function fn(inout x int) returns int language plpgsql as
$$
	begin
		x := x * x;

	end;

$$;

----------------


create or replace function fn(inout x int, inout y int) language plpgsql as
$$
	begin
		x := x * x;
		y := y + y;
	end;

$$;



------------------


do 
$$
	
	declare
		i int := 0;
		name books%rowtype;

	begin	

		loop

			exit when i = 10;

			i = i + 1;

			select
			 	*
			from
				books
			into
				name
			where
				book_id = i;

			continue when not found;

			raise info '%', name.name;

		end loop;

	end;

$$;



-----------------------

create function books(inout x int) returns varchar language plpgsql as
$$

	declare
		book books%rowtype;

	begin	

		exit when x;

		x = x + 1;

		select
			*
		from
			books
		into	
			book
		where
			book_id = x;
		continue when not found;

		raise info '%', book.name;

	end;

$$;

-----------------

create or replace function library(b_id int) returns varchar language plpgsql as
$$

	declare
		book books%rowtype;

	begin

		select * from books into book where book_id = b_id;

		if found then

			return book.name;

		else

			return(select name from books where book_id = 
			(select max(book_id) from books)
			);

		end if;

	end;

$$;	


-----------------

do
$$

	declare
		q text := 'select * from';
		t text := 'books';
		r record;

	begin 

		for r in execute q || ' ' || t loop

			raise info '%', r.name;

		end loop;

	end;

$$;






-------------------



do 
$$
	
	declare
		i int;

	begin

		for i in 1...10 loop

			raise info '%', i;

		end loop;

	end;

$$;





-----------------


select *
from generate_series(1,10)
;

---------------

select *
from generate_series(

	'1994-01-12 00:00' :: timestamp,
	'2021-01-12 00:00' :: timestamp,
	'1 year'
) as t(year)
;


------------------

--Homework














