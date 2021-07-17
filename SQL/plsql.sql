/* 01_09 */
/* PLSQL_Fundamentals.pdf  p.9 */
set serveroutput on;
begin
    dbms_output.put_line('Hello World');
end;
/      
        /* plsql�� ;�� ��ü�� ���ư��Ƿ� /�� �� �������� */

/* 
 '�̸�:ȫ�浿' ���
   C       =>   printf("�̸�:%s", "ȫ�浿")
   java    =>   System.out.println("�̸�:" + "ȫ�浿")
   Python  =>   print("�̸�:" "ȫ�浿")
           =>   print("�̸�:","ȫ�浿")
           =>   print("�̸�:"+"ȫ�浿")
   Oracle  =>   dmbs_output.put_line('�̸�:' || ' ' || 'ȫ�浿')
*/
 
begin
    dbms_output.put_line('�λ�:'||'Hello World');
end;
/  
begin
    dbms_output.put_line('�λ�:'||' '||'Hello World');
end;
/  
desc dbms_output;
/

--���� ����
declare
    v_name varchar2( 10 );
    v_age number( 3 ) := 30;
    v_tel varchar2( 30 ) not null := '1111-2222';   --not null�� ������Ƿ� �����͸� �ȳ����� ����
    v_logtime date := to_date( '2019/12/30' );
    v_flag boolean;                                 --������ ��� �Ұ�! ��·�� ������ ����
begin
    dbms_output.put_line( 'name : ' || v_name );
    dbms_output.put_line( 'age : ' || v_age );
    v_name := 'ȫ�浿';
    v_age := 40;
    dbms_output.put_line( 'name : ' || v_name );
    dbms_output.put_line( 'age : ' || v_age );
    dbms_output.put_line( 'tel : ' || v_tel );
    dbms_output.put_line( 'logtime : ' || v_logtime );
    dbms_output.put_line( 'flag : ' || v_flag );      --������ ��� �Ұ�! ��·�� ������ ����
end;
/

--���ڿ� ���ͷ��� ����ǥ
declare
    v_name varchar2( 30 ) := q'[hong's name]';   --���ڿ� ���� ����ǥ, ū ����ǥ ����ϱ� ���� ���
    --v_name varchar2( 30 ) := q'{hong's name}';
    --v_name varchar2( 30 ) := q'!hong's name!';
    --v_name varchar2( 30 ) := q'&hong's name&';
    --v_name varchar2( 30 ) := q'Ahong's nameA';
    --v_name varchar2( 30 ) := q'��hong's name��';
begin
    dbms_output.put_line( 'name : ' || v_name );
end;
/







/* 01_10 */
/* PLSQL_Fundamentals.pdf  p.74 */
--%TYPE
set serveroutput on;
declare
    name constant varchar2( 30 ) := 40;  --> constant �� ���� �ٲ� �� ����  --> �ʱⰪ�� �ݵ�� �־�� �� (���ָ� ����)
    empid employees.employee_id%TYPE := 300;
    myid empid%TYPE := 400;
begin
    --name := '������';        --> ���� : constant�� ���� ���ȭ �Ǵ� �Լ��̱� ������ ���� �ٲ� �� ���� --> ����� �����ϰ� ���� �� ���
    dbms_output.put_line( 'name : ' || name );
    dbms_output.put_line( 'empid : ' || empid );
    dbms_output.put_line( 'myid : ' || myid );
end;
/

select * from employees;

   --���ڵ� : ���̺��� �� �� : �� �ٸ� ������ ����
   --�÷��� : ���̺��� �� �� : �� ���� ������ ����


--���ε� ����
variable b_result number;   --> ������ �ϳ��� ����
begin
    select salary into :b_result from employees where employee_id = 200;
end;
/
print b_result;           --> ���� ������ �� �� �������൵ �� �� �� ���� ���´�!

begin
    select salary into :b_result from employees where employee_id = 100;
end;
/
print b_result;           --> ���� ������ �� �� �������൵ �� �� �� ���� ���´�!

select employee_id ���, last_name �̸�, salary ���� 
from employees
where salary = :b_result;   --> 98~108�ٱ��� �� �����ؼ� F5�� ����


--���ε� ������ autoprint ���
set autoprint on;         --> ���ε� ���� �ڵ� ���
variable b_result number;
begin
    select salary into :b_result from employees where employee_id = 100;
end;
/
--print b_result; 



/* <3�ܿ�> */
--SQL �Լ� ���
declare
    v_msg varchar2( 100 ) := '�츮���� ���ѹα�';
    --v_msg varchar2( 100 ) := ABCD;     --> ���� : �̹� �ִ� ������ �� �����Ͽ��� ������
    v_nmsg nvarchar2( 100 ) := '�츮���� ���ѹα�';   --> nvarchar2 : ���� �� ���� �ڷ���
    v_hire timestamp := '2019/12/30';
    v_dhire date := '2019/12/30';
    
    v_seq number( 5 );
