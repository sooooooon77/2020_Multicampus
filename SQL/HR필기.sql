/* 12_24 */
select * from all_users;

select * from user_tables;

select * from employees;
desc employees;         /* describe (테이블 구조 표시) */

select employee_id, last_name, salary from employees;
select salary, last_name from employees;

select last_name, salary + 1000 from employees;

/* 예제 */
/* last_name, salary, 10% 오른 연봉 출력 */
select last_name, salary, salary * 1.1 from employees;

select 2 + 5 from dual;     /* dual = 더미 테이블(가짜 테이블) */
select 5 / 2 from dual;     /* dual = 더미 테이블(가짜 테이블) */
select 5 / 0 from dual;    -- 에러
select 5 / NULL from dual; -- NULL

select salary + salary * 0.1 from employees;
select (salary + salary) * 0.1 from employees;

select last_name, commission_pct from employees;   /* (null) */
select last_name, salary + salary * commission_pct from employees;   
    /* null에 무슨 짓을 해도 결과는 null  ->  nvl 연산 이용하면 null을 다른 값으로 바꿔 연산해줌 */
    
select last_name as 이름, salary + salary * 0.2 as 연봉인상 from employees;       /* alias = 별칭 */ 
select last_name as "이   름", salary + salary * 0.2 as 연봉인상 from employees;  /* oracle에서 유일하게 쌍따옴표 사용하는 경우 */
select last_name "이   름", salary + salary * 0.2 연봉인상 from employees;        /* as 생략가능 */ 
select last_name "<이   름>", salary + salary * 0.2 연봉인상 from employees;        /* as 생략가능 */ 

select first_name, last_name from employees;
select first_name || last_name from employees;   /* || : 한 칸에 붙어 나오게 함  -> 실제로 데이터 넣을 때는 사용 X -> 볼 때만 */
select first_name || ' ' || last_name 이름 from employees;   /* 작은따옴표!!! */
select first_name || ', ' || last_name 이름 from employees;   /* 작은따옴표!!! */
select first_name || ' AND ' || last_name 이름 from employees;

/* 예제 */
/* 2019년에 연봉이 10% 인상됐다는 가정하에 2018연봉 : 2019연봉 하나로 출력 */
select salary || ' : ' || salary * 1.1 "2018연봉 : 2019연봉" from employees;
select salary * 0.9 || ' : ' || salary "2018연봉 : 2019연봉" from employees;   

/* select last_name || ''19 연봉' || salary from employees; */
select last_name || q'['19 연봉]' || salary || '만원' 연봉 from employees;   /* 따옴표를 출력하고 싶을 때 */
select last_name || q'<'19 연봉>' || salary || '만원' 연봉 from employees;   /* 모든 한 쌍의 문자 가능 */
select last_name || q'A'19 연봉A' || salary || '만원' 연봉 from employees;   /* 모든 한 쌍의 문자 가능 */

select salary || '(만원)' from employees;
select q'[ 2019's 연봉 ]' || salary || '만원' 연봉 from employees;
-- select ' 2019's 연봉 ' || salary || '만원' 연봉 from employees; --에러

select department_id from employees;
select distinct department_id from employees;   /* 중복행 제거 */

select job_id from employees;
select distinct job_id from employees;

select department_id, job_id from employees;
select distinct department_id, job_id from employees;   /* 두 열의 개수가 다르므로 개수가 더 많은 job을 기준으로 중복행 제거됨 */

desc employees;
desc departments;

/* 퀴즈 */
select first_name, last_name, job_id, salary * 12 As Yearly Sal from employees;
select first_name, last_name, job_id, salary * 12 "yearly sal" from employees;
select first_name, last_name, job_id, salary AS "yearly sal" from employees;
select first_name, last_name, job_id, salary*12 yearly sal from employees;



alter session set nls_date_format = 'DD-MON-RR';
alter session set nls_date_format = 'YY/MM/DD';
select last_name 이름 from employees where last_name like 'T%';   --K이상을 뜻함 (그냥 K라는 이름과 K뒤에 뭐가 있는 이름 함께 나옴)
select last_name 이름 from employees where last_name like 'T_';   --앞글자는 K인 두 글자
select last_name 이름 from employees where last_name like 'K___'; --앞글자는 K인 네 글자







/* 12_26 */
desc departments;
desc employees;

select last_name 이름, department_id 부서번호 from employees where department_id = 100;
/* where는 true인 값만 출력 -> if와 다르다!! */

select * from employees;
select last_name 이름, salary 연봉 from employees where last_name = 'King';
select last_name 이름, salary 연봉 from employees where last_name = 'Whalen';
select last_name 이름, hire_date 입사일 from employees where hire_date = '07/03/17';
/* hire_date = '05/10/10' : Varchar2형 과 Date형 은 서로 변환이 편하기 때문에 자동으로 형변환이 일어남 */ 
/* Date형 : 연/월/일 */

select last_name 이름, salary 연봉 from employees where salary >= 10000;
select last_name 이름, hire_date 입사일 from employees where hire_date >= '05/10/10';
select last_name 이름, hire_date 입사일 from employees where hire_date >= '05/09/21';
select last_name 이름, hire_date 입사일 from employees where hire_date >= '00/01/01';
select last_name 이름, hire_date 입사일 from employees where hire_date <= '00/01/01';
/* Date형도 비교가 된다!! */

select last_name 이름, salary 연봉 from employees where last_name < 'Den';
/* 문자형도 비교가 된다!! */

select last_name 이름, salary 연봉 from employees where salary between 2500 and 3500;  -- 이상, 이하
select last_name 이름, salary 연봉 from employees where salary >= 2500 and salary <= 3500;

select last_name 이름, salary 연봉 from employees where last_name between 'A' and 'C';
select last_name 이름, hire_date 입사일 from employees where hire_date between '05/09/21' and '05/11/21';

select employee_id 사번, last_name 이름, manager_id 부서장 from employees
where manager_id in (100);    -- where manager_id = 100
select employee_id 사번, last_name 이름, manager_id 부서장 from employees
where manager_id in (100, 101);  -- where manager_id = 100 or manager_id = 101
select last_name 이름, hire_date 입사일 from employees where last_name in ('King', 'Baer');

select last_name 이름, salary 연봉 from employees where last_name = 'King';    --같은 애를 찾음
select last_name 이름, salary 연봉 from employees where last_name like 'King'; --비슷한 애를 찾음
select last_name 이름, salary 연봉 from employees where last_name like 'K%';   --K이상을 뜻함 (그냥 K라는 이름과 K뒤에 뭐가 있는 이름 함께 나옴)
select last_name 이름, salary 연봉 from employees where last_name like 'K_';   --앞글자는 K인 두 글자
select last_name 이름, salary 연봉 from employees where last_name like 'K___'; --앞글자는 K인 네 글자
select last_name 이름, salary 연봉 from employees where last_name like '%h%';  --중간에 h가 하나라도 들어가는 이름
select last_name 이름, salary 연봉 from employees where last_name like '_h%';  --두번째 글자가 h이고 뒤에는 뭐가 와도 상관 없다
select last_name 이름, hire_date 입사일 from employees where hire_date like '05%'; --2005년 입사자
select last_name 이름, hire_date 입사일 from employees where hire_date like '05/01%'; --2005년 1월 입사자
select last_name 이름, hire_date 입사일 from employees where hire_date like '05/01/29%'; --2005년 1월 입사자
select last_name 이름, job_id 업무 from employees where job_id like '%PROG%';
select last_name 이름, job_id 업무 from employees where job_id like 'SA%';
select last_name 이름, job_id 업무 from employees where job_id like '%A%';
select last_name 이름, job_id 업무 from employees where job_id like '%_A%'; --A앞에 한글자가 꼭 있는 경우
select last_name 이름, job_id 업무 from employees where job_id like '%\_A%' escape '\'; -- _A를 출력하고 싶을 때

select last_name 이름, department_id 부서 from employees where department_id like null;
select last_name 이름, department_id 부서 from employees where department_id = null;
select last_name 이름, department_id 부서 from employees where department_id = 'null';
select last_name 이름, department_id 부서 from employees where department_id = 0;
select last_name 이름, department_id 부서 from employees where department_id = '';
/* null은 값이 아니기 때문에 할당할수도 비교할수도 없다! */

select last_name 이름, department_id 부서 from employees where department_id is null;
select last_name 이름, commission_pct 인센티브 from employees where commission_pct is null;
select last_name 이름, commission_pct 인센티브 from employees where commission_pct is not null;

select last_name 이름, salary 연봉 from employees where salary between 10000 and 15000;      --이상 이하
select last_name 이름, salary 연봉 from employees where salary >= 10000 and salary <= 15000; --이상 이하
select last_name 이름, salary 연봉 from employees where salary > 10000 and salary < 15000;   --초과 미만
select department_id 부서 from employees where department_id = 90 or department_id = 100 or department_id = 80;
select department_id 부서 from employees where department_id in (90, 100, 80);

/* 예제 */
/* job_id가 IT_PROG SA_MAN ST_MAN 인 직원 중 연봉이 5000이상인 직원의 last_name과 job_id 출력 */
select last_name 이름, job_id 업무, salary 연봉 from employees where job_id in ('IT_PROG','SA_MAN','ST_MAN') and salary >= 5000;

/* 예제 */
/* 2005년 상반기에 입사한 직원의 last_name hire_date 출력 */
select last_name 이름, hire_date 입사일 from employees where hire_date >= '05/01/01' and hire_date < '05/07/01';
select last_name 이름, hire_date 입사일 from employees where hire_date between '05/01/01' and '05/07/01';


select employee_id 사번, last_name 이름 from employees where employee_id between 100 and 150;
select employee_id 사번, last_name 이름 from employees where employee_id between not 100 and 150; --에러
select employee_id 사번, last_name 이름 from employees where employee_id not between 100 and 150;

select employee_id 사번, last_name 이름 from employees where employee_id >= 100 and employee_id <= 150;
select employee_id 사번, last_name 이름 from employees where not employee_id >= 100 and employee_id <= 150;
select employee_id 사번, last_name 이름 from employees where employee_id >= 100 and not employee_id <= 150; --and로 각각 부정 가능함
select employee_id 사번, last_name 이름 from employees where not (employee_id >= 100 and employee_id <= 150); --전체 부정

select last_name 이름, department_id 부서 from employees where department_id in (70, 80, 90, 100);
select last_name 이름, department_id 부서 from employees where department_id not in (70, 80, 90, 100);

select last_name 이름, department_id 부서, salary 연봉 from employees where department_id = 50 or salary < 5000;
select last_name 이름, department_id 부서, salary 연봉 from employees where not department_id = 50 or salary < 5000;
select last_name 이름, department_id 부서, salary 연봉 from employees where department_id = 50 or not salary < 5000;
select last_name 이름, department_id 부서, salary 연봉 not (department_id = 50 or salary < 5000); --or의 not이므로 and!!

select last_name 이름, salary 연봉 from employees order by salary;      --오름차순
select last_name 이름, salary 연봉 from employees order by salary desc; --내림차순
select last_name 이름, salary 연봉 from employees where department_id = 80 order by salary desc; --내림차순
select last_name 이름, salary 연봉 from employees where department_id = 80 order by salary desc;
select last_name 이름, (salary + salary*commission_pct)/12 월급 from employees where commission_pct is not null order by salary desc;
select last_name 이름, (salary + salary*commission_pct)/12 월급 from employees where commission_pct is not null order by 월급 desc;

select last_name 이름, salary 연봉 from employees where department_id = 80 order by 2;  --연봉(두번째 열)로 정렬한다는 뜻
select last_name 이름, salary 연봉 from employees order by salary desc;
select last_name 이름, salary 연봉 from employees order by salary desc, last_name;
select last_name 이름, salary 연봉, department_id 부서 from employees order by salary desc, last_name, department_id;

select employee_id 사번, last_name 이름, salary 연봉 from employees where employee_id = &emp;
select last_name 이름, salary 연봉, department_id 부서 from employees where department_id = &depart and salary >= &sal;
select last_name 이름, job_id 업무 from employees where job_id = '&job';  --문자열이니까 따옴표!!
select last_name 이름, hire_date 입사일 from employees where hire_date > '&hire';
select last_name 이름, department_id 부서, &column from employees where &condition order by &order; 
select last_name 이름, department_id 부서, &column from employees where &condition order by &&column; 
--&&:그 값을 재사용하라는 뜻 -> 전에 입력한 값으로 계속 입력되기 때문에 새로운 창 안뜸 -> 바꾸려면 밑의 코드
undefine column;
select last_name 이름, department_id 부서, &column from employees where &condition order by &&column; 


select last_name 이름, job_id 부서, salary 연봉 from employees where department_id = &depart order by salary desc;

define depart = 50;
select last_name 이름, job_id 부서, salary 연봉 from employees where department_id = &depart order by salary desc;
undefine depart;

define depart = 50;
select last_name 이름, department_id 부서 from employees where department_id = &depart order by last_name;

set verify on;
select last_name 이름, department_id 부서 from employees where department_id = &depart order by last_name;




select * from emp;
select ename 이름, deptno 부서 from emp where deptno = &dep;
select ename 이름, job 직업 from emp where job = '&job';
select ename 이름, hiredate 입사일 from emp where hiredate = '&date';
select ename 이름, deptno 부서, &col_name 연봉 from emp where &condition order by &order_col;

select ename 이름, &&col_name 부서 from emp order by &col_name;
undefine col_name;

select ename 이름, deptno 부서 from emp where &&col >= 20 order by &col;












/* 12_27 */
select last_name 이름, salary 연봉 from employees where last_name ='king';
select last_name 이름, salary 연봉 from employees where lower(last_name) = lower('king');
select last_name 이름, salary 연봉 from employees where lower(last_name) = lower('&name');
select last_name 이름, salary 연봉 from employees where upper(last_name) = upper('&name');
select last_name 이름, salary 연봉 from employees where initcap(last_name) = initcap('&name');
select last_name 이름, upper(last_name) "upper", lower(last_name) "lower", initcap(last_name) "initcap" from employees
where employee_id between 100 and 109;

select concat('Helloworld!', '!!!') from dual; --dual:문법을 맞춰주기 위한 더미 테이블(가짜 테이블)

undefine str;
define str = 'Hello';
select concat('&str', 'world') from dual;

select substr('Helloworld!', 6) from dual;
select substr('Helloworld!', 6, 12) from dual;
select substr('Helloworld!', -5, 3) from dual;

select length('Hello   World!!') from dual;

select instr('HelloWorld!!', '!!') from dual;
select instr('HelloWorld!!','o') from dual;
select instr('HelloWorld!!','o', 1, 2) from dual; -- 찾은 'o'의 두번째값의 위치 출력

select lpad('Hello', 20) from dual; --왼쪽에 20칸의 여백을 찍어라
select rpad('Hello', 20) from dual; --오른쪽에 20칸의 여백을 찍어라
select lpad('Hello', 20, '*') from dual;
select rpad('Hello', 20, '*') from dual;

select replace('HelloWorld!!', 'o', 'a') from dual; --첫번째 문자열에서 두번째 문자를 세번째 문자로 바꿔라

select ltrim('aaaaaHello World!!!aaaaa', 'a') from dual; --왼쪽의 a를 지워라
select rtrim('aaaaaHello World!!!aaaaa', 'a') from dual; --오른쪽의 a를 지워라
select ltrim('     Hello World!!!     ', ' ') from dual; --왼쪽의 띄어쓰기를 지워라
select rtrim('     Hello World!!!     ', ' ') from dual; --오른쪽의 띄어쓰기를 지워라
select trim('H' from 'Hello World!!!') from dual; --얘도 문자열 중간의 문자는 못 지움

select last_name 이름, salary / 12 월급 from employees;
select last_name 이름, round(salary / 12, 2) 월급 from employees;  --반올림해서 두자리까지 나타남
select last_name 이름, trunc(salary / 12, 2) 월급 from employees;  --버림해서 두자리까지 나타남

select round(1234.5678, 2) from dual;
select round(1234.5678, 1) from dual;
select round(1234.5678, 0) from dual;
select round(1234.5678) from dual;
select round(1234.5678, -1) from dual;
select round(1234.5678, -2) from dual;

select trunc(1234.5678, 2) from dual;
select trunc(1234.5678, 1) from dual;
select trunc(1234.5678, 0) from dual;
select trunc(1234.5678) from dual;
select trunc(1234.5678, -1) from dual;
select trunc(1234.5678, -2) from dual;

select mod(10, 2) from dual;     --나머지 구하는 함수
select mod(10, 3) from dual;     --나머지 구하는 함수



alter session set nls_date_format = 'YY/MM/DD';
alter session set nls_date_format = 'YYYY/MM/DD HH24:MI:SS';

select sysdate, current_date from dual;  --오늘 날짜

alter session set nls_date_format = 'YY/MM/DD';
select sysdate from dual;  --오늘 날짜

alter session set nls_date_format = 'RR/MM/DD';
select sysdate from dual;  --오늘 날짜




/* 오라클에서만 가능한 날짜 연산 */
select sysdate from dual;
select sysdate + 10 from dual;
select sysdate - 10 from dual;
select sysdate + 30 from dual;
select '20/05/04' - '20/04/24' from dual;
select sysdate + 6/24 from dual;


select last_name 이름, hire_date 입사일, (sysdate - hire_date) 근속일수 from employees order by 근속일수 desc;
-- 지금도 계속 일하고 있기 때문에 돌릴 때마다 소수점이 계속 증가함 -> 소수점 버림
select last_name 이름, hire_date 입사일, trunc(((sysdate - hire_date)+1)/365) 근속연수 from employees order by 근속일수 desc;
select last_name 이름, months_between(sysdate, hire_date) 근속월수 from employees order by 근속월수 desc;
select last_name 이름, hire_date 입사일, add_months(hire_date, 18) 진급일 from employees order by 진급일 desc;

select * from employees;

select last_name 이름, hire_date 입사일, trunc((sysdate - hire_date)+1) 근속일수 from employees;
select last_name 이름, hire_date 입사일, trunc(months_between(sysdate, hire_date)) 근속월수 from employees;
select last_name 이름, hire_date 입사일, trunc(((sysdate - hire_date)+1)/365) 근속연수 from employees;



select MONTHS_BETWEEN('20/05/06','20/03/06') from dual;
select MONTHS_BETWEEN('20/03/06','20/05/06') from dual;
select MONTHS_BETWEEN('20/05/06','20/03/01') from dual;
select MONTHS_BETWEEN('20/03/01','20/05/06') from dual;

select ADD_MONTHS('20/05/06',10) from dual;
select ADD_MONTHS('20/05/06',-10) from dual;

select next_day ('20/05/06',-1) from dual;
select next_day ('20/05/06',1) from dual;
select next_day ('20/05/06','일') from dual;
select next_day ('20/05/06',5) from dual;
select next_day ('20/05/06','목') from dual;

select last_day ('20/02/06') from dual;
select last_day ('20/05/06') from dual;






select last_day(sysdate) from dual;
select last_day('2020/02/01') from dual;
select last_day(sysdate) - sysdate from dual;

select next_day(sysdate, 1) from dual;
select next_day(sysdate, 4) from dual;
select next_day(sysdate, '월') from dual; --오늘 이후에오는 처음 월요일의 날짜
select next_day(sysdate, '수') from dual; --오늘 이후에오는 처음 수요일의 날짜

