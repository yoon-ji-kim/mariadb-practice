-- subquery
-- 1) select절
--   insert values(..)의 서브쿼리
-- 2) from절
select a.n, a.r
from (select now() as n, sysdate() as s, 3+1 as r from dual) a;
-- 3) where절
-- 예제) 현재 , Fail Bale이 근무하는 부서에서 근무하는 다른 직원의 사번, 이름 출력
-- 1) Fail Bale이 근무하는 부서 구하기
select b.dept_no
from employees a, dept_emp b
where a.emp_no = b.emp_no
	and b.to_date = '9999-01-01'
    and concat(a.first_name, ' ', a.last_name) = 'Fai Bale';
-- 2) 
select a.emp_no, a.first_name
from employees a, dept_emp b
where a.emp_no = b.emp_no
	and b.to_date = '9999-01-01'
    and b.dept_no = (select b.dept_no
					from employees a, dept_emp b
					where a.emp_no = b.emp_no
						and b.to_date = '9999-01-01'
						and concat(a.first_name, ' ', a.last_name) = 'Fai Bale');
                        
-- 단일행 연산자 : =, <, >, >=, <=, <>, !=
-- 실습 문제 1: 현재 전체 사원의 평균 연봉보다 적은 급여를 받는 사원의 이름, 급여 출력
select avg(salary)
from salaries
where to_date = '9999-01-01';

select first_name, b.salary
from employees a, salaries b
where a.emp_no = b.emp_no
	and to_date = '9999-01-01'
	and salary < ( select avg(salary)
					from salaries
					where to_date = '9999-01-01')
order by b.salary desc;

-- 실습 문제 2: 현재 가장 적은 평균 급여의 직책과 그 평균 급여를 출력
-- 1) 직책별 평균 급여
select title, avg(salary) as avg_salary
from titles a, salaries b
where a.emp_no =b.emp_no
	and a.to_date ='9999-01-01'
    and b.to_date = '9999-01-01'
group by a.title;
-- 2) 직책별 가장 적은 평균 급여
select min(a.avg_salary)
from (select title, avg(salary) as avg_salary
		from titles a, salaries b
		where a.emp_no =b.emp_no
			and a.to_date ='9999-01-01'
			and b.to_date = '9999-01-01'
		group by a.title) a;
-- sol 1) sub query
select title, avg(salary) as avg_salary
		from titles a, salaries b
		where a.emp_no =b.emp_no
			and a.to_date ='9999-01-01'
			and b.to_date = '9999-01-01'
		group by a.title
        having avg_salary = (select min(a.avg_salary)
							from (select title, avg(salary) as avg_salary
									from titles a, salaries b
									where a.emp_no =b.emp_no
									and a.to_date ='9999-01-01'
									and b.to_date = '9999-01-01'
									group by a.title) a);
-- sol2) top -k
select title, avg(salary) as avg_salary
from titles a, salaries b
where a.emp_no =b.emp_no
	and a.to_date ='9999-01-01'
	and b.to_date = '9999-01-01'
group by a.title
order by avg_salary asc  -- order by 하고 limit 해야함
limit 0, 1; -- offset , 개수
 
-- 복수행 연산자 : in, not in, any비교연산자, all
 -- 1) any
    -- 1. = any : in
    -- 2. >any, >= any : 최소값
    -- 3. <any, <= any : 최대값
    -- 4. <>any, !=any: not in
 -- 2) all
	-- 1. = all : x
    -- 2. > all, >= all : 최대값
    -- 3. < all, <= all : 최소값
    -- 4. <> all, != all : 다른 값

-- 실습문제3: 현재 급여가 5000이상인 직원의 이름과 급여를 출력
-- sol1)
select a.first_name, b.salary
	from employees a, salaries b
    where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
    and b.salary > 50000
order by b.salary asc;
-- sol2) subquery
select emp_no, salary
from salaries
where to_date = '9999-01-01'
and salary > 50000;

select a.first_name, b.salary
	from employees a, salaries b
    where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
    and (a.emp_no, b.salary) in (select emp_no, salary
								from salaries
								where to_date = '9999-01-01'
								and salary > 50000)
order by b.salary asc;

-- 실습문제 4: 현재 각 부서별로 최고 급여를 받고 있는 직원 이름과 월급을 출력
-- ex) 결과 : 총무 둘리 4000
--   		 영업 또치 5000
select a.dept_no, max(b.salary)
	from dept_emp a, salaries b
where a.emp_no = b.emp_no
	and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
group by a.dept_no;
-- sol1: where절 subquery(in)
select a.dept_name, c.first_name, d.salary
from departments a, dept_emp b, employees c, salaries d
	where a.dept_no = b.dept_no
		and b.emp_no = c.emp_no
        and c.emp_no = d.emp_no
        and b.to_date = '9999-01-01'
        and d.to_date = '9999-01-01'
        and (a.dept_no, d.salary) in (select a.dept_no, max(b.salary)
										from dept_emp a, salaries b
										where a.emp_no = b.emp_no
											and a.to_date = '9999-01-01'
											and b.to_date = '9999-01-01'
									group by a.dept_no); 
-- sol2: from절 subquery & join

select a.dept_name, c.first_name, d.salary
from departments a, dept_emp b, employees c, salaries d, (select a.dept_no, max(b.salary) as max_salary
															from dept_emp a, salaries b
															where a.emp_no = b.emp_no
															and a.to_date = '9999-01-01'
															and b.to_date = '9999-01-01'
															group by a.dept_no) e
	where a.dept_no = b.dept_no
	and b.emp_no = c.emp_no
	and c.emp_no = d.emp_no
	and a.dept_no = e.dept_no
    and b.to_date = '9999-01-01'
	and d.to_date = '9999-01-01'
    and d.salary = e.max_salary;