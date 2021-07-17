/* 01_09 */
/* PLSQL_Fundamentals.pdf  p.9 */
set serveroutput on;
begin
    dbms_output.put_line('Hello World');
end;
/      
        /* plsql은 ;찍어도 전체가 돌아가므로 /를 꼭 찍어줘야함 */

/* 
 '이름:홍길동' 출력
   C       =>   printf("이름:%s", "홍길동")
   java    =>   System.out.println("이름:" + "홍길동")
   Python  =>   print("이름:" "홍길동")
           =>   print("이름:","홍길동")
           =>   print("이름:"+"홍길동")
   Oracle  =>   dmbs_output.put_line('이름:' || ' ' || '홍길동')
*/
 
begin
    dbms_output.put_line('인사:'||'Hello World');
end;
/  
begin
    dbms_output.put_line('인사:'||' '||'Hello World');
end;
/  
desc dbms_output;
/

--변수 선언
declare
    v_name varchar2( 10 );
    v_age number( 3 ) := 30;
    v_tel varchar2( 30 ) not null := '1111-2222';   --not null로 잡았으므로 데이터를 안넣으면 에러
    v_logtime date := to_date( '2019/12/30' );
    v_flag boolean;                                 --논리값은 출력 불가! 어쨌든 변수는 있음
begin
    dbms_output.put_line( 'name : ' || v_name );
    dbms_output.put_line( 'age : ' || v_age );
    v_name := '홍길동';
    v_age := 40;
    dbms_output.put_line( 'name : ' || v_name );
    dbms_output.put_line( 'age : ' || v_age );
    dbms_output.put_line( 'tel : ' || v_tel );
    dbms_output.put_line( 'logtime : ' || v_logtime );
    dbms_output.put_line( 'flag : ' || v_flag );      --논리값은 출력 불가! 어쨌든 변수는 있음
end;
/

--문자열 리터럴의 따옴표
declare
    v_name varchar2( 30 ) := q'[hong's name]';   --문자열 안의 따옴표, 큰 따옴표 출력하기 위해 사용
    --v_name varchar2( 30 ) := q'{hong's name}';
    --v_name varchar2( 30 ) := q'!hong's name!';
    --v_name varchar2( 30 ) := q'&hong's name&';
    --v_name varchar2( 30 ) := q'Ahong's nameA';
    --v_name varchar2( 30 ) := q'ㅁhong's nameㅁ';
begin
    dbms_output.put_line( 'name : ' || v_name );
end;
/







/* 01_10 */
/* PLSQL_Fundamentals.pdf  p.74 */
--%TYPE
set serveroutput on;
declare
    name constant varchar2( 30 ) := 40;  --> constant 는 값을 바꿀 수 없다  --> 초기값을 반드시 주어야 함 (안주면 에러)
    empid employees.employee_id%TYPE := 300;
    myid empid%TYPE := 400;
begin
    --name := '김유신';        --> 에러 : constant는 값이 상수화 되는 함수이기 때문에 값을 바꿀 수 없음 --> 어떤값을 고정하고 싶을 때 사용
    dbms_output.put_line( 'name : ' || name );
    dbms_output.put_line( 'empid : ' || empid );
    dbms_output.put_line( 'myid : ' || myid );
end;
/

select * from employees;

   --레코드 : 테이블의 한 행 : 다 다른 데이터 조합
   --컬렉션 : 테이블의 한 열 : 다 같은 데이터 조합


--바인드 변수
variable b_result number;   --> 변수는 하나만 지정
begin
    select salary into :b_result from employees where employee_id = 200;
end;
/
print b_result;           --> 같은 변수를 두 번 지정해줘도 두 개 다 값이 나온다!

begin
    select salary into :b_result from employees where employee_id = 100;
end;
/
print b_result;           --> 같은 변수를 두 번 지정해줘도 두 개 다 값이 나온다!

select employee_id 사번, last_name 이름, salary 연봉 
from employees
where salary = :b_result;   --> 98~108줄까지 블럭 지정해서 F5로 실행


--바인드 변수와 autoprint 사용
set autoprint on;         --> 바인드 변수 자동 출력
variable b_result number;
begin
    select salary into :b_result from employees where employee_id = 100;
end;
/
--print b_result; 



