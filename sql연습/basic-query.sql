select version(), current_date(), now() from dual;
-- 사칙연산, 수학함수 가능
select sin(pi() /4), 1+2+3+4 from dual;

-- 대소문자 구분 안함
select VERSION(), CURRENT_date(), now() from dual;

select sin(pi() /4); select 1+2+3+4 from dual;
show databases;

use test;
show tables;

drop table pet;
-- table 생성: DML
create table pet (
	name varchar(100),
    owner varchar(20),
    species varchar(20),
    gender char(1), -- f또는 m
    birth date,
    death date
);

-- shema 확인
desc pet;
describe pet;

-- table, database 삭제
drop table pet;

show tables;
-- insert :DML(C)
insert into pet 
values('별이','김윤지','dog','f','2019-12-01', null);
select * from pet; --