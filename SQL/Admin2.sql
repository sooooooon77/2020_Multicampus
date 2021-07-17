/* Administration Workshop.pdf */
/* 3단원 */
/* 01_16 */

--유저 보안 관리
--System 계정
select * from all_users;  -- 모든 계정 확인할 수 있다


--계정 생성
create user mctest identified by mctest;  
    --계정을 만들었다고 로그인 바로 가능한건 아님 -> 일단은 권한을 하나하나 줘야한다
    
grant create session to mctest;  --로그인 권한 부여
grant create table to mctest;    --테이블 생성 권한 부여

select * from dba_tablespaces;
select * from dba_users where username = 'MCTEST';

alter user mctest quota 10M on users;  --저장 공간 할당
alter user mctest default tablespace users temporary tablespace temp;
    -- 기본 테이블스페이스 임시 테이블스페이스 지정
    
grant create view to mctest;        -- 뷰 생성 권한 부여
grant create sequence to mctest;    -- 시퀀스 생성 권한 부여
grant create procedure, create trigger to mctest;   --권한을 한번에 부여할수도 있다


--조회
select * from dba_users;
select * from user_users;     --자기 계정 확인하기
select * from dba_ts_quotas;  --전체 용량 확인하기  -- '-1' : '무제한'을 의미


--수정
alter user mctest identified by mctest;
connect mctest/mctest;
alter user mctest default tablespace users;   --기본 테이블스페이스 변경
alter user mctest temporary tablespace temp;  --임시 테이블스페이스 변경
alter user mctest quota unlimited on users;   --쿼타를 무제한으로

select * from dba_ts_quotas;


--삭제
drop user mctest cascade;   --딕셔너리 객체를 모두 삭제 -> 접속이 되어 있으면 삭제를 못 함
select * from dba_users where username = 'MCTEST';


--권한
create user mctest identified by mctest quota 10M on users
default tablespace users temporary tablespace temp;

grant create session, create table, create view, create sequence to mctest;

select * from dba_sys_privs;   -- 부여된 시스템 권한 확인
select * from dba_sys_privs where grantee = 'MCTEST';

select * from dba_roles;       -- role : 권한 여러개를 묶어 한 번에 권한을 부여하는 명령어

revoke create view from mctest;    -- 뷰를 만들 권한을 뺏음
     -- grant ~ to  <->  revoke ~ from


-- with admin option  계층적이지 않고 수평적이다.
-- system with admin option -> Atest with admin option -> Btest
create user atest identified by atest;
create user btest identified by btest;
create user ctest identified by ctest;

grant create session to atest;                   --권한 부여 권한 X
grant create session to atest with admin option; --권한 부여 권한 O

-- system revoke <- Atest
-- Atest 접속 불가능
-- Btest Ctest 접속 가능

-- Btest 가 Atest 의 권한을 제거 가능
-- Btest 가 Atest 의 권한을 부여 가능


--객체 권한
select * from HR.employees;
grant select on HR.employees to mctest;  --HR 계정 테이블의 select 권한 부여


--HR 계정이 객체 insert 권한 부여
grant insert on HR.employees to mctest;
grant insert on employees to mctest;

revoke insert on employees from mctest;


--HR 계정 --
--권한 확인
grant insert on employees to mctest;
select * from user_tab_privs where table_name = 'EMPLOYEES';
select * from user_tab_privs_made;
select * from user_tab_privs_made where table_name = 'EMPLOYEES';
select * from user_tab_privs_recd;


--with grant option
--수평적이지 않고 계층적
--Atest with grant option -> Btest with grant option -> Ctest
--Atest 테이블을 Btest, Ctest 접근 가능
--Atest 권한 회수하면 Btest, Ctest 모두 접근 불가능


--SYSTEM 계정--
--ROLE
--ROLE 생성 -> ROLE 에 권한 부여 -> 계정에 ROLE 을 부여 (ROLE은 일종의 저장소 역할을 함)
drop user ctest cascade;
set role all except new_user;            --new_user 제외 모든 롤 활성화
create user ctest identified by ctest;

create role new_user identified by 1234;  --롤 생성
grant create session, create table, create view, create sequence to new_user; --롤 권한 부여

revoke create session from ctest;

grant new_user to ctest;

select * from role_sys_privs where role = 'NEW_USER';
select * from session_roles;
select * from user_role_privs;

grant new_user to ctest;
set role new_user identified by 1234;

alter role new_user not identified;   --롤 수정
--set role new_user;                    --new_user 롤만 활성화
grant new_user to ctest;              --롤 계정에 부여     ctest 로그인 가능
revoke new_user from ctest;           --롤 계정에서 해제    ctest 로그인 불가능

