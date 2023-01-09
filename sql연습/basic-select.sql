-- select 연습
select * from departments;
-- 프로젝션
-- 예제 1: employees 테이블에서 직원의 이름,  성별, 입사일을 출력
select dept_name, dept_no
	from departments;

-- alias 별칭(AS, 생략 가능)
-- 예제2 : employees 테이블에서 직원의 이름,  성별, 입사일을 출력
select  first_name AS '이름', gender AS '성별', hire_date AS '입사일'
from employees;
-- 문자열 결합함수 concat()
select concat(first_name , ' ', last_name) AS '이름'
from employees;