begin
    dbms_output.put_line( 'msg : ' || length( v_msg ));  --> length : bite �� X, ���� �� O
    v_msg := 'ABCD';
    dbms_output.put_line( 'nmsg : ' || length( v_nmsg ));
    dbms_output.put_line( 'time : ' || (sysdate - v_hire ));   --> 1/1000�� ������ ǥ����
    dbms_output.put_line( 'date : ' || (sysdate - v_dhire )); 
    
    select employees_seq.nextval into v_seq from dual
    dbms_output.put_line( 'sequence : ' || v_seq );                 -->11g ���� ���
    dbms_output.put_line( 'sequence : ' || employees_seq.nextval ); -->11g ���� ���
end;
/

--SEQUENCE ���
select * from user_sequences;  --> ��� ������ Ȯ��

declare
    v_seq number( 5 );
begin
    select employees_seq.nextval into v_seq from dual;
    dbms_output.put_line( 'sequence : ' || v_seq );                 -->11g ���� ���
    dbms_output.put_line( 'sequence : ' || employees_seq.nextval ); -->11g ���� ���
end;
/

--����ȯ : �Ͻ��� ��ȯ(�ڵ��� ��ȯ) / ����� ��ȯ(������ ��ȯ)
declare
    a number( 3 ) := 10;
    b varchar2( 3 ) := '20';
    c number( 3 );
    d varchar2 ( 3 ) := 'A';
begin
    c := a + b;      -->�Ͻ��� ��ȯ(�ڵ��� ��ȯ)
    --c := a + d;    -->���� : ���� ������ ���ڸ� ����
    dbms_output.put_line( '��� : ' || c ); 
    
    dbms_output.put_line( '���� : ' || months_between(sysdate, '2019/12/30') ); -->�Ͻ��� ��ȯ(�ڵ��� ��ȯ)
    dbms_output.put_line( '���� : ' || (sysdate + 30) );                        -->�Ͻ��� ��ȯ(�ڵ��� ��ȯ)
    
    dbms_output.put_line( '���� : ' || (sysdate - to_date('2019/12/30') )); -->����� ��ȯ(������ ��ȯ)
end;
/

--��ø ���
declare
    a number( 3 ) := 10;
    c varchar2( 10 ) := 'ȫ�浿';
begin
        declare
            b number( 3 ) := 20;
            c varchar2( 10 ) := '�̼���';
        begin
            dbms_output.put_line( 'outer a : ' || a );
            dbms_output.put_line( 'outer b : ' || b );
            dbms_output.put_line( 'outer c : ' || c );
        end;
        
    dbms_output.put_line( 'outer a : ' || a );
    --dbms_output.put_line( 'outer b : ' || b );  --> ���� : b�� end���� ������ �� (�ڱ� ����(���κ� ��)������ ���� = ���� ����)
    dbms_output.put_line( 'outer c : ' || c );
end;
/

--��ø ��Ͽ� ������ ���
begin <<outer>>
    declare
        c varchar2( 10 ) := 'ȫ�浿';
    begin
            declare
                c varchar2( 10 ) := '�̼���';
            begin
                dbms_output.put_line( 'outer c : ' || c );
                dbms_output.put_line( 'outer c : ' || outer.c );
            end;
        dbms_output.put_line( 'outer c : ' || c );
    end;
end outer;
/

begin <<first>>
    declare
        name varchar2( 20 ) := 'first';
    begin
        begin <<second>>
            declare
                name varchar2( 20 ) := 'second';
            begin
                begin <<third>>
                    declare
                        name varchar2( 20 ) := 'third';
                    begin
                        dbms_output.put_line( name );         --third
                        dbms_output.put_line( first.name );   --first
                        dbms_output.put_line( second.name );  --second
                        dbms_output.put_line( third.name );   --third
                    end;
                end third;
            end;
        end second;
    end;
end first;
/



/* <4�ܿ�> */
--PLSQL�� SELECT
declare
    fname employees.first_name%TYPE;
    sal employees.salary%TYPE;
    hiredate employees.hire_date%TYPE;
    jobtitle jobs.job_title%TYPE;
    deptname departments.department_name%TYPE;
    salsum number( 7 );
begin
    --select * into fname from employees where id = 120;  --> ���� : �����͸� ������ �����ͼ�
    select first_name into fname from employees where employee_id = 120;
    dbms_output.put_line( 'name : ' || fname );
    
    select first_name, salary, hire_date into fname, sal, hiredate
    from employees where last_name = 'Seo';
    dbms_output.put_line( 'name : ' || fname );
    dbms_output.put_line( 'salary : ' || sal );
    dbms_output.put_line( 'hire_date : ' || hiredate );
    
    select e.first_name, e.salary, d.department_name, j.job_title
    into fname, sal, deptname, jobtitle
    from employees e
    join departments d
    on e.department_id = d.department_id
    join jobs j
    on e.job_id = j.job_id
    where e.employee_id = 130;
    dbms_output.put_line( 'name : ' || fname );
    dbms_output.put_line( 'salary : ' || sal );
    dbms_output.put_line( 'department_name : ' || deptname );
    dbms_output.put_line( 'job_title : ' || jobtitle );

    --�׷��Լ�
    --salsum := sum( employees.salary );    --���� : �׷��Լ��� ���� ����� �� ����.
    select sum(salary) into salsum from employees;
    dbms_output.put_line( 'sum : ' || salsum );
