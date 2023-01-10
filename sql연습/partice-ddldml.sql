
create table member (
	no int not null auto_increment,
    email varchar(100) not null,
    password varchar(64) not null,
    name varchar(100) not null,
    department varchar(100),
    primary key(no)
);

desc member; -- 스키마 확인

alter table member add  column juminbunho char(13) not null;
alter table member drop juminbunho;
alter table member add column juminhunho char(13) not null after email;
desc member;

alter table member change column department dept varchar(200) not null;
alter table member add self_intro text;

alter table member drop juminbunho;
desc member;

-- DML
select * from member;
-- insert
insert into member 
	values(null ,'lyly5@gmail.com', password('2345'), '김윤지5', '개발팀5', null);
insert into member (no, email, name, dept, password)
	values(null ,'lyly@gmail.com', '김윤지', '개발팀', password('2345'));
-- update
update member
	set email = 'lily@gmail.com', password =password('5678')
    where no = 3;
-- delete
delete from member
	where no = 3;
    
-- transaction
select @@autocommit;  -- 1: 자동 commit  --> 0으로 바꿔서 transaction 관리해야함 commit, rollback
set autocommit =0; 
select * from member;
commit;

select * from member;