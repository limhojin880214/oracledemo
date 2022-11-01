/*-----------------------------------------------------------
       문제
 -------------------------------------------------------------*/
-- 1) department_id가 60인 부서의 도시명을 알아내는 SELECT문장을 기술하시오
SELECT d.department_id, l.city
from departments d, locations l
WHERE d.department_id = 60;
    
--2)사번이 107인 사원과 부서가같고,167번의 급여보다 많은 사원들의 사번,이름(first_name),급여를 출력하시오.
SELECT employee_id, first_name, salary
from employees e1
where department_id = (
    SELECT department_id
    from employees e2
    where employee_id = 107
)
AND salary > (
    SELECT salary
    from employees
    where employee_id = 167
);

                  
--3) 급여평균보다 급여를 적게받는 사원들중 커미션을 받는 사원들의 사번,이름(first_name),급여,커미션 퍼센트를 출력하시오.
SELECT employee_id, first_name, salary, COMMISSION_PCT
FROM employees e
WHERE salary < (
    select avg(salary)
    from employees
    );
    
--4)각 부서의 최소급여가 20번 부서의 최소급여보다 많은 부서의 번호와 그부서의 최소급여를 출력하시오.
select department_id, min(salary)
from employees
where salary > (
    select min(salary)
    from employees
    where department_id = 20
)
group by department_id
order by department_id;
    
--5) 사원번호가 177인 사원과 담당 업무가 같은 사원의 사원이름(first_name)과 담당업무(job_id)하시오.   
select first_name, job_id
from employees
where job_id = (
    select job_id
    from employees
    where employee_id = 177
);
  
--6) 최소 급여를 받는 사원의 이름(first_name), 담당 업무(job_id) 및 급여(salary)를 표시하시오(그룹함수 사용).
select first_name, job_id, min(salary)
from employees
group by first_name, job_id;
				
--7)업무별 평균 급여가 가장 적은  업무(job_id)를 찾아 업무(job_id)와 평균 급여를 표시하시오.
select *
from (
select job_id, avg(salary)
from employees
group by job_id
order by avg(salary))
where rownum = 1;

					  
--8) 각 부서의 최소 급여를 받는 사원의 이름(first_name), 급여(salary), 부서번호(department_id)를 표시하시오.
select first_name, salary, department_id
from employees
where salary = (
    select department_id, salary
    from employees
    order by department_id, salary;
);

--9)담당 업무가 프로그래머(IT_PROG)인 모든 사원보다 급여가 적으면서 
--업무가 프로그래머(IT_PROG)가 아닌  사원들의 사원번호(employee_id), 이름(first_name), 
--담당 업무(job_id), 급여(salary))를 출력하시오.
           

--10)부하직원이 없는 모든 사원의 이름을 표시하시오.
select first_name
from employees
where (
);

select department_id, count(*)
from employees
group by department_id;