end;
/

--������ ����
select * from user_tables;

drop table customer;
create table customer(
    cid varchar2( 20 ) primary key,
    cpasswd varchar2( 30 ) not null,
    cname varchar2 ( 30 ) not null,
    ctel varchar2( 30 ),
    clogtime date    
);
select * from customer;
/

begin
    insert into customer values( 'aaa', '111', 'kim', '1111-2222', sysdate );
    insert into customer values( 'bbb', '111', 'lee', '2222-2222', sysdate );
    insert into customer values( 'ccc', '111', 'park', '3333-2222', sysdate );
    insert into customer values( 'ddd', '111', 'jung', '2222-3333', sysdate );
    insert into customer values( 'eee', '111', 'choi', '3333-1111', sysdate );
end;
/
select * from customer;
commit;    --Ŀ�� �ʼ�!
/

declare
    tel customer.ctel%TYPE := '9999-9999';
    logtime customer.clogtime%TYPE := '2019/12/30';
begin
    update customer set ctel = tel, clogtime = logtime
    where cid = 'aaa';
    commit;
end;
/
select * from customer;
/

declare
    id customer.cid%TYPE := 'ccc';
    tel customer.ctel%TYPE;
    logtime customer.clogtime%TYPE;
begin    
    update customer set ( ctel, clogtime ) =
        ( select ctel, clogtime from customer where cid = id )
        where cid = 'aaa';
    
    --select ctel, clogtime into tel, logtime from customer where cid = id;
    --update customer set ctel = tel, clogtime = logtime where cid = 'aaa';
    
    commit;
end;
/
select * from customer;
/    

/* ���� */
--employees 100-120 ���� ���� �� employee_id, last_name, phone_number, hire_date
--customer ���̺�� insert
declare
begin
    insert into customer ( cid, cpasswd, cname, ctel, clogtime )
    select employee_id, '111', last_name, phone_number, hire_date
        from employees where employee_id between 100 and 120;
    commit;
end;
/
select * from customer;
/   


--������ ����
declare
    id customer.cid%TYPE := 'eee';
begin
    delete from customer where cid = id;
    commit;
end;
/
select * from customer;
/

/* ���� */
--employees department_id = 60 �� ������� customer ���� ����
declare
    deptno departments.department_id%TYPE := 60;
begin
    delete from customer where cid in
    (select to_char(employee_id) from employees
    where department_id = deptno);
    commit;
end;
/
select * from customer;
/
select * from employees;
/


--PLSQL���� DDL ���
--DDL  -> create alter drop  ���� �� ��
--DCL  -> grant revoke   ���� �� ��
begin
    --drop table customer; -> ���� ���ϹǷ� ����
    create sequence customer_seq
    start with 1
    maxvalue 999999
    increment by 1
    nocycle
    nocache;
end;
/







/* 01_13 */
set serveroutput on;

select * from customer;

create table copy_customer
as select * from customer where 1=0;   --������ �����

select * from copy_customer;

insert into copy_customer values( 'aaa', '111', '������', '9999-9999', sysdate );
insert into copy_customer values( 'bbb', '111', '������', '9999-9999', sysdate );
insert into copy_customer values( 'ccc', '111', '������', '9999-9999', sysdate );
insert into copy_customer values( 'ddd', '111', '������', '9999-9999', sysdate );

select * from copy_customer;
/
begin
    merge into copy_customer cc
    using customer cu
    on ( cc.cid = cu.cid )
    when matched then
        update set cc.cpasswd = cu.cpasswd, cc.cname = cu.cname, 
            cc.ctel = cu.ctel, cc.clogtime = cu.clogtime
    when not matched then
        insert values( cu.cid, cu.cpasswd, cu.cname, cu.ctel, cu.clogtime ); 
end;
/
select * from copy_customer;
/

--�Ͻ��� Ŀ��
declare
    id customer.cid%TYPE;
    found boolean;
    notfound boolean;
    rowcount number( 2 );
    getid customer.cid%TYPE;
begin
    id := 'aaa';
    select cid into getid from customer where cid = id;
    dbms_output.put_line( 'found : ' || sys.diutil.bool_to_int( SQL%FOUND ));
    dbms_output.put_line( 'notfound : ' || sys.diutil.bool_to_int( SQL%NOTFOUND ));
    dbms_output.put_line( 'rowcount : ' || SQL%ROWCOUNT ); 
    -- 1 = true, 0 = false
    -- found : 1, notfound : 0  =>  �� �� �̻� ������ ���ƴ�.
    -- rowcount : 1             =>  ������ ���� �� ���� 1�̴�.
    
    update customer set ctel = '9999-9999' where cid = id;
    dbms_output.put_line( 'found : ' || sys.diutil.bool_to_int( SQL%FOUND ));
    dbms_output.put_line( 'notfound : ' || sys.diutil.bool_to_int( SQL%NOTFOUND ));
    dbms_output.put_line( 'rowcount : ' || SQL%ROWCOUNT ); 
    -- found : 1, notfound : 0  =>  �� �� �̻� ������ ���ƴ�.
    -- rowcount : 1             =>  ������ ���� �� ���� 1�̴�.
    
    update customer set ctel = '9999-9999' where length( cname ) > 5 ;
    dbms_output.put_line( 'rowcount : ' || SQL%ROWCOUNT ); 
    -- rowcount : 9             =>  ������ ���� �� ���� 9�̴�.
