/* 12_24 */
select * from all_users;

select * from user_tables;

select * from employees;
desc employees;         /* describe (���̺� ���� ǥ��) */

select employee_id, last_name, salary from employees;
select salary, last_name from employees;

select last_name, salary + 1000 from employees;

/* ���� */
/* last_name, salary, 10% ���� ���� ��� */
select last_name, salary, salary * 1.1 from employees;

select 2 + 5 from dual;     /* dual = ���� ���̺�(��¥ ���̺�) */
select 5 / 2 from dual;     /* dual = ���� ���̺�(��¥ ���̺�) */
select 5 / 0 from dual;    -- ����
select 5 / NULL from dual; -- NULL

select salary + salary * 0.1 from employees;
select (salary + salary) * 0.1 from employees;

select last_name, commission_pct from employees;   /* (null) */
select last_name, salary + salary * commission_pct from employees;   
    /* null�� ���� ���� �ص� ����� null  ->  nvl ���� �̿��ϸ� null�� �ٸ� ������ �ٲ� �������� */
    
select last_name as �̸�, salary + salary * 0.2 as �����λ� from employees;       /* alias = ��Ī */ 
select last_name as "��   ��", salary + salary * 0.2 as �����λ� from employees;  /* oracle���� �����ϰ� �ֵ���ǥ ����ϴ� ��� */
select last_name "��   ��", salary + salary * 0.2 �����λ� from employees;        /* as �������� */ 
select last_name "<��   ��>", salary + salary * 0.2 �����λ� from employees;        /* as �������� */ 

select first_name, last_name from employees;
select first_name || last_name from employees;   /* || : �� ĭ�� �پ� ������ ��  -> ������ ������ ���� ���� ��� X -> �� ���� */
select first_name || ' ' || last_name �̸� from employees;   /* ��������ǥ!!! */
select first_name || ', ' || last_name �̸� from employees;   /* ��������ǥ!!! */
select first_name || ' AND ' || last_name �̸� from employees;

/* ���� */
/* 2019�⿡ ������ 10% �λ�ƴٴ� �����Ͽ� 2018���� : 2019���� �ϳ��� ��� */
select salary || ' : ' || salary * 1.1 "2018���� : 2019����" from employees;
select salary * 0.9 || ' : ' || salary "2018���� : 2019����" from employees;   

/* select last_name || ''19 ����' || salary from employees; */
select last_name || q'['19 ����]' || salary || '����' ���� from employees;   /* ����ǥ�� ����ϰ� ���� �� */
select last_name || q'<'19 ����>' || salary || '����' ���� from employees;   /* ��� �� ���� ���� ���� */
select last_name || q'A'19 ����A' || salary || '����' ���� from employees;   /* ��� �� ���� ���� ���� */

select salary || '(����)' from employees;
select q'[ 2019's ���� ]' || salary || '����' ���� from employees;
-- select ' 2019's ���� ' || salary || '����' ���� from employees; --����

select department_id from employees;
select distinct department_id from employees;   /* �ߺ��� ���� */

select job_id from employees;
select distinct job_id from employees;

select department_id, job_id from employees;
select distinct department_id, job_id from employees;   /* �� ���� ������ �ٸ��Ƿ� ������ �� ���� job�� �������� �ߺ��� ���ŵ� */

desc employees;
desc departments;

/* ���� */
select first_name, last_name, job_id, salary * 12 As Yearly Sal from employees;
select first_name, last_name, job_id, salary * 12 "yearly sal" from employees;
select first_name, last_name, job_id, salary AS "yearly sal" from employees;
select first_name, last_name, job_id, salary*12 yearly sal from employees;



alter session set nls_date_format = 'DD-MON-RR';
alter session set nls_date_format = 'YY/MM/DD';
select last_name �̸� from employees where last_name like 'T%';   --K�̻��� ���� (�׳� K��� �̸��� K�ڿ� ���� �ִ� �̸� �Բ� ����)
select last_name �̸� from employees where last_name like 'T_';   --�ձ��ڴ� K�� �� ����
select last_name �̸� from employees where last_name like 'K___'; --�ձ��ڴ� K�� �� ����







/* 12_26 */
desc departments;
desc employees;

select last_name �̸�, department_id �μ���ȣ from employees where department_id = 100;
/* where�� true�� ���� ��� -> if�� �ٸ���!! */

select * from employees;
select last_name �̸�, salary ���� from employees where last_name = 'King';
select last_name �̸�, salary ���� from employees where last_name = 'Whalen';
select last_name �̸�, hire_date �Ի��� from employees where hire_date = '07/03/17';
/* hire_date = '05/10/10' : Varchar2�� �� Date�� �� ���� ��ȯ�� ���ϱ� ������ �ڵ����� ����ȯ�� �Ͼ */ 
/* Date�� : ��/��/�� */

select last_name �̸�, salary ���� from employees where salary >= 10000;
select last_name �̸�, hire_date �Ի��� from employees where hire_date >= '05/10/10';
select last_name �̸�, hire_date �Ի��� from employees where hire_date >= '05/09/21';
select last_name �̸�, hire_date �Ի��� from employees where hire_date >= '00/01/01';
select last_name �̸�, hire_date �Ի��� from employees where hire_date <= '00/01/01';
/* Date���� �񱳰� �ȴ�!! */

select last_name �̸�, salary ���� from employees where last_name < 'Den';
/* �������� �񱳰� �ȴ�!! */

select last_name �̸�, salary ���� from employees where salary between 2500 and 3500;  -- �̻�, ����
select last_name �̸�, salary ���� from employees where salary >= 2500 and salary <= 3500;

select last_name �̸�, salary ���� from employees where last_name between 'A' and 'C';
select last_name �̸�, hire_date �Ի��� from employees where hire_date between '05/09/21' and '05/11/21';

select employee_id ���, last_name �̸�, manager_id �μ��� from employees
where manager_id in (100);    -- where manager_id = 100
select employee_id ���, last_name �̸�, manager_id �μ��� from employees
where manager_id in (100, 101);  -- where manager_id = 100 or manager_id = 101
select last_name �̸�, hire_date �Ի��� from employees where last_name in ('King', 'Baer');

select last_name �̸�, salary ���� from employees where last_name = 'King';    --���� �ָ� ã��
select last_name �̸�, salary ���� from employees where last_name like 'King'; --����� �ָ� ã��
select last_name �̸�, salary ���� from employees where last_name like 'K%';   --K�̻��� ���� (�׳� K��� �̸��� K�ڿ� ���� �ִ� �̸� �Բ� ����)
select last_name �̸�, salary ���� from employees where last_name like 'K_';   --�ձ��ڴ� K�� �� ����
select last_name �̸�, salary ���� from employees where last_name like 'K___'; --�ձ��ڴ� K�� �� ����
select last_name �̸�, salary ���� from employees where last_name like '%h%';  --�߰��� h�� �ϳ��� ���� �̸�
select last_name �̸�, salary ���� from employees where last_name like '_h%';  --�ι�° ���ڰ� h�̰� �ڿ��� ���� �͵� ��� ����
select last_name �̸�, hire_date �Ի��� from employees where hire_date like '05%'; --2005�� �Ի���
select last_name �̸�, hire_date �Ի��� from employees where hire_date like '05/01%'; --2005�� 1�� �Ի���
select last_name �̸�, hire_date �Ի��� from employees where hire_date like '05/01/29%'; --2005�� 1�� �Ի���
select last_name �̸�, job_id ���� from employees where job_id like '%PROG%';
select last_name �̸�, job_id ���� from employees where job_id like 'SA%';
select last_name �̸�, job_id ���� from employees where job_id like '%A%';
select last_name �̸�, job_id ���� from employees where job_id like '%_A%'; --A�տ� �ѱ��ڰ� �� �ִ� ���
select last_name �̸�, job_id ���� from employees where job_id like '%\_A%' escape '\'; -- _A�� ����ϰ� ���� ��

select last_name �̸�, department_id �μ� from employees where department_id like null;
select last_name �̸�, department_id �μ� from employees where department_id = null;
select last_name �̸�, department_id �μ� from employees where department_id = 'null';
select last_name �̸�, department_id �μ� from employees where department_id = 0;
select last_name �̸�, department_id �μ� from employees where department_id = '';
/* null�� ���� �ƴϱ� ������ �Ҵ��Ҽ��� ���Ҽ��� ����! */

select last_name �̸�, department_id �μ� from employees where department_id is null;
select last_name �̸�, commission_pct �μ�Ƽ�� from employees where commission_pct is null;
select last_name �̸�, commission_pct �μ�Ƽ�� from employees where commission_pct is not null;

select last_name �̸�, salary ���� from employees where salary between 10000 and 15000;      --�̻� ����
select last_name �̸�, salary ���� from employees where salary >= 10000 and salary <= 15000; --�̻� ����
select last_name �̸�, salary ���� from employees where salary > 10000 and salary < 15000;   --�ʰ� �̸�
select department_id �μ� from employees where department_id = 90 or department_id = 100 or department_id = 80;
select department_id �μ� from employees where department_id in (90, 100, 80);

/* ���� */
/* job_id�� IT_PROG SA_MAN ST_MAN �� ���� �� ������ 5000�̻��� ������ last_name�� job_id ��� */
select last_name �̸�, job_id ����, salary ���� from employees where job_id in ('IT_PROG','SA_MAN','ST_MAN') and salary >= 5000;

