-- 날짜 함수alter

-- curdate() 함수, current_date 상수: 오늘 날짜를 YYYY-MM-DD/ YYYYMMDD 형식으로 반환
select curdate(), current_date from dual;

-- curtime(), current_time: 현재 시간을 반환
select curtime(), current_time from dual;

-- now() vs sysdate()
select now(), sysdate() from dual;
select now(), sleep(2), now() from dual; -- 시작할 때 
select sysdate(), sleep(2), sysdate() from dual; -- 실행될 때 시간

-- date_format()
-- 2023-01-09 15:19:20 (기본 포맷)
select date_format(now(), '%Y-%m-%d %h:%i:%s') from dual;
select date_format(now(), '%Y년 %m월 %d일 %h시 %i분%s초') from dual;
select date_format(now(), '%d %b \'%y') from dual;

-- period_diff(p1, p2) :p1과 p2의 차이 개월 수
-- 포맷은 YYMM 또는 YYYYMM
-- 예시) 근무개월 출력
select first_name, hire_date, period_diff(date_format(curdate(), '%Y%m'), date_format(hire_date, '%Y%m')) as month
	from employees
order by month desc;

-- date_add(=add date), date_sub(=subdate)
-- 날짜를 date 타입의 컬럼이나 값에 type(year, month, day)의 표현식으로 더하거나 뺄 수 있다.
-- 예) 각 사원들의 근속 년 수가 5년이 되는 날에 휴가를 보내준다면 각 사원의 5년 근속 휴가 날짜는?
select first_name, hire_date,
	date_add(hire_date, interval 5 year)
	from employees;

-- cast
select '12345' + 10, cast('12345' as int) + 10 from dual;
select date_format(cast('2023-01-09'as date), '%Y년 %m월 %d일') from dual;
select cast(1-2 as unsigned) from dual;
select cast(cast(1-2 as unsigned) as signed) from dual;
select cast(cast(1-2 as unsigned) as int) from dual;
select cast(cast(1-2 as unsigned) as integer) from dual;

-- type
-- 문자: varchar(길이), char, text, CLOB(Character Large Object)
-- 정수: medium int, int/integer(signed), unsigned, big int
-- 실수: float, double
-- 시간: date, datetime
-- LOB: CLOB, BLOB(Binary Large Object)