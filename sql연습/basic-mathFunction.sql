-- 수학 함수

-- abs 절대값
select abs(1), abs(-1) from dual;

-- ceil 올림
select ceil(3.14), ceiling(3.14) from dual;

-- floor 내림
select floor(3.14), floor(3.96) from dual;

-- mod 나머지
select mod(10, 3), 10%3 from dual;

-- round(x): x에 가장 근접한 정수
-- round(x, d): x 값 중 소수점 d자리에 근접한 수a
select round(1.498), round(1.501) from dual;
select round(1.498, 1), round(1.501, 0) from dual;

-- pow(x,y), power(x,y) : x의 y 제곱
select pow(2, 10), power(2,10) from dual;

-- sign(x) : x가 양수면 1, 음수면 -1, 0이면 0 
select sign(20), sign(-100), sign(0) from dual;

-- greatest(x, y, ...): 최대값, least(x, y, ...): 최소값  문자에도 가능(아스키코드)
select greatest(10, 40, 20, 50), least(10, 40, 20, 50) from dual;
select greatest('b', 'A', 'C', 'D'), least('hello', 'hela', 'hell') from dual;