-- 문제1. 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select count(*)
from salaries
where salary >= (select avg(salary)
				from salaries
				where to_date = '9999-01-01')
and to_date = '9999-01-01';
-- (X)문제2. 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 

-- 문제3. 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 급여를 조회하세요 
-- 부서별 평균 급여
select c.dept_name, avg(a.salary)
from salaries a, dept_emp b, departments c
where a.emp_no = b.emp_no
	and b.dept_no = c.dept_no
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
group by c.dept_name;
select a.emp_no, a.first_name, b.salary, d.dept_name
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
	and b.to_date = '9999-01-01'
    and c.to_date = '9999-01-01';
    and d.dept_name = e.dept_n;
                                
-- 문제4. 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.

-- 문제5. 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 급여을 조회하고 연봉 순으로 출력하세요.

-- 문제6. 평균 연봉이 가장 높은 부서는? 
-- 부서이름, 평균 급여

-- 문제7. 평균 연봉이 가장 높은 직책?
-- 직책, 평균급여

-- 문제8. 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.
-- 