/* <3단원> */
--SQL 함수 사용
declare
    v_msg varchar2( 100 ) := '우리나라 대한민국';
    --v_msg varchar2( 100 ) := ABCD;     --> 에러 : 이미 있는 변수를 또 선언하였기 때문에
    v_nmsg nvarchar2( 100 ) := '우리나라 대한민국';   --> nvarchar2 : 글자 수 세기 자료형
    v_hire timestamp := '2019/12/30';
    v_dhire date := '2019/12/30';
    
    v_seq number( 5 );
begin
    dbms_output.put_line( 'msg : ' || length( v_msg ));  --> length : bite 수 X, 글자 수 O
    v_msg := 'ABCD';
    dbms_output.put_line( 'nmsg : ' || length( v_nmsg ));
    dbms_output.put_line( 'time : ' || (sysdate - v_hire ));   --> 1/1000초 단위로 표현됨
    dbms_output.put_line( 'date : ' || (sysdate - v_dhire )); 
    
    select employees_seq.nextval into v_seq from dual
    dbms_output.put_line( 'sequence : ' || v_seq );                 -->11g 이전 방식
    dbms_output.put_line( 'sequence : ' || employees_seq.nextval ); -->11g 이후 방식
end;
/

--SEQUENCE 사용
select * from user_sequences;  --> 모든 시퀀스 확인

declare
    v_seq number( 5 );
begin
    select employees_seq.nextval into v_seq from dual;
    dbms_output.put_line( 'sequence : ' || v_seq );                 -->11g 이전 방식
    dbms_output.put_line( 'sequence : ' || employees_seq.nextval ); -->11g 이후 방식
end;
/

--형변환 : 암시적 변환(자동형 변환) / 명시적 변환(강제형 변환)
declare
    a number( 3 ) := 10;
    b varchar2( 3 ) := '20';
    c number( 3 );
    d varchar2 ( 3 ) := 'A';
begin
    c := a + b;      -->암시적 변환(자동형 변환)
    --c := a + d;    -->에러 : 숫자 형태의 문자만 가능
    dbms_output.put_line( '결과 : ' || c ); 
    
    dbms_output.put_line( '간격 : ' || months_between(sysdate, '2019/12/30') ); -->암시적 변환(자동형 변환)
    dbms_output.put_line( '간격 : ' || (sysdate + 30) );                        -->암시적 변환(자동형 변환)
    
    dbms_output.put_line( '간격 : ' || (sysdate - to_date('2019/12/30') )); -->명시적 변환(강제형 변환)
end;
/

--중첩 블록
declare
    a number( 3 ) := 10;
    c varchar2( 10 ) := '홍길동';
begin
        declare
            b number( 3 ) := 20;
            c varchar2( 10 ) := '이순신';
        begin
            dbms_output.put_line( 'outer a : ' || a );
            dbms_output.put_line( 'outer b : ' || b );
            dbms_output.put_line( 'outer c : ' || c );
        end;
        
    dbms_output.put_line( 'outer a : ' || a );
    --dbms_output.put_line( 'outer b : ' || b );  --> 에러 : b는 end에서 끝나게 됨 (자기 영역(내부블럭 안)에서만 쓰임 = 지역 변수)
    dbms_output.put_line( 'outer c : ' || c );
end;
/

--중첩 블록에 수식자 사용
begin <<outer>>
    declare
        c varchar2( 10 ) := '홍길동';
    begin
            declare
                c varchar2( 10 ) := '이순신';
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



/* <4단원> */
--PLSQL의 SELECT
declare
    fname employees.first_name%TYPE;
    sal employees.salary%TYPE;
    hiredate employees.hire_date%TYPE;
    jobtitle jobs.job_title%TYPE;
    deptname departments.department_name%TYPE;
    salsum number( 7 );
begin
    --select * into fname from employees where id = 120;  --> 에러 : 데이터를 여러개 가져와서
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

    --그룹함수
    --salsum := sum( employees.salary );    --에러 : 그룹함수를 직접 사용할 수 없다.
    select sum(salary) into salsum from employees;
    dbms_output.put_line( 'sum : ' || salsum );
end;
/

--데이터 갱신
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
commit;    --커밋 필수!
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

/* 예제 */
--employees 100-120 직원 정보 중 employee_id, last_name, phone_number, hire_date
--customer 테이블로 insert
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


--데이터 삭제
declare
    id customer.cid%TYPE := 'eee';
begin
    delete from customer where cid = id;
    commit;
end;
/
select * from customer;
/