select round(sysdate, 'MONTH') from dual; --월을 반올림
select trunc(sysdate, 'MONTH') from dual;
select round(to_date('19/12/15'), 'MONTH') from dual;
select round(to_date('19/12/16'), 'MONTH') from dual;
select trunc(to_date('19/12/15'), 'MONTH') from dual;

select round(sysdate, 'YEAR') from dual; --연도를 반올림
select trunc(sysdate, 'YEAR') from dual;
select round(to_date('19/12/15'), 'YEAR') from dual;
select trunc(to_date('19/12/15'), 'YEAR') from dual;

select width_bucket(92, 0, 100, 10) from dual; --0부터 100까지를 10으로 나눈 등급 중 몇등급인가
select width_bucket(55, 0, 100, 10) from dual;
select width_bucket(5, 0, 100, 10) from dual;
select width_bucket(100, 0, 100, 10) from dual;
select width_bucket(95, 100, 0, 10) from dual;

select width_bucket( sysdate, '1972/01/01', '2072/12/31', 10) from dual; --전 생애 중 나는 지금 몇등급중에 있는가
select width_bucket( sysdate, '1996/07/26', '2096/12/31', 10) from dual; --전 생애 중 나는 지금 몇등급중에 있는가


/* 예제 */
-- 입사일 기준으로 근속연에 따라 30등급으로 나누고 등급에 따라 수당 1000을 지급한다.
-- 기준은 2000년 1월 1일을 기준으로 한다.
-- 사변 연봉 입사일 수당을 출력하고 수당으로 내림차순 한다.

select employee_id 사번, last_name 이름, salary 연봉, hire_date 입사일, width_bucket(hire_date, sysdate, '2000/01/31', 30) * 1000 근속수당
from employees order by 근속수당 desc;


/* 예제 */
-- 사번 이름 입사일 근속연수 근속월수 근속일수
-- 몇년 몇월 며칠째 근무하고 있는지 
-- 근속연수/ 근속월수/ 근속일수로 내림차순

/*나*/
select employee_id 사번, last_name 이름, hire_date 입사일, 
trunc(((sysdate - hire_date)+1)/365) 근속연수, 
trunc(months_between(sysdate, hire_date)) 근속월수, 
trunc((sysdate - hire_date)) 근속일수
from employees order by 근속연수 desc, 근속월수 desc, 근속일수 desc;
/*강사님*/
select employee_id 사번, last_name 이름, hire_date 입사일, 
trunc((months_between(sysdate, hire_date))/12) 근속연수, 
trunc(mod(months_between(sysdate, hire_date),12)) 근속월수, 
trunc(sysdate - add_months(hire_date, months_between(sysdate, hire_date)))+1 근속일수
from employees order by 근속연수 desc, 근속월수 desc, 근속일수 desc;



select last_name 이름, hire_date 입사일, 
trunc((months_between(sysdate, hire_date))/12) "몇 년", 
trunc(mod(months_between(sysdate, hire_date),12)) "몇 월", 
trunc(sysdate - add_months(hire_date, months_between(sysdate, hire_date)))+1 "며칠"
from employees;





/* <4단원> */
select last_name 이름, to_char(hire_date, 'yyyy-mm-dd') 입사일 from employees;
select last_name 이름, to_char(hire_date, 'yy-mm-dd') 입사일 from employees;
select last_name 이름, to_char(hire_date, 'rrrr-mm-dd') 입사일 from employees;
select last_name 이름, to_char(hire_date, 'rr-mm-dd') 입사일 from employees;
select last_name 이름, to_char(hire_date, 'year month dd day') 입사일 from employees;

select to_char(sysdate, 'yy-mm-dd HH:mi:ss') 시각 from dual;
select to_char(sysdate, 'yy-mm-dd HH24:mi:ss') 시각 from dual;
select to_char(sysdate, 'yyyy dd "of" month HH24:mi:ss') 시각 from dual;
select to_char(sysdate, 'year mon ddspth HH24:mi:ss') 시각 from dual;
select to_char(sysdate, 'year mon ddspth HH24:mi:ss sssss') 시각 from dual;

select to_char( 12345 ) from dual;
select to_char( 12345, '999999' ) from dual;
select to_char( 12345, '0999999' ) from dual;
select to_char( 12345, '0,999,999' ) from dual;
select to_char( 12345, '09,999.99' ) from dual;
select to_char( 12345, '09.99' ) from dual;
select to_char( 12345, '$09,999.99' ) from dual;
select to_char( 12345, 'L09,999.99' ) from dual;
select to_char( 12345, 'L09999D99' ) from dual;
select to_char( 12345, 'L09999D99' ) from dual;
select to_char( -12345, '09999MI' ) from dual;
select to_char( 12345, '09999MI' ) from dual;
select to_char( -12345, 'MI09999' ) from dual; --앞에 주면 에러난다
select to_char( 12345, '09999' ) from dual;
select to_char( -12345, '09999PR' ) from dual;
select to_char( 12345, '09999PR' ) from dual;
select to_char( 12345, '9.9999EEEE' ) from dual; --E가 4개 = 10을 네 번 곱해라
select to_char( 12345, 'U09999' ) from dual;
select to_char( 12345, '99G999D9' ) from dual;

select last_name 이름, to_char(salary, '999,999.99') 연봉 from employees;
select last_name 이름, months_between(sysdate, hire_date) 근무월수 from employees;

select last_name 이름, round(months_between('2018/12/31', hire_date), 2) 근무월수 from employees; --암시적 형변환 (자동형변환)
select last_name 이름, round(months_between(sysdate - hire_date), 2) 근무월수 from employees; --형변환 X
select sysdate - '2019/01/01' from dual;          --에러발생 : 날짜형식 - 문자형식
select sysdate - to_date('2019/01/01') from dual; --에러 X : 명시적 형변환(강제형변환)
   -- 날짜형식은 문자열형식으로 표기할 수 밖에 없기 때문에
select last_name 이름, hire_date 입사일 from employees where hire_date > '2005/01/01'; --암시적 형변환 (자동형변환)
select last_name 이름, hire_date 입사일 from employees where hire_date > '01/01/2005'; --에러발생
select last_name 이름, hire_date 입사일 from employees where hire_date > to_date('2005 JAN 01', 'yyyy/mm/dd'); --에러발생








/* 12_30 */
select upper(concat(substr(last_name, 1, 8), '_US')) from employees;
select last_name 이름, to_char(round(salary/12, 2), '$') 월급 from employees;
select last_name 이름, salary + salary * nvl(commission_pct, 1000,0) 연봉 from employees
    where department_id in (80, 90); -- nvl : null이 아니면 1000, null이면 0으로 출력해라

select employee_id 사번, last_name 이름, department_id 부서, nvl(manager_id,'CEO') 부서장 from employees; 
  -- 에러 -> nvl을 쓸 때는 데이터 유형이 같아야 한다 -> manager_id 를 문자형으로 바꿔준다
select employee_id 사번, last_name 이름, department_id 부서, nvl(to_char(manager_id),'CEO') 부서장 from employees; 
  
/* 예제 */
-- department_id 가 없는 경우 '신입'이라고 출력
select last_name 이름, nvl(to_char(department_id), '신입') 부서 from employees
    where department_id is null; 
    

select first_name 이름, last_name 성, nullif( length(first_name), length(last_name)) 길이비교 from employees;
-- 두 길이가 같으면 null반환, 다르면 첫번째 값 반환

select last_name 이름, commission_pct 인센티브 from employees
    where commission_pct is not null;

select last_name 이름, coalesce(to_char(commission_pct), to_char(manager_id), 'CEO') coalesce함수 from employees;
-- 첫번째 인수 null아니면 출력, 첫번째 null이고 두번째 인수 null 아니면 출력, 둘 다 null 이면 CEO 출력
-- select last_name 이름, commission_pct 인센티브, manager_id 부서장 from employees;

select last_name 이름, salary 올해연봉, coalesce((salary + salary * commission_pct), salary + 2000, 3000) 인상연봉 from employees;

select last_name 이름, salary 연봉, job_id 업무,
case job_id
    when 'IT_PROG' then salary * 1.1
    when 'ST_CLERK' then salary * 1.2
    when 'SA_REP' then salary * 1.3
    else salary
end 인상연봉 from employees;

select last_name 이름,
case
    when department_id = 90 then '경영지원실'
    when department_id = 100 then '비서실'
    when department_id = 110 then '기획실'
    else '영업부'
end 부서명 from employees;

select last_name 이름, salary 연봉,
case
    when salary > 15000 then '이사'
    when salary > 10000 then '부장'
    when salary > 8000 then '과장'
    else '사원'
end 직급 from employees;

/* 예제 */
-- 이름 입사일 직급 출력
-- 근속연수가 18년 이상 '이사' 15년 이상 '부장' 12년 이상 '과장' 9년 이상 '대리' 그 이하는 사원
-- 직급으로 내림차순
select last_name 이름, hire_date 입사일, trunc((months_between(sysdate, hire_date))/12) 근속연수,
case
    when trunc((months_between(sysdate, hire_date))/12) >= 18 then '이사'
    when trunc((months_between(sysdate, hire_date))/12) >= 15 then '부장'
    when trunc((months_between(sysdate, hire_date))/12) >= 12 then '과장'
    when trunc((months_between(sysdate, hire_date))/12) >= 9 then '대리'
    else '사원'
end 직급 from employees order by hire_date;

select last_name 이름, salary 연봉, job_id 업무,
decode(job_id, 
    'IT_PROG', salary * 1.1,
    'ST_CLERK', salary * 1.2,
    'SA_REP', salary * 1.3,
    salary) 인상연봉 
from employees;

select last_name 이름, department_id 부서, 
decode(department_id,
    90, '경영지원실',
    80, '영업부',
    70, '관리부',
    60, '경리부',
    '인사부') 부서명
from employees;

/* 예제 */
-- 이름 연봉 입사일 근속연수(소수점 이하 버림) 수당 출력
-- 수당은 1년당 1000씩
-- 1년 이하의 근속 월수는 3개월 이하 250, 6개월 이하 500, 9개월 이하 750, 12개월 미만 1000
select last_name 이름, salary 연봉, hire_date 입사일,
case 
    when months_between(sysdate - hire_date) - trunc((sysdate - hire_date) / 365) * 12 <= 3 then trunc((sysdate - hire_date) / 365) * 1000 + (month_between(sysdate - hire_date) - trunc((sysdate - hire_date) / 365) * 12) * 250
    when months_between(sysdate - hire_date) - trunc((sysdate - hire_date) / 365) * 12 <= 6 then trunc((sysdate - hire_date) / 365) * 1000 + (month_between(sysdate - hire_date) - trunc((sysdate - hire_date) / 365) * 12) * 500
    when months_between(sysdate - hire_date) - trunc((sysdate - hire_date) / 365) * 12 <= 9 then trunc((sysdate - hire_date) / 365) * 1000 + (month_between(sysdate - hire_date) - trunc((sysdate - hire_date) / 365) * 12) * 750
    when months_between(sysdate - hire_date) - trunc((sysdate - hire_date) / 365) * 12 < 12 then trunc((sysdate - hire_date) / 365) * 1000 + (month_between(sysdate - hire_date) - trunc((sysdate - hire_date) / 365) * 12) * 1000
    else 
end 수당 from employees;
-- 강사님
select last_name 이름, salary 연봉, hire_date 입사일,
case 
    when trunc(mod(months_between(sysdate, hire_date),12)) + 1 <= 3 then 250
    when trunc(mod(months_between(sysdate, hire_date),12)) + 1 <= 6 then 500
    when trunc(mod(months_between(sysdate, hire_date),12)) + 1 <= 9 then 750
    else 1000
end + trunc((sysdate - hire_date) / 365) * 1000 수당 from employees;


/* <5단원> */
--------- 그룹함수 : sum, avg, max, min, count --------
select last_name 이름, salary 연봉 from employees where salary > avg(salary);
    -- 그룹함수 허용이 안된다!!!
select last_name 이름, salary 연봉, avg(salary) 평균연봉 from employees;
    -- avg(그룹함수)는 다른 변수와 달리 행마다 한 개의 값이 아닌 총 한 개의 값만 출력되야하는 함수
    -- 따라서 그룹함수는 다른 변수와 함께 입력하면 안됨!!! 
select max(salary), min(salary), sum(salary), avg(salary) from employees;

select count(salary) from employees;
select count(department_id) from employees;
select count(commission_pct) from employees;
select count(*) from employees;
    -- count는 null을 빼고 계산한다
select max(salary), min(salary), sum(salary), avg(salary), count(*) from employees;

select distinct department_id from employees;
select count(distinct department_id) from employees;
    -- 여기서도 count는 null은 빼고 계산한다
    
    
select avg(commission_pct) from employees;           -- 인센티브를 받는 사람들의 평균
-- select avg(commission_pct) from employees where commission_pct is not null;

select avg(nvl(commission_pct, 0 )) from employees;  -- 전사원의 인센티브 평균(인센티브를 받는 사람, 안받는 사람 모두 합한 평균)

select count(commission_pct) from employees;
select count(nvl(commission_pct, 0 )) from employees;

select last_name 이름, salary 연봉, department_id 부서 from employees;

select department_id 부서 from employees group by department_id;

select department_id 부서, avg(salary) 평균연봉 from employees group by department_id;
-- null도 그룹으로 인정해준다

select job_id 업무, avg(salary) 평균연봉, max(salary) 최고연봉, min(salary) 최저연봉 
    from employees group by job_id;

select department_id 부서, job_id 업무,  avg(salary) 평균연봉
    from employees group by department_id, job_id order by 부서;

select job_id 업무, department_id 부서, avg(salary) 평균연봉
    from employees group by job_id, department_id order by 업무;

select department_id 부서, max(salary) 최대연봉 from employees
    group by department_id having salary > 10000;  
-- 에러!! -> having은 group by를 해서 나온 결과(최대 연봉)에 대한 제어만 가능!!
select department_id 부서, max(salary) 최대연봉 from employees
    group by department_id having max(salary) > 10000; 

select department_id 부서, avg(salary) 평균연봉 from employees where salary > 5000
    group by department_id having avg(salary) > 5000; 

/* 예제 */
-- having 이용!
-- 부서인원이 2명 이상인 부서들의 부서번호와 평균연봉을 출력
-- 단 평균연봉이 5000 이상인 부서만 출력
select department_id 부서, avg(salary) 평균연봉 from employees
    group by department_id having count(department_id) >= 2 and avg(salary) >= 5000;


------분석함수--------
select last_name 이름, salary 연봉, first_value(salary) over (order by salary desc) 최고연봉 
    from employees;
-- first_value ~ over ~ : 그 행 포함 위쪽 첫번째 값을 출력 / last_value ~ over ~ : 그 행 포함 아래쪽 마지막 값을 출력 = 무조건 그 행 값 나옴
select last_name 이름, salary 연봉, first_value(salary) over (order by salary) 최저연봉 
    from employees; 
    
select last_name 이름, salary 연봉, first_value(salary) over (order by salary rows 3 preceding) 최저연봉 
    from employees;     -- 그 행 빼고 위 세번째 값 출력
    
select last_name 이름, salary 연봉, 
    last_value(salary) 
    over (order by salary rows between 3 preceding and 3 following) "범위내 마지막값" 
from employees;     -- 위로 3행 아래로 3행 총 7행 중 마지막 행의 값 출력
    
select last_name 이름, salary 연봉, 
    first_value(salary)
    over (order by salary desc range between 1000 preceding and 1000 following) "범위내 최저값"
from employees;
 
select last_name 이름, department_id 부서,
    avg(salary) over(partition by department_id) "부서별 평균"
from employees;
/* = */ select last_name 이름, department_id 부서, avg(salary) 평균연봉
            from employees group by department_id;
        -- 같은 코드이지만 이 코드는 이름 때문에 에러가 난다 -> 이름까지 출력하려면 위의 코드를 사용!!
        /* 그룹함수 : 전체 행을 한번만 계산, 분석함수 : 전체 행을 매번 계산 */

select last_name 이름, department_id 부서,
    trunc(avg(salary) over(partition by department_id), 2) 평균연봉,
    trunc(sum(salary) over(partition by department_id), 2) 연봉합계,
    trunc(count(salary) over(partition by department_id), 2) 인원수
from employees;    

select last_name 이름, salary 연봉,
    row_number() over(order by salary desc) 순위,
    rank() over(order by salary desc) 순위,
    dense_rank() over(order by salary desc) 순위
from employees;



-- group by 확장 --
-- 우측부터 하나씩 제거하면서 결과를 반환
----- group by          : (a, b, c) => (a, b, c)
----- group by rollup() : (a, b, c) => (a, b, c), (a, b), (a), ()
----- group by cube()   : (a, b, c) => (a, b, c), (a, b), (a, c), (b, c), (a), (b), (c), ()
----- group by grouping sets() : 조합을 선택할 수 있다

-- group by (a, b) => (a, b)
select department_id 부서, job_id 업무, round(avg(salary)) 연봉평균
    from employees
    group by department_id, job_id
    order by department_id;

-- group by rollup(a, b) => (a, b), (a), ()   
select department_id 부서, job_id 업무, round(avg(salary)) 연봉평균
    from employees
    group by rollup (department_id, job_id)
    order by department_id;  -- 맨 밑줄이 전체평균 = ()

-- group by cube(a, b) => (a, b), (a), (b), ()   
select department_id 부서, job_id 업무, round(avg(salary)) 연봉평균
    from employees
    group by cube (department_id, job_id)
    order by department_id;  -- 맨 밑줄이 전체평균 = ()

-- group by grouping sets ( (a), (b), () )  
select department_id 부서, job_id 업무, round(avg(salary)) 연봉평균
    from employees
    group by grouping sets ( (department_id), (job_id), () )
    order by department_id; 








/* 01_02 */
------- 정규표현식 -------
select last_name 이름, salary 연봉 from employees
where regexp_like(last_name, 'K'); -- 이름에 K가 들어있는 사람을 찾아라

select last_name 이름, salary 연봉 from employees
where regexp_like(last_name, 'K[^i]'); -- 이름에 K가 들어있고 두번째 글자에 i가 들어있지 않은 사람 찾아라

select last_name 이름, salary 연봉 from employees
where regexp_like(last_name, 'Ki'); -- 이름에 Ki가 들어있는 사람 찾아라

select last_name 이름, salary 연봉 from employees
where regexp_like(last_name, 'K[ah]'); -- 첫번째 글자가 K이고 두번째 글자가 a이거나 h인 이름

select last_name 이름, salary 연봉 from employees
where regexp_like(last_name, 'K[a-i]'); -- 첫번째 글자가 K이고 두번째 글자가 a부터 i인 이름

select last_name 이름, salary 연봉 from employees
where regexp_like(last_name, 'K[a-z]'); -- 첫번째 글자가 K이고 두번째 글자가 a부터 z인 이름

select last_name 이름, salary 연봉 from employees
where regexp_like(last_name, 'K[0-9]'); -- 첫번째 글자가 K이고 두번째 글자가 0부터 9인 이름

select last_name 이름, job_id 업무, regexp_substr( job_id, '[^_]' )  -- ^ : '맨앞부터'를 뜻함
from employees;
select last_name 이름, job_id 업무, regexp_substr( job_id, '[^$]+' )
from employees;
select last_name 이름, job_id 업무, regexp_substr( job_id, '[_$]' )
from employees;
----------------------