/* ���� */
/* 2005�� ��ݱ⿡ �Ի��� ������ last_name hire_date ��� */
select last_name �̸�, hire_date �Ի��� from employees where hire_date >= '05/01/01' and hire_date < '05/07/01';
select last_name �̸�, hire_date �Ի��� from employees where hire_date between '05/01/01' and '05/07/01';


select employee_id ���, last_name �̸� from employees where employee_id between 100 and 150;
select employee_id ���, last_name �̸� from employees where employee_id between not 100 and 150; --����
select employee_id ���, last_name �̸� from employees where employee_id not between 100 and 150;

select employee_id ���, last_name �̸� from employees where employee_id >= 100 and employee_id <= 150;
select employee_id ���, last_name �̸� from employees where not employee_id >= 100 and employee_id <= 150;
select employee_id ���, last_name �̸� from employees where employee_id >= 100 and not employee_id <= 150; --and�� ���� ���� ������
select employee_id ���, last_name �̸� from employees where not (employee_id >= 100 and employee_id <= 150); --��ü ����

select last_name �̸�, department_id �μ� from employees where department_id in (70, 80, 90, 100);
select last_name �̸�, department_id �μ� from employees where department_id not in (70, 80, 90, 100);

select last_name �̸�, department_id �μ�, salary ���� from employees where department_id = 50 or salary < 5000;
select last_name �̸�, department_id �μ�, salary ���� from employees where not department_id = 50 or salary < 5000;
select last_name �̸�, department_id �μ�, salary ���� from employees where department_id = 50 or not salary < 5000;
select last_name �̸�, department_id �μ�, salary ���� not (department_id = 50 or salary < 5000); --or�� not�̹Ƿ� and!!

select last_name �̸�, salary ���� from employees order by salary;      --��������
select last_name �̸�, salary ���� from employees order by salary desc; --��������
select last_name �̸�, salary ���� from employees where department_id = 80 order by salary desc; --��������
select last_name �̸�, salary ���� from employees where department_id = 80 order by salary desc;
select last_name �̸�, (salary + salary*commission_pct)/12 ���� from employees where commission_pct is not null order by salary desc;
select last_name �̸�, (salary + salary*commission_pct)/12 ���� from employees where commission_pct is not null order by ���� desc;

select last_name �̸�, salary ���� from employees where department_id = 80 order by 2;  --����(�ι�° ��)�� �����Ѵٴ� ��
select last_name �̸�, salary ���� from employees order by salary desc;
select last_name �̸�, salary ���� from employees order by salary desc, last_name;
select last_name �̸�, salary ����, department_id �μ� from employees order by salary desc, last_name, department_id;

select employee_id ���, last_name �̸�, salary ���� from employees where employee_id = &emp;
select last_name �̸�, salary ����, department_id �μ� from employees where department_id = &depart and salary >= &sal;
select last_name �̸�, job_id ���� from employees where job_id = '&job';  --���ڿ��̴ϱ� ����ǥ!!
select last_name �̸�, hire_date �Ի��� from employees where hire_date > '&hire';
select last_name �̸�, department_id �μ�, &column from employees where &condition order by &order; 
select last_name �̸�, department_id �μ�, &column from employees where &condition order by &&column; 
--&&:�� ���� �����϶�� �� -> ���� �Է��� ������ ��� �ԷµǱ� ������ ���ο� â �ȶ� -> �ٲٷ��� ���� �ڵ�
undefine column;
select last_name �̸�, department_id �μ�, &column from employees where &condition order by &&column; 


select last_name �̸�, job_id �μ�, salary ���� from employees where department_id = &depart order by salary desc;

define depart = 50;
select last_name �̸�, job_id �μ�, salary ���� from employees where department_id = &depart order by salary desc;
undefine depart;

define depart = 50;
select last_name �̸�, department_id �μ� from employees where department_id = &depart order by last_name;

set verify on;
select last_name �̸�, department_id �μ� from employees where department_id = &depart order by last_name;




select * from emp;
select ename �̸�, deptno �μ� from emp where deptno = &dep;
select ename �̸�, job ���� from emp where job = '&job';
select ename �̸�, hiredate �Ի��� from emp where hiredate = '&date';
select ename �̸�, deptno �μ�, &col_name ���� from emp where &condition order by &order_col;

select ename �̸�, &&col_name �μ� from emp order by &col_name;
undefine col_name;

select ename �̸�, deptno �μ� from emp where &&col >= 20 order by &col;












/* 12_27 */
select last_name �̸�, salary ���� from employees where last_name ='king';
select last_name �̸�, salary ���� from employees where lower(last_name) = lower('king');
select last_name �̸�, salary ���� from employees where lower(last_name) = lower('&name');
select last_name �̸�, salary ���� from employees where upper(last_name) = upper('&name');
select last_name �̸�, salary ���� from employees where initcap(last_name) = initcap('&name');
select last_name �̸�, upper(last_name) "upper", lower(last_name) "lower", initcap(last_name) "initcap" from employees
where employee_id between 100 and 109;

select concat('Helloworld!', '!!!') from dual; --dual:������ �����ֱ� ���� ���� ���̺�(��¥ ���̺�)

undefine str;
define str = 'Hello';
select concat('&str', 'world') from dual;

select substr('Helloworld!', 6) from dual;
select substr('Helloworld!', 6, 12) from dual;
select substr('Helloworld!', -5, 3) from dual;

select length('Hello   World!!') from dual;

select instr('HelloWorld!!', '!!') from dual;
select instr('HelloWorld!!','o') from dual;
select instr('HelloWorld!!','o', 1, 2) from dual; -- ã�� 'o'�� �ι�°���� ��ġ ���

select lpad('Hello', 20) from dual; --���ʿ� 20ĭ�� ������ ����
select rpad('Hello', 20) from dual; --�����ʿ� 20ĭ�� ������ ����
select lpad('Hello', 20, '*') from dual;
select rpad('Hello', 20, '*') from dual;

select replace('HelloWorld!!', 'o', 'a') from dual; --ù��° ���ڿ����� �ι�° ���ڸ� ����° ���ڷ� �ٲ��

select ltrim('aaaaaHello World!!!aaaaa', 'a') from dual; --������ a�� ������
select rtrim('aaaaaHello World!!!aaaaa', 'a') from dual; --�������� a�� ������
select ltrim('     Hello World!!!     ', ' ') from dual; --������ ���⸦ ������
select rtrim('     Hello World!!!     ', ' ') from dual; --�������� ���⸦ ������
select trim('H' from 'Hello World!!!') from dual; --�굵 ���ڿ� �߰��� ���ڴ� �� ����

select last_name �̸�, salary / 12 ���� from employees;
select last_name �̸�, round(salary / 12, 2) ���� from employees;  --�ݿø��ؼ� ���ڸ����� ��Ÿ��
select last_name �̸�, trunc(salary / 12, 2) ���� from employees;  --�����ؼ� ���ڸ����� ��Ÿ��

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

select mod(10, 2) from dual;     --������ ���ϴ� �Լ�
select mod(10, 3) from dual;     --������ ���ϴ� �Լ�



alter session set nls_date_format = 'YY/MM/DD';
alter session set nls_date_format = 'YYYY/MM/DD HH24:MI:SS';

select sysdate, current_date from dual;  --���� ��¥

alter session set nls_date_format = 'YY/MM/DD';
select sysdate from dual;  --���� ��¥

alter session set nls_date_format = 'RR/MM/DD';
select sysdate from dual;  --���� ��¥




/* ����Ŭ������ ������ ��¥ ���� */
select sysdate from dual;
select sysdate + 10 from dual;
select sysdate - 10 from dual;
select sysdate + 30 from dual;
select '20/05/04' - '20/04/24' from dual;
select sysdate + 6/24 from dual;


select last_name �̸�, hire_date �Ի���, (sysdate - hire_date) �ټ��ϼ� from employees order by �ټ��ϼ� desc;
-- ���ݵ� ��� ���ϰ� �ֱ� ������ ���� ������ �Ҽ����� ��� ������ -> �Ҽ��� ����
select last_name �̸�, hire_date �Ի���, trunc(((sysdate - hire_date)+1)/365) �ټӿ��� from employees order by �ټ��ϼ� desc;
select last_name �̸�, months_between(sysdate, hire_date) �ټӿ��� from employees order by �ټӿ��� desc;
select last_name �̸�, hire_date �Ի���, add_months(hire_date, 18) ������ from employees order by ������ desc;

select * from employees;

select last_name �̸�, hire_date �Ի���, trunc((sysdate - hire_date)+1) �ټ��ϼ� from employees;
select last_name �̸�, hire_date �Ի���, trunc(months_between(sysdate, hire_date)) �ټӿ��� from employees;
select last_name �̸�, hire_date �Ի���, trunc(((sysdate - hire_date)+1)/365) �ټӿ��� from employees;



select MONTHS_BETWEEN('20/05/06','20/03/06') from dual;
select MONTHS_BETWEEN('20/03/06','20/05/06') from dual;
select MONTHS_BETWEEN('20/05/06','20/03/01') from dual;
select MONTHS_BETWEEN('20/03/01','20/05/06') from dual;

select ADD_MONTHS('20/05/06',10) from dual;
select ADD_MONTHS('20/05/06',-10) from dual;

select next_day ('20/05/06',-1) from dual;
select next_day ('20/05/06',1) from dual;
select next_day ('20/05/06','��') from dual;
select next_day ('20/05/06',5) from dual;
select next_day ('20/05/06','��') from dual;

select last_day ('20/02/06') from dual;
select last_day ('20/05/06') from dual;






select last_day(sysdate) from dual;
select last_day('2020/02/01') from dual;
select last_day(sysdate) - sysdate from dual;

