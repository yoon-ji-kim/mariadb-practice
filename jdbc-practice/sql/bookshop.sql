-- bookshop
desc book;
desc author;
select * from author;
select * from book;
select no, name
from author
order by no;

insert into author values(null, "김윤지");
delete from author
where name ='김윤지';
insert into book(no, title, author_no) values(null, "트와일라잇", 1);
select * from book;

select a.no, a.title, a.rent, b.name
from book a
join author b
on a.author_no = b.no;

update book
set rent = 'Y'
where no = ;
select no, rent
from book
where no = 1;