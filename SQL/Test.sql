select * from user_tables;
select * from emp;
select * from dept;
select * from employees;

select empno, ename, deptno from emp;

/* <Advanced SQL> */ 
/* 1 */ 
select * from employees;
select employee_id, first_name, last_name, salary from employees where first_name = 'Peter';

/* 2 */
select * from emp;
select empno, ename, sal, deptno from emp where ename > 'JONES';

/* 3 */
select * from emp;
select empno, ename, sal, deptno from emp where ename like '%TT';

/* 4 */
select * from emp;
select empno, ename, sal, deptno from emp where ename like 'S%' or ename like 'A%';

/* 5 */
select * from emp;
select empno, ename, hiredate, deptno from emp where hiredate = '80/12/17';


/* -------------------------------------------------------------------------------------- */

/* < SQL 실습 > */
/* <1> */ 
select * from tab;

describe dept;
desc emp;

select * from dept;
select * from emp;

select deptno, dname from dept;
select empno, ename, deptno from emp;

select empno, ename, 'RYU', 100, '2013/05/05' from emp;

select empno, ename, sal*12, deptno from emp;
select empno, ename, hiredate, hiredate+1 from emp;

select empno, ename + 'A' from emp;  --에러

select empno, ename, sal, comm, mgr from emp;
select empno, sal, comm, sal+comm from emp;
select empno, sal, comm, sal+NVL(comm, 0) from emp;

select empno id, ename AS name, sal*12 "Annual Salary" from emp;

