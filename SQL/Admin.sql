/* Administration Workshop.pdf */
/* 01_15 */
----------------------
-----테이블 스페이스-----
----------------------
--생성
select * from user_tables;
select * from user_tablespaces;

create tablespace myspace
datafile 'C:\oraclexe\app\oracle\oradata\myspace1.dbf' size 10M
default storage(
    initial 10K
    next 10K
    minextents 2
    maxextents 50
    pctincrease 50
);

create table mytable( id varchar2(30), passwd varchar2(400)) tablespace myspace;

select * from user_tablespaces;  --테이블 스페이스의 정보
select * from dba_tablespaces;   --테이블 스페이스의 정보
select * from dba_data_files;    --테이블 파일의 정보
select * from dba_segments;      --세그먼트 정보
select * from dba_segments where owner = 'SYSTEM';
select * from dba_segments where tablespace_name = 'MYSPACE';
select * from dba_extents;       --extent 정보
select * from dba_extents where tablespace_name = 'MYSPACE';

select * from dba_free_space;    --남은 공간 정보
select * from dba_free_space where tablespace_name = 'MYSPACE';
select * from dba_free_space_coalesced;   --Extent 조각 모음 통계 정보
select * from dba_free_space_coalesced where tablespace_name = 'MYSPACE';
alter tablespace myspace coalesce;   --조각 모음

select * from dba_tables where owner = 'SYSTEM';
select * from dba_tables where table_name = 'MYTABLE';
select * from dba_tables where table_name = 'MYBOARD';

create table myinfo( id varchar2(( 30), information varchar2(4000));
select * from dba_tables where table_name = 'MYINFO';

select * from dba_tables where owner = 'MC';
select * from dba_tables where owner = 'HR';

select * from dba_users where username = 'HR';
select * from user_users;      --Default Tablespace 정의


--수정 변경
--MC.employees 테이블 스페이스 USERS -> MYSPACE
alter user mc quota 1M on myspace;      --myspace 공간 확보
grant unlimited tablespace to mc;       --권한 부여
alter table MC.employees move tablespace myspace;


--MC Default tablespace
alter user mc default tablespace myspace;
alter user mc default tablespace users;


--테이블스페이스 데이터 파일 이름 변경
alter tablespace myspace rename datafile 'C:\oraclexe\app\oracle\oradata\myspace1.dbf'
    to 'C:\oraclexe\app\oracle\oradata\my1.dbf';


--데이터 파일 용량 증가
--파일 추가
alter tablespace myspace
add datafile 'C:\oraclexe\app\oracle\oradata\myspace2.dbf' size 10M;


--파일 크기 증가 (감소는 안됨)
alter database datafile 'C:\oraclexe\app\oracle\oradata\myspace1.dbf' resize 20M;

alter database datafile 'C:\oraclexe\app\oracle\oradata\myspace1.dbf'
    autoextend on next 10M maxsize unlimited;
--size 10m autoextent on next 1M maxsize 250m
--size 10m maxsize unlimited   운영체제가 부여할 수 있는 최대 공간


--자동 증가 중지
alter database datafile 'C:\oraclexe\app\oracle\oradata\myspace1.dbf'
    autoextend off;


--Online/Offline
select * from dba_tablespaces;
alter tablespace myspace offline;
alter tablespace myspace online;


--삭제
drop tablespace myspace;
drop tablespace myspace including contents;  --테이블이 있을 경우 삭제
drop tablespace myspace including contents cascade constraints; 
                                            --참조무결성 제약조건까지 무시하고 삭제
                                            
drop tablespace myspace including contents and datafiles cascade constraints;
                                            --데이터 파일까지 삭제





