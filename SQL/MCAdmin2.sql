/* Administration Workshop.pdf */
/* 3단원 */
/* 01_16 */

--유저 보안 관리
--MC_TEST 계정--
select * from all_users;  -- 모든 계정 확인할 수 있다

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
select * from user_ts_quotas;    --자기 용량 확인하기

alter user mctest identified by mc;

connect mctest/mctest;
connect mctest/mc;
select * from test;

alter user mc identified by mc;

drop user mctest;  --권한 없음

select * from user_users;

select * from HR.employees;   --접근 권한 (객체 권한) 이 없음

create table test( id varchar2( 20 ), passwd varchar2( 30 ));
create view v_test as select * from test;



--ATEST 계정--
grant create session to btest;    --권한 없음
grant create session to btest with admin option;

--BTEST 계정--
grant create session to ctest;    --권한 없음
--Atest 권한 제거
revoke create session from atest;
grant create session to atest;


--객체 권한
select * from HR.employees;


--MCTEST 계정--
select * from HR.employees;

insert into HR.employees 
    values( 250, '길동', '홍', 'HONG', '9999-9999', sysdate, 'IT_PROG', 10000, NULL, 100, 100 );

insert into HR.employees 
    values( 260, '순신', '이', 'LEE', '8888-8888', sysdate, 'IT_PROG', 10000, NULL, 100, 100 );

--객체 권한 확인
select * from user_tab_privs_recd;
select * from user_col_privs_recd;


--CTEST 계정--
select * from session_roles;
select * from role_sys_privs;
select * from user_role_privs;









