create or replace function users(size int,  type varchar) 
returns record language plpgsql as
$$
	declare
		s int := size;
		i int;
		j int := 1;
		z int := 2;
	begin
		if type = 'odd' then
			for i in 1..s loop
				raise info '% | User% ', i, j;
				j := j + 2;
			end loop;
		end if;
		if type = 'even' then
		    for i in 1..s loop
				raise info '% | User%', i, z;
				z := z + 2;
			end loop;
		end if;
	end;
$$;





--------------------------------




create table users(
  id serial not null primary key,
  name varchar not null
);

insert into users(id,name)
  select tn, 'User' || tn
    from generate_series(1,200) as tn
;

create or replace function users(users_num int, step varchar) returns record language plpgsql as 
$$

  declare 
 
    out varchar;
    num int := 0;
    i int := 1;

  begin

    if step = 'even' then

      for out in select u.name from users as u loop

        num := num + 1;

        if (num % 2) = 0 then

          raise info '% | %',i, out;

        end if;

        exit when num = users_num;

      end loop;

      elsif step = 'odd' then

          for out in select u.name from users as u loop

        num := num + 1;
        i := i + 1;

        if (num % 2) != 0 then

          raise info '% | %',i, out;

        end if;

        exit when num = users_num;

      end loop;

    end if;

  end;

$$;

