/* <6단원> */
-- 사번이 100번인 사람의 부서명
select department_id from employees where employee_id = 100;
select department_name from departments where department_id = 90;

-- 두 테이블을 합쳐서 하나의 테이블인것처럼 => 'join'
select * from employees, departments;  -- 107 * 27 행
select * from employees natural join departments;
select * from employees join departments using( department_id );

select employee_id 사번, last_name 이름, department_id 부서, department_name 부서명
from employees
join departments
using (department_id)
where employee_id = 100;

select * from employees
join departments   
on employees.department_id  = departments.department_id
order by employee_id;

select employee_id 사번, last_name 이름, department_name 부서명 
from employees
join departments 
on employees.department_id  = departments.department_id
where employee_id = 100;

select employee_id 사번, last_name 이름, department_id 부서, department_name 부서명 
from employees
join departments 
on employees.department_id  = departments.department_id
where employee_id = 100;
-- 에러
  --> department_id가 두 테이블에 모두 있기 때문에 약어를 사용하여 어디 테이블꺼인지 써주자
select e.employee_id 사번, e.last_name 이름, e.department_id 부서, d.department_name 부서명 
from employees e
join departments d
on e.department_id  = d.department_id
where employee_id = 100;

select e.employee_id 사번, e.last_name 이름, e.department_id 부서, d.department_name 부서명 
from employees e, departments d
where e.department_id = d.department_id
and employee_id = 100;

/* 예제 */
-- 사번이 120번인 사원의 employee_id, last_name, job_id, job_title 을 출력
--- 방법1
select employee_id 사번, last_name 이름, job_id 업무, job_title 업무명
from employees 
join jobs 
using(job_id)
where employee_id = 120;
--- 방법2
select e.employee_id 사번, e.last_name 이름, e.job_id 업무, j.job_title 업무명
from employees e 
join jobs j 
on e.job_id = j.job_id
where e.employee_id = 120;
--- 방법3
select e.employee_id 사번, e.last_name 이름, e.job_id 업무, j.job_title 업무명
from employees e, jobs j
where e.job_id = j.job_id
and employee_id = 120;



-- 세 테이블 조인
--- 방법1
select e.last_name 이름, d.department_name 부서명, l.city 도시명
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;
--- 방법2
select last_name 이름, department_name, city
from employees 
join departments 
using ( department_id )
join locations 
using ( location_id);
--- 방법3
select e.last_name 이름, d.department_name 부서명, l.city 도시명
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id;

/* 예제 */
-- 2005년 상반기에 입사한 직원의 사번, 이름, 부서명, 업무명 을 출력
--- 방법1
select employee_id 사번, last_name 이름, department_name 부서명, job_title 업무명, hire_date
from employees
join departments using ( department_id )
join jobs using ( job_id )
where hire_date between '05/01/01' and '05/06/30';
--- 방법2
select e.employee_id 사번, e.last_name 이름, d.department_name 부서명, j.job_title 업무명, hire_date
from employees e 
join departments d on e.department_id = d.department_id
join jobs j on e.job_id = j.job_id
where hire_date between '05/01/01' and '05/06/30';
--- 방법3
select e.employee_id 사번, e.last_name 이름, d.department_name 부서명, j.job_title 업무명, hire_date
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id
and hire_date between '05/01/01' and '05/06/30';



-- self join
select e.employee_id 사번, e.last_name 이름, e.manager_id 부서장, m.last_name 부서장명
from employees e  -- 내 정보 테이블
join employees m  -- 부서장 정보 테이블
on e.manager_id = m.employee_id(+)  --(+)써도 되고 안써도 됨 <= employee_id의 개수가 한 개 더 많아서 <= king의 사수는 없으니까 부서장 데이터 없음
order by e.employee_id;

select e.employee_id 사번, e.last_name 이름, e.manager_id 부서장, m.last_name 부서장명
from employees e, employees m
where e.manager_id = m.manager_id(+)
order by e.employee_id;



-- salgrade 테이블 생성하기
select * from jobs;

create table salgrade(
grade varchar2(3) primary key,
minsal number(8, 2) not null,
maxsal number(8, 2) not null
);
insert into salgrade values( 'A', 20000, 30000);
insert into salgrade values( 'B', 15000, 20000);
insert into salgrade values( 'C', 10000, 15000);
insert into salgrade values( 'D', 5000, 10000);
insert into salgrade values( 'F', 1000, 5000);
select * from salgrade;
-- 잘못 만들었을 때 : drop table salgrade;
commit;  -- commit 한번씩 해주자 (insert 저장 같은 것)

select * from user_tables;



-- nonequijoin
select e.last_name 이름, e.salary 연봉, s.grade 연봉등급 
from employees e
join salgrade s
-- on e.salary >= s.minsal and e.salary < s.maxsal
on e.salary between s.minsal and s.maxsal  -- 이렇게 하면 이상,이하라서 겹치는 부분이 생김
order by s.grade;

select e.last_name 이름, e.salary 연봉, s.grade 연봉등급
from employees e, salgrade s
where e.salary >= s.minsal and e.salary < s.maxsal
order by s.grade;



-- left outer join
select e.last_name 이름, e.department_id 부서, d.department_name 부서명
from employees e
-- join departments d  -> 원래 107명인데 부서가 없는 사람이 1명 있어서 106명 나옴
left outer join departments d
on e.department_id = d.department_id;

select e.last_name 이름, e.department_id 부서, d.department_name 부서명
from employees e, departments d
where e.department_id = d.department_id (+); -- 데이터개수가 모자라는 쪽에 (+)를 붙인다


-- right outer join
select e.last_name 이름, e.department_id 부서, d.department_id 부서, d.department_name 부서명
from employees e
-- join departments d  
right outer join departments d --> 부서들이 더 있다
on e.department_id = d.department_id;

select e.last_name 이름, e.department_id 부서, d.department_name 부서명
from employees e, departments d
where e.department_id (+) = d.department_id; -- 데이터개수가 모자라는 쪽에 (+)를 붙인다


-- full outer join
select e.last_name 이름, e.department_id 부서, d.department_id 부서, d.department_name 부서명
from employees e
-- join departments d  
full outer join departments d --> 부서들이 더 있다
on e.department_id = d.department_id;



/* 예제 */
--사원들의 이름 부서번호 부서이름을 출력
--단 부서가 없는 직원까지 모두 출력( Outer Join )
select e.last_name 이름, e.department_id 부서, d.department_name 부서명
from employees e
left outer join departments d
on e.department_id = d.department_id;

select e.last_name 이름, e.department_id 부서, d.department_name 부서명
from employees e, departments d
where e.department_id = d.department_id (+);


--인센티브를 받는 사원의 이름, 인센티브, 부서명을 
--인센티브가 큰 순서로 출력
select * from departments;
select e.last_name 이름, e.commission_pct 인센티브, d.department_name 부서명
from employees e, departments d
where e.department_id = d.department_id
and e.commission_pct is not null
order by e.commission_pct desc;  --- where절로 join 하는것은 표준이 아니다!! join on이 표준!!

select last_name 이름, commission_pct 인센티브, department_name 부서명
from employees 
join departments
using (department_id)
where commission_pct is not null
order by commission_pct desc;

select e.last_name 이름, e.commission_pct 인센티브, d.department_name 부서명
from employees e
join departments d
on e.department_id = d.department_id
where e.commission_pct is not null
order by e.commission_pct desc;


--사원명, 부서명, 도시를 출력( Outer Join )
select e.last_name 이름, d.department_name 부서명, l.city 도시명
from employees e
left outer join departments d
on e.department_id = d.department_id
left outer join locations l
on d.location_id = l.location_id
order by e.employee_id;

select e.last_name 이름, d.department_name 부서명, l.city 도시명
from employees e, departments d, locations l 
where e.department_id = d.department_id (+)
and d.location_id = l.location_id (+)
order by e.employee_id;



--사원명, 업무, 급여, 급여등급을 높은 등급부터 출력
select e.last_name 이름, j.job_title 업무명, e.salary 급여, s.grade 급여등급
from employees e
join jobs j
on e.job_id = j.job_id                           --equijoin
join salgrade s
on e.salary >= s.minsal and e.salary < s.maxsal  --non equijoin -> 섞어쓰기 가능
order by s.grade;


--Abel 이라는 직원의 사원명, 부서번호와 같은 부서 직원을 
--사원명순 동료이름순으로 출력
--self join. 단 자신을 동료로 출력하면 안된다.
select e.last_name 이름, e.department_id 부서번호, m.last_name 동료이름
from employees e       -- 내 테이블
join employees m       -- 동료 테이블
on e.department_id = m.department_id
where e.last_name = 'Abel'
-- and not m.last_name = 'Abel'
and e.last_name != m.last_name
order by m.last_name;

select e.last_name 이름, e.department_id 부서번호, d.department_name 부서명, m.last_name 동료이름
from employees e , employees m, departments d
where e.department_id = m.department_id             --self join
and e.department_id = d.department_id               --equijoin -> 섞어쓰기 가능
and e.last_name = 'Abel'
-- and not m.last_name = 'Abel'
and e.last_name != m.last_name
order by m.last_name;


/* 사진 예제 */
--1
select d.department_name 부서명, l.city 도시, c.country_name 국가, r.region_name 대륙
from departments d
join locations l
on d.location_id = l.location_id
join countries c
on l.country_id = c.country_id
join regions r
on c.region_id = r.region_id
order by 부서명;

--2
select e.last_name 이름, j.job_title 업무, d.department_name 부서, h.start_date 전입, h.end_date 전출
from employees e
join departments d
on e.department_id = d.department_id
join jobs j
on e.job_id = j.job_id
join job_history h
on j.job_id = h.job_id;

