/* Administration Workshop.pdf */
/* 3�ܿ� */
/* 01_16 */

--���� ���� ����
--System ����
select * from all_users;  -- ��� ���� Ȯ���� �� �ִ�


--���� ����
create user mctest identified by mctest;  
    --������ ������ٰ� �α��� �ٷ� �����Ѱ� �ƴ� -> �ϴ��� ������ �ϳ��ϳ� ����Ѵ�
    
grant create session to mctest;  --�α��� ���� �ο�
grant create table to mctest;    --���̺� ���� ���� �ο�

select * from dba_tablespaces;
select * from dba_users where username = 'MCTEST';

alter user mctest quota 10M on users;  --���� ���� �Ҵ�
alter user mctest default tablespace users temporary tablespace temp;
    -- �⺻ ���̺����̽� �ӽ� ���̺����̽� ����
    
grant create view to mctest;        -- �� ���� ���� �ο�
grant create sequence to mctest;    -- ������ ���� ���� �ο�
grant create procedure, create trigger to mctest;   --������ �ѹ��� �ο��Ҽ��� �ִ�


--��ȸ
select * from dba_users;
select * from user_users;     --�ڱ� ���� Ȯ���ϱ�
select * from dba_ts_quotas;  --��ü �뷮 Ȯ���ϱ�  -- '-1' : '������'�� �ǹ�


--����
alter user mctest identified by mctest;
connect mctest/mctest;
alter user mctest default tablespace users;   --�⺻ ���̺����̽� ����
alter user mctest temporary tablespace temp;  --�ӽ� ���̺����̽� ����
alter user mctest quota unlimited on users;   --��Ÿ�� ����������

select * from dba_ts_quotas;


--����
drop user mctest cascade;   --��ųʸ� ��ü�� ��� ���� -> ������ �Ǿ� ������ ������ �� ��
select * from dba_users where username = 'MCTEST';


--����
create user mctest identified by mctest quota 10M on users
default tablespace users temporary tablespace temp;

grant create session, create table, create view, create sequence to mctest;

select * from dba_sys_privs;   -- �ο��� �ý��� ���� Ȯ��
select * from dba_sys_privs where grantee = 'MCTEST';

select * from dba_roles;       -- role : ���� �������� ���� �� ���� ������ �ο��ϴ� ��ɾ�

revoke create view from mctest;    -- �並 ���� ������ ����
     -- grant ~ to  <->  revoke ~ from


-- with admin option  ���������� �ʰ� �������̴�.
-- system with admin option -> Atest with admin option -> Btest
create user atest identified by atest;
create user btest identified by btest;
create user ctest identified by ctest;

grant create session to atest;                   --���� �ο� ���� X
grant create session to atest with admin option; --���� �ο� ���� O

-- system revoke <- Atest
-- Atest ���� �Ұ���
-- Btest Ctest ���� ����

-- Btest �� Atest �� ������ ���� ����
-- Btest �� Atest �� ������ �ο� ����


--��ü ����
select * from HR.employees;
grant select on HR.employees to mctest;  --HR ���� ���̺��� select ���� �ο�


--HR ������ ��ü insert ���� �ο�
grant insert on HR.employees to mctest;
grant insert on employees to mctest;

revoke insert on employees from mctest;


--HR ���� --
--���� Ȯ��
grant insert on employees to mctest;
select * from user_tab_privs where table_name = 'EMPLOYEES';
select * from user_tab_privs_made;
select * from user_tab_privs_made where table_name = 'EMPLOYEES';
select * from user_tab_privs_recd;


--with grant option
--���������� �ʰ� ������
--Atest with grant option -> Btest with grant option -> Ctest
--Atest ���̺��� Btest, Ctest ���� ����
--Atest ���� ȸ���ϸ� Btest, Ctest ��� ���� �Ұ���


--SYSTEM ����--
--ROLE
--ROLE ���� -> ROLE �� ���� �ο� -> ������ ROLE �� �ο� (ROLE�� ������ ����� ������ ��)
drop user ctest cascade;
set role all except new_user;            --new_user ���� ��� �� Ȱ��ȭ
create user ctest identified by ctest;

create role new_user identified by 1234;  --�� ����
grant create session, create table, create view, create sequence to new_user; --�� ���� �ο�

revoke create session from ctest;

grant new_user to ctest;

select * from role_sys_privs where role = 'NEW_USER';
select * from session_roles;
select * from user_role_privs;

grant new_user to ctest;
set role new_user identified by 1234;

alter role new_user not identified;   --�� ����
--set role new_user;                    --new_user �Ѹ� Ȱ��ȭ
grant new_user to ctest;              --�� ������ �ο�     ctest �α��� ����
revoke new_user from ctest;           --�� �������� ����    ctest �α��� �Ұ���

