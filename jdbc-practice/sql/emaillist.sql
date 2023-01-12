-- emaillist query

-- select (list)
select no, first_name, last_name, email
from emaillist
order by no desc;
-- delete (delete -> list)
delete from emaillist
where email = 'dooly@gmail.com';
-- insert
insert into emaillist
values(null, '둘','리', 'dooly@gmail.com');