select next_day(sysdate, 1) from dual;
select next_day(sysdate, 4) from dual;
select next_day(sysdate, '��') from dual; --���� ���Ŀ����� ó�� �������� ��¥
select next_day(sysdate, '��') from dual; --���� ���Ŀ����� ó�� �������� ��¥

select round(sysdate, 'MONTH') from dual; --���� �ݿø�
select trunc(sysdate, 'MONTH') from dual;
select round(to_date('19/12/15'), 'MONTH') from dual;
select round(to_date('19/12/16'), 'MONTH') from dual;
select trunc(to_date('19/12/15'), 'MONTH') from dual;

select round(sysdate, 'YEAR') from dual; --������ �ݿø�
select trunc(sysdate, 'YEAR') from dual;
select round(to_date('19/12/15'), 'YEAR') from dual;
select trunc(to_date('19/12/15'), 'YEAR') from dual;

select width_bucket(92, 0, 100, 10) from dual; --0���� 100������ 10���� ���� ��� �� �����ΰ�
select width_bucket(55, 0, 100, 10) from dual;
select width_bucket(5, 0, 100, 10) from dual;
select width_bucket(100, 0, 100, 10) from dual;
select width_bucket(95, 100, 0, 10) from dual;

select width_bucket( sysdate, '1972/01/01', '2072/12/31', 10) from dual; --�� ���� �� ���� ���� �����߿� �ִ°�
select width_bucket( sysdate, '1996/07/26', '2096/12/31', 10) from dual; --�� ���� �� ���� ���� �����߿� �ִ°�


/* ���� */
-- �Ի��� �������� �ټӿ��� ���� 30������� ������ ��޿� ���� ���� 1000�� �����Ѵ�.
-- ������ 2000�� 1�� 1���� �������� �Ѵ�.
-- �纯 ���� �Ի��� ������ ����ϰ� �������� �������� �Ѵ�.

select employee_id ���, last_name �̸�, salary ����, hire_date �Ի���, width_bucket(hire_date, sysdate, '2000/01/31', 30) * 1000 �ټӼ���
from employees order by �ټӼ��� desc;


/* ���� */
-- ��� �̸� �Ի��� �ټӿ��� �ټӿ��� �ټ��ϼ�
-- ��� ��� ��ĥ° �ٹ��ϰ� �ִ��� 
-- �ټӿ���/ �ټӿ���/ �ټ��ϼ��� ��������

/*��*/
select employee_id ���, last_name �̸�, hire_date �Ի���, 
trunc(((sysdate - hire_date)+1)/365) �ټӿ���, 
trunc(months_between(sysdate, hire_date)) �ټӿ���, 
trunc((sysdate - hire_date)) �ټ��ϼ�
from employees order by �ټӿ��� desc, �ټӿ��� desc, �ټ��ϼ� desc;
/*�����*/
select employee_id ���, last_name �̸�, hire_date �Ի���, 
trunc((months_between(sysdate, hire_date))/12) �ټӿ���, 
trunc(mod(months_between(sysdate, hire_date),12)) �ټӿ���, 
trunc(sysdate - add_months(hire_date, months_between(sysdate, hire_date)))+1 �ټ��ϼ�
from employees order by �ټӿ��� desc, �ټӿ��� desc, �ټ��ϼ� desc;



select last_name �̸�, hire_date �Ի���, 
trunc((months_between(sysdate, hire_date))/12) "�� ��", 
trunc(mod(months_between(sysdate, hire_date),12)) "�� ��", 
trunc(sysdate - add_months(hire_date, months_between(sysdate, hire_date)))+1 "��ĥ"
from employees;





/* <4�ܿ�> */
select last_name �̸�, to_char(hire_date, 'yyyy-mm-dd') �Ի��� from employees;
select last_name �̸�, to_char(hire_date, 'yy-mm-dd') �Ի��� from employees;
select last_name �̸�, to_char(hire_date, 'rrrr-mm-dd') �Ի��� from employees;
select last_name �̸�, to_char(hire_date, 'rr-mm-dd') �Ի��� from employees;
select last_name �̸�, to_char(hire_date, 'year month dd day') �Ի��� from employees;

select to_char(sysdate, 'yy-mm-dd HH:mi:ss') �ð� from dual;
select to_char(sysdate, 'yy-mm-dd HH24:mi:ss') �ð� from dual;
select to_char(sysdate, 'yyyy dd "of" month HH24:mi:ss') �ð� from dual;
select to_char(sysdate, 'year mon ddspth HH24:mi:ss') �ð� from dual;
select to_char(sysdate, 'year mon ddspth HH24:mi:ss sssss') �ð� from dual;

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
select to_char( -12345, 'MI09999' ) from dual; --�տ� �ָ� ��������
select to_char( 12345, '09999' ) from dual;
select to_char( -12345, '09999PR' ) from dual;
select to_char( 12345, '09999PR' ) from dual;
select to_char( 12345, '9.9999EEEE' ) from dual; --E�� 4�� = 10�� �� �� ���ض�
select to_char( 12345, 'U09999' ) from dual;
select to_char( 12345, '99G999D9' ) from dual;

select last_name �̸�, to_char(salary, '999,999.99') ���� from employees;
select last_name �̸�, months_between(sysdate, hire_date) �ٹ����� from employees;

select last_name �̸�, round(months_between('2018/12/31', hire_date), 2) �ٹ����� from employees; --�Ͻ��� ����ȯ (�ڵ�����ȯ)
select last_name �̸�, round(months_between(sysdate - hire_date), 2) �ٹ����� from employees; --����ȯ X
select sysdate - '2019/01/01' from dual;          --�����߻� : ��¥���� - ��������
select sysdate - to_date('2019/01/01') from dual; --���� X : ����� ����ȯ(��������ȯ)
   -- ��¥������ ���ڿ��������� ǥ���� �� �ۿ� ���� ������
select last_name �̸�, hire_date �Ի��� from employees where hire_date > '2005/01/01'; --�Ͻ��� ����ȯ (�ڵ�����ȯ)
select last_name �̸�, hire_date �Ի��� from employees where hire_date > '01/01/2005'; --�����߻�
select last_name �̸�, hire_date �Ի��� from employees where hire_date > to_date('2005 JAN 01', 'yyyy/mm/dd'); --�����߻�








/* 12_30 */
select upper(concat(substr(last_name, 1, 8), '_US')) from employees;
select last_name �̸�, to_char(round(salary/12, 2), '$') ���� from employees;
select last_name �̸�, salary + salary * nvl(commission_pct, 1000,0) ���� from employees
    where department_id in (80, 90); -- nvl : null�� �ƴϸ� 1000, null�̸� 0���� ����ض�

select employee_id ���, last_name �̸�, department_id �μ�, nvl(manager_id,'CEO') �μ��� from employees; 
  -- ���� -> nvl�� �� ���� ������ ������ ���ƾ� �Ѵ� -> manager_id �� ���������� �ٲ��ش�
select employee_id ���, last_name �̸�, department_id �μ�, nvl(to_char(manager_id),'CEO') �μ��� from employees; 
  
/* ���� */
-- department_id �� ���� ��� '����'�̶�� ���
select last_name �̸�, nvl(to_char(department_id), '����') �μ� from employees
    where department_id is null; 
    

select first_name �̸�, last_name ��, nullif( length(first_name), length(last_name)) ���̺� from employees;
-- �� ���̰� ������ null��ȯ, �ٸ��� ù��° �� ��ȯ

select last_name �̸�, commission_pct �μ�Ƽ�� from employees
    where commission_pct is not null;

select last_name �̸�, coalesce(to_char(commission_pct), to_char(manager_id), 'CEO') coalesce�Լ� from employees;
-- ù��° �μ� null�ƴϸ� ���, ù��° null�̰� �ι�° �μ� null �ƴϸ� ���, �� �� null �̸� CEO ���
-- select last_name �̸�, commission_pct �μ�Ƽ��, manager_id �μ��� from employees;

select last_name �̸�, salary ���ؿ���, coalesce((salary + salary * commission_pct), salary + 2000, 3000) �λ󿬺� from employees;

select last_name �̸�, salary ����, job_id ����,
case job_id
    when 'IT_PROG' then salary * 1.1
    when 'ST_CLERK' then salary * 1.2
    when 'SA_REP' then salary * 1.3
    else salary
end �λ󿬺� from employees;

select last_name �̸�,
case
    when department_id = 90 then '�濵������'
    when department_id = 100 then '�񼭽�'
    when department_id = 110 then '��ȹ��'
    else '������'
end �μ��� from employees;

select last_name �̸�, salary ����,
case
    when salary > 15000 then '�̻�'
    when salary > 10000 then '����'
    when salary > 8000 then '����'
    else '���'
end ���� from employees;

/* ���� */
-- �̸� �Ի��� ���� ���
-- �ټӿ����� 18�� �̻� '�̻�' 15�� �̻� '����' 12�� �̻� '����' 9�� �̻� '�븮' �� ���ϴ� ���
-- �������� ��������
select last_name �̸�, hire_date �Ի���, trunc((months_between(sysdate, hire_date))/12) �ټӿ���,
case
    when trunc((months_between(sysdate, hire_date))/12) >= 18 then '�̻�'
    when trunc((months_between(sysdate, hire_date))/12) >= 15 then '����'
    when trunc((months_between(sysdate, hire_date))/12) >= 12 then '����'
    when trunc((months_between(sysdate, hire_date))/12) >= 9 then '�븮'
    else '���'
end ���� from employees order by hire_date;

