--  문자열 함수

-- upper, ucase 문자를 대문자로 
select upper('busan'), upper('Busan'), upper('BuSaN') from dual;
select upper(first_name), last_name
	from employees
    order by upper(first_name); -- 정렬하는 컬럼명을 써줘야함
-- lower,lcase 문자를 소문자로
select lower('BUSAN'), lower('Busan'), lower('BuSaN') from dual;
select lower(first_name), last_name
	from employees
    order by lower(first_name);

-- substring(문자열, index, length) 문자 자르기, 첫 인덱스는 1
select substring('Hello World', 3, 2);

-- 예제) 1989년에 입사한 사원들의 이름, 입사일을 출력
select first_name, hire_date
from employees
where substring(hire_date, 1, 4) = 1989;

-- lpad(왼쪽 정렬), rpad(오른쪽 정렬)
--           문자 , 길이 , 비어있으면 채울 문자
select lpad('1234', 10, '-'), rpad('1234', 10, '-') from dual;

-- 예제) 직원들의 월급을 오른쪽 정렬(빈 공간은 *) 출력
select lpad(salary, 10, '*')
from salaries;

-- trim, ltrim, rtrim
-- trim: both, leading, trailing
select ltrim('     hello     ');
select rtrim('     hello     ');
select concat('---', ltrim('     hello     '), '---'), 
	   concat('---', rtrim('     hello     '), '---'),
       concat('---', trim(both ' ' from '     hello     '), '---'), -- ' ' 지우기
       concat('---', trim(both 'x' from 'xx hello x xx'), '---'), -- x 지우기
       concat('---', trim(leading ' ' from '     hello     '), '---'),
       concat('---', trim(trailing ' ' from '     hello     '), '---')
from dual;

-- length
select length('Hellow World') from dual;