/* 예제 */
--employees department_id = 60 인 사원들을 customer 에서 삭제
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


--PLSQL에서 DDL 사용
--DDL  -> create alter drop  지원 안 함
--DCL  -> grant revoke   지원 안 함
begin
    --drop table customer; -> 지원 안하므로 에러
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
as select * from customer where 1=0;   --구조만 복사됨

select * from copy_customer;

insert into copy_customer values( 'aaa', '111', '김유신', '9999-9999', sysdate );
insert into copy_customer values( 'bbb', '111', '김유신', '9999-9999', sysdate );
insert into copy_customer values( 'ccc', '111', '김유신', '9999-9999', sysdate );
insert into copy_customer values( 'ddd', '111', '김유신', '9999-9999', sysdate );

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

--암시적 커서
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
    -- found : 1, notfound : 0  =>  한 행 이상에 영향을 미쳤다.
    -- rowcount : 1             =>  영향을 받은 행 수는 1이다.
    
    update customer set ctel = '9999-9999' where cid = id;
    dbms_output.put_line( 'found : ' || sys.diutil.bool_to_int( SQL%FOUND ));
    dbms_output.put_line( 'notfound : ' || sys.diutil.bool_to_int( SQL%NOTFOUND ));
    dbms_output.put_line( 'rowcount : ' || SQL%ROWCOUNT ); 
    -- found : 1, notfound : 0  =>  한 행 이상에 영향을 미쳤다.
    -- rowcount : 1             =>  영향을 받은 행 수는 1이다.
    
    update customer set ctel = '9999-9999' where length( cname ) > 5 ;
    dbms_output.put_line( 'rowcount : ' || SQL%ROWCOUNT ); 
    -- rowcount : 9             =>  영향을 받은 행 수는 9이다.
end;
/
select * from customer;
/



/* <5단원> */
--제어문 if
declare
    age number( 3 ) := 25;
begin
    if age < 20 then
        dbms_output.put_line( '어린이' );
    else
        dbms_output.put_line( '어른' );
    end if;
end;
/
declare
    age number( 3 ) := 35;      --> 청년
    --age number( 3 );          -- NULL --> 노년
begin
    if age < 20 then dbms_output.put_line( '어린이' );
    elsif age < 40 then dbms_output.put_line( '청년' );
    elsif age < 60 then dbms_output.put_line( '장년' );
    else dbms_output.put_line( '노년' );
    end if;
end;
/

/* 예제 */
--90점 이상이면 'A학점'
--80점 이상이면 'B학점'
--70점 이상이면 'C학점'
--60점 이상이면 'D학점'
--50점 미만이면 'F학점'
--단 0~100 사이 일때만 학점 출력, 아니면 '잘못입력' 출력
-----나
declare
    score number( 3 ) := 60;
begin
    if score < 0 or score > 100 then dbms_output.put_line( '잘못입력' );
    elsif score >= 90 then dbms_output.put_line( 'A학점' );
    elsif score >= 80 then dbms_output.put_line( 'B학점' );
    elsif score >= 70 then dbms_output.put_line( 'C학점' );
    elsif score >= 60 then dbms_output.put_line( 'D학점' );
    else dbms_output.put_line( 'F학점' );
    end if;
end;
/
-----강사님
declare
    score number( 3 ) := 60;
begin
    if score >= 0 and score <= 100 then
        if score >= 90 then dbms_output.put_line( 'A학점' );
        elsif score >= 80 then dbms_output.put_line( 'B학점' );
        elsif score >= 70 then dbms_output.put_line( 'C학점' );
        elsif score >= 60 then dbms_output.put_line( 'D학점' );
        else dbms_output.put_line( 'F학점' );
        end if;
    else dbms_output.put_line( '잘못입력' );
    end if;
end;
/

--제어문 case
declare
    grade varchar2( 1 ) := 'D';
    score varchar2( 30 );
begin
    score := case grade
    when 'A' then '참 잘했어요!'
    when 'B' then '잘했어요!'
    when 'C' then '노력하세요!'
    else '값을 확인하세요!'
    end;
    dbms_output.put_line( score );
end;
/
declare
    grade varchar2( 1 ) := 'F';
    score varchar2( 30 );
begin
    score := case
    when grade in ('A', 'B') then '참 잘했어요!'
    when grade in ('C', 'D') then '잘했어요!'
    when grade = 'F' then '노력하세요!'
    else '값을 확인하세요!'
    end;  --> end case; 주면 에러 -> 그냥 대입만 하는 거기 때문에
    dbms_output.put_line( score );
