/* Administration Workshop.pdf */
/* 3�ܿ� */
/* 01_16 */

--���� ���� ����
--MC_TEST ����--
select * from all_users;  -- ��� ���� Ȯ���� �� �ִ�

create table test( id varchar2( 20 ), passwd varchar2( 30 ));

create view v_test as select * from test;

create sequence s_test
start with 1
maxvalue 9999
increment by 1
nocache
nocycle;
/

create or replace procedure p_test is
    a number := 10;
begin
    dbms_output.put_line( a );
end;
/

select * from user_users;
select * from user_ts_quotas;    --�ڱ� �뷮 Ȯ���ϱ�

alter user mctest identified by mc;

connect mctest/mctest;
connect mctest/mc;
select * from test;

alter user mc identified by mc;

drop user mctest;  --���� ����

select * from user_users;

select * from HR.employees;   --���� ���� (��ü ����) �� ����

create table test( id varchar2( 20 ), passwd varchar2( 30 ));
create view v_test as select * from test;



--ATEST ����--
grant create session to btest;    --���� ����
grant create session to btest with admin option;

--BTEST ����--
grant create session to ctest;    --���� ����
--Atest ���� ����
revoke create session from atest;
grant create session to atest;


--��ü ����
select * from HR.employees;


--MCTEST ����--
select * from HR.employees;

insert into HR.employees 
    values( 250, '�浿', 'ȫ', 'HONG', '9999-9999', sysdate, 'IT_PROG', 10000, NULL, 100, 100 );

insert into HR.employees 
    values( 260, '����', '��', 'LEE', '8888-8888', sysdate, 'IT_PROG', 10000, NULL, 100, 100 );

--��ü ���� Ȯ��
select * from user_tab_privs_recd;
select * from user_col_privs_recd;


--CTEST ����--
select * from session_roles;
select * from role_sys_privs;
select * from user_role_privs;