---강사님 : job_history 기준으로 inner join을 함
select h.employee_id 사번, e.last_name || ' ' || e.first_name 이름, j.job_title 업무, d.department_name 부서, h.start_date 전입, h.end_date 전출
from job_history h
join employees e
on h.employee_id = e.employee_id
join jobs j
on h.job_id = j.job_id
join departments d
on h.department_id = d.department_id;








/* 01_03 */
-----subquery-----
--last_name이 'Seo'인 사람의 부서명
select department_id from employees where last_name = 'Seo';
select department_name from departments where department_id = 50;

----> join : 위치가 중요
select department_name from employees e, departments d
where e.department_id = d.department_id
and last_name = 'Seo';

----> subquery : 순서가 중요 : 알고 있는 데이터 -> 알고 싶은 데이터
select department_name from departments where department_id         --mainquery
= ( select department_id from employees where last_name = 'Seo' );  --subquery

select department_name from departments where department_id
in ( select department_id from employees where last_name = 'King'); 

select last_name 이름, salary 연봉
from employees
where salary > avg( salary );  --함수 쓰면 에러

select avg(salary) from employees;
select last_name 이름, salary 연봉
from employees
where salary > ( select avg(salary) from employees );  --서브쿼리를 이용해 함수 사용

select job_id from employees where employee_id = 141;
select last_name 이름, job_id 업무
from employees
where job_id = (select job_id from employees where employee_id = 141);

select last_name 이름, salary 연봉, job_id 업무
from employees
where job_id = ( select job_id from employees where last_name = 'Seo' )
and salary > ( select salary from employees where last_name = 'Seo' );

select department_id 부서, avg(salary) 평균연봉
from employees
group by department_id;

select department_id 부서, trunc(avg(salary), 2) 평균연봉
from employees
group by department_id
having avg(salary) > (select avg(salary) from employees where department_id = 50 );

select last_name 이름, department_id 부서
from employees
where department_id  = 90 or department_id = 100;

select last_name 이름, department_id 부서
from employees
where department_id  in (90, 100);  -- in : or 대신 쓰는 함수 => 여러 데이터 중 하나 (다중쿼리)

select last_name 이름, department_id 부서
from employees
where department_id in (select department_id from employees where last_name = 'King');
----- in : or 대신 쓰는 함수 => 여러 데이터 중 하나 (다중쿼리)

select department_id from employees where last_name = 'King';
select last_name 이름, department_id 부서
from employees
where department_id >= any (select department_id from employees where last_name = 'King');
----- any : 최소값보다 큰 애 (최대값보다 작은 애)

select department_id from employees where last_name = 'King';
select last_name 이름, department_id 부서
from employees
where department_id >= all (select department_id from employees where last_name = 'King');
----- all : 최대값보다 큰 애 (최소값보다 작은 애)

select last_name, department_id from employees where last_name = 'Seo';
select last_name 이름, department_id 부서
from employees 
where exists ( select last_name, department_id from employees where last_name = 'Seo');

select employee_id 사번, last_name 이름
from employees
where employee_id in ( select distinct manager_id from employees);

select employee_id 사번, last_name 이름
from employees
where employee_id not in ( select distinct manager_id from employees);
---manager_id가 없는 null값이 있기 때문에 not in 을 쓰면 null값이 반환됨
---subquery에 null값이 있는 경우를 조심해야 한다. 결과가 null값이 나오기 때문에.



/* 예제 */
--1
--연봉이 2500 이하인 직원들의 이름 연봉 평균연봉 출력
select last_name 이름, salary 연봉, 
trunc((select avg(salary) from employees where salary <= 2500),2) 평균연봉
from employees
where salary <= 2500 ;  

--2
--100번 부서 직원들의 이름 연봉 최고연봉 최저연봉 연봉-평균연봉 출력
select last_name 이름, salary 연봉,
(select max(salary) from employees where department_id = 100) 최고연봉, 
(select min(salary) from employees where department_id = 100) 최저연봉, 
trunc(salary - (select avg(salary) from employees where department_id = 100)) 연봉차
from employees
where department_id = 100;  

--3
-- last_name 이 Russell 인 사람의 급여보다 많은 급여를 받는 사람의 이름과 연봉를 출력
select last_name 이름, salary 연봉
from employees
where salary > (select salary from employees where last_name = 'Russell');

--4
--Russell과 job_id 가 같은 사람의 이름, 부서명, 도시를 출력한다.
--Russell은 제외. 부서명과 도시는 join으로.
select e.last_name 이름, d.department_name 부서명, l.city 도시
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where job_id = (select job_id from employees where last_name = 'Russell')
and last_name != 'Russell';

--5
--부서가 위치한 도시가 Toronto 인 직원들의 사번, 이름을 출력한다. 
--서브 쿼리 추가 사용. 
---> join
select e.employee_id 사번, e.last_name 이름
from employees e
join departments d 
on e.department_id = d.department_id
join locations l 
on d.location_id = l.location_id
where city = 'Toronto';
---> subquery : 값이 하나라서 in 이 아닌 등호 사용!
select employee_id 사번, last_name 이름 from employees where department_id =
    (select department_id from departments where location_id =
        (select location_id from locations where city = 'Toronto'));


--6
--급여 등급이 B등급인 사람들의 이름, 급여를 모두 출력한다.
--서브 쿼리를 써서 해결한다.
---> join
select e.last_name 이름, e.salary 급여
from employees e
join salgrade s
on e.salary >= s.minsal and e.salary < s.maxsal
where grade = 'B';
---> subquery
select last_name 이름, salary 급여 from employees 
where salary >= (select minsal from salgrade where grade = 'B')
    and salary < (select maxsal from salgrade where grade = 'B');
    
    
--7
--유럽대륙에 근무하는 사람들의 이름(last_name)과 부서(department_id) 출력
--Join / SubQuery 각각 실행
---> join
select * from regions;
select e.last_name 이름, e.department_id 부서
from employees e
join departments d 
on e.department_id = d.department_id
join locations l 
on d.location_id = l.location_id
join countries c 
on l.country_id = c.country_id
join regions r 
on c.region_id = r.region_id
where region_name = 'Europe';
---> subquery : 값이 하나라서 in 이 아닌 등호 사용!
select last_name 이름, department_id 부서 from employees where department_id in
    (select department_id from departments where location_id in
        (select location_id from locations where country_id in 
            (select country_id from countries where region_id =
                (select region_id from regions where region_name = 'Europe'))));

--8
--employee_id가 201번인 사람이 퇴사하기 전까지 같은 부서에 근무한 직원들의 사번 이름 부서 입사일 출력
--end_date를 퇴사일로 가정
---> join
select distinct e.employee_id 사번, e.last_name 이름, e.department_id 부서, e.hire_date 입사일
from employees e
cross join job_history j
where e.department_id =
    (select department_id from job_history where employee_id = 201) --이미 퇴사한 사람이기 때문에 job_history에서 정보를 가져와야 한다
and e.hire_date < j.end_date
and e.employee_id != 201;

---> subquery
select distinct e.employee_id 사번, e.last_name 이름, e.department_id 부서, e.hire_date 입사일
from employees e
where hire_date < 
    (select end_date from job_history where employee_id = 201) --이미 퇴사한 사람이기 때문에 job_history에서 정보를 가져와야 한다
and department_id = 
    (select department_id from job_history where employee_id = 201) --이미 퇴사한 사람이기 때문에 job_history에서 정보를 가져와야 한다
and employee_id != 201;








/* 01_06 */
-------집합연산자--------
select last_name 이름, salary 연봉, department_id 부서
from employees
where department_id = 80      -- 34명
union  --합집합 : 41
select last_name 이름, salary 연봉
from employees
where salary > 10000;         -- 15명
  ---> 에러 -> 집합연산자를 사용하고 싶을 때 두 쿼리에서 가져오는 데이터가 같아야 한다!!!

select last_name 이름, salary 연봉, department_id 부서
from employees
where department_id = 80      -- 34명
union  -- 합집합 : 41
select last_name 이름, salary 연봉, department_id 부서
from employees
where salary > 10000;         -- 15명

select last_name 이름, salary 연봉, department_id 부서
from employees
where department_id = 80      -- 34명
union all  -- 두집합 그냥 더해라 : 49
select last_name 이름, salary 연봉, department_id 부서
from employees
where salary > 10000         -- 15명
order by 연봉;    -- alias를 줘야 돌아간다!!! 

select last_name 이름, salary 연봉, department_id 부서
from employees
where department_id = 80      -- 34명
intersect  -- 교집합 : 8
select last_name 이름, salary 연봉, department_id 부서
from employees
where salary > 10000         -- 15명
order by 연봉;    -- alias를 줘야 돌아간다!!! 

select last_name 이름, salary 연봉, department_id 부서
from employees
where department_id = 80      -- 34명
minus  -- 차집합 : 34-8 = 26
select last_name 이름, salary 연봉, department_id 부서
from employees
where salary > 10000         -- 15명
order by 연봉;    -- alias를 줘야 돌아간다!!! 

select last_name 이름, salary 연봉, department_id 부서
from employees
where salary > 10000         -- 15명
minus  -- 차집합 : 15-8 = 7
select last_name 이름, salary 연봉, department_id 부서
from employees
where department_id = 80     -- 34명
order by 연봉;    -- alias를 줘야 돌아간다!!!

select location_id 위치, department_name 부서명, to_char( NULL ), 주
from departments
union
select location_id 위치, to_char( NULL ) 부서명, state_province 주
from locations;


create table customer(
    id varchar2( 20 ) primary key,
    passwd varchar2 ( 30 ) not null,
    name varchar2 ( 30 ) not null,
    tel varchar( 20 ),
    logtime date default sysdate --값이 안들어오면 현재 시간을 넣어라
);
desc customer;
drop table customer;

select * from customer;

insert into customer (id, passwd, name, tel, logtime ) 
    values ( 'aaa', '111', 'kim', '1111-2222', sysdate );
insert into customer 
    values ( 'bbb', '111', 'lee', '2222-3333', sysdate ); 
