SELECT first_name
FROM employees;

-- 주석처리

-- 도구 > 환경설정 > 코드편집기 > 글꼴 > 크기 조정

-- CTRL + Enter : 실행
SELECT * FROM employees;
SELECT * FROM tab;

/*
컬럼명, 테이블명에 별칭(alias)를 지정할 수 있다.
별칭(alias)에 공백이 있을 때는 " "(쌍따옴표)를 지정한다.
*/
SELECT salary, salary*10 AS bonus
FROM employees;

SELECT salary, salary*10 AS 보너스
FROM employees;

SELECT salary, salary*10 AS "b o n u s"
FROM employees;

-- King님의 급여는 24000입니다.
SELECT last_name || '님의 급여는 ' || salary || '입니다.' AS name
FROM employees;


-- DISTINCT는 중복제거를 한 후 출력해 주는 명령어이다.
SELECT DISTINCT first_name
FROM employees;

SELECT DISTINCT first_name, last_name
FROM employees;

/*
first_name last_name
sunder      Abel
sunder      Abel
sunder        Ande
*/

/*
-- SELECT 입력순서
SELECT column_name, column name2
FROM table_name
WHERE column_name='value'
GROUP BY column_name
HAVING column_name='value'
ORDER BY column_name ASC, column_name DESC;

-- SELECT 해석 순서
FROM table_name
WHERE column_name='value'
GROUP BY column_name
HAVING column_name='value'
SELECT column_name, column name2
ORDER BY column_name ASC, column_name DESC;
*/

--employees테이블에서 salary이 3000미만 일때의
--first_name, salary를 출력하라.
SELECT first_name, salary
FROM employees
WHERE salary < 3000;

--employees테이블에서 first_name컬럼의 값이 'David' 일때의
--first_name, salary를 출력하라.
SELECT first_name, salary
FROM employees
WHERE first_name = 'David';

--employees테이블에서 first_name컬럼의 값이 'David' 아닐때의
--first_name, salary를 출력하라.
SELECT first_name, salary
FROM employees
WHERE first_name != 'David';

SELECT first_name, salary
FROM employees
WHERE first_name <> 'David';

--&&(and), ||(or)
--employees테이블에서 salary이 3000, 9000, 17000일때
--first_name, hire_date, salary를 출력하라.
SELECT first_name, hire_date, salary
FROM employees
WHERE salary = 3000 OR salary = 9000 OR salary = 17000;

SELECT first_name, hire_date, salary
FROM employees
WHERE salary IN(3000, 9000, 17000);


--employees테이블에서 salary이 3000부터 5000까지 일때의
--first_name, hire_date, salary를 출력하라.
SELECT first_name, hire_date, salary
FROM employees
WHERE salary >= 3000 AND salary <= 5000;

SELECT first_name, hire_date, salary
FROM employees
WHERE salary BETWEEN 3000 AND 5000;

--employees테이블에서 job_id가 'IT_PROG'가 아닐때
--first_name, email, job_id를 출력하라.
SELECT first_name, email, job_id
FROM employees
WHERE job_id != 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE job_id <> 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE job_id ^= 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE NOT(job_id = 'IT_PROG');

--&&(and), ||(or)
--employees테이블에서 salary이 3000, 9000, 17000 아닐때의
--first_name, hire_date, salary를 출력하라.
SELECT first_name, hire_date, salary
FROM employees
WHERE NOT(salary = 3000 OR salary = 9000 OR salary = 17000);

SELECT first_name, hire_date, salary
FROM employees
WHERE salary NOT IN(3000, 9000, 17000);

--employees테이블에서 salary이 3000부터 5000까지 아닐때의
--first_name, hire_date, salary를 출력하라.
SELECT first_name, hire_date, salary
FROM employees
WHERE NOT(salary >= 3000 AND salary <= 5000);

SELECT first_name, hire_date, salary
FROM employees
WHERE salary NOT BETWEEN 3000 AND 5000;

--employees테이블에서 commission_pct이 null일때
--first_name, salary, commission_pct를 출력하라.
SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NULL;

--employees테이블에서 commission_pct이 null이 아닐때
--first_name, salary, commission_pct를 출력하라.
SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

--employees테이블에서 first_name에 'der'이 포함이 된
--first_name, salary, email을 출력하라.
SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE '%der%';


--employees테이블에서 first_name의 값중 'A'로 시작하고
--두번째 문자는 임의 문자이면 'exander'로 끝나는
--first_name, salary, email을 출력하라.
SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE 'A_exander';

/*
WHERE절에서 사용된 연산자 3가지 종류
1 비교연산자 : = > >= < <= != <> ^=
2 SQL연산자 : BETWEEN a AND b, IN, LIKE, IS NULL
3 논리연산자 : AND, OR, NOT

우선순위
1 괄호()
2 NOT 연산자
3 비교연산자, SQL연산자
4 AND
5 OR
*/

--employees테이블에서 job_id를 오름차순으로
--first_name, email, job_id를 출력하라.
SELECT first_name, email, job_id
FROM employees
ORDER BY job_id ASC;

SELECT first_name, email, job_id
FROM employees
ORDER BY job_id;


--employees테이블에서 department_id를 오름차순으로
--first_name을 내림차순으로
--department_id, first_name, salary를 출력하라.
SELECT department_id, first_name, salary
FROM employees
ORDER BY department_id ASC, first_name DESC;

--employees테이블에서 가장 최근 입사 순으로
--사원의 first_name, salary, hire_date를 출력하시오.
SELECT first_name, salary, hire_date
FROM employees
ORDER BY hire_date DESC;

--employees테이블에서 업무(job_id)이 'FI_ACCOUNT'인 사원들의
--급여(salary)가 높은 순으로 first_name, job_id, salary를 출력하시오.
SELECT first_name, job_id, salary
FROM employees
WHERE job_id = 'FI_ACCOUNT'
ORDER BY salary DESC;


---------------------------
--union(합집합)
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 or department_id = 40
UNION
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 or department_id = 60;

--UNION ALL(합집합)
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 or department_id = 40
UNION ALL
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 or department_id = 60;

--INTERSECT(교집합)
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 or department_id = 40
INTERSECT
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 or department_id = 60;

--MINUS(=except)(차집합)
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 or department_id = 40
MINUS
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 or department_id = 60;