select last_name �̸�, salary ����, job_id ����,
decode(job_id, 
    'IT_PROG', salary * 1.1,
    'ST_CLERK', salary * 1.2,
    'SA_REP', salary * 1.3,
    salary) �λ󿬺� 
from employees;

select last_name �̸�, department_id �μ�, 
decode(department_id,
    90, '�濵������',
    80, '������',
    70, '������',
    60, '�渮��',
    '�λ��') �μ���
from employees;

/* ���� */
-- �̸� ���� �Ի��� �ټӿ���(�Ҽ��� ���� ����) ���� ���
-- ������ 1��� 1000��
-- 1�� ������ �ټ� ������ 3���� ���� 250, 6���� ���� 500, 9���� ���� 750, 12���� �̸� 1000
select last_name �̸�, salary ����, hire_date �Ի���,
case 
    when months_between(sysdate - hire_date) - trunc((sysdate - hire_date) / 365) * 12 <= 3 then trunc((sysdate - hire_date) / 365) * 1000 + (month_between(sysdate - hire_date) - trunc((sysdate - hire_date) / 365) * 12) * 250
    when months_between(sysdate - hire_date) - trunc((sysdate - hire_date) / 365) * 12 <= 6 then trunc((sysdate - hire_date) / 365) * 1000 + (month_between(sysdate - hire_date) - trunc((sysdate - hire_date) / 365) * 12) * 500
    when months_between(sysdate - hire_date) - trunc((sysdate - hire_date) / 365) * 12 <= 9 then trunc((sysdate - hire_date) / 365) * 1000 + (month_between(sysdate - hire_date) - trunc((sysdate - hire_date) / 365) * 12) * 750
    when months_between(sysdate - hire_date) - trunc((sysdate - hire_date) / 365) * 12 < 12 then trunc((sysdate - hire_date) / 365) * 1000 + (month_between(sysdate - hire_date) - trunc((sysdate - hire_date) / 365) * 12) * 1000
    else 
end ���� from employees;
-- �����
select last_name �̸�, salary ����, hire_date �Ի���,
case 
    when trunc(mod(months_between(sysdate, hire_date),12)) + 1 <= 3 then 250
    when trunc(mod(months_between(sysdate, hire_date),12)) + 1 <= 6 then 500
    when trunc(mod(months_between(sysdate, hire_date),12)) + 1 <= 9 then 750
    else 1000
end + trunc((sysdate - hire_date) / 365) * 1000 ���� from employees;


/* <5�ܿ�> */
--------- �׷��Լ� : sum, avg, max, min, count --------
select last_name �̸�, salary ���� from employees where salary > avg(salary);
    -- �׷��Լ� ����� �ȵȴ�!!!
select last_name �̸�, salary ����, avg(salary) ��տ��� from employees;
    -- avg(�׷��Լ�)�� �ٸ� ������ �޸� �ึ�� �� ���� ���� �ƴ� �� �� ���� ���� ��µǾ��ϴ� �Լ�
    -- ���� �׷��Լ��� �ٸ� ������ �Բ� �Է��ϸ� �ȵ�!!! 
select max(salary), min(salary), sum(salary), avg(salary) from employees;

select count(salary) from employees;
select count(department_id) from employees;
select count(commission_pct) from employees;
select count(*) from employees;
    -- count�� null�� ���� ����Ѵ�
select max(salary), min(salary), sum(salary), avg(salary), count(*) from employees;

select distinct department_id from employees;
select count(distinct department_id) from employees;
    -- ���⼭�� count�� null�� ���� ����Ѵ�
    
    
select avg(commission_pct) from employees;           -- �μ�Ƽ�긦 �޴� ������� ���
-- select avg(commission_pct) from employees where commission_pct is not null;

select avg(nvl(commission_pct, 0 )) from employees;  -- ������� �μ�Ƽ�� ���(�μ�Ƽ�긦 �޴� ���, �ȹ޴� ��� ��� ���� ���)

select count(commission_pct) from employees;
select count(nvl(commission_pct, 0 )) from employees;

select last_name �̸�, salary ����, department_id �μ� from employees;

select department_id �μ� from employees group by department_id;

select department_id �μ�, avg(salary) ��տ��� from employees group by department_id;
-- null�� �׷����� �������ش�

select job_id ����, avg(salary) ��տ���, max(salary) �ְ���, min(salary) �������� 
    from employees group by job_id;

select department_id �μ�, job_id ����,  avg(salary) ��տ���
    from employees group by department_id, job_id order by �μ�;

select job_id ����, department_id �μ�, avg(salary) ��տ���
    from employees group by job_id, department_id order by ����;

select department_id �μ�, max(salary) �ִ뿬�� from employees
    group by department_id having salary > 10000;  
-- ����!! -> having�� group by�� �ؼ� ���� ���(�ִ� ����)�� ���� ��� ����!!
select department_id �μ�, max(salary) �ִ뿬�� from employees
    group by department_id having max(salary) > 10000; 

select department_id �μ�, avg(salary) ��տ��� from employees where salary > 5000
    group by department_id having avg(salary) > 5000; 

/* ���� */
-- having �̿�!
-- �μ��ο��� 2�� �̻��� �μ����� �μ���ȣ�� ��տ����� ���
-- �� ��տ����� 5000 �̻��� �μ��� ���
select department_id �μ�, avg(salary) ��տ��� from employees
    group by department_id having count(department_id) >= 2 and avg(salary) >= 5000;


------�м��Լ�--------
select last_name �̸�, salary ����, first_value(salary) over (order by salary desc) �ְ��� 
    from employees;
-- first_value ~ over ~ : �� �� ���� ���� ù��° ���� ��� / last_value ~ over ~ : �� �� ���� �Ʒ��� ������ ���� ��� = ������ �� �� �� ����
select last_name �̸�, salary ����, first_value(salary) over (order by salary) �������� 
    from employees; 
    
select last_name �̸�, salary ����, first_value(salary) over (order by salary rows 3 preceding) �������� 
    from employees;     -- �� �� ���� �� ����° �� ���
    
select last_name �̸�, salary ����, 
    last_value(salary) 
    over (order by salary rows between 3 preceding and 3 following) "������ ��������" 
from employees;     -- ���� 3�� �Ʒ��� 3�� �� 7�� �� ������ ���� �� ���
    
select last_name �̸�, salary ����, 
    first_value(salary)
    over (order by salary desc range between 1000 preceding and 1000 following) "������ ������"
from employees;
 
select last_name �̸�, department_id �μ�,
    avg(salary) over(partition by department_id) "�μ��� ���"
from employees;
/* = */ select last_name �̸�, department_id �μ�, avg(salary) ��տ���
            from employees group by department_id;
        -- ���� �ڵ������� �� �ڵ�� �̸� ������ ������ ���� -> �̸����� ����Ϸ��� ���� �ڵ带 ���!!
        /* �׷��Լ� : ��ü ���� �ѹ��� ���, �м��Լ� : ��ü ���� �Ź� ��� */

select last_name �̸�, department_id �μ�,
    trunc(avg(salary) over(partition by department_id), 2) ��տ���,
    trunc(sum(salary) over(partition by department_id), 2) �����հ�,
    trunc(count(salary) over(partition by department_id), 2) �ο���
from employees;    

select last_name �̸�, salary ����,
    row_number() over(order by salary desc) ����,
    rank() over(order by salary desc) ����,
    dense_rank() over(order by salary desc) ����
from employees;



-- group by Ȯ�� --
-- �������� �ϳ��� �����ϸ鼭 ����� ��ȯ
----- group by          : (a, b, c) => (a, b, c)
----- group by rollup() : (a, b, c) => (a, b, c), (a, b), (a), ()
----- group by cube()   : (a, b, c) => (a, b, c), (a, b), (a, c), (b, c), (a), (b), (c), ()
----- group by grouping sets() : ������ ������ �� �ִ�

-- group by (a, b) => (a, b)
select department_id �μ�, job_id ����, round(avg(salary)) �������
    from employees
    group by department_id, job_id
    order by department_id;

-- group by rollup(a, b) => (a, b), (a), ()   
select department_id �μ�, job_id ����, round(avg(salary)) �������
    from employees
    group by rollup (department_id, job_id)
    order by department_id;  -- �� ������ ��ü��� = ()

-- group by cube(a, b) => (a, b), (a), (b), ()   
select department_id �μ�, job_id ����, round(avg(salary)) �������
    from employees
    group by cube (department_id, job_id)
    order by department_id;  -- �� ������ ��ü��� = ()

-- group by grouping sets ( (a), (b), () )  
select department_id �μ�, job_id ����, round(avg(salary)) �������
    from employees
    group by grouping sets ( (department_id), (job_id), () )
    order by department_id; 








/* 01_02 */
------- ����ǥ���� -------
select last_name �̸�, salary ���� from employees
where regexp_like(last_name, 'K'); -- �̸��� K�� ����ִ� ����� ã�ƶ�

select last_name �̸�, salary ���� from employees
where regexp_like(last_name, 'K[^i]'); -- �̸��� K�� ����ְ� �ι�° ���ڿ� i�� ������� ���� ��� ã�ƶ�

select last_name �̸�, salary ���� from employees
where regexp_like(last_name, 'Ki'); -- �̸��� Ki�� ����ִ� ��� ã�ƶ�

select last_name �̸�, salary ���� from employees
where regexp_like(last_name, 'K[ah]'); -- ù��° ���ڰ� K�̰� �ι�° ���ڰ� a�̰ų� h�� �̸�

select last_name �̸�, salary ���� from employees
where regexp_like(last_name, 'K[a-i]'); -- ù��° ���ڰ� K�̰� �ι�° ���ڰ� a���� i�� �̸�

select last_name �̸�, salary ���� from employees
where regexp_like(last_name, 'K[a-z]'); -- ù��° ���ڰ� K�̰� �ι�° ���ڰ� a���� z�� �̸�

select last_name �̸�, salary ���� from employees
where regexp_like(last_name, 'K[0-9]'); -- ù��° ���ڰ� K�̰� �ι�° ���ڰ� 0���� 9�� �̸�

select last_name �̸�, job_id ����, regexp_substr( job_id, '[^_]' )  -- ^ : '�Ǿպ���'�� ����
from employees;
select last_name �̸�, job_id ����, regexp_substr( job_id, '[^$]+' )
from employees;
select last_name �̸�, job_id ����, regexp_substr( job_id, '[_$]' )
from employees;
----------------------


/* <6�ܿ�> */
-- ����� 100���� ����� �μ���
select department_id from employees where employee_id = 100;
select department_name from departments where department_id = 90;

-- �� ���̺��� ���ļ� �ϳ��� ���̺��ΰ�ó�� => 'join'
select * from employees, departments;  -- 107 * 27 ��
select * from employees natural join departments;
select * from employees join departments using( department_id );

select employee_id ���, last_name �̸�, department_id �μ�, department_name �μ���
from employees
join departments
using (department_id)
where employee_id = 100;

select * from employees
join departments   
on employees.department_id  = departments.department_id
order by employee_id;

select employee_id ���, last_name �̸�, department_name �μ��� 
from employees
join departments 
on employees.department_id  = departments.department_id
where employee_id = 100;

select employee_id ���, last_name �̸�, department_id �μ�, department_name �μ��� 
from employees
join departments 
on employees.department_id  = departments.department_id
where employee_id = 100;
-- ����
  --> department_id�� �� ���̺� ��� �ֱ� ������ �� ����Ͽ� ��� ���̺����� ������
select e.employee_id ���, e.last_name �̸�, e.department_id �μ�, d.department_name �μ��� 
from employees e
join departments d
on e.department_id  = d.department_id
where employee_id = 100;

select e.employee_id ���, e.last_name �̸�, e.department_id �μ�, d.department_name �μ��� 
from employees e, departments d
where e.department_id = d.department_id
and employee_id = 100;

/* ���� */
-- ����� 120���� ����� employee_id, last_name, job_id, job_title �� ���
--- ���1
select employee_id ���, last_name �̸�, job_id ����, job_title ������
from employees 
join jobs 
using(job_id)
where employee_id = 120;
--- ���2
select e.employee_id ���, e.last_name �̸�, e.job_id ����, j.job_title ������
from employees e 
join jobs j 
on e.job_id = j.job_id
where e.employee_id = 120;
--- ���3
select e.employee_id ���, e.last_name �̸�, e.job_id ����, j.job_title ������
from employees e, jobs j
where e.job_id = j.job_id
and employee_id = 120;



-- �� ���̺� ����
--- ���1
select e.last_name �̸�, d.department_name �μ���, l.city ���ø�
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;
--- ���2
select last_name �̸�, department_name, city
from employees 
join departments 
using ( department_id )
join locations 
using ( location_id);
--- ���3
select e.last_name �̸�, d.department_name �μ���, l.city ���ø�
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id;

/* ���� */
-- 2005�� ��ݱ⿡ �Ի��� ������ ���, �̸�, �μ���, ������ �� ���
--- ���1
select employee_id ���, last_name �̸�, department_name �μ���, job_title ������, hire_date
from employees
join departments using ( department_id )
join jobs using ( job_id )
where hire_date between '05/01/01' and '05/06/30';
--- ���2
select e.employee_id ���, e.last_name �̸�, d.department_name �μ���, j.job_title ������, hire_date
from employees e 
join departments d on e.department_id = d.department_id
join jobs j on e.job_id = j.job_id
where hire_date between '05/01/01' and '05/06/30';
--- ���3
select e.employee_id ���, e.last_name �̸�, d.department_name �μ���, j.job_title ������, hire_date
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id
and hire_date between '05/01/01' and '05/06/30';



-- self join
select e.employee_id ���, e.last_name �̸�, e.manager_id �μ���, m.last_name �μ����
from employees e  -- �� ���� ���̺�
join employees m  -- �μ��� ���� ���̺�
on e.manager_id = m.employee_id(+)  --(+)�ᵵ �ǰ� �Ƚᵵ �� <= employee_id�� ������ �� �� �� ���Ƽ� <= king�� ����� �����ϱ� �μ��� ������ ����
order by e.employee_id;

select e.employee_id ���, e.last_name �̸�, e.manager_id �μ���, m.last_name �μ����
from employees e, employees m
where e.manager_id = m.manager_id(+)
order by e.employee_id;



-- salgrade ���̺� �����ϱ�
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
-- �߸� ������� �� : drop table salgrade;
commit;  -- commit �ѹ��� ������ (insert ���� ���� ��)

select * from user_tables;



-- nonequijoin
select e.last_name �̸�, e.salary ����, s.grade ������� 
from employees e
join salgrade s
-- on e.salary >= s.minsal and e.salary < s.maxsal
on e.salary between s.minsal and s.maxsal  -- �̷��� �ϸ� �̻�,���϶� ��ġ�� �κ��� ����
order by s.grade;

select e.last_name �̸�, e.salary ����, s.grade �������
from employees e, salgrade s
where e.salary >= s.minsal and e.salary < s.maxsal
order by s.grade;



-- left outer join
select e.last_name �̸�, e.department_id �μ�, d.department_name �μ���
from employees e
-- join departments d  -> ���� 107���ε� �μ��� ���� ����� 1�� �־ 106�� ����
left outer join departments d
on e.department_id = d.department_id;

select e.last_name �̸�, e.department_id �μ�, d.department_name �μ���
from employees e, departments d
where e.department_id = d.department_id (+); -- �����Ͱ����� ���ڶ�� �ʿ� (+)�� ���δ�


-- right outer join
select e.last_name �̸�, e.department_id �μ�, d.department_id �μ�, d.department_name �μ���
from employees e
-- join departments d  
right outer join departments d --> �μ����� �� �ִ�
on e.department_id = d.department_id;

select e.last_name �̸�, e.department_id �μ�, d.department_name �μ���
from employees e, departments d
where e.department_id (+) = d.department_id; -- �����Ͱ����� ���ڶ�� �ʿ� (+)�� ���δ�


-- full outer join
select e.last_name �̸�, e.department_id �μ�, d.department_id �μ�, d.department_name �μ���
from employees e
-- join departments d  
full outer join departments d --> �μ����� �� �ִ�
on e.department_id = d.department_id;



/* ���� */
--������� �̸� �μ���ȣ �μ��̸��� ���
--�� �μ��� ���� �������� ��� ���( Outer Join )
select e.last_name �̸�, e.department_id �μ�, d.department_name �μ���
from employees e
left outer join departments d
on e.department_id = d.department_id;

select e.last_name �̸�, e.department_id �μ�, d.department_name �μ���
from employees e, departments d
where e.department_id = d.department_id (+);


--�μ�Ƽ�긦 �޴� ����� �̸�, �μ�Ƽ��, �μ����� 
--�μ�Ƽ�갡 ū ������ ���
select * from departments;
select e.last_name �̸�, e.commission_pct �μ�Ƽ��, d.department_name �μ���
from employees e, departments d
where e.department_id = d.department_id
and e.commission_pct is not null
order by e.commission_pct desc;  --- where���� join �ϴ°��� ǥ���� �ƴϴ�!! join on�� ǥ��!!

select last_name �̸�, commission_pct �μ�Ƽ��, department_name �μ���
from employees 
join departments
using (department_id)
where commission_pct is not null
order by commission_pct desc;

select e.last_name �̸�, e.commission_pct �μ�Ƽ��, d.department_name �μ���
from employees e
join departments d
on e.department_id = d.department_id
where e.commission_pct is not null
order by e.commission_pct desc;


--�����, �μ���, ���ø� ���( Outer Join )
select e.last_name �̸�, d.department_name �μ���, l.city ���ø�
from employees e
left outer join departments d
on e.department_id = d.department_id
left outer join locations l
on d.location_id = l.location_id
order by e.employee_id;

select e.last_name �̸�, d.department_name �μ���, l.city ���ø�
from employees e, departments d, locations l 
where e.department_id = d.department_id (+)
and d.location_id = l.location_id (+)
order by e.employee_id;



--�����, ����, �޿�, �޿������ ���� ��޺��� ���
select e.last_name �̸�, j.job_title ������, e.salary �޿�, s.grade �޿����
from employees e
join jobs j
on e.job_id = j.job_id                           --equijoin
join salgrade s
on e.salary >= s.minsal and e.salary < s.maxsal  --non equijoin -> ����� ����
order by s.grade;


--Abel �̶�� ������ �����, �μ���ȣ�� ���� �μ� ������ 
--������ �����̸������� ���
--self join. �� �ڽ��� ����� ����ϸ� �ȵȴ�.
select e.last_name �̸�, e.department_id �μ���ȣ, m.last_name �����̸�
from employees e       -- �� ���̺�
join employees m       -- ���� ���̺�
on e.department_id = m.department_id
where e.last_name = 'Abel'
-- and not m.last_name = 'Abel'
and e.last_name != m.last_name
order by m.last_name;

