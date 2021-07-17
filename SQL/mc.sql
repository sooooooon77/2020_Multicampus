/* <볼륨2_부록> */
/* 1-1 */
--1
select last_name, job_id, salary as sal
from employees;  --맞음

--2
select * from job_grades;  --틀림

--3
select employee_id, last_name sal x 12 annual salary from employees; --(X)
--->
select employee_id, last_name, salary * 12 "annual salary" from employees; --(O)

--4
desc departments;
select * from departments;

--5
desc employees;
select * from employees;

--6
select employee_id, last_name, job_id, hire_date StartDate from employees;

--7
select distinct job_id from employees;

--8
select employee_id "emp #", last_name employee, job_id job, hire_date "Hire Date" 
from employees;

--9
select last_name || ', ' || job_id "Employee and Title" 
from employees;

--10
select employee_id || ', ' || first_name || ', ' || last_name || ', ' || 
email || ', ' || phone_number || ', ' || hire_date || ', ' || job_id || ', ' || 
salary || ', ' || commission_pct || ', ' || manager_id || ', ' || 
department_id "THE_OUTPUT" 
from employees;





/* 2-1 */
select * from employees;

--1
select last_name, salary from employees
where salary > 12000;

--2
select last_name, department_id from employees
where employee_id = 176;

--3
select last_name, salary from employees
where salary < 5000 or salary > 12000;

select last_name, salary from employees
where salary not between 5000 and 12000;

--4
select last_name, job_id, hire_date from employees
where last_name in ( 'Matos', 'Taylor' )
order by hire_date;

--5
select last_name, department_id from employees
where department_id in ( 20, 50 )
order by last_name;

--6
select last_name Employee, salary "Monthly Salary" from employees
where salary between 5000 and 12000 
and department_id in (20, 50);

--7
select last_name, hire_date from employees
where hire_date like '03%';

select * from employees;

--8
select last_name, job_id from employees
where manager_id is null;

--9
select last_name, salary, commission_pct from employees
where commission_pct is not null
order by salary desc, commission_pct desc;

select last_name, salary, commission_pct from employees
where commission_pct is not null
order by 2 desc, 3 desc;

--10
select last_name, salary from employees
where salary > &sal;

--11
select employee_id, last_name, salary, department_id from employees
where manager_id = &manager_id
order by &order;

--12
select last_name from employees
where last_name like '__a%';

--13
select last_name from employees
where last_name like '%a%'
and last_name like '%e%';

--14
select last_name, job_id, salary from employees
where job_id in ('SA_REP', 'ST_CLERK')
and salary not in (2500, 3500, 7000);

--15
select last_name employee, salary "Monthly Salary", commission_pct
from employees
where commission_pct = 0.2;





/* 3-1 */
--1
select sysdate "Date" from dual;

--2
select employee_id, last_name, salary, round(salary + salary * 15.5/100, 0) "New Salary"
from employees;

--3
select employee_id, last_name, salary, round(salary + salary * 15.5/100, 0) "New Salary"
from employees;

--4
select employee_id, last_name, salary, 
round(salary + salary * 15.5/100, 0) "New Salary",
round(salary + salary * 15.5/100, 0) - salary Increase
from employees;

--5
select initcap(last_name) Name, length(last_name) Length
from employees
where last_name like 'J%'
or last_name like 'A%'
or last_name like 'M%'
order by last_name;

select initcap(last_name) Name, length(last_name) Length
from employees
where last_name like '&start_letter%'
order by last_name;

select initcap(last_name) Name, length(last_name) Length
from employees
where last_name like upper('&start_letter%')
order by last_name;

--6
select last_name, round(months_between(sysdate , hire_date), 0) "MONTHS_WORKED"
from employees
order by "MONTHS_WORKED";

--7
select last_name, lpad(salary, 15, '$') salary
from employees;

--8
select rpad(last_name, 8, ' ') || ' ' || rpad(' ', salary/1000+1, '*') "employees_and_their_salaries"
from employees
order by salary desc;

--9
select last_name, trunc((sysdate - hire_date)/7) tenure
from employees
where department_id = 90
order by tenure desc;





/* 4-1 */
--1
select last_name || ' earns ' 
|| to_char(salary, 'fm$99,999.00') 
|| ' monthly but wants ' 
|| to_char(3*salary, 'fm$99,999.00') 
|| '.'
"Dreams Salaries"
from employees;

--2
select last_name, hire_date,
to_char(next_day(add_months(hire_date, 6), 'MONDAY'), 'fmDay, "the" Ddspth "of" Month, YYYY') review
from employees;  -----다시 해보기!!!