end;
/
select * from customer;
/



/* <5�ܿ�> */
--��� if
declare
    age number( 3 ) := 25;
begin
    if age < 20 then
        dbms_output.put_line( '���' );
    else
        dbms_output.put_line( '�' );
    end if;
end;
/
declare
    age number( 3 ) := 35;      --> û��
    --age number( 3 );          -- NULL --> ���
begin
    if age < 20 then dbms_output.put_line( '���' );
    elsif age < 40 then dbms_output.put_line( 'û��' );
    elsif age < 60 then dbms_output.put_line( '���' );
    else dbms_output.put_line( '���' );
    end if;
end;
/

/* ���� */
--90�� �̻��̸� 'A����'
--80�� �̻��̸� 'B����'
--70�� �̻��̸� 'C����'
--60�� �̻��̸� 'D����'
--50�� �̸��̸� 'F����'
--�� 0~100 ���� �϶��� ���� ���, �ƴϸ� '�߸��Է�' ���
-----��
declare
    score number( 3 ) := 60;
begin
    if score < 0 or score > 100 then dbms_output.put_line( '�߸��Է�' );
    elsif score >= 90 then dbms_output.put_line( 'A����' );
    elsif score >= 80 then dbms_output.put_line( 'B����' );
    elsif score >= 70 then dbms_output.put_line( 'C����' );
    elsif score >= 60 then dbms_output.put_line( 'D����' );
    else dbms_output.put_line( 'F����' );
    end if;
end;
/
-----�����
declare
    score number( 3 ) := 60;
begin
    if score >= 0 and score <= 100 then
        if score >= 90 then dbms_output.put_line( 'A����' );
        elsif score >= 80 then dbms_output.put_line( 'B����' );
        elsif score >= 70 then dbms_output.put_line( 'C����' );
        elsif score >= 60 then dbms_output.put_line( 'D����' );
        else dbms_output.put_line( 'F����' );
        end if;
    else dbms_output.put_line( '�߸��Է�' );
    end if;
end;
/

--��� case
declare
    grade varchar2( 1 ) := 'D';
    score varchar2( 30 );
begin
    score := case grade
    when 'A' then '�� ���߾��!'
    when 'B' then '���߾��!'
    when 'C' then '����ϼ���!'
    else '���� Ȯ���ϼ���!'
    end;
    dbms_output.put_line( score );
end;
/
declare
    grade varchar2( 1 ) := 'F';
    score varchar2( 30 );
begin
    score := case
    when grade in ('A', 'B') then '�� ���߾��!'
    when grade in ('C', 'D') then '���߾��!'
    when grade = 'F' then '����ϼ���!'
    else '���� Ȯ���ϼ���!'
    end;  --> end case; �ָ� ���� -> �׳� ���Ը� �ϴ� �ű� ������
    dbms_output.put_line( score );
end;
/
declare
    process number := 3;    --1: Ȯ��, 2: ����, 3: ����
    id customer.cid%TYPE := 'bbb';
    counts number( 3 );
begin
    case process
    when 1 then 
        select count(*) into counts from customer;  --customer�� ��ü �ο����� ��������� counts�� �־��
    when 2 then
        update customer set ctel = '9999-9999' where cid = id;
        counts := SQL%ROWCOUNT;
    when 3 then
        delete from customer where cid = id;
        counts := SQL%ROWCOUNT;
    end case;
    dbms_output.put_line( 'process : ' || process || ' ' || 'counts : ' || counts );
end;
/

--NULL ó��
begin
    --if 10 = 10 then dbms_output.put_line( '����' );           --����
    --if 10 = '10' then dbms_output.put_line( '����' );         --���� -> �Ͻ��� ����ȯ
    --if 10 = 10.0 then dbms_output.put_line( '����' );         --����
    
    --if true = 1 then dbms_output.put_line( '����' );          --����
    --if false = 0 then dbms_output.put_line( '����' );         --����
    --if false = '' then dbms_output.put_line( '����' );        --����
    
    --if NULL = 0 then dbms_output.put_line( '����' );          --�ٸ���
    --if NULL = NULL then dbms_output.put_line( '����' );       --�ٸ���
    --if NULL = '' then dbms_output.put_line( '����' );         --�ٸ���
    if to_char(NULL) = '' then dbms_output.put_line( '����' );  --�ٸ���
    else dbms_output.put_line( '�ٸ��� ' );
    end if;
end;
/