end;
/
declare
    process number := 3;    --1: 확인, 2: 수정, 3: 삭제
    id customer.cid%TYPE := 'bbb';
    counts number( 3 );
begin
    case process
    when 1 then 
        select count(*) into counts from customer;  --customer의 전체 인원수가 몇명인지를 counts에 넣어라
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

--NULL 처리
begin
    --if 10 = 10 then dbms_output.put_line( '같다' );           --같다
    --if 10 = '10' then dbms_output.put_line( '같다' );         --같다 -> 암시적 형변환
    --if 10 = 10.0 then dbms_output.put_line( '같다' );         --같다
    
    --if true = 1 then dbms_output.put_line( '같다' );          --에러
    --if false = 0 then dbms_output.put_line( '같다' );         --에러
    --if false = '' then dbms_output.put_line( '같다' );        --에러
    
    --if NULL = 0 then dbms_output.put_line( '같다' );          --다르다
    --if NULL = NULL then dbms_output.put_line( '같다' );       --다르다
    --if NULL = '' then dbms_output.put_line( '같다' );         --다르다
    if to_char(NULL) = '' then dbms_output.put_line( '같다' );  --다르다
    else dbms_output.put_line( '다르다 ' );
    end if;
end;
/

--P.157 논리테이블
begin
    --<AND>                      --실행이 되면 true이고 안되면 false
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

--반복문 LOOP    do ( 실행문 ) while ( 조건 );
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
    name customer.cname%TYPE := '홍길동';
    tel customer.ctel%TYPE := '0000-0000';
    maxid customer.cid%TYPE;
begin
    select max( cid ) into maxid from customer;
    loop
        insert into customer values( maxid + to_char(i), '111', name, tel, sysdate );
        i := i + 1;   -- 121, 122, 123
        exit when i > 3;   -->loop가 끝나는 조건
    end loop;
end;
/
select * from customer;
/
    
--반복문 WHILE
declare
    i number( 3 ) := 1;
begin
    while i < 3 loop       -->loop가 실행되는 조건
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

--반복문 FOR  
--  : 반복 횟수를 정확히 알 때 사용 -> 대부분 가장 많이 사용한다.
begin
    --for i in 1 .. 3 loop       --1, 2, 3
    --for i in 1.5 .. 3.5 loop   --2, 3, 4 (소수를 반올림한다!!) -> sql에만 있는 경우
    for i in 3 .. 1 loop         --거꾸로는 실행안함
        dbms_output.put_line( 'i : ' || i );
    end loop;
end;
/
declare
    v_start number( 3 ) := 1;  --null이면 안됨!!
    v_end number( 3 ) := 3;
    cnt number( 3 ) := 3;
begin
    for i in v_start .. v_end loop
        --dbms_output.put_line( 'i : ' || i );
        dbms_output.put_line( 'cnt ' || cnt );  --감소
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

--중첩 반복문
begin
    <<outer_loop>>
    for i in 1 .. 3 loop     -- 1, 2, 3
        <<inner_loop>>
        for j in 4 .. 6 loop  -- 4, 5, 6   => 총 3 x 3 = 9번 출력
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
        continue when mod( i, 2 ) = 1; -- i를 2로 나누었을 때 나머지가 1인(TRUE) 경우 밑 코드로 넘어가지 않고 다시 위로!!
        dbms_output.put_line( 'i : ' || i );
    end loop;
end;
/




/* <6단원> */
--조합 데이터 유형 RECORD
declare
    /*1*/
    type t_customer is record                --레코드 설계
        ( id varchar2( 30 ), 
          passwd customer.cpasswd%TYPE, 
          name varchar( 30 ), 
          tel customer.ctel%TYPE,
          logtime customer.clogtime%TYPE );
    cus t_customer;                          --변수선언 = 메모리 할당
    name varchar2( 30 );
    tel varchar2( 50 );
    /*2*/
    cust customer%ROWTYPE;   --> 위 코드보다 더 쉬운 방법!!!
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


-- %ROWTYPE insert  ( %ROWTYPE : 한 줄을 다 가져와라 )
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

