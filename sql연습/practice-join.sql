-- inner join

-- 예제 1) 현재 근무하고 있는 직원의 이름과 직책을 모두 출력하세요.
select a.first_name, b.title
from employees a, titles b
where a.emp_no = b.emp_no 			-- join 조건(n-1개) :equi JOIN 
	and b.to_date = '9999-01-01';	-- row 선택 조건

-- 예제 2) 현재 근무하고 있는 직원의 이름과 직책을 여성 엔지니어(Engineer)만 출력하세요.
select a.first_name, a.gender, b.title
from employees a, titles b
where a.emp_no = b.emp_no				-- Join 조건(n-1개) 
	and b.to_date ='9999-01-01'				-- row 선택 조건1
	and a.gender = 'f'						-- row 선택 조건2
	and b.title = 'Engineer';				-- row 선택 조건3


/*
	ANSI/ISO SQL 1999 JOIN 표준 문법
    1) Natural Join
		조인 대상이 되는 두 테이블에 이름이 같은 공통 컬럼이 있으면 조인 조건을 명시하지 않고 암묵적으로 조인
	2) join ~ using
		natural join의 문제점인 
    3) join ~ on ****
*/

-- Natural Join
select a.first_name, b.title
	from employees a natural join titles b 	-- 이름이 같은 공통 컬럼으로 암묵적으로 조인
	where b.to_date = '9999-01-01';			-- row 선택 조건

-- Natural Join의 문제점
-- 현재 근무하고 있는 직원의 직책별 평균 급여
select title, avg(salary)
from  salaries a natural join titles b
where a.to_date ='9999-01-01'
	 and b.to_date = '9999-01-01';

-- using
select title, avg(salary)
from  salaries a join titles b
using(emp_no)
where a.to_date ='9999-01-01'
	 and b.to_date = '9999-01-01';

-- join ~on
-- 예제) 현재 직책별 평균 연봉을 큰 순서대로 출력하세요
select a.title, avg(b.salary) as avg_salary
from titles a
join salaries b
on a.emp_no = b.emp_no
where a.to_date = '9999-01-01'
	and b.to_date = '9999-01-01'    -- 임시 테이블
group by a.title					-- 직책별로 group만들고 평균연봉구해서 결과테이블 생성
order by avg_salary desc;		-- 결과테이블에서 정렬

-- 실습 문제 1) 현재 직원별 근무 부서를 사번, 직원 이름, 부서명 순으로 출력
select a.emp_no, a.first_name, c.dept_name
from employees a
join dept_emp b
	on a.emp_no = b.emp_no
join departments c
	on b.dept_no = c.dept_no
where b.to_date = '9999-01-01';
-- 실습 문제 2) 현재 지급되고 있는 급여를 사번, 직원이름, 급여 순으로 출력
select a.emp_no, a.first_name, b.salary
from employees a
join salaries b
	on a.emp_no = b.emp_no
where b.to_date = '9999-01-01';
-- 실습 문제 3) 현재 직책별 평균 연봉, 직책별 인원수 출력(단, 직책별 인원수가 100명 이상인 경우만)
-- 직책, 평균연봉, 직원수 순으로 출력
select a.title, avg(c.salary), count(b.emp_no) as count
from titles a
join employees b
	on a.emp_no = b.emp_no
join salaries c
	on b.emp_no = c.emp_no
where a.to_date = '9999-01-01'
	and c.to_date = '9999-01-01'
group by a.title
having count >= 100;

select title,avg(b.salary), count(*)
from titles a, salaries b
where a.emp_no =b.emp_no
	and a.to_date = '9999-01-01'
	and b.to_date = '9999-01-01' 
group by a.title
having count(*) >= 100;
-- 실습 문제 4) 현재 부서별로 직책이 Engineer인 직원들에 대해 평균 급여 출력
-- 부서이름, 평균금여 순으로 출력 (다시 ******)

select a.dept_name, avg(d.salary)
from departments a, dept_emp b, titles c, salaries d
where a.dept_no = b.dept_no
	and b.emp_no  = c.emp_no
    and c.emp_no = d.emp_no 						-- JOIN조건 n-1개
    and b.to_date = '9999-01-01'
    and c.to_date = '9999-01-01'
    and d.to_date = '9999-01-01'
    and c.title = 'Engineer'
group by a.dept_name
order by avg(d.salary) desc;