insert into customer (id, passwd, name) 
    values ( 'ccc', '111', '3333-1111' ); 
insert into customer (name, passwd, id, tel) 
    values ( 'park', '111', 'ddd', '3333-1111' );
insert into customer
    values ( 'eee', '111', 'jung', NULL, NULL );
insert into customer
    values ( 'fff', '111', 'choi', NULL, to_date( '2019/12/30' , 'yyyy mm dd') );
insert into customer
    values ( 'ggg', '&passwd', '&name', '&tel', sysdate );

insert into customer (id, passwd, name, tel)
select employee_id, '111', first_name || ' ' || last_name, phone_number
from employees
where employee_id between 100 and 109;

commit;  --꼭 해주기!!!!!

select * from customer;
update  customer set tel = '9999-9999' where id = 'ccc';
update  customer set tel = '9999-9999', logtime = sysdate where id = 'eee';
    
update customer set name = ( select first_name || ' ' || last_name from employee_id = 110), 
tel = ( select phone_number from employees where employee_id = 110)
where id = 'fff';
commit;

delete from customer where id = 'ccc';
delete from customer where length( name ) < 5;
delete from customer;

select * from customer;
rollback;  -- 마지막 commit한 상태로 돌아감!!



create table test(
    num number( 2 ),
    value varchar2( 10 )
);
desc test;
commit;

select * from test;

insert into test values( 1, 'A' );
savepoint a;  --중간에 롤백으로 다시 돌아갈 수 있게!!
insert into test values( 2, 'B' );
savepoint b;
insert into test values( 3, 'C' );
savepoint c;
insert into test values( 4, 'D' );
savepoint d;
insert into test values( 5, 'E' );

select * from test;

rollback to c;
rollback to d;  --에러 : 윗줄에서 d라는 세이브 포인트가 만들어지지 않은 시점으로 돌아갔기 때문에 -> 다시 미래로 가라! 할 수 없는 것
rollback to a;  --에러 X : 얘는 과거이기 때문에 롤백을 할 수 있는 것
rollback; --아예 처음으로 돌아감

commit;  --커밋을 하면 세이브포인트는 다 살아짐!!

rollback;

select * from employees fror update;
select * from user_tables;
select * from user_sequences;
select * from user_indexes;


select * from hr.employees;

desc employees;








/* 01_07 */
select * from user_constraints;

select * from user_constraints where table_name = 'CUSTOMER';  --제약 조건 확인하기

drop table test;

create table test(
id  varchar2(20) constraint test_id_pk primary key,
passwd varchar2(20) constraint test_passwd_nn not null,
name varchar2(30) constraint test_name_nn not null,
email varchar2(50) constraint test_email_uk unique,
age number(3), 
constraint test_email_ck check( age between 1 and 150 )
);

select * from user_constraints where table_name = 'TEST';  --

insert into test( id, email, age )
values ( 'aaa', 'a@a.com', 20);  --passwd와 name에 null을 넣을 수 없으므로 에러!!

insert into test( id, passwd, name, email, age )
values ( 'aaa', '111', '홍길동', 'a@a.com', 20);

insert into test values ( 'bbb', '111', '홍길동홍길동홍길동홍길동', 'a@a.com', 20); 
    --name에 30 byte 제한을 걸어놨기 때문에 에러 (한글 12글자 = 36 byte)

insert into test values ( 'bbb', '111', '이순신', 'b@b.com', 20);

insert into test values ( 'ccc', '111', '이순신', to_char(null), 20);

insert into test values ( 'ddd', '111', '김유신', to_char(null), 20);
    --null은 unique 충돌이 일어나지 않는다 -> 값에서만 충돌됨!!
insert into test values ( 'eee', '111', '대조영', 'a@a.com', 40);
    --이메일 unique 충돌!! 에러

select * from test;

insert into test values ( 'fff', '111', '강감찬', 'f@f.com', -10); -- age 범위 에러
insert into test values ( 'fff', '111', '강감찬', 'f@f.com', 0);   -- age 범위 에러
insert into test values ( 'fff', '111', '강감찬', 'f@f.com', 200); -- age 범위 에러

insert into test values ( 'fff', '111', '권율', 'g@g.com', 30);
insert into test values ( 'fff', '111', '권율', 'h@h.com', 30); 
    -- 아이디 -> primary key -> unique 충돌!!   
insert into test values ( to_char(null), '111', '권율', 'h@h.com', 30);
    -- 아이디 -> primary key -> null을 넣을 수 없다!! 
insert into test values ( 'hhh', '111', '연개소문', 'h@h.com', 50);   
    

create table te as select * from test;
select * from te;

desc employees; 
create table emp as select * from employees where 1=0;  
    --where절이 무조건 거짓 -> 가져오는 내용 하나도 없게 됨 -> 구조만 복사됨
desc emp;
select * from emp;


alter table te read only;  --읽기 전용 테이블

select * from user_constraints where table_name = 'TE';
insert into te values('ggg', '111', '윤봉길', 'c@c.com', 30);
    -- 읽기 전용 테이블로 위에서 바꿨기 때문에 데이터를 넣을 수 없다 
delete from te where id = 'hhh';
    -- 읽기 전용 테이블로 위에서 바꿨기 때문에 데이터를 삭제할 수 없다

alter table te read write;  --읽기 전용 풀기


select * from te;
alter table te add ( address varchar(20) );
alter table te modify ( address number(10) );
alter table te modify ( address varchar(40) );

insert into te values( 'hhh', '111', '연개소문', 'h@h.com', 30, '서울시 서초구 서초동' );
alter table te modify ( address number(10) );  --데이터가 비어있지 않으면 데이터 타입을 바꿀 수 없다.
alter table te modify ( address varchar(100) );
alter table te modify ( address varchar(20) ); --에러 -> 20보다 더 긴 데이터가 들어가 있으므로

alter table te modify ( age number(4) );

alter table te drop column address;  --데이터가 들어 있어도 드랍됨 -> 굉장히 조심해야 한다.

--alter table drop -> 모든 메모리가 진짜로 삭제됨 -> 시간이 오래걸림
--set unused -> 그냥 메모리를 안보이게 해줌 -> 어쨌든 메모리를 차지하고 있음 -> 일단 비활성화시킨 후 사람이 적은 새벽시간에 drop해야됨

select * from user_unused_col_tabs;

alter table te add(address varchar(30));
alter table te set unused( address ); --비활성화 -> 다시 활성화 절대 못 함

select * from te;

alter table te drop unused columns;

select * from user_constraints where table_name = 'TEST';
alter table test rename constraint test_email_ck to test_age_range;

alter table test add ( address varchar2(50) );
alter table test modify address constraint test_address_nn not null; 
    --> 제약 조건 not null로 바꾸기 -> 에러 -> null인 데이터로 채워져 있기 때문에
alter table test modify age constraint test_age_nn not null;

select * from test;
insert into test values( 'ggg', '111', '윤봉길', 'g@g.com', to_number(null), '서울시' );
    --> age에 not null 제약조건이 걸려 있어 age에 null넣으면 에러

alter table test drop constraint test_age_nn;  --test에 age에 줬던 not null 제약조건 삭제

select * from test;
insert into test values( 'iii', '111', '윤봉길', 'i@i.com', to_number(null), '서울시' );
    --> age에 not null 제약조건을 삭제해서 age에 null 넣을 수 있음

alter table test drop age constraint test_age_range;  --age 범위 제약 조건 삭제
insert into test values( 'jjj', '111', '안창호', 'j@j.com', 200, '인천시');

alter table test add constraint test_age_range check ( age between 1 and 150 );
    -- 범위를 넘는 값이 있어 에러
alter table test add constraint test_age_range check ( age between 1 and 200 );

insert into test values( 'kkk', '111', '유관순', 'k@k.com', 210, '수원시' );
    -- 범위를 넘는 값이 있어 에러
    
update test set email = 'c@c.com' where id = 'ccc';
update test set email = 'd@d.com' where id = 'ddd';

select * from test;

alter table test modify email constraint test_email_nn not null;
select * from user_constraints where table_name ='TEST';

insert into test values( 'lll', '111', '세종대왕', to_char(null), 50, '안산시' );
    -- email not null 이라 에러
insert into test values( 'lll', '111', '세종대왕', 'l@l.com', 50, '안산시' );

alter table test drop constraint test_id_pk;
insert into test values( 'lll', '111', '세종대왕', 'm@m.com', 50, '안산시' );

select * from test;
delete from test where id = 'lll';

alter table test add constraint test_id_pk primary key(id);
alter table test add constraint test_name_pk primary key(name);
    -- 에러 -> primary key는 한 개만 가능!!
    
select * from user_constraints where table_name = 'EMPLOYEES';

----- 참조 ------
-- 참조될 데이터는 pk이거나 unique여야 한다 -> 참조될 데이터가 두 개이면 안되므로!
create table depart(
depart_no number( 3 ) primary key,
depart_name varchar2( 20 ) not null
);
insert into depart values( 10, '비서실' );
insert into depart values( 20, '경리부' );
insert into depart values( 30, '인사부' );
insert into depart values( 40, '관리부' );
insert into depart values( 50, '영업부' );
select * from depart;
select * from test;

alter table test add ( depart_no number(3) );
-- 테이블을 만드는 상황이라면 밑의 코드로!!
-- create table test(
--  ...
--   depart_no number(3) constraint test_deno_fk references depart( depart_no ),
--  ... );
alter table test add constraint test_deno_fk foreign key ( depart_no ) 
references depart( depart_no ); --부모키 = 참조될 키

select * from user_constraints where table_name = 'TEST';
select * from test;

insert into test values( 'mmm', '111', '유관순', 'l@l.com', 30, '서울시', 60 );
    --참조되는 키(부모키)에 60이 없으므로 에러