select e.last_name �̸�, e.department_id �μ���ȣ, d.department_name �μ���, m.last_name �����̸�
from employees e , employees m, departments d
where e.department_id = m.department_id             --self join
and e.department_id = d.department_id               --equijoin -> ����� ����
and e.last_name = 'Abel'
-- and not m.last_name = 'Abel'
and e.last_name != m.last_name
order by m.last_name;


/* ���� ���� */
--1
select d.department_name �μ���, l.city ����, c.country_name ����, r.region_name ���
from departments d
join locations l
on d.location_id = l.location_id
join countries c
on l.country_id = c.country_id
join regions r
on c.region_id = r.region_id
order by �μ���;

--2
select e.last_name �̸�, j.job_title ����, d.department_name �μ�, h.start_date ����, h.end_date ����
from employees e
join departments d
on e.department_id = d.department_id
join jobs j
on e.job_id = j.job_id
join job_history h
on j.job_id = h.job_id;

---����� : job_history �������� inner join�� ��
select h.employee_id ���, e.last_name || ' ' || e.first_name �̸�, j.job_title ����, d.department_name �μ�, h.start_date ����, h.end_date ����
from job_history h
join employees e
on h.employee_id = e.employee_id
join jobs j
on h.job_id = j.job_id
join departments d
on h.department_id = d.department_id;








/* 01_03 */
-----subquery-----
--last_name�� 'Seo'�� ����� �μ���
select department_id from employees where last_name = 'Seo';
select department_name from departments where department_id = 50;

----> join : ��ġ�� �߿�
select department_name from employees e, departments d
where e.department_id = d.department_id
and last_name = 'Seo';

----> subquery : ������ �߿� : �˰� �ִ� ������ -> �˰� ���� ������
select department_name from departments where department_id         --mainquery
= ( select department_id from employees where last_name = 'Seo' );  --subquery

select department_name from departments where department_id
in ( select department_id from employees where last_name = 'King'); 

select last_name �̸�, salary ����
from employees
where salary > avg( salary );  --�Լ� ���� ����

select avg(salary) from employees;
select last_name �̸�, salary ����
from employees
where salary > ( select avg(salary) from employees );  --���������� �̿��� �Լ� ���

select job_id from employees where employee_id = 141;
select last_name �̸�, job_id ����
from employees
where job_id = (select job_id from employees where employee_id = 141);

select last_name �̸�, salary ����, job_id ����
from employees
where job_id = ( select job_id from employees where last_name = 'Seo' )
and salary > ( select salary from employees where last_name = 'Seo' );

select department_id �μ�, avg(salary) ��տ���
from employees
group by department_id;

select department_id �μ�, trunc(avg(salary), 2) ��տ���
from employees
group by department_id
having avg(salary) > (select avg(salary) from employees where department_id = 50 );

select last_name �̸�, department_id �μ�
from employees
where department_id  = 90 or department_id = 100;

select last_name �̸�, department_id �μ�
from employees
where department_id  in (90, 100);  -- in : or ��� ���� �Լ� => ���� ������ �� �ϳ� (��������)

select last_name �̸�, department_id �μ�
from employees
where department_id in (select department_id from employees where last_name = 'King');
----- in : or ��� ���� �Լ� => ���� ������ �� �ϳ� (��������)

select department_id from employees where last_name = 'King';
select last_name �̸�, department_id �μ�
from employees
where department_id >= any (select department_id from employees where last_name = 'King');
----- any : �ּҰ����� ū �� (�ִ밪���� ���� ��)

select department_id from employees where last_name = 'King';
select last_name �̸�, department_id �μ�
from employees
where department_id >= all (select department_id from employees where last_name = 'King');
----- all : �ִ밪���� ū �� (�ּҰ����� ���� ��)

select last_name, department_id from employees where last_name = 'Seo';
select last_name �̸�, department_id �μ�
from employees 
where exists ( select last_name, department_id from employees where last_name = 'Seo');

select employee_id ���, last_name �̸�
from employees
where employee_id in ( select distinct manager_id from employees);

select employee_id ���, last_name �̸�
from employees
where employee_id not in ( select distinct manager_id from employees);
---manager_id�� ���� null���� �ֱ� ������ not in �� ���� null���� ��ȯ��
---subquery�� null���� �ִ� ��츦 �����ؾ� �Ѵ�. ����� null���� ������ ������.



/* ���� */
--1
--������ 2500 ������ �������� �̸� ���� ��տ��� ���
select last_name �̸�, salary ����, 
trunc((select avg(salary) from employees where salary <= 2500),2) ��տ���
from employees
where salary <= 2500 ;  

--2
--100�� �μ� �������� �̸� ���� �ְ��� �������� ����-��տ��� ���
select last_name �̸�, salary ����,
(select max(salary) from employees where department_id = 100) �ְ���, 
(select min(salary) from employees where department_id = 100) ��������, 
trunc(salary - (select avg(salary) from employees where department_id = 100)) ������
from employees
where department_id = 100;  

--3
-- last_name �� Russell �� ����� �޿����� ���� �޿��� �޴� ����� �̸��� ������ ���
select last_name �̸�, salary ����
from employees
where salary > (select salary from employees where last_name = 'Russell');

--4
--Russell�� job_id �� ���� ����� �̸�, �μ���, ���ø� ����Ѵ�.
--Russell�� ����. �μ���� ���ô� join����.
select e.last_name �̸�, d.department_name �μ���, l.city ����
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where job_id = (select job_id from employees where last_name = 'Russell')
and last_name != 'Russell';

--5
--�μ��� ��ġ�� ���ð� Toronto �� �������� ���, �̸��� ����Ѵ�. 
--���� ���� �߰� ���. 
---> join
select e.employee_id ���, e.last_name �̸�
from employees e
join departments d 
on e.department_id = d.department_id
join locations l 
on d.location_id = l.location_id
where city = 'Toronto';
---> subquery : ���� �ϳ��� in �� �ƴ� ��ȣ ���!
select employee_id ���, last_name �̸� from employees where department_id =
    (select department_id from departments where location_id =
        (select location_id from locations where city = 'Toronto'));


--6
--�޿� ����� B����� ������� �̸�, �޿��� ��� ����Ѵ�.
--���� ������ �Ἥ �ذ��Ѵ�.
---> join
select e.last_name �̸�, e.salary �޿�
from employees e
join salgrade s
on e.salary >= s.minsal and e.salary < s.maxsal
where grade = 'B';
---> subquery
select last_name �̸�, salary �޿� from employees 
where salary >= (select minsal from salgrade where grade = 'B')
    and salary < (select maxsal from salgrade where grade = 'B');
    
    
--7
--��������� �ٹ��ϴ� ������� �̸�(last_name)�� �μ�(department_id) ���
--Join / SubQuery ���� ����
---> join
select * from regions;
select e.last_name �̸�, e.department_id �μ�
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
---> subquery : ���� �ϳ��� in �� �ƴ� ��ȣ ���!
select last_name �̸�, department_id �μ� from employees where department_id in
    (select department_id from departments where location_id in
        (select location_id from locations where country_id in 
            (select country_id from countries where region_id =
                (select region_id from regions where region_name = 'Europe'))));

--8
--employee_id�� 201���� ����� ����ϱ� ������ ���� �μ��� �ٹ��� �������� ��� �̸� �μ� �Ի��� ���
--end_date�� ����Ϸ� ����
---> join
select distinct e.employee_id ���, e.last_name �̸�, e.department_id �μ�, e.hire_date �Ի���
from employees e
cross join job_history j
where e.department_id =
    (select department_id from job_history where employee_id = 201) --�̹� ����� ����̱� ������ job_history���� ������ �����;� �Ѵ�
and e.hire_date < j.end_date
and e.employee_id != 201;

---> subquery
select distinct e.employee_id ���, e.last_name �̸�, e.department_id �μ�, e.hire_date �Ի���
from employees e
where hire_date < 
    (select end_date from job_history where employee_id = 201) --�̹� ����� ����̱� ������ job_history���� ������ �����;� �Ѵ�
and department_id = 
    (select department_id from job_history where employee_id = 201) --�̹� ����� ����̱� ������ job_history���� ������ �����;� �Ѵ�
and employee_id != 201;








/* 01_06 */
-------���տ�����--------
select last_name �̸�, salary ����, department_id �μ�
from employees
where department_id = 80      -- 34��
union  --������ : 41
select last_name �̸�, salary ����
from employees
where salary > 10000;         -- 15��
  ---> ���� -> ���տ����ڸ� ����ϰ� ���� �� �� �������� �������� �����Ͱ� ���ƾ� �Ѵ�!!!

select last_name �̸�, salary ����, department_id �μ�
from employees
where department_id = 80      -- 34��
union  -- ������ : 41
select last_name �̸�, salary ����, department_id �μ�
from employees
where salary > 10000;         -- 15��

select last_name �̸�, salary ����, department_id �μ�
from employees
where department_id = 80      -- 34��
union all  -- ������ �׳� ���ض� : 49
select last_name �̸�, salary ����, department_id �μ�
from employees
where salary > 10000         -- 15��
order by ����;    -- alias�� ��� ���ư���!!! 

select last_name �̸�, salary ����, department_id �μ�
from employees
where department_id = 80      -- 34��
intersect  -- ������ : 8
select last_name �̸�, salary ����, department_id �μ�
from employees
where salary > 10000         -- 15��
order by ����;    -- alias�� ��� ���ư���!!! 