select ename || job from emp;
select ename || 'is a' || job from emp;
select ename || '''s Salary:' || sal from emp;
select ename || q'['s Salary:]'|| sal from emp;

select mgr from emp;
select distinct mgr from emp;
select deptno from emp;
select distinct deptno from emp;
select mgr, deptno from emp;
select distinct mgr, deptno from emp;

/* 퀴즈 */
/*1*/
select * from employees;
select * from departments;
/*2*/
select last_name 이름, salary 급여, department_id 부서 from employees;
/*3*/
select first_name, last_name, salary, commission_pct, salary * commission_pct comm from employees;


select empno, ename, sal, hiredate, deptno from emp where deptno = 30;
select empno, ename, sal, hiredate, deptno from emp where deptno ^= 30;
select empno, ename, sal, hiredate, deptno from emp where deptno != 30;





/* <2> */
select empno, ename, sal, hiredate, deptno from emp where deptno = 30;
select empno, ename, sal, hiredate, deptno from emp where ename = 'SCOTT';
select empno, ename, sal, hiredate, deptno from emp where ename = SCOTT; --에러
select empno, ename, sal, hiredate, deptno from emp where ename = 'scott';
select empno, ename, sal, hiredate, deptno from emp where hiredate = '81/12/03';
select empno, ename, sal, hiredate, deptno from emp where hiredate = '03-DEC-81'; --에러

select ename, sal, hiredate, deptno from emp where sal >= 3000;
select ename, sal, hiredate, deptno from emp where deptno != 30;
select ename, sal, hiredate, deptno from emp where ename >= 'SCOTT';
select ename, sal, hiredate, deptno from emp where hiredate >= '31-DEC-81'; --에러
select ename, sal, hiredate, deptno from emp where hiredate >= '81/12/31';

select ename, sal, hiredate, deptno from emp where sal between 2000 and 3000;
select ename, sal, hiredate, deptno from emp where sal >= 2000 and sal <= 3000;
select ename, sal, hiredate, deptno from emp where ename between 'ADAMS' and 'CLARK';
select ename, sal, hiredate, deptno from emp where hiredate between '01-JAN-82' and '31-DEC-82'; --에러

select ename, sal, deptno from emp where deptno in (10, 20);
select ename, sal, deptno from emp where deptno = 10 or deptno = 20;
select ename, job, deptno from emp where job in ('MANACER', 'CLERK');

select last_name, hire_date, salary from employees where last_name like 'M%';
select last_name, hire_date, salary from employees where last_name like 'M____';
select last_name, job_id, salary from employees where job_id like '%A_%';
select last_name, job_id, salary from employees where job_id like '%A%';
select last_name, job_id, salary from employees where job_id like '%A\_%' escape '\';
select last_name, job_id, salary from employees where job_id like '%Aa_%' escape 'a';
select last_name, job_id, salary from employees where job_id like '%A*_%' escape '*';
select last_name, job_id, salary from employees where job_id like '%A_%' escape 'A';

select last_name, job_id, salary from employees where job_id like '%\_M%' escape '\';
select last_name, job_id, salary from employees where job_id like '%+_M%' escape '+';
select last_name, job_id, salary from employees where job_id like '%*_M%' escape '*';

select job_id 업무이름 from employees where job_id like '%A_%';
select job_id 업무이름 from employees where job_id like '%A\_%' escape '\';
select job_id 업무이름 from employees where job_id like '%A*_%' escape '*';
select job_id 업무이름 from employees where job_id like '%Ab_%' escape '*b';


select empno, sal, comm, deptno from emp where comm is null;
select empno, sal, comm, deptno from emp where comm = '';

select ename, sal, deptno from emp where deptno = 10 or deptno = 20 and sal >= 3000;
select ename, sal, deptno from emp where (deptno = 10 or deptno = 20) and sal >= 3000;
select ename 이름, deptno 부서번호, sal 연봉 from emp where deptno = 10 and sal >= 1000;

select ename 이름, deptno 부서번호 from emp where deptno = 10 or deptno = 20;
select ename 이름, deptno 부서번호 from emp where deptno IN (10,20);
select ename 이름, deptno 부서번호 from emp where deptno not IN (10,20);

select ename, sal, deptno from emp where sal not between 1000 and 3000;
select ename, sal, deptno from emp where deptno not in (20,30);
select ename, sal, deptno from emp where ename not like 'A%';
select ename, sal, comm, deptno from emp where comm is not null;

select * from dept order by dname;
select * from dept order by dname desc;
select * from dept order by 2;
select ename, sal, comm, deptno from emp order by deptno, sal desc;
select ename, sal, comm, deptno from emp order by 4, 2 desc;
select ename, sal, sal*12 ANN_SAL from emp order by sal*12;
select ename, sal, sal*12 ANN_SAL from emp order by ANN_SAL;

select empno, ename, sal, deptno from emp where empno = &id;
accept id number prompt 'employee ID:'
select empno, ename, sal, deptno from emp where empno = &id;
set verify off;
select empno, ename, sal, deptno from emp where empno =&id;
define id;
undefine id;
select empno, ename, sal, deptno from emp where empno = &id;

/* 퀴즈 */
/*1*/
select ename, sal, comm, deptno from emp where sal < comm;
/*2*/
select ename, hiredate, deptno from emp where hiredate like '%/12/%';
/*3*/
select ename, sal, comm, ((12 * sal) + comm) AS ANN_SAL, ((12 * sal) + comm) * 0.03 AS TAX from emp where deptno = 30 and sal > 1500 order by sal desc;






/* <3> */
select last_name, job_id, upper(last_name), lower(last_name), initcap(job_id)
from employees where department_id = 20;
select ename, job, ename||job, concat(ename, job) from emp where deptno = 10;
select ename, substr(ename,1,3), substr(ename,3), substr(ename,-2,2) from emp where deptno = 10;
select ename, length(ename), instr(ename,'L'), instr(ename,'L',1,2) from emp where deptno = 10;
select sal, lpad(sal, 7, '0'), rpad(sal,7,'*') from emp where deptno = 10;
select ename, replace(ename, 'CL', 'M') from emp where deptno = 10;
select ename, trim('S' from ename), trim(leading 'S' from ename), trim(trailing 'S' from ename) 
from emp where deptno = 20;  --leading : 선행 'S' 지움, trailing : 후행 'S' 지움
select ename, length(ename), trim(ename) from emp where deptno = 10;

select sal/7, round(sal/7,2), round(sal/7,0), round(sal/7,-1) from emp where deptno = 10;
select sal/7, trunc(sal/7,2), trunc(sal/7,2), trunc(sal/7,-1) from emp where deptno = 10;
select sal, mod(sal, 1000) from emp where deptno = 10; --mod : 나머지

desc dual;
select * from dual;
select sysdate from dept;
select sysdate from dual;

alter session set nls_date_format = 'YYYY/MM/DD HH24:MI:SS';
select sysdate from dual;
select ename, sysdate - hiredate from emp where deptno = 10;

create table copy_emp as select * from emp;
alter session set nls_date_format = 'RR/MM/DD';
update copy_emp set hiredate = '13/05/16' where empno = 7369;
update copy_emp set hiredate = '99/05/06' where empno = 7566;
alter session set nls_date_format = 'YY/MM/DD';
update copy_emp set hiredate = '13/05/06' where empno = 7788;
update copy_emp set hiredate = '99/05/06' where empno = 7876;
alter session set nls_date_format = 'YYYY/MM/DD';
select empno, hiredate from copy_emp where deptno = 20;

select sysdate, hiredate, months_between(sysdate, hiredate) from emp where deptno = 10;
select sysdate, add_months(sysdate,3), add_months('2012/02/28',3), add_months('2012/02/29',3) from dual;
select hiredate, next_day(hiredate, '월'), last_day(hiredate) from emp where deptno = 10;
select hiredate, round(hiredate, 'MONTH'), round(hiredate, 'YEAR') from emp where deptno = 10;
select hiredate, trunc(hiredate, 'MONTH'), trunc(hiredate, 'YEAR') from emp where deptno = 10;
alter session set nls_date_format = 'DD-MON-RR';

/* 퀴즈 */
/*1*/
select ename 이름, hiredate 입사일, deptno 부서번호, next_day(hiredate - 7, '일') first_day from emp;
/*2*/
select ename 이름, instr(ename, 'S') from emp; 
-- 강사님
select ename 이름, length(ename) - length(replace(ename,'S' ,'')) 개수 from emp;


select ename 이름, sal 연봉 from emp order by sal;
select ename 이름, sal 연봉 from emp order by 연봉;
select ename 이름, sal 연봉 from emp order by 2;

select ename 이름, sal 연봉 from emp order by sal desc;

select ename 이름, deptno 부서, sal 연봉 from emp order by 부서, 연봉;
select ename 이름, deptno 부서, sal 연봉 from emp order by 부서, 연봉 desc;
select ename 이름, deptno 부서, sal 연봉 from emp order by 부서 desc, 연봉 desc;





/* <4> */
select ename, sal, sal*'12' from emp where deptno = 10;
select ename, sal, deptno from emp where deptno = 10;
set autotrace on explain
select ename, hiredate, sal, deptno from emp where hiredate like '%82';
set autotrace off
select ename, hiredate, to_char(hiredate, 'YYYY/MM/DD'), to_char(hiredate, 'YYYY/MM/DD HH24:MI:SS') from emp where deptno = 10;
select ename, hiredate, to_char(hiredate, 'DD Month YYYY', 'NLS_DATE_LANGUAGE = AMERICAN'), 
                        to_char(hiredate, 'fmDD Month YYYY', 'NLS_DATE_LANGUAGE = AMERICAN') from emp where deptno = 10;
select ename, hiredate, to_char(hiredate,'Q'), -- 분기
                        to_char(hiredate,'D'), -- 주의 몇번째 일
                        to_char(hiredate,'W'), -- 월의 주
                        to_char(hiredate,'Day') from emp where deptno = 10;
select ename, sal, to_char(sal, '$99,999.00'),
                   to_char(sal, '$00,000.00'),
                   to_char(sal, '$09,999.99'),
                   to_char(sal, 'L99,999.00') from emp where deptno = 10;

/* 에러 */
select trunc('06-05-13', 'MONTH') from dual; --에러
select trunc(to_date('06-05-13', 'DD-MM-RR'), 'MONTH') from dual;

select empno, ename, hiredate from emp where hiredate = to_date('01   05, 1981','DD MM, YYYY'); 
select empno, ename, hiredate from emp where hiredate = to_date('01   05, 1981','DD MM, YYYY');
select empno, ename, hiredate from emp where hiredate = to_date('01   05, 1981','DD    MM, YYYY');
--------------

select ename, sal, comm, sal + nvl(comm, 0) from emp where deptno = 30;
select ename, mgr, nvl(to_char(mgr), 'No Manager') from emp where deptno = 10;
select ename, sal, comm, nvl2(comm, sal + comm, sal) from emp where deptno = 30;
select nullif(5,5), nullif(5,4) from dual;
select ename, comm, mgr, sal, nvl(comm, nvl(mgr, nvl(sal, -1))) from emp where deptno = 10;
select ename, comm, mgr, sal, coalesce(comm, mgr, sal, -1) from emp where deptno = 10;

select ename, deptno, sal,
    case deptno
    when 10 then sal * 1.1
    when 20 then sal * 1.2
    when 30 then sal * 1.3
    else sal
    end inc_sal
from emp;
    
select ename, deptno, sal,
    decode(deptno, 
    10, sal * 1.1,
    20, sal * 1.2,
    30, sal * 1.3,
    sal) inc_sal
from emp;

select ename, deptno, sal,
    case
    when deptno in (10, 20) then sal * 1.1
    when deptno = 30 then sal * 1.2
    end inc_sal
from emp;

/* 퀴즈 */
/*1*/
/*2*/






/* <5> */
select sum(sal), avg(sal), max(sal), min(sal), count(sal) from emp;
select sum(ename), avg(ename), sum(hiredate), avg(hiredate) from emp; --에러
select max(ename), min(ename), max(hiredate), min(hiredate) from emp;
    -- 문자에서의 max, min은 알파벳순
select count(*), count(empno), count(comm), count(mgr) from emp;
select avg(comm), sum(comm), sum(comm) / 14 from emp;
select avg(nvl(comm, 0)), sum(comm) / 14 from emp;
select avg(nvl(comm, 0)), sum(comm) / 15 from emp;
select count(deptno), count(distinct deptno), sum(deptno), sum(distinct deptno) from emp;

select sum(sal) from emp group by deptno;
select deptno, sum(sal) from emp group by deptno;
select deptno, job, sum(sal) from emp group by deptno; --에러
select deptno, job, sum(sal) from emp group by deptno, job;
select deptno, avg(sal) from emp where avg(sal) > 1500 group by deptno; --에러
select deptno, avg(sal) from emp having avg(sal) > 2500 group by deptno;

select deptno, sum(sal) from emp where deptno in (20, 30)
    group by deptno having sum(sal) > 10000;
select deptno, sum(sal) from emp 
    group by deptno having sum(sal) > 10000 and deptno in (20, 30);
select deptno, avg(sal) from emp where job = 'CLERK'
    group by deptno having avg(sal) > 1000;
select deptno, avg(sal) from emp 
    group by deptno having avg(sal) > 1000 and job = 'CLERK'; --에러

select sum(sal) from emp group by deptno;
select max(sum(sal)) from emp group by deptno;
select avg(max(sum(sal))) from emp group by deptno; --에러

/* 퀴즈 */
/*1*/
select deptno, hiredate, sal from emp;
    
select deptno, to_char(hiredate, 'YYYY'), sum(sal) from emp 
    group by deptno, to_char(hiredate, 'YYYY') order by deptno;

/*강사님*/
select department_id,  --열 여러개 하고 싶을 때 => decode 줄 여러개
sum( decode( to_char( hire_date, 'YYYY'), '2001', salary )) "2001", 
sum( decode( to_char( hire_date, 'YYYY'), '2002', salary )) "2002", 
sum( decode( to_char( hire_date, 'YYYY'), '2003', salary )) "2003", 
sum( decode( to_char( hire_date, 'YYYY'), '2004', salary )) "2004", 
sum( decode( to_char( hire_date, 'YYYY'), '2005', salary )) "2005", 
sum( decode( to_char( hire_date, 'YYYY'), '2006', salary )) "2006", 
sum( decode( to_char( hire_date, 'YYYY'), '2007', salary )) "2007",
sum( decode( to_char( hire_date, 'YYYY'), '2008', salary )) "2008",
sum( salary ) total
from employees
group by department_id
order by department_id;






/* <7> */
select sal from emp where ename = 'JONES';
select ename, sal, deptno from emp where sal > 2975;
select ename, sal, deptno from emp 
where sal > (select sal from emp where ename = 'JONES');

select ename, sal, deptno from emp
where sal > (select avg(sal) from emp);

select ename, sal, deptno from emp
where sal = (select min(sal) from emp group by deptno); -- 등호 : 에러

select ename, sal, deptno from emp
where sal in (select min(sal) from emp group by deptno); -- in : 하나 이상의 값이기 때문에

select ename, sal, deptno from emp
where sal in (950, 800, 1300);

select ename, sal, deptno from emp
where sal = 950 or sal = 800 or sal = 1300;

select ename, sal, deptno from emp
where sal > any ( select avg(sal) from emp group by deptno);

select ename, sal, deptno from emp
where sal > any ( 1566, 2175, 2916 );

select ename, sal, deptno from emp
where sal > 1566 or sal > 2175 or sal > 2916;

select ename, sal, deptno from emp
where sal > all (select avg(sal) from emp group by deptno);

select ename, sal, deptno from emp
where sal > 1566 and sal > 2175 and sal > 2916;

select ename, sal, deptno from emp
where sal > (select min(avg(sal)) from emp group by deptno);

select ename, sal, deptno from emp
where sal > (select max(avg(sal)) from emp group by deptno);

select ename, mgr, sal, deptno from emp
where empno in ( select mgr from emp );

select ename, mgr, sal, deptno from emp
where empno not in (select mgr from emp);

select ename, sal, deptno from emp
where deptno in ( 10, 20, null );

select ename, sal, deptno from emp
where deptno = 10 or deptno = 20 or deptno = null;

----------------------------------------------------
select ename, sal, deptno from emp
where deptno not in (10, 20, null);
---manager_id가 없는 null값이 있기 때문에 not in 을 쓰면 null값이 반환됨
---subquery에 null값이 있는 경우를 조심해야 한다. 결과가 null값이 나오기 때문에.

select ename, sal, deptno from emp
where deptno != 10 and deptno != 20 and deptno != null;
---manager_id가 없는 null값이 있기 때문에 not in 을 쓰면 null값이 반환됨
---subquery에 null값이 있는 경우를 조심해야 한다. 결과가 null값이 나오기 때문에.

select ename, sal, deptno from emp
where deptno not in (10, 20);

select ename, sal, deptno from emp
where deptno != 10 and deptno != 20;
---------------------------------------------------

------------------------------------------------------------
select ename, mgr, sal, deptno from emp 
where empno not in (select nvl(mgr, -1) from emp);

select ename, mgr, sal, deptno from emp 
where empno not in (select mgr from emp);
---manager_id가 없는 null값이 있기 때문에 not in 을 쓰면 null값이 반환됨
---subquery에 null값이 있는 경우를 조심해야 한다. 결과가 null값이 나오기 때문에.
-------------------------------------------------------------

/* 퀴즈 */
/*1*/
select empno, ename, sal, deptno
from emp;


/*2*/
select e.empno, e.ename, e.deptno, e.sal, sum(m.sal)
from ( select empno, ename, deptno, sal from emp where deptno = 10 ) e
join ( select empno, ename, deptno, sal from emp where deptno = 10 ) m
on e.empno >= m.empno
where e.deptno = 10
group by e.empno, e.ename, e.deptno, e.sal
order by e.empno;






/* <8> */
select deptno, ename, sal 
from emp
where deptno in (10, 30)
union  -- 합집합
select deptno, ename, sal
from emp
where deptno in (20, 30);

select sal, ename, deptno
from emp
where deptno in (10, 30)
union  -- 합집합
select sal, ename, deptno
from emp
where deptno in (20, 30);

select deptno, ename, sal
from emp
where deptno in (10, 30)
union all  -- 두 집합 그냥 더하기
select deptno, ename, sal
from emp
where deptno in (20,30);

select ename, sal, deptno
from emp
where deptno in (10, 30)
intersect  -- 교집합
select ename, sal, deptno
from emp
where deptno in (20, 30);

select ename, sal, deptno
from emp
where deptno in (10, 30)
minus  -- 차집합
select ename, sal, deptno
from emp
where deptno in (20, 30);

set autotrace traceonly explain;

select deptno, empno, ename, sal
from emp
where deptno in (10, 30)
order by ename    -- 에러
union
select deptno, empno, ename, sal
from emp
where deptno in (20, 30)
order by ename;   -- 에러

select deptno, empno, ename, sal
from emp
where deptno in (10, 30)
union
select deptno, empno, ename, sal
from emp
where deptno in (20, 30)
order by ename;

select deptno, sum(sal)
from emp
group by deptno
union all
select job, sum(sal)
from emp
group by job;  -- 에러

select deptno, null as job, sum(sal)
from emp
group by deptno
union all
select null, job, sum(sal)
from emp
group by job
order by deptno;


select deptno, null as job, sum(sal)
from emp
group by deptno
union all
select null, job, sum(sal)
from emp
group by job
order by deptno;



/* 퀴즈 */
/*1*/
select * from emp;

select deptno, job, null as mgr, sum(sal)
from emp
group by deptno, job
union
select deptno, null as job, mgr, sum(sal)
from emp
group by deptno, mgr
order by deptno;






/* <9> */
drop table copy_emp purge;

create table copy_emp
as
select * from emp where 1 = 0;

select * from copy_emp;

insert into copy_emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values( 7369, 'SMITH', 'CLERK', 7902, to_date('80/12/17', 'RR/MM/DD'), 800, null, 20);

insert into copy_emp (empno, ename, hiredate, deptno)
values ( 7499, 'ALLEN', sysdate, 30);

insert into copy_emp
select * from emp
where deptno = 10;

commit;

update copy_emp
set sal = 5000
where empno = 7369;

update copy_emp
set hiredate = sysdate, comm = null
where empno = 7369;

update copy_emp
set deptno = 50;

select * from copy_emp;

rollback;

select * from copy_emp;

update copy_emp
set hiredate = ( select hiredate from emp where empno = 7499 )
where empno = 7499;

update copy_emp
set ( job, mgr, sal, comm ) = ( select job, mgr, sal, comm from emp where empno = 7499 )
where empno = 7499;

select * from copy_emp
where empno = 7499;

delete copy_emp
where empno = 7369;

select * from copy_emp;

delete copy_emp
where empno = 1234; -------------------------

select * from copy_emp;

delete copy_emp;

select * from copy_emp;

rollback;

delete copy_emp
where deptno = ( select deptno from emp where empno = 7839 );

select * from copy_emp;

rollback;

delete copy_emp;
select * from copy_emp;

rollback;

select * from copy_emp;
select * from salgrade;
truncate table salgrade;
select * from salgrade;

rollback;

select * from salgrade;

update copy_emp
set sal = 6000
where empno = 7369;

select * from copy_emp;

savepoint update_done;

delete copy_emp
where empno = 7499;

rollback update_done;

select * from copy_emp;

rollback;

select * from copy_emp;

update copy_emp
set sal = 7000
where empno = 7369;

alter table copy_emp
modify (sal number (8, 2));

select * from copy_emp;

rollback;

select * from copy_emp;

select to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') from dual;

update emp
set sal = sal * 1.2
where empno = 7788;

commit;

select empno, sal
from emp
where empno = 7788;

select empno, sal
from emp as of timestamp to_date('2020/01/06 17:37:57', 'YYYY/MM/DD HH24:MI:SS')
where empno = 7788;

select empno, sal
from emp as of timestamp (sysdate - interval '10' minute)
where empno = 7788;

update emp
set sal = sal * 1.2
where empno = 7788;

commit;

select empno, sal
from emp
where empno = 7788;

select empno, sal, versions_starttime, versions_endtime, versions_startscn, versions_endscn
from emp
versions between timestamp minvalue and maxvalue
where empno = 7788;

update emp
set sal = (select sal from emp as of scn 1294257 where empno = 7788)
where empno = 7788;  --에러??

select empno, sal
from emp
where empno = 7788;

commit;






/* <10> */
create table t1
( c1 char(5),
  c2 varchar2(5),
  c3 long,
  c4 clob
  );
desc t1;

insert into t1(c1, c2, c3, c4)
values ('ABC', 'ABC', 'ABC', 'ABC');

select c1, c2, c3, c4 from t1;
select * from t1;

select length(c1), length(c2), dump(c1), dump(c2) from t1;

select c1, c2 
from t1
where c2 = 'ABC';

select c1, c2
from t1
where c1 = 'ABC';

select c1, c2
from t1
where c1 = 'ABC';

select c1, c2
from t1
where trim(c1) = c2;

alter table t1
add (c5 long); --에러

select table_name, column_name, segment_name from user_lobs;

alter table t1
add (c5 clob);

select table_name, column_name, segment_name
from user_lobs;

select object_name, object_type 
from user_objects
where object_name like 'SYS%';

create table t2
( c1 number,
  c2 number(4, 2),  -- 자릿수가 4이고 소수점 이하 자릿수가 2인 숫자
  c3 number(4, 0),
  c4 number(2, 4),
  c5 number(3, -1)
  );
select * from t2;

insert into t2  
values (999999.999999 , 99.99, 9999, 0.0099, 9990) ;  -- 자릿수
insert into t2(c2) values (999.99);  --에러
insert into t2(c3) values (99999);  --에러
insert into t2(c4) values (0.0999);  --에러
insert into t2(c5) values (9990);  --에러 

create table t3
( c1 date,
  c2 timestamp,
  c3 timestamp with time zone,
  c4 timestamp with local time zone,
  c5 interval year to month,
  c6 interval day to second);
select * from t3;  

select dbtimezone, sessiontimezone from dual;

alter session set nls_date_format = 'DD-MON-RR HH24:MI:SS';

select sysdate, systimestamp from dual;
select current_date, current_timestamp from dual;

alter session set time_zone = '-5:00';
select dbtimezone, sessiontimezone from dual;
select sysdate, systimestamp from dual;
select current_date, current_timestamp from dual;

insert into t3(c1, c2, c3, c4)
values (systimestamp, systimestamp, systimestamp, systimestamp );

select c1, c2, c3, c4 from t3;

alter session set time_zone = '-10:00';
select c1, c2, c3, c4 from t3;

update t3
set c5 = '1-5', c6 = '5 15:11:10';
select c1, c5, c6, c1 + c5, c1 + c6 from t3;

select sysdate, sysdate + to_yminterval('1-2')
from dual;

select sysdate, sysdate + to_dsinterval('5 10:10:15')
from dual;

create table t4
( c1 raw(2000),
  c2 long raw,
  c3 blob,
  c4 bfile 
);
drop table t1 purge;
drop table t2 purge;
drop table t3 purge;
drop table t4 purge;
alter session set nls_date_format = 'DD-MON-RR';

select table_name, column_name, data_type, data_default
from user_tab_columns
where table_name = 'EMP';

select * from emp;

insert into emp(empno, ename, deptno)
values(1234, 'RYU', 30);
rollback;

alter table emp
modify (hiredate date default sysdate);

select table_name, column_name, data_type, data_default
from user_tab_columns
where table_name = 'EMP';

insert into emp(empno, ename, deptno)
values (1234, 'RYU', 30);

select empno, ename, hiredate, deptno
from emp
where empno = 1234;

update emp
set hiredate = default
where empno = 1234;

rollback;

select constraint_name, table_name, constraint_type, search_condition
from user_constraints
where table_name in ('EMP', 'DEPT');

update emp
set empno = 1234,
    ename = 'RYU',
    sal = -1000,
    deptno = 50;
    
select empno, ename, sal, deptno from emp;
rollback;

alter table dept
add constraint dept_pk primary key (deptno);

alter table emp
add constraint emp_pk primary key (empno);

alter table emp
modify ename not null;

alter table emp
add unique (ename);

alter table emp
add constraint emp_ck check (sal > 0);

alter constraint_name, table_name, constraint_type, search_condition
from user_constraints
where table_name in ('EMP','DEPT');

select constraint_name, table_name, constraint_type, search_condition
from user_constraints
where table_name in ('EMP', 'DEPT');

select * from user_constraints where table_name = 'EMP';  --제약 조건 확인하기

update emp
set empno = 7788; --에러

update emp
set ename = null; --에러

update emp
set ename = 'RYU'; --에러

update emp
set sal = '-1000'; --에러

update emp
set deptno = 50; --에러

update dept
where deptno = 40; --에러

update dept
set deptno = 10; --에러

rollback;

alter table emp
disable constraint emp_fk;

update emp
set deptno = 50;

rollback;

alter table emp
enable constraint emp_fk;

alter table emp
drop constraint emp_fk;

alter table emp
drop constraint SYS_C0015572;

alter table emp
drop constraint emp_ck;

alter table emp
drop constraint SYS_C0015569;

alter table emp
drop primary key;

alter table dept
drop primary key;

drop table copy_emp purge;

create table copy_emp
as select * from emp;

alter table copy_emp
add( dname varchar2(10) );

alter table copy_emp
modify( dname varchar2(20) );

alter table copy_emp
drop column dname;

alter table copy_emp
set unused column hiredate;

select * from unused_col_tabs;

alter table copy_emp
drop unused columns;

alter table copy_emp
rename column ename to name;

alter table copy_emp read only;
alter table copy_emp read write;

drop table copy_emp;

select object_name, original_name, type, droptime
from user_recyclebin;

select empno, name, sal, deptno
from "BIN$CMX7D+8HTJaLPGJqlsWC0w==$0";

flashback table copy_emp to before drop rename to cp_emp;

select empno, name, sal, deptnp
from cp_emp;

drop table cp_emp;

purge recyclebin;

create global temporary table temp1
(id number, name varchar2(10))
on commit delete rows;

create global temporary table temp2
(id number, name varchar2(10))
on commit preserve rows;

insert into temp1
values(1111, 'AAA');

insert into temp2
values(2222, 'BBB');

select * from temp1;
select * from temp2;
commit;

select * from temp1;
select * from temp2;

connect ora1/oracle
select * from temp2;
drop table temp1 purge;
drop table temp2 purge;

conn system/oracle;
create or replace directory data_dir AS '/home/oracle';

conn ora1/oracle;

host;

create table oldemp
(deptno number(2),
 ename varchar2(10),
 hiredate date)
organization external
(type oracle_loader
 default directory data_dir
 access parameters
(records delimited by newline
 nobadfile
 nologfile
 fields terminated by','
 (deptno, ename, hiredate char date_format date mask "DD-MON-RR"))
 location('emp.dat'));

select * from oldemp;
update oldemp
set deptno = 30
where ename = 'jones';

create table emp_ext
(employee_id, first_name, last_name)
organization external
(type oracle_datapump
default directory data_dir
location('emp1.exp', 'emp2.exp'))
parallel
as select employee_id, first_name, last_name
from employees;

select * from emp_ext;

! ls -al /home/oracle/emp*






/* <11> */
delete from emp where ename = 'RYU';

select empno, ename, sal, deptno
from emp
where deptno = 10;

create view empv10
as
select empno, ename, sal, deptno
from emp
where deptno = 10;

desc empv10;

select * from empv10;

update empv10
set sal = sal * 1.2
where empno = 7839;

select * from emp;

select empno, ename, sal, deptno
from emp
where empno in ( 7839, 7934 );

select view_name, text
from user_views
where view_name = 'EMPV10';

select * from ( select empno, ename, sal, deptno from emp where deptno = 10 );

create view empv_sum
as
select deptno, sum(sal)
from emp
group by deptno;    --에러

create view empv_sum
as
select deptno, sum(sal) as sum
from emp
group by deptno;  

select * from empv_sum;

delete empv_sum
where deptno = 10;

drop view empv_sum;

create view empv10
as 
select empno, ename, sal, comm, deptno
from emp
where deptno = 10;  --에러

create or replace view empv10
as
select empno, ename, sal, comm, deptno
from emp
where deptno = 10;

create or replace view empv10
as
select empno, ename, sal, comm, deptno
from emp
where deptno = 10 with check option;

update empv10
set sal = 6000
where empno = 7839;

update empv10
set deptno = 20
where empno = 7839;  --에러 : 위에 deptno = 10 체크옵션 걸어놔서 변경안됨

rollback;

create or replace view empv10
as
select empno, ename, sal, comm, deptno
from emp
where deptno = 10 with read only;

update empv10
set sal = 6000
where empno = 7839;  --에러 : 위에 read only 옵션으로 수정 불가

drop view empv10;


create sequence empno_seq
start with 8000
increment by 1;

select sequence_name, increment_by, cache_size, last_number
from user_sequences
where sequence_name = 'EMPNO_SEQ';

select * from emp;

insert into emp( empno, ename, deptno )
values(empno_seq.nextval, 'RYU', 30);

insert into emp( empno, ename, deptno )
values(empno_seq.nextval, 'RYU', 30);

select empno, ename, deptno
from emp
where ename = 'RYU';

select empno_seq.nextval from dual;
select empno_seq.nextval from dual;
select empno_seq.nextval from dual;
select empno_seq.nextval from dual;
select empno_seq.nextval from dual;

select empno_seq.currval from dual;

select sequence_name, increment_by, cache_size, last_number
from user_sequences
where sequence_name = 'EMPNO_SEQ';

rollback;

select empno_seq.nextval from dual;

create sequence seq1
start with 100
increment by 1
maxvalue 103
minvalue 50
cycle
nocache;

select seq1.nextval from dual;
select seq1.nextval from dual;
select seq1.nextval from dual;
select seq1.nextval from dual;
select seq1.nextval from dual;
select seq1.nextval from dual;

alter sequence seq1
maxvalue 200
cache 20;

drop sequence empno_seq;
drop sequence seq1;

select index_name, index_type, table_name, uniqueness
from user_indexes
where table_name = 'EMP';

alter table emp
add primary key(empno);

select index_name, index_type, table_name, uniqueness
from user_indexes
where table_name = 'EMP';

alter table emp
drop primary key;

conn system/oracle;

select empno, ename, deptno
from emp;

select empno, ename, deptno
from ora1.emp;

create synonym emp for ora1.emp;

drop synonym emp;
conn ora1/oracle;