insert into test values( 'mmm', '111', '유관순', 'l@l.com', 30, '서울시', 50 );
    --참조되는 키(부모키)에 50이 있으므로 에러 X
    
insert into depart test values( 60, '생산부' );  --부서 60 추가
insert into test values( 'nnn', '111', '이봉창', 'n@n.com', 30, '인천시', 60 );
    --참조되는 키(부모키)에 60이 있으므로 에러 X

select * from test;    
update test set depart_no = 70 where id = 'aaa';
update test set depart_no = 10 where id = 'aaa';

select * from test t 
left outer join depart d
on t.depart_no = d.depart_no;

drop table depart;  -- 참조되고 있으므로 지울 수 없다!!
                    -- 지우려면 test 테이블을 지우고 지워야 함
--> 강제로 지울 수 있는 방법
drop table depart cascade constraint;  -- 참조되고 있어도 지워라!! -> 참조되고 있는 제약조건까지 지워짐

create table loc(
    loc_id number(3) primary key,
    address varchar(40) not null
);
insert into loc values( 10, '서울시' );
insert into loc values( 20, '수원시' );
insert into loc values( 30, '안산시' );
insert into loc values( 40, '인천시' );
insert into loc values( 50, '평택시' );
select * from loc;
select * from test;

alter table test add constraint test_address_fk foreign key(address)
references loc( address );  -- 참조될 키가 unique하지 않아서 에러!!

alter table loc add constraint loc_address_uk unique( address ); --address를 unique하게 바꿔주기!!

insert into test values( 'ooo', '111', '홍길동', 'o@o.com', 90, '평택시', 100);

drop table loc;
drop table loc cascade constraint purge; --> purge : 공간을 아예 반납 -> 휴지통으로 안들어감 = 되살릴 수 없음

select * from recyclebin;   -- 휴지통 -> 여기로 들어오면 되살릴 수 있음

flashback table "BIN$xt5c34fPTLShu0nrByQrng==$0" to before drop; -- 휴지통에서 depart 테이블 되살리기
select * from depart;
select * from user_constraints where table_name = 'TEST';
select * from test;  --depart 되살려도 제약 조건까지 되살아나지 않음








/* 01_08 */
drop table emp;

create table emp
as 
select employee_id 사번, last_name 이름, salary 연봉, department_id 부서 -- alias를 필수로 줘야함
from employees
where department_id = 50
order by employee_id;

select * from emp;

select employee_id, salary from emp; -- 에러 -> 위에서 alias를 주면서 칼럼 이름이 변경됨!!
select 이름, 연봉 from emp;


-----뷰(VIEW)
select * from user_views;

create view emp_dept50_view
as
select employee_id 사번, last_name 이름, salary 연봉, department_id 부서 -- alias를 필수로 줘야함
from employees
where department_id = 50
order by employee_id;

desc emp_dept50_view;

select * from emp_dept50_view;
select 이름, 연봉 from emp_dept50_view; -- 위에서 alias를 주면서 칼럼 이름이 변경됨!!


-----뷰 수정
create or replace view emp_sal20_view
as
select last_name 이름, salary 연봉, salary * 1.1 인상연봉,
nvl( commission_pct , 0 ) * 1.1 인상인센티브
from employees;

select * from emp_sal20_view;
select 이름, 인상연봉 from emp_sal20_view;

select * from user_views;

create or replace view emp_dept50_view (사번, 이름, 연봉, 부서, 업무)
as
select employee_id 사번, last_name 이름, salary 연봉, department_id 부서, job_id 업무
from employees
where department_id = 50;

select * from emp_dept50_view;


/* 예제 */
-- 이름 first_name + last_name 합친다.
create or replace view emp_dept50_view (사번, 이름, 연봉, 부서, 업무)
as
select employee_id 사번, first_name || ' ' || last_name 이름, salary 연봉, department_id 부서, job_id 업무
from employees
where department_id = 50;

select * from emp_dept50_view;



update emp_dept50_view set 연봉 = 80000 --view 만 수정되는것이 아니고 원본 자체가 바뀐다!!
where 사번 = 120;

select * from emp_dept50_view;
select * from employees where employee_id = 120; --view 만 수정되는것이 아니고 원본 자체가 바뀐다!!

update emp_dept50_view set phone_number = '9999.9999'
where 사번 = 120;  -- 에러 -> view가 갖고 있는 컬럼만 수정할 수 있다!!


-----복합 뷰 생성
create or replace view loc_seattle_view
as
select e.last_name 이름, e.salary 연봉, e.department_id 부서, d.department_name 부서명
from employees e
join departments d
on e.department_id = d.department_id
where d.location_id = (select location_id from locations where city = 'Seattle');

select * from locations;
select * from user_views;
select * from loc_seattle_view;

update loc_seattle_view set 부서 = 100
where 이름 = 'Khoo';

select * from employees where last_name = 'Khoo';

drop table emp;

create table emp
as
select last_name, salary, department_id, job_id, phone_number
from employees;

select * from emp;


-----체크옵션
create or replace view emp80
as
select last_name 이름, salary 연봉, department_id 부서
from emp
where department_id = 80
with check option constraint emp80_uk;

select * from emp80;

update emp80 set 연봉 = 10000
where 이름 = 'Lee';

select last_name, salary from employees where last_name = 'Lee';
    --> 체크옵션을 주면 원본이 바뀌지 않고 view만 바뀐다!!
    
create or replace view emp50
as
select last_name 이름, salary 연봉,  department_id 부서
from employees
where department_id = 50
with read only;

select * from emp50;

update emp50 set 연봉 = 8000
where 이름 = 'Weiss';    -- 에러 -> read only 옵션을 주어서 수정을 할 수 없다!!

select * from emp80;
select * from user_views;

drop table emp;       -- 원본이 사라지면
select * from emp80;  -- 바로가기 연결 불가하다!!

drop view emp50;
drop view emp80;


-----시퀀스
--자동으로 primary key값 증가시켜줌 ( ex.회원가입 할 때마다)
select * from user_sequences;
select * from employees;

select employees_seq.nextval from dual; --다음값 (한번 꺼내오면 다시 못집어넣음 = 다시 감소시킬 수 없음)
select employees_seq.currval from dual; --현재값 

select * from departments;

create table board(
num number( 6 ) primary key,
subject varchar2( 1000 ) not null,
content varchar2( 4000 ) not null,
wtime date default sysdate
);

create sequence board_seq
start with 1
maxvalue 99999
increment by 1
nocache
nocycle;

select * from user_sequences;

select * from board;

insert into board values( board_seq.nextval, '테스트', '테스트', sysdate); 

select board_seq.CURRVAL from dual;
select board_seq.NEXTVAL from dual;

update board set num = board_seq.NEXTVAL
where num = 1;

insert into board values( board_seq.nextval, to_char(null), '테스트', sysdate); --데이터는 안들어가지만 num = 9를 얘가 차지하게 됨
insert into board values( board_seq.nextval, 'null테스트', '테스트', sysdate); --num = 9를 뛰어넘고 10이 들어감

select * from board;

delete from board where num = 3;


-----시퀀스 수정
alter sequence board_seq
increment by 10;   -- 한 번에 10씩 증가되도록 수정!!

insert into board values( board_seq.nextval, '수정테스트', '테스트', sysdate);
select * from board;

alter sequence board_seq
maxvalue 99;

insert into board values( board_seq.nextval, '수정테스트', '테스트', sysdate);
    --> 계속 넣다가 num = 100부터는 데이터가 들어가지 않음!!

alter sequence board_seq
cycle;    -- 순환 : maxvalue를 넘어가면 num이 처음 ( 1 ) 부터 다시 시작!!

insert into board values( board_seq.nextval, '수정테스트', '테스트', sysdate);
select * from board;   --> 데이터 계속 넣다가 num이 겹치면 -> 에러 -> num은 primary key이므로!!

drop table board;

create table boardtest(
num number( 6 ) primary key,
subject varchar2( 1000 ) not null,
content varchar2( 4000 ) not null,
wtime date default sysdate
);
insert into boardtest values( board_seq.nextval, '수정테스트', '테스트', sysdate);
select * from boardtest;    --> 테이블 삭제하고 다시 만들어도 시퀀스 값(num)계속 이어진다

drop sequence board_seq;    --> 시퀀스 삭제
select * from user_sequences;


-----인덱스
select e.last_name 이름, e.salary 연봉, e.department_id 부서, 
d.department_name 부서명, e.job_id 업무, j.job_title 업무명
from employees e
join departments d
on e.department_id = d.department_id
join jobs j
on e.job_id = j.job_id;

create index emp_depart_idx on employees ( department_id );

select * from user_indexes;
drop index emp_department_ix;
drop index emp_job_ix;
drop index emp_name_ix;


-----동의어
create synonym emp for employees;
select * from emp;
select * from employees;
create synonym dept for departments;

select * from user_synonyms;

create view emp_deptname_view
as
select e.last_name 이름, e.salary 연봉, e.department_id 부서, d.department_name 부서명
from emp e, dept d
where e.department_id = d.department_id;

select * from emp_deptname_view;
create synonym deptname for emp_deptname_view;

select * from deptname;
select 이름, 연봉 from deptname;

drop synonym emp;
drop synonym dept;
drop synonym deptname;
drop view emp_deptname_view;





/* 01_09 */
/* SQL 실습.pdf  p.103 */
-- 계층적 질의
select employee_id 사번, last_name 이름, department_id 부서, manager_id 부서장
from employees;

select level, employee_id 사번, last_name 이름, department_id 부서, manager_id 부서장
from employees
start with manager_id is null
connect by prior employee_id = manager_id;

select lpad( '  ', ( level-1 )*3 ) || last_name 이름, level,
department_id 부서, manager_id 부서장
from employees
start with manager_id is null
connect by prior employee_id = manager_id;
