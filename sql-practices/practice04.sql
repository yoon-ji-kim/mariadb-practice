-- 문제1. 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select count(*)
from salaries
where salary >= (select avg(salary)
				from salaries
				where to_date = '9999-01-01')
and to_date = '9999-01-01';
-- (X)문제2. 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
-- 문제3. 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 급여를 조회하세요 
select a.emp_no as 사번, concat(a.first_name,' ',a.last_name) as 이름, b.salary as 급여
from employees a, salaries b, dept_emp c, departments d, (select c.dept_name as dept_n, avg(a.salary) as avg_salary
															from salaries a, dept_emp b, departments c
															where a.emp_no = b.emp_no
															and b.dept_no = c.dept_no
															and a.to_date = '9999-01-01'
															and b.to_date = '9999-01-01'
															group by c.dept_name) e
where a.emp_no = b.emp_no
	and b.emp_no = c.emp_no
    and c.dept_no = d.dept_no
    and e.dept_n = d.dept_name
	and b.to_date = '9999-01-01'
    and c.to_date = '9999-01-01'
    and d.dept_name = e.dept_n
    and b.salary > e.avg_salary
order by 급여;
-- 문제4. 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
select a.emp_no as 사번, concat(a.first_name,' ',a.last_name) as 이름, d.mngName as 매니저이름, d.deptName as 부서이름
from employees a, dept_emp b , departments c, (select b.dept_no as deptno, b.dept_name as deptName, concat(c.first_name,' ',c.last_name) as mngName
												from dept_manager a, departments b, employees c
													where a.dept_no = b.dept_no
												and a.emp_no = c.emp_no
												and to_date = '9999-01-01') d
where a.emp_no = b.emp_no
	and b.dept_no = c.dept_no
    and c.dept_name = d.deptName
    and b.to_date = '9999-01-01'
    and c.dept_no = d.deptno
order by 사번;
-- 문제5. 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 급여을 조회하고 연봉 순으로 출력하세요.
select a.emp_no as 사번, concat(first_name,' ', last_name) as 이름, title as 직책, salary as 급여
from employees a, titles b, salaries c, dept_emp d, departments e
where a.emp_no = b.emp_no
	and a.emp_no = c.emp_no
    and a.emp_no = d.emp_no
    and d.dept_no = e.dept_no
    and b.to_date = '9999-01-01'
    and c.to_date = '9999-01-01'
    and e.dept_name in (select d.dept_name 
						from departments d, (select dept_name, max(a.avg_salary)
												from (	select dept_name, avg(salary) as avg_salary
														from salaries a, dept_emp b, departments c
														where a.emp_no = b.emp_no
														and b.dept_no = c.dept_no
														and b.to_date = '9999-01-01'
														group by dept_name
														order by avg_salary desc) a
											) b
						where d.dept_name = b.dept_name) 
order by 급여 desc;
-- 문제6. 평균 연봉이 가장 높은 부서는? 
-- 부서이름, 평균 급여
select dept_name as 부서, max(a.avg_salary) as 평균급여
from (select dept_name, avg(salary) as avg_salary
		from salaries a, dept_emp b, departments c
		where a.emp_no = b.emp_no
		and b.dept_no = c.dept_no
		and b.to_date = '9999-01-01'
	group by dept_name
	order by avg_salary desc) a;
-- 문제7. 평균 연봉이 가장 높은 직책?
-- 직책, 평균급여
select title as 직책, avg(salary) as 평균급여
from titles a, salaries b
where a.emp_no = b.emp_no
group by title
order by avg(salary) desc
limit 0, 1;
-- 문제8. 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.
select f.dept_name as 부서, concat(a.first_name,' ',a.last_name) as 사원이름, d.salary as 연봉, e.mngName as 매니저이름, e.mngSalary as 매니저연봉
from employees a, dept_emp b, dept_manager c, salaries d, departments f,(select b.dept_no as deptNo,concat(c.first_name,' ',c.last_name) as mngName, a.salary as mngSalary
															from salaries a, dept_manager b, employees c
															where a.emp_no = b.emp_no
																and b.emp_no = c.emp_no
																and a.to_date ='9999-01-01'
																and b.to_date = '9999-01-01') e
where a.emp_no = b.emp_no
	and b.dept_no = c.dept_no
    and a.emp_no = d.emp_no
    and b.dept_no = e.deptNo
    and b.dept_no = f.dept_no
    and b.to_date ='9999-01-01'
    and c.to_date ='9999-01-01'
    and d.to_date ='9999-01-01'
    and d.salary > e.mngSalary
order by 사원이름 desc;