select last_name �̸�, salary ����, department_id �μ�
from employees
where department_id = 80      -- 34��
minus  -- ������ : 34-8 = 26
select last_name �̸�, salary ����, department_id �μ�
from employees
where salary > 10000         -- 15��
order by ����;    -- alias�� ��� ���ư���!!! 

select last_name �̸�, salary ����, department_id �μ�
from employees
where salary > 10000         -- 15��
minus  -- ������ : 15-8 = 7
select last_name �̸�, salary ����, department_id �μ�
from employees
where department_id = 80     -- 34��
order by ����;    -- alias�� ��� ���ư���!!!

select location_id ��ġ, department_name �μ���, to_char( NULL ), ��
from departments
union
select location_id ��ġ, to_char( NULL ) �μ���, state_province ��
from locations;


create table customer(
    id varchar2( 20 ) primary key,
    passwd varchar2 ( 30 ) not null,
    name varchar2 ( 30 ) not null,
    tel varchar( 20 ),
    logtime date default sysdate --���� �ȵ����� ���� �ð��� �־��
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

commit;  --�� ���ֱ�!!!!!

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
rollback;  -- ������ commit�� ���·� ���ư�!!



create table test(
    num number( 2 ),
    value varchar2( 10 )
);
desc test;
commit;

select * from test;

insert into test values( 1, 'A' );
savepoint a;  --�߰��� �ѹ����� �ٽ� ���ư� �� �ְ�!!
insert into test values( 2, 'B' );
savepoint b;
insert into test values( 3, 'C' );
savepoint c;
insert into test values( 4, 'D' );
savepoint d;
insert into test values( 5, 'E' );

select * from test;

rollback to c;
rollback to d;  --���� : ���ٿ��� d��� ���̺� ����Ʈ�� ��������� ���� �������� ���ư��� ������ -> �ٽ� �̷��� ����! �� �� ���� ��
rollback to a;  --���� X : ��� �����̱� ������ �ѹ��� �� �� �ִ� ��
rollback; --�ƿ� ó������ ���ư�

commit;  --Ŀ���� �ϸ� ���̺�����Ʈ�� �� �����!!

rollback;

select * from employees fror update;
select * from user_tables;
select * from user_sequences;
select * from user_indexes;


select * from hr.employees;

desc employees;








/* 01_07 */
select * from user_constraints;

select * from user_constraints where table_name = 'CUSTOMER';  --���� ���� Ȯ���ϱ�

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
values ( 'aaa', 'a@a.com', 20);  --passwd�� name�� null�� ���� �� �����Ƿ� ����!!

insert into test( id, passwd, name, email, age )
values ( 'aaa', '111', 'ȫ�浿', 'a@a.com', 20);

insert into test values ( 'bbb', '111', 'ȫ�浿ȫ�浿ȫ�浿ȫ�浿', 'a@a.com', 20); 
    --name�� 30 byte ������ �ɾ���� ������ ���� (�ѱ� 12���� = 36 byte)

insert into test values ( 'bbb', '111', '�̼���', 'b@b.com', 20);

insert into test values ( 'ccc', '111', '�̼���', to_char(null), 20);

insert into test values ( 'ddd', '111', '������', to_char(null), 20);
    --null�� unique �浹�� �Ͼ�� �ʴ´� -> �������� �浹��!!
insert into test values ( 'eee', '111', '������', 'a@a.com', 40);
    --�̸��� unique �浹!! ����

select * from test;

insert into test values ( 'fff', '111', '������', 'f@f.com', -10); -- age ���� ����
insert into test values ( 'fff', '111', '������', 'f@f.com', 0);   -- age ���� ����
insert into test values ( 'fff', '111', '������', 'f@f.com', 200); -- age ���� ����

insert into test values ( 'fff', '111', '����', 'g@g.com', 30);
insert into test values ( 'fff', '111', '����', 'h@h.com', 30); 
    -- ���̵� -> primary key -> unique �浹!!   
insert into test values ( to_char(null), '111', '����', 'h@h.com', 30);
    -- ���̵� -> primary key -> null�� ���� �� ����!! 
insert into test values ( 'hhh', '111', '�����ҹ�', 'h@h.com', 50);   
    

create table te as select * from test;
select * from te;

desc employees; 
create table emp as select * from employees where 1=0;  
    --where���� ������ ���� -> �������� ���� �ϳ��� ���� �� -> ������ �����
desc emp;
select * from emp;


alter table te read only;  --�б� ���� ���̺�

select * from user_constraints where table_name = 'TE';
insert into te values('ggg', '111', '������', 'c@c.com', 30);
    -- �б� ���� ���̺�� ������ �ٲ�� ������ �����͸� ���� �� ���� 
delete from te where id = 'hhh';
    -- �б� ���� ���̺�� ������ �ٲ�� ������ �����͸� ������ �� ����

alter table te read write;  --�б� ���� Ǯ��


select * from te;
alter table te add ( address varchar(20) );
alter table te modify ( address number(10) );
alter table te modify ( address varchar(40) );

insert into te values( 'hhh', '111', '�����ҹ�', 'h@h.com', 30, '����� ���ʱ� ���ʵ�' );
alter table te modify ( address number(10) );  --�����Ͱ� ������� ������ ������ Ÿ���� �ٲ� �� ����.
alter table te modify ( address varchar(100) );
alter table te modify ( address varchar(20) ); --���� -> 20���� �� �� �����Ͱ� �� �����Ƿ�

alter table te modify ( age number(4) );

alter table te drop column address;  --�����Ͱ� ��� �־ ����� -> ������ �����ؾ� �Ѵ�.

--alter table drop -> ��� �޸𸮰� ��¥�� ������ -> �ð��� �����ɸ�
--set unused -> �׳� �޸𸮸� �Ⱥ��̰� ���� -> ��·�� �޸𸮸� �����ϰ� ���� -> �ϴ� ��Ȱ��ȭ��Ų �� ����� ���� �����ð��� drop�ؾߵ�

select * from user_unused_col_tabs;

alter table te add(address varchar(30));
alter table te set unused( address ); --��Ȱ��ȭ -> �ٽ� Ȱ��ȭ ���� �� ��

select * from te;

alter table te drop unused columns;

select * from user_constraints where table_name = 'TEST';
alter table test rename constraint test_email_ck to test_age_range;

alter table test add ( address varchar2(50) );
alter table test modify address constraint test_address_nn not null; 
    --> ���� ���� not null�� �ٲٱ� -> ���� -> null�� �����ͷ� ä���� �ֱ� ������
alter table test modify age constraint test_age_nn not null;

select * from test;
insert into test values( 'ggg', '111', '������', 'g@g.com', to_number(null), '�����' );
    --> age�� not null ���������� �ɷ� �־� age�� null������ ����

alter table test drop constraint test_age_nn;  --test�� age�� ��� not null �������� ����

select * from test;
insert into test values( 'iii', '111', '������', 'i@i.com', to_number(null), '�����' );
    --> age�� not null ���������� �����ؼ� age�� null ���� �� ����

alter table test drop age constraint test_age_range;  --age ���� ���� ���� ����
insert into test values( 'jjj', '111', '��âȣ', 'j@j.com', 200, '��õ��');

alter table test add constraint test_age_range check ( age between 1 and 150 );
    -- ������ �Ѵ� ���� �־� ����
alter table test add constraint test_age_range check ( age between 1 and 200 );

insert into test values( 'kkk', '111', '������', 'k@k.com', 210, '������' );
    -- ������ �Ѵ� ���� �־� ����
    
update test set email = 'c@c.com' where id = 'ccc';
update test set email = 'd@d.com' where id = 'ddd';

select * from test;

alter table test modify email constraint test_email_nn not null;
select * from user_constraints where table_name ='TEST';

insert into test values( 'lll', '111', '�������', to_char(null), 50, '�Ȼ��' );
    -- email not null �̶� ����
insert into test values( 'lll', '111', '�������', 'l@l.com', 50, '�Ȼ��' );

alter table test drop constraint test_id_pk;
insert into test values( 'lll', '111', '�������', 'm@m.com', 50, '�Ȼ��' );

select * from test;
delete from test where id = 'lll';

alter table test add constraint test_id_pk primary key(id);
alter table test add constraint test_name_pk primary key(name);
    -- ���� -> primary key�� �� ���� ����!!
    
select * from user_constraints where table_name = 'EMPLOYEES';

----- ���� ------
-- ������ �����ʹ� pk�̰ų� unique���� �Ѵ� -> ������ �����Ͱ� �� ���̸� �ȵǹǷ�!
create table depart(
depart_no number( 3 ) primary key,
depart_name varchar2( 20 ) not null
);
insert into depart values( 10, '�񼭽�' );
insert into depart values( 20, '�渮��' );
insert into depart values( 30, '�λ��' );
insert into depart values( 40, '������' );
insert into depart values( 50, '������' );
select * from depart;
select * from test;

alter table test add ( depart_no number(3) );
-- ���̺��� ����� ��Ȳ�̶�� ���� �ڵ��!!
-- create table test(
--  ...
--   depart_no number(3) constraint test_deno_fk references depart( depart_no ),
--  ... );
alter table test add constraint test_deno_fk foreign key ( depart_no ) 
references depart( depart_no ); --�θ�Ű = ������ Ű

select * from user_constraints where table_name = 'TEST';
select * from test;

insert into test values( 'mmm', '111', '������', 'l@l.com', 30, '�����', 60 );
    --�����Ǵ� Ű(�θ�Ű)�� 60�� �����Ƿ� ����
insert into test values( 'mmm', '111', '������', 'l@l.com', 30, '�����', 50 );
    --�����Ǵ� Ű(�θ�Ű)�� 50�� �����Ƿ� ���� X
    
insert into depart test values( 60, '�����' );  --�μ� 60 �߰�
insert into test values( 'nnn', '111', '�̺�â', 'n@n.com', 30, '��õ��', 60 );
    --�����Ǵ� Ű(�θ�Ű)�� 60�� �����Ƿ� ���� X

select * from test;    
update test set depart_no = 70 where id = 'aaa';
update test set depart_no = 10 where id = 'aaa';

select * from test t 
left outer join depart d
on t.depart_no = d.depart_no;

drop table depart;  -- �����ǰ� �����Ƿ� ���� �� ����!!
                    -- ������� test ���̺��� ����� ������ ��
--> ������ ���� �� �ִ� ���
drop table depart cascade constraint;  -- �����ǰ� �־ ������!! -> �����ǰ� �ִ� �������Ǳ��� ������

create table loc(
    loc_id number(3) primary key,
    address varchar(40) not null
);
insert into loc values( 10, '�����' );
insert into loc values( 20, '������' );
insert into loc values( 30, '�Ȼ��' );
insert into loc values( 40, '��õ��' );
insert into loc values( 50, '���ý�' );
select * from loc;
select * from test;

alter table test add constraint test_address_fk foreign key(address)
references loc( address );  -- ������ Ű�� unique���� �ʾƼ� ����!!

alter table loc add constraint loc_address_uk unique( address ); --address�� unique�ϰ� �ٲ��ֱ�!!

insert into test values( 'ooo', '111', 'ȫ�浿', 'o@o.com', 90, '���ý�', 100);

drop table loc;
drop table loc cascade constraint purge; --> purge : ������ �ƿ� �ݳ� -> ���������� �ȵ� = �ǻ츱 �� ����

select * from recyclebin;   -- ������ -> ����� ������ �ǻ츱 �� ����

flashback table "BIN$xt5c34fPTLShu0nrByQrng==$0" to before drop; -- �����뿡�� depart ���̺� �ǻ츮��
select * from depart;
select * from user_constraints where table_name = 'TEST';
select * from test;  --depart �ǻ���� ���� ���Ǳ��� �ǻ�Ƴ��� ����








/* 01_08 */
drop table emp;

create table emp
as 
select employee_id ���, last_name �̸�, salary ����, department_id �μ� -- alias�� �ʼ��� �����
from employees
where department_id = 50
order by employee_id;

select * from emp;

select employee_id, salary from emp; -- ���� -> ������ alias�� �ָ鼭 Į�� �̸��� �����!!
select �̸�, ���� from emp;


-----��(VIEW)
select * from user_views;

create view emp_dept50_view
as
select employee_id ���, last_name �̸�, salary ����, department_id �μ� -- alias�� �ʼ��� �����
from employees
where department_id = 50
order by employee_id;

desc emp_dept50_view;

select * from emp_dept50_view;
select �̸�, ���� from emp_dept50_view; -- ������ alias�� �ָ鼭 Į�� �̸��� �����!!


-----�� ����
create or replace view emp_sal20_view
as
select last_name �̸�, salary ����, salary * 1.1 �λ󿬺�,
nvl( commission_pct , 0 ) * 1.1 �λ��μ�Ƽ��
from employees;

select * from emp_sal20_view;
select �̸�, �λ󿬺� from emp_sal20_view;

select * from user_views;

create or replace view emp_dept50_view (���, �̸�, ����, �μ�, ����)
as
select employee_id ���, last_name �̸�, salary ����, department_id �μ�, job_id ����
from employees
where department_id = 50;

select * from emp_dept50_view;


/* ���� */
-- �̸� first_name + last_name ��ģ��.
create or replace view emp_dept50_view (���, �̸�, ����, �μ�, ����)
as
select employee_id ���, first_name || ' ' || last_name �̸�, salary ����, department_id �μ�, job_id ����
from employees
where department_id = 50;

select * from emp_dept50_view;



update emp_dept50_view set ���� = 80000 --view �� �����Ǵ°��� �ƴϰ� ���� ��ü�� �ٲ��!!
where ��� = 120;

select * from emp_dept50_view;
select * from employees where employee_id = 120; --view �� �����Ǵ°��� �ƴϰ� ���� ��ü�� �ٲ��!!

update emp_dept50_view set phone_number = '9999.9999'
where ��� = 120;  -- ���� -> view�� ���� �ִ� �÷��� ������ �� �ִ�!!


-----���� �� ����
create or replace view loc_seattle_view
as
select e.last_name �̸�, e.salary ����, e.department_id �μ�, d.department_name �μ���
from employees e
join departments d
on e.department_id = d.department_id
where d.location_id = (select location_id from locations where city = 'Seattle');

select * from locations;
select * from user_views;
select * from loc_seattle_view;

update loc_seattle_view set �μ� = 100
where �̸� = 'Khoo';

select * from employees where last_name = 'Khoo';

drop table emp;

create table emp
as
select last_name, salary, department_id, job_id, phone_number
from employees;

select * from emp;


-----üũ�ɼ�
create or replace view emp80
as
select last_name �̸�, salary ����, department_id �μ�
from emp
where department_id = 80
with check option constraint emp80_uk;

select * from emp80;

update emp80 set ���� = 10000
where �̸� = 'Lee';

select last_name, salary from employees where last_name = 'Lee';
    --> üũ�ɼ��� �ָ� ������ �ٲ��� �ʰ� view�� �ٲ��!!
    
create or replace view emp50
as
select last_name �̸�, salary ����,  department_id �μ�
from employees
where department_id = 50
with read only;

select * from emp50;

update emp50 set ���� = 8000
where �̸� = 'Weiss';    -- ���� -> read only �ɼ��� �־ ������ �� �� ����!!

select * from emp80;
select * from user_views;

drop table emp;       -- ������ �������
select * from emp80;  -- �ٷΰ��� ���� �Ұ��ϴ�!!

drop view emp50;
drop view emp80;


-----������
--�ڵ����� primary key�� ���������� ( ex.ȸ������ �� ������)
select * from user_sequences;
select * from employees;

select employees_seq.nextval from dual; --������ (�ѹ� �������� �ٽ� ��������� = �ٽ� ���ҽ�ų �� ����)
select employees_seq.currval from dual; --���簪 

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

insert into board values( board_seq.nextval, '�׽�Ʈ', '�׽�Ʈ', sysdate); 

select board_seq.CURRVAL from dual;
select board_seq.NEXTVAL from dual;

update board set num = board_seq.NEXTVAL
where num = 1;

insert into board values( board_seq.nextval, to_char(null), '�׽�Ʈ', sysdate); --�����ʹ� �ȵ����� num = 9�� �갡 �����ϰ� ��
insert into board values( board_seq.nextval, 'null�׽�Ʈ', '�׽�Ʈ', sysdate); --num = 9�� �پ�Ѱ� 10�� ��

select * from board;

delete from board where num = 3;


-----������ ����
alter sequence board_seq
increment by 10;   -- �� ���� 10�� �����ǵ��� ����!!

insert into board values( board_seq.nextval, '�����׽�Ʈ', '�׽�Ʈ', sysdate);
select * from board;

alter sequence board_seq
maxvalue 99;

insert into board values( board_seq.nextval, '�����׽�Ʈ', '�׽�Ʈ', sysdate);
    --> ��� �ִٰ� num = 100���ʹ� �����Ͱ� ���� ����!!

alter sequence board_seq
cycle;    -- ��ȯ : maxvalue�� �Ѿ�� num�� ó�� ( 1 ) ���� �ٽ� ����!!

insert into board values( board_seq.nextval, '�����׽�Ʈ', '�׽�Ʈ', sysdate);
select * from board;   --> ������ ��� �ִٰ� num�� ��ġ�� -> ���� -> num�� primary key�̹Ƿ�!!

drop table board;

create table boardtest(
num number( 6 ) primary key,
subject varchar2( 1000 ) not null,
content varchar2( 4000 ) not null,
wtime date default sysdate
);
insert into boardtest values( board_seq.nextval, '�����׽�Ʈ', '�׽�Ʈ', sysdate);
select * from boardtest;    --> ���̺� �����ϰ� �ٽ� ���� ������ ��(num)��� �̾�����

drop sequence board_seq;    --> ������ ����
select * from user_sequences;


-----�ε���
select e.last_name �̸�, e.salary ����, e.department_id �μ�, 
d.department_name �μ���, e.job_id ����, j.job_title ������
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


-----���Ǿ�
create synonym emp for employees;
select * from emp;
select * from employees;
create synonym dept for departments;

select * from user_synonyms;

create view emp_deptname_view
as
select e.last_name �̸�, e.salary ����, e.department_id �μ�, d.department_name �μ���
from emp e, dept d
where e.department_id = d.department_id;

select * from emp_deptname_view;
create synonym deptname for emp_deptname_view;

select * from deptname;
select �̸�, ���� from deptname;

drop synonym emp;
drop synonym dept;
drop synonym deptname;
drop view emp_deptname_view;





/* 01_09 */
/* SQL �ǽ�.pdf  p.103 */
-- ������ ����
select employee_id ���, last_name �̸�, department_id �μ�, manager_id �μ���
from employees;

select level, employee_id ���, last_name �̸�, department_id �μ�, manager_id �μ���
from employees
start with manager_id is null
connect by prior employee_id = manager_id;

select lpad( '  ', ( level-1 )*3 ) || last_name �̸�, level,
department_id �μ�, manager_id �μ���
from employees
start with manager_id is null
connect by prior employee_id = manager_id;
