-- bookshop
desc book;
desc author;
select * from author;
select * from book;
select no, name
from author
order by no;

insert into author values(null, ?);