/* Administration Workshop.pdf */
/* 01_15 */
----------------------
-----���̺� �����̽�-----
----------------------
--����
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

select * from user_tablespaces;  --���̺� �����̽��� ����
select * from dba_tablespaces;   --���̺� �����̽��� ����
select * from dba_data_files;    --���̺� ������ ����
select * from dba_segments;      --���׸�Ʈ ����
select * from dba_segments where owner = 'SYSTEM';
select * from dba_segments where tablespace_name = 'MYSPACE';
select * from dba_extents;       --extent ����
select * from dba_extents where tablespace_name = 'MYSPACE';

select * from dba_free_space;    --���� ���� ����
select * from dba_free_space where tablespace_name = 'MYSPACE';
select * from dba_free_space_coalesced;   --Extent ���� ���� ��� ����
select * from dba_free_space_coalesced where tablespace_name = 'MYSPACE';
alter tablespace myspace coalesce;   --���� ����

select * from dba_tables where owner = 'SYSTEM';
select * from dba_tables where table_name = 'MYTABLE';
select * from dba_tables where table_name = 'MYBOARD';

create table myinfo( id varchar2(( 30), information varchar2(4000));
select * from dba_tables where table_name = 'MYINFO';

select * from dba_tables where owner = 'MC';
select * from dba_tables where owner = 'HR';

select * from dba_users where username = 'HR';
select * from user_users;      --Default Tablespace ����


--���� ����
--MC.employees ���̺� �����̽� USERS -> MYSPACE
alter user mc quota 1M on myspace;      --myspace ���� Ȯ��
grant unlimited tablespace to mc;       --���� �ο�
alter table MC.employees move tablespace myspace;


--MC Default tablespace
alter user mc default tablespace myspace;
alter user mc default tablespace users;


--���̺����̽� ������ ���� �̸� ����
alter tablespace myspace rename datafile 'C:\oraclexe\app\oracle\oradata\myspace1.dbf'
    to 'C:\oraclexe\app\oracle\oradata\my1.dbf';


--������ ���� �뷮 ����
--���� �߰�
alter tablespace myspace
add datafile 'C:\oraclexe\app\oracle\oradata\myspace2.dbf' size 10M;


--���� ũ�� ���� (���Ҵ� �ȵ�)
alter database datafile 'C:\oraclexe\app\oracle\oradata\myspace1.dbf' resize 20M;

alter database datafile 'C:\oraclexe\app\oracle\oradata\myspace1.dbf'
    autoextend on next 10M maxsize unlimited;
--size 10m autoextent on next 1M maxsize 250m
--size 10m maxsize unlimited   �ü���� �ο��� �� �ִ� �ִ� ����


--�ڵ� ���� ����
alter database datafile 'C:\oraclexe\app\oracle\oradata\myspace1.dbf'
    autoextend off;


--Online/Offline
select * from dba_tablespaces;
alter tablespace myspace offline;
alter tablespace myspace online;


--����
drop tablespace myspace;
drop tablespace myspace including contents;  --���̺��� ���� ��� ����
drop tablespace myspace including contents cascade constraints; 
                                            --�������Ἲ �������Ǳ��� �����ϰ� ����
                                            
drop tablespace myspace including contents and datafiles cascade constraints;
                                            --������ ���ϱ��� ����





