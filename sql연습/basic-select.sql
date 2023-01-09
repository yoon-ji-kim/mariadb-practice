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

-- DISTINCT 중복행 제거
-- 예제 : titles 테이블에서 모든 직급의 이름 출력
select DISTINCT(title)
from titles;

-- WHERE절 
-- 예제 :employees 테이블에서 1991년 이전에 입사한 직원의 이름, 성별, 입사일을 출력
-- 산술 비교 연산
SELECT first_name, gender, hire_date
	FROM employees
	WHERE hire_date < '1991-01-01';
-- ORDER BY hire_date DESC;

-- 예제2: employees 테이블에서 1989년 이전에 입사한 여직원의 이름, 입사일을 출력
-- 논리 연산
select first_name, hire_date
	from employees
	where hire_date < '1989-01-01'
		and gender = 'f';

-- 예제 3: dept_emp 테이블에서 부서 번호가 d005나 d009에 속한 사원의 사번, 부서번호 출력
-- IN 연산
select emp_no, dept_no
	from dept_emp
	where dept_no = 'd005' 
		or dept_no = 'd009';
    
select emp_no, dept_no
	from dept_emp
	where dept_no in ('d005', 'd009');

-- 예제 4: employees 테이블에서 1989년에 입사한 직원의 이름, 입사일을 출력
-- LIKE 검색
select first_name, hire_date
	from employees
    where '1989-01-01' <= hire_date
		and hire_date <= '1989-12-31';
        
select first_name, hire_date
	from employees
    where hire_date between '1989-01-01' and '1989-12-31';

select first_name, hire_date
	from employees
    where hire_date like '1989%';

-- order by ASC, DESC
-- default는 ASC
-- 화면 출력을 위해 order by는 제일 마지막에 수행됨 

-- 예제 1: employees 테이블에서 직원의 전체이름,  성별, 입사일을  입사일 순으로 출력
select concat(first_name,' ',last_name) as name, gender, hire_date
	from employees
	order by hire_date asc;


-- 예제 2: 예제 : salaries 테이블에서 2001년 월급을 가장 높은순으로 사번, 월급순으로 출력
select emp_no, salary
	from salaries
	where from_date like '2001%'
		or to_date like '2001%'
	order by salary desc;

-- 예제 3: 남자 직원 이름, 성별, 입사일을 입사일순(선임순)으로 출력하시오
select first_name as '이름', gender as '성별', hire_date as '입사일'
	from employees
	where gender = 'm'
	order by 입사일 asc;

-- 예제 4: 직원들의 사번, 월급을 조회할 때 사번은 오름차순, 월급은 내림차순으로 출력
select emp_no, salary, from_date, to_date
	from salaries
	order by emp_no asc, salary desc;
-- 현재 date => 9999-01-01