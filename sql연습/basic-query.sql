select version(), current_date(), now() from dual;
-- 사칙연산, 수학함수 가능
select sin(pi() /4), 1+2+3+4 from dual;

-- 대소문자 구분 안함
select VERSION(), CURRENT_date(), now() from dual;

select sin(pi() /4); select 1+2+3+4 from dual;
show databases;

use webdb;
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
-- select : DML (R)
select * from pet; 
-- update : DML (U)
update pet 
	set name = '벼리'
	where name = '별이';
    
update pet
	set death = null
    where name = 'Bowser';
    
-- delete : DML(D)
delete from pet 
	where name = '벼리';
-- load data
load data local infile 'd:\pet.txt' into table pet;

-- 대소문자 구분 X, 내용 기반
-- select 
select * from pet
    where name ='bowser';
    
select name, species from pet
	where name = 'bowser';
    
select name, species
 from pet
 where birth >= '1998-01-01';
 
-- 논리식도 가능 
select name , species, gender
	from pet
    where species = 'dog'
    and gender = 'f';
    
select name , species
	from pet
    where species = 'snake'
    or species = 'bird';
    
-- 정렬 order by
-- 마지막에 실행되고, default는 asc
select name , birth
	from pet
    order by birth desc;
    
-- null (빈 값, 알 수 없는 값)
-- 비교 연산자 사용 불가, IS NULL 또는 IS NOT NULL 연산자 사용
select name, birth, death
	from pet
    where death IS NOT NULL;
-- LIKE 패턴 매칭
-- 포함된 문자 조회 _ :한문자, %:여러문자열
select name
	from pet
    where name like 'b%';
    
select name
	from pet
    where name like '%fy';
select name
	from pet
    where name like '%w%';
    
select name
	from pet
    where name like '_____';

select name
	from pet
    where name like 'b____';

-- count 
-- null이 아닌 결과의 수
select count(*)
	from pet;
    
select count(death)
	from pet;
-- --->
select count(*)
	from pet
    where death is not null;
    
-- grant 계정/권한 관리 
select * from departments;