--P.157 �����̺�
begin
    --<AND>                      --������ �Ǹ� true�̰� �ȵǸ� false
    --if TRUE and TRUE then dbms_output.put_line( 'TRUE' ); --TRUE
    --if TRUE and FALSE then dbms_output.put_line( 'TRUE' );  --FALSE
    --if TRUE and NULL then dbms_output.put_line( 'TRUE' );  --NULL
    --if FALSE and TRUE then dbms_output.put_line( 'TRUE' );  --FALSE
    --if FALSE and FALSE then dbms_output.put_line( 'TRUE' );  --FALSE
    --if FALSE and NULL then dbms_output.put_line( 'TRUE' );  --FALSE
    --if NULL and TRUE then dbms_output.put_line( 'TRUE' );  --FALSE
    --if NULL and FALSE then dbms_output.put_line( 'TRUE' );  --FALSE
    --if NULL and NULL then dbms_output.put_line( 'TRUE' );  --NULL
    
    --<OR>    
    --if TRUE or TRUE then dbms_output.put_line( 'TRUE' ); --TRUE
    --if TRUE or FALSE then dbms_output.put_line( 'TRUE' );  --TRUE
    --if TRUE or NULL then dbms_output.put_line( 'TRUE' );  --TRUE
    --if FALSE or TRUE then dbms_output.put_line( 'TRUE' );  --TRUE
    --if FALSE or FALSE then dbms_output.put_line( 'TRUE' );  --FALSE
    --if FALSE or NULL then dbms_output.put_line( 'TRUE' );  --NULL
    --if NULL or TRUE then dbms_output.put_line( 'TRUE' );  --TRUE
    --if NULL or FALSE then dbms_output.put_line( 'TRUE' );  --NULL
    --if NULL or NULL then dbms_output.put_line( 'TRUE' );  --NULL
    
    --<NOT> 
    --if not TRUE then dbms_output.put_line( 'TRUE' );     --FALSE
    --if not FALSE then dbms_output.put_line( 'TRUE' );     --TRUE
    --if not NULL then dbms_output.put_line( 'TRUE' );     --NULL
    end if;
end;
/

--�ݺ��� LOOP    do ( ���๮ ) while ( ���� );
declare
    i number( 3 ) := 1;
begin
    loop
        dbms_output.put_line( 'i : ' || i );
        i := i + 1;
        exit when i > 3;
    end loop;
end;   
/    

delete from customer where cid = 'aaa';
delete from customer where cid = 'ccc';
delete from customer where cid = 'ddd';
alter table customer modify ( cid number( 3 ) ) primary key );
declare
    i number( 3 ) := 1;
    name customer.cname%TYPE := 'ȫ�浿';
    tel customer.ctel%TYPE := '0000-0000';
    maxid customer.cid%TYPE;
begin
    select max( cid ) into maxid from customer;
    loop
        insert into customer values( maxid + to_char(i), '111', name, tel, sysdate );
        i := i + 1;   -- 121, 122, 123
        exit when i > 3;   -->loop�� ������ ����
    end loop;
end;
/
select * from customer;
/
    
--�ݺ��� WHILE
declare
    i number( 3 ) := 1;
begin
    while i < 3 loop       -->loop�� ����Ǵ� ����
        dbms_output.put_line( 'i : ' || i ) ;
        i := i + 1;
    end loop;
end;
/
declare
    i number( 3 ) := 0;
    id customer.cid%TYPE := 120;
begin
    while i < 4 loop      -- i : 0, 1, 2
        update customer set ctel = '9999-9999' where cid = id + i;
        i := i + 1;
    end loop;
end;
/
select * from customer;
/

--�ݺ��� FOR  
--  : �ݺ� Ƚ���� ��Ȯ�� �� �� ��� -> ��κ� ���� ���� ����Ѵ�.
begin
    --for i in 1 .. 3 loop       --1, 2, 3
    --for i in 1.5 .. 3.5 loop   --2, 3, 4 (�Ҽ��� �ݿø��Ѵ�!!) -> sql���� �ִ� ���
    for i in 3 .. 1 loop         --�Ųٷδ� �������
        dbms_output.put_line( 'i : ' || i );
    end loop;
end;
/
declare
    v_start number( 3 ) := 1;  --null�̸� �ȵ�!!
    v_end number( 3 ) := 3;
    cnt number( 3 ) := 3;
begin
    for i in v_start .. v_end loop
        --dbms_output.put_line( 'i : ' || i );
        dbms_output.put_line( 'cnt ' || cnt );  --����
        cnt := cnt - 1;
    end loop;
end;
/
declare
    id customer.cid%TYPE := 120;
begin
    for i in 1 .. 3 loop
        delete from customer where cid = id + i;
    end loop;
end;
/
select * from customer;
/

--��ø �ݺ���
begin
    <<outer_loop>>
    for i in 1 .. 3 loop     -- 1, 2, 3
        <<inner_loop>>
        for j in 4 .. 6 loop  -- 4, 5, 6   => �� 3 x 3 = 9�� ���
            dbms_output.put_line( 'i : ' || i || ' , ' || 'j : ' || j );
        end loop inner_loop;
    end loop outer_loop;
end;
/

--continue
declare
    i number( 3 ) := 1;
begin
    while true loop
        i := i + 1;
        exit when i > 10;
        continue when mod( i, 2 ) = 1; -- i�� 2�� �������� �� �������� 1��(TRUE) ��� �� �ڵ�� �Ѿ�� �ʰ� �ٽ� ����!!
        dbms_output.put_line( 'i : ' || i );
    end loop;
end;
/




