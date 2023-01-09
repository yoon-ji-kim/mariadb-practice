-- 집계 함수 : select절에 통계함수(avg, max, min, count, sum, stddev(표준편차), varance(분산), ...)

select avg(salary), sum(salary), max(salary)
from salaries;

-- select 절에 그룹함수(통계함수)가 있는 경우, 어떤 컬럼도 select절에 올 수 없다
-- emp_no는 아무의미가 없음
-- 오류*****
select emp_no, avg(salary) -- logical error
from salaries;

-- 쿼리 순서
-- 1) from: 접근 테이블 확인
-- 2) where: 조건에 맞는 row 선택(임시테이블 생성)
-- 3) 집계 (결과테이블, order by)
-- 4) projection 표현
-- 예시: 사번이 10060인 사원이 받은 평균 월급은?
select avg(salary)
from salaries
where emp_no = '10060';

-- group by :집계함수 사용시 사용
-- 5) group by에 참여하고 있는 컬럼은 projection 가능: select절에 올 수 있다
-- having 절
-- 예제: 사원별 평균 월급은?
select emp_no, avg(salary)
from salaries
group by emp_no;

-- 6) having
-- 집계 결과(결과 테이블)에서 row를 선택해야 하는 경우
-- 이미 where절은 실행 되어서 having절에서 조건을 주어야 한다.
-- 예제: 평균 월급이 60,000 달러 이상인 사원의 사번과 평균 월급 출력
-- 통계과 낸 결과 테이블에서 해야해서 having!
select emp_no, avg(salary) as avg_salary
from salaries
group by emp_no
having avg_salary > 60000   -- 결과 테이블 컬럼이름이 avg(salary)
order by avg_salary asc;

-- 7) order by
-- 항상 맨 마지막 출력 전 실행

-- 주의)
-- 예) 사번이 10060인 사원의 사번, 급여평균, 급여총합을 출력하세요
-- 의미적으로 맞지만 문법적 오류!
select emp_no, avg(salary), sum(salary) -- 에러!!  select 절에 그룹함수(통계함수)가 있는 경우
from salaries
where emp_no = 10060;
-- --> 수정
select emp_no, avg(salary), sum(salary)
from salaries
group by emp_no
having emp_no = 10060;