-- PLSQL 컬렉션 (배열 같은거)
-- 연관배열 ( Index by table )
declare
    /*설계*/
    type ename_table_type is table of
        employees.last_name%TYPE
        index by PLS_INTEGER;
    type esal_table_type is table of
        employees.salary%TYPE
        index by PLS_INTEGER;
    /*변수 생성 - 메모리 할당*/
    v_ename ename_table_type;
    v_esal esal_table_type;
begin
    v_ename( 1 ) := '홍길동';
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

-- 연관배열 테이블 옵션
declare
    type employees_table_type is table of
        employees%ROWTYPE
        index by PLS_INTEGER;
    v_emp employees_table_type;
    v_eno_min employees.employee_id%TYPE;
    v_eno_max employees.employee_id%TYPE;
begin
    --v_eno_min := min( employee_id );  -> 에러 : PLSQL 에서는 그룹함수 사용할 수 없다.
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




/* <7단원> */
-- 명시적 커서 : 반복문으로 이용할 수 있다!!

/*1*/
--fetch를 각각 변수로 받음
declare
    CURSOR c_emp_cursor is
        select last_name, salary from employees where department_id = 80; 
                --커서를 해서 into가 없어도 에러 안남
    v_name employees.last_name%TYPE;
    v_salary employees.salary%TYPE;
begin
    open c_emp_cursor;  -- 커서 오픈
    loop
        fetch c_emp_cursor into v_name, v_salary; -- 커서가 자동으로 한 행씩 밑으로 내려감 
                                                  -- fetch를 각각 변수로 받음
        exit when c_emp_cursor%NOTFOUND;  -- notfound : 행을 반환하지 않으면(TRUE)이면 끝남(exit)
        dbms_output.put_line( 'name : ' || v_name || ' ' || 'salary : ' || v_salary );
    end loop;
    close c_emp_cursor; -- 커서 닫기
end;
/

/*2*/
-- fetch를 레코드 단위로 받음  -> 이게 더 쉬움!!
declare
    CURSOR c_emp_cursor is
        select last_name, salary from employees where department_id = 80; 
    v_emp_record c_emp_cursor%ROWTYPE;
begin
    open c_emp_cursor;  -- 커서 오픈
    loop
        fetch c_emp_cursor into v_emp_record; -- fetch를 레코드 단위로 받음  -> 이게 더 쉬움!!
        exit when c_emp_cursor%NOTFOUND;  -- notfound : 행을 반환하지 않으면(TRUE)이면 끝남(exit)
        dbms_output.put_line( v_emp_record.last_name || ' ' || v_emp_record.salary );
    end loop;
    close c_emp_cursor;
end;
/

/*3*/
-- cursor 와 for 문  -> 이게 더더더 쉬움!!
declare
    CURSOR c_emp_cursor is
        select last_name, salary from employees where department_id = 80; 
begin
    -- cursor 와 for 문
    for i in c_emp_cursor loop     -- open
        dbms_output.put_line( c_emp_cursor%ROWCOUNT || ' ' || i.last_name 
            || ' ' || i.salary );
    end loop;                      -- close
end;
/

/*4*/
-- Subquery cursor 와 for 문
begin
    -- Subquery cursor 와 for 문
    for i in (select last_name, salary from employees where department_id = 80)
        loop                       -- open
        dbms_output.put_line( i.last_name || ' ' || i.salary );
    end loop;                      -- close
end;
/

-- 파라미터가 포함된 cursor
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




/* <8단원> */
--예외 처리 (미리 정의된 예외)
declare
    v_lname varchar2( 6 );
    result number;
begin
    /*p.256-7 참고*/
    select last_name into v_lname from employees where first_name = 'John';   --TOO_MANY_ROWS
    --select last_name into v_lname from employees where first_name = 'Diana'; --VALUE_ERROR
    --select last_name into v_lname from employees where first_name = 'Bruce';
    dbms_output.put_line( 'name : ' || v_lname );
    --select 10 / 0 into result from dual;                                     --ZERO_DIVIDE
exception 
    when TOO_MANY_ROWS then
        dbms_output.put_line( '행이 너무 많다' );
    when VALUE_ERROR then
        dbms_output.put_line( '갑의 크기를 확인하세요' );
    when others then
        dbms_output.put_line( '예외 발생' );
end;
/

--예외 처리 (미리 정의되지 않은 오류)
declare
    e_null_except EXCEPTION;
    PRAGMA EXCEPTION_INIT ( e_null_except, -01400 );  
            --선언된 예외와 표준 오라클 서버 오류 번호를 연관
                --> cannot insert NULL into 에러를 잡기 위해
begin
    insert into departments( department_id, department_name )
    values( 280, NULL );   -- cannot insert NULL into 에러 발생
exception
    when e_null_except then
        dbms_output.put_line( 'NULL을 넣으면 안됩니다.' );
        dbms_output.put_line( 'SQLCODE : ' || SQLCODE );
        dbms_output.put_line( 'SQLERRM : ' || SQLERRM );
end;
/

--예외 처리 (사용자(유저) 정의 예외)
declare
    e_notfound_except EXCEPTION;
begin
    update departments set department_name = 'Testing'
        where department_id = 500;
    if SQL%NOTFOUND then
        raise e_notfound_except;   -- unhandled user-defined exception 예외 발생
    end if;  
    commit;
exception
    when e_notfound_except then
        dbms_output.put_line( '처리되지 않았습니다.' );
end;
/




/* <9단원> */
-- 익명 블록
declare
    v_new customer%ROWTYPE;
begin
    v_new.cid := 200;
    v_new.cpasswd := '111';
    v_new.cname := '홍길동';
    v_new.ctel := '9999-9999';
    insert into customer 
        values( v_new.cid, v_new.cpasswd, v_new.cname, v_new.ctel, sysdate );
end;
/
select * from customer;
/

--프로시저
--데이터 한 행을 프로시저로 저장해놓고 나중에 가져다 쓸 수 있게 해줌
create or replace procedure insert_cust is
    v_new customer%ROWTYPE;
begin
    v_new.cid := 300;
    v_new.cpasswd := '111';
    v_new.cname := '홍길동';
    v_new.ctel := '9999-9999';
    insert into customer 
        values( v_new.cid, v_new.cpasswd, v_new.cname, v_new.ctel, sysdate );
end;
/
select * from user_objects where object_name = 'INSERT_CUST';   --지금까지 만든 모든 테이블, 프로시져, 시퀀스 등 다 보여줌
select * from user_source where name = 'INSERT_CUST';    -- 코드들 보여줌
/

begin
    insert_cust;
end;
/
select * from customer;
/

--함수
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
    if find then -- 100번 데이터 있으니까 '해당 회원이 존재합니다.'
        dbms_output.put_line( '해당 회원이 존재합니다.' );
    else         -- 400번 데이터 있으니까 '해당 회원이 존재하지 않습니다.'
        dbms_output.put_line( '해당 회원이 존재하지 않습니다.' );
    end if;
end;
/

--함수에 파라미터 전달
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
    if (find(100)) then -- 100번 데이터 있으니까 '해당 회원이 존재합니다.'
        dbms_output.put_line( '해당 회원이 존재합니다.' );
    else         -- 400번 데이터 있으니까 '해당 회원이 존재하지 않습니다.'
        dbms_output.put_line( '해당 회원이 존재하지 않습니다.' );
    end if;
    
    if (find(400)) then -- 100번 데이터 있으니까 '해당 회원이 존재합니다.'
        dbms_output.put_line( '해당 회원이 존재합니다.' );
    else         -- 400번 데이터 있으니까 '해당 회원이 존재하지 않습니다.'
        dbms_output.put_line( '해당 회원이 존재하지 않습니다.' );
    end if;
end;
/
begin
    if (find(120)) then -- 100번 데이터 있으니까 '해당 회원이 존재합니다.'
        dbms_output.put_line( '해당 회원이 존재합니다.' );
    else         -- 400번 데이터 있으니까 '해당 회원이 존재하지 않습니다.'
        dbms_output.put_line( '해당 회원이 존재하지 않습니다.' );
    end if;
end;
/

--패키지
  --선언부
create or replace package customers as
    procedure add_salary( add_value number);  -- 함수 만들때에는 number(4, 2)이렇게 정밀하게 못씀
    function insert_user( v_cust customer%ROWTYPE ) return number;
    function update_user( v_cust customer%ROWTYPE ) return number;
    function delete_user( v_cid customer.cid%TYPE ) return number;
    function select_user( v_cid customer.cid%TYPE ) return boolean;
end customer;
/
  --구현부
create or replace package body customers as
    procedure add_salary( add_value number ) is
    begin
    end;
    function insert_user( v_cust customer%ROWTYPE ) return number is
    begin
    end;
end;
/
  --실행
exec customers.add_salary( 0.1 );
exec customers.insert_user( 가입할 데이터 );