/* <6�ܿ�> */
--���� ������ ���� RECORD
declare
    /*1*/
    type t_customer is record                --���ڵ� ����
        ( id varchar2( 30 ), 
          passwd customer.cpasswd%TYPE, 
          name varchar( 30 ), 
          tel customer.ctel%TYPE,
          logtime customer.clogtime%TYPE );
    cus t_customer;                          --�������� = �޸� �Ҵ�
    name varchar2( 30 );
    tel varchar2( 50 );
    /*2*/
    cust customer%ROWTYPE;   --> �� �ڵ庸�� �� ���� ���!!!
    /*3*/
    emp employees%ROWTYPE;
    
begin
    /*1*/
    select cname, ctel into name, tel from customer where cid = '120';
    select * into cus from customer where cid = '120';
    dbms_output.put_line( 'name : ' || cus.name );
    dbms_output.put_line( 'tel : ' || cus.tel );
    dbms_output.put_line( 'logtime : ' || cus.logtime );
    /*2*/
    select * into cust from customer where cid = '110';
    dbms_output.put_line( 'name : ' || cust.cname );
    dbms_output.put_line( 'tel : ' || cust.ctel );
    dbms_output.put_line( 'logtime : ' || cust.clogtime );
    /*3*/
    select * into emp from employees where employee_id = 100;
    dbms_output.put_line( 'name : ' || emp.last_name );
    dbms_output.put_line( 'tel : ' || emp.salary );
    dbms_output.put_line( 'logtime : ' || emp.department_id );
    dbms_output.put_line( 'logtime : ' || emp.hire_date );
end;
/


-- %ROWTYPE insert  ( %ROWTYPE : �� ���� �� �����Ͷ� )
select * from user_tables;
drop table emp;

create table emp
as select * from employees where 1=0;

select * from emp;
/
declare
    v_emp emp%ROWTYPE;
    v_empno employees.employee_id%TYPE := 120;
begin
    select * into v_emp from employees where employee_id = v_empno;
    insert into emp values(
        v_emp.employee_id, v_emp.first_name, v_emp.last_name, v_emp.email, 
        v_emp.phone_number, v_emp.hire_date, v_emp.job_id, v_emp.salary,
        v_emp.commission_pct, v_emp.manager_id, v_emp.department_id );
end;
/







/* 01_13 */
-- %ROWTYPE update
set serveroutput on;
declare
    v_emp employees%ROWTYPE;
    v_empno employees.employee_id%TYPE := 120;
begin
    select * into v_emp from employees where employee_id = v_empno;
    dbms_output.put_line( 'salary : ' || v_emp.salary );
    dbms_output.put_line( 'department_id : ' || v_emp.department_id );
    dbms_output.put_line( 'phone number : ' || v_emp.phone_number );
    
    v_emp.salary := 9999.00;
    v_emp.department_id := 90;
    v_emp.phone_number := '9999-9999';
    
    update emp set salary = v_emp.salary, department_id = v_emp.department_id,
    phone_number = v_emp.phone_number
    where employee_id = v_empno;
end;
/
select * from emp;

-- PLSQL �÷��� (�迭 ������)
-- �����迭 ( Index by table )
declare
    /*����*/
    type ename_table_type is table of
        employees.last_name%TYPE
        index by PLS_INTEGER;
    type esal_table_type is table of
        employees.salary%TYPE
        index by PLS_INTEGER;
    /*���� ���� - �޸� �Ҵ�*/
    v_ename ename_table_type;
    v_esal esal_table_type;
begin
    v_ename( 1 ) := 'ȫ�浿';
    v_esal( 1 ) := 10000;
    if v_ename.exists( 1 ) then 
        dbms_output.put_line( 'name : ' || v_ename( 1 ));
    end if;
    
    v_esal( 1 ) := 10000;
    v_esal( 2 ) := 9000;
    v_esal( 3 ) := 7000;
    v_esal( 4 ) := 5000;
    v_esal( 5 ) := 2000;
    
    v_esal.delete( 4 );
    
    dbms_output.put_line( 'count : ' || v_esal.count());
    
    for i in v_esal.first .. v_esal.last loop
        if v_esal.exists( i ) then 
            dbms_output.put_line( i || ' : ' || v_esal( i ));
        end if;
    end loop;
end;
/

-- �����迭 ���̺� �ɼ�
declare
    type employees_table_type is table of
        employees%ROWTYPE
        index by PLS_INTEGER;
    v_emp employees_table_type;
    v_eno_min employees.employee_id%TYPE;
    v_eno_max employees.employee_id%TYPE;
begin
    --v_eno_min := min( employee_id );  -> ���� : PLSQL ������ �׷��Լ� ����� �� ����.
    select min( employee_id ) into v_eno_min from employees;
    select max( employee_id ) into v_eno_max from employees;
    for i in v_eno_min .. v_eno_max loop
        select * into v_emp( i ) from employees where employee_id = i;
    end loop;
    for i in v_emp.first .. v_emp.last loop
        dbms_output.put_line( i || ' ' || v_emp( i ).last_name 
        || ' ' || v_emp( i ).salary || ' ' || v_emp( i ).department_id );
    end loop;
end;
/




/* <7�ܿ�> */
-- ����� Ŀ�� : �ݺ������� �̿��� �� �ִ�!!

/*1*/
--fetch�� ���� ������ ����
declare
    CURSOR c_emp_cursor is
        select last_name, salary from employees where department_id = 80; 
                --Ŀ���� �ؼ� into�� ��� ���� �ȳ�
    v_name employees.last_name%TYPE;
    v_salary employees.salary%TYPE;
begin
    open c_emp_cursor;  -- Ŀ�� ����
    loop
        fetch c_emp_cursor into v_name, v_salary; -- Ŀ���� �ڵ����� �� �྿ ������ ������ 
                                                  -- fetch�� ���� ������ ����
        exit when c_emp_cursor%NOTFOUND;  -- notfound : ���� ��ȯ���� ������(TRUE)�̸� ����(exit)
        dbms_output.put_line( 'name : ' || v_name || ' ' || 'salary : ' || v_salary );
    end loop;
    close c_emp_cursor; -- Ŀ�� �ݱ�
end;
/

/*2*/
-- fetch�� ���ڵ� ������ ����  -> �̰� �� ����!!
declare
    CURSOR c_emp_cursor is
        select last_name, salary from employees where department_id = 80; 
    v_emp_record c_emp_cursor%ROWTYPE;
begin
    open c_emp_cursor;  -- Ŀ�� ����
    loop
        fetch c_emp_cursor into v_emp_record; -- fetch�� ���ڵ� ������ ����  -> �̰� �� ����!!
        exit when c_emp_cursor%NOTFOUND;  -- notfound : ���� ��ȯ���� ������(TRUE)�̸� ����(exit)
        dbms_output.put_line( v_emp_record.last_name || ' ' || v_emp_record.salary );
    end loop;
    close c_emp_cursor;
end;
/

/*3*/
-- cursor �� for ��  -> �̰� ������ ����!!
declare
    CURSOR c_emp_cursor is
        select last_name, salary from employees where department_id = 80; 
begin
    -- cursor �� for ��
    for i in c_emp_cursor loop     -- open
        dbms_output.put_line( c_emp_cursor%ROWCOUNT || ' ' || i.last_name 
            || ' ' || i.salary );
    end loop;                      -- close
end;
/

/*4*/
-- Subquery cursor �� for ��
begin
    -- Subquery cursor �� for ��
    for i in (select last_name, salary from employees where department_id = 80)
        loop                       -- open
        dbms_output.put_line( i.last_name || ' ' || i.salary );
    end loop;                      -- close
end;
/

-- �Ķ���Ͱ� ���Ե� cursor
declare
    cursor c_emp_cursor( deptno number ) is
        select last_name, salary from employees where department_id = deptno;
    c_emp_record c_emp_cursor%ROWTYPE;
begin
    open c_emp_cursor( 80 );
    loop
        fetch c_emp_cursor into c_emp_record;
        exit when c_emp_cursor%NOTFOUND;
        dbms_output.put_line( c_emp_cursor%ROWCOUNT || ' ' || c_emp_record.last_name
            || ' ' || c_emp_record.salary );
    end loop;
    close c_emp_cursor;

    open c_emp_cursor( 90 );
    loop
        fetch c_emp_cursor into c_emp_record;
        exit when c_emp_cursor%NOTFOUND;
        dbms_output.put_line( c_emp_cursor%ROWCOUNT || ' ' || c_emp_record.last_name
            || ' ' || c_emp_record.salary );
    end loop;
    close c_emp_cursor;
end;
/




/* <8�ܿ�> */
--���� ó�� (�̸� ���ǵ� ����)
declare
    v_lname varchar2( 6 );
    result number;
begin
    /*p.256-7 ����*/
    select last_name into v_lname from employees where first_name = 'John';   --TOO_MANY_ROWS
    --select last_name into v_lname from employees where first_name = 'Diana'; --VALUE_ERROR
    --select last_name into v_lname from employees where first_name = 'Bruce';
    dbms_output.put_line( 'name : ' || v_lname );
    --select 10 / 0 into result from dual;                                     --ZERO_DIVIDE
exception 
    when TOO_MANY_ROWS then
        dbms_output.put_line( '���� �ʹ� ����' );
    when VALUE_ERROR then
        dbms_output.put_line( '���� ũ�⸦ Ȯ���ϼ���' );
    when others then
        dbms_output.put_line( '���� �߻�' );
end;
/

--���� ó�� (�̸� ���ǵ��� ���� ����)
declare
    e_null_except EXCEPTION;
    PRAGMA EXCEPTION_INIT ( e_null_except, -01400 );  
            --����� ���ܿ� ǥ�� ����Ŭ ���� ���� ��ȣ�� ����
                --> cannot insert NULL into ������ ��� ����
begin
    insert into departments( department_id, department_name )
    values( 280, NULL );   -- cannot insert NULL into ���� �߻�
exception
    when e_null_except then
        dbms_output.put_line( 'NULL�� ������ �ȵ˴ϴ�.' );
        dbms_output.put_line( 'SQLCODE : ' || SQLCODE );
        dbms_output.put_line( 'SQLERRM : ' || SQLERRM );
end;
/

--���� ó�� (�����(����) ���� ����)
declare
    e_notfound_except EXCEPTION;
begin
    update departments set department_name = 'Testing'
        where department_id = 500;
    if SQL%NOTFOUND then
        raise e_notfound_except;   -- unhandled user-defined exception ���� �߻�
    end if;  
    commit;
exception
    when e_notfound_except then
        dbms_output.put_line( 'ó������ �ʾҽ��ϴ�.' );
end;
/




/* <9�ܿ�> */
-- �͸� ���
declare
    v_new customer%ROWTYPE;
begin
    v_new.cid := 200;
    v_new.cpasswd := '111';
    v_new.cname := 'ȫ�浿';
    v_new.ctel := '9999-9999';
    insert into customer 
        values( v_new.cid, v_new.cpasswd, v_new.cname, v_new.ctel, sysdate );
end;
/
select * from customer;
/

--���ν���
--������ �� ���� ���ν����� �����س��� ���߿� ������ �� �� �ְ� ����
create or replace procedure insert_cust is
    v_new customer%ROWTYPE;
begin
    v_new.cid := 300;
    v_new.cpasswd := '111';
    v_new.cname := 'ȫ�浿';
    v_new.ctel := '9999-9999';
    insert into customer 
        values( v_new.cid, v_new.cpasswd, v_new.cname, v_new.ctel, sysdate );
end;
/
select * from user_objects where object_name = 'INSERT_CUST';   --���ݱ��� ���� ��� ���̺�, ���ν���, ������ �� �� ������
select * from user_source where name = 'INSERT_CUST';    -- �ڵ�� ������
/

begin
    insert_cust;
end;
/
select * from customer;
/

--�Լ�
create or replace function find return boolean is
    v_cust customer%ROWTYPE;
    v_cid customer.cid%TYPE := 400;
begin
    select * into v_cust from customer where cid = v_cid;
    if SQL%FOUND then
        dbms_output.put_line(
            v_cust.cid || ' ' || v_cust.cpasswd || ' ' || v_cust.cname
            || ' ' || v_cust.ctel || ' ' || v_cust.clogtime );
        return true;
    end if;
exception when NO_DATA_FOUND then
    return false;
end;
/
begin
    if find then -- 100�� ������ �����ϱ� '�ش� ȸ���� �����մϴ�.'
        dbms_output.put_line( '�ش� ȸ���� �����մϴ�.' );
    else         -- 400�� ������ �����ϱ� '�ش� ȸ���� �������� �ʽ��ϴ�.'
        dbms_output.put_line( '�ش� ȸ���� �������� �ʽ��ϴ�.' );
    end if;
end;
/

--�Լ��� �Ķ���� ����
create or replace function find( v_cid customer.cid%TYPE ) return boolean is
    v_cust customer%ROWTYPE;
begin
    select * into v_cust from customer where cid = v_cid;
    if SQL%FOUND then
        dbms_output.put_line(
            v_cust.cid || ' ' || v_cust.cpasswd || ' ' || v_cust.cname
            || ' ' || v_cust.ctel || ' ' || v_cust.clogtime );
        return true;
    end if;
exception when NO_DATA_FOUND then
    return false;
end;
/
begin
    if (find(100)) then -- 100�� ������ �����ϱ� '�ش� ȸ���� �����մϴ�.'
        dbms_output.put_line( '�ش� ȸ���� �����մϴ�.' );
    else         -- 400�� ������ �����ϱ� '�ش� ȸ���� �������� �ʽ��ϴ�.'
        dbms_output.put_line( '�ش� ȸ���� �������� �ʽ��ϴ�.' );
    end if;
    
    if (find(400)) then -- 100�� ������ �����ϱ� '�ش� ȸ���� �����մϴ�.'
        dbms_output.put_line( '�ش� ȸ���� �����մϴ�.' );
    else         -- 400�� ������ �����ϱ� '�ش� ȸ���� �������� �ʽ��ϴ�.'
        dbms_output.put_line( '�ش� ȸ���� �������� �ʽ��ϴ�.' );
    end if;
end;
/
begin
    if (find(120)) then -- 100�� ������ �����ϱ� '�ش� ȸ���� �����մϴ�.'
        dbms_output.put_line( '�ش� ȸ���� �����մϴ�.' );
    else         -- 400�� ������ �����ϱ� '�ش� ȸ���� �������� �ʽ��ϴ�.'
        dbms_output.put_line( '�ش� ȸ���� �������� �ʽ��ϴ�.' );
    end if;
end;
/

--��Ű��
  --�����
create or replace package customers as
    procedure add_salary( add_value number);  -- �Լ� ���鶧���� number(4, 2)�̷��� �����ϰ� ����
    function insert_user( v_cust customer%ROWTYPE ) return number;
    function update_user( v_cust customer%ROWTYPE ) return number;
    function delete_user( v_cid customer.cid%TYPE ) return number;
    function select_user( v_cid customer.cid%TYPE ) return boolean;
end customer;
/
  --������
create or replace package body customers as
    procedure add_salary( add_value number ) is
    begin
    end;
    function insert_user( v_cust customer%ROWTYPE ) return number is
    begin
    end;
end;
/
  --����
exec customers.add_salary( 0.1 );
exec customers.insert_user( ������ ������ );



