########### 01_17 ###########
R.version
options( encoding = 'UTF-8')



### 변수 ###
## 연산자
# 논리연산자    &  |  &  ||
c(T, T, F, F) & c(T, F, T, F)     # T F T F
c(T, T, F, F) && c(T, F, T, F)     # T    # 0이 아니면 다 참 => 왼쪽 : 참 & 오른쪽 : 참 = 참!!
3 && 3


c(T, T, F, F) | c(T, F, T, F)     # T T T F
c(T, T, F, F) || c(T, F, T, F)     # T


c(T, T, F, F) + 1:4    # T=1, F=0

# 출력
print( 100 )
print( pi )
cat( 100 )
cat( "one", "two", "three" )

#NA NULL NAN
is.character( 'A' )  #문자인가 아닌가
is.character( 'ABC' )
is.character( 10 )
is.character( "A" )
is.character( '월' )
is.character( a ) #에러

is.logical( T )      #논리값인가 아닌가
is.logical( F )
is.logical( 0 )
is.logical( 3 )

is.numeric( 5 )      #숫자인가 아닌가
is.numeric( 5.0 )
is.numeric( '5' )

is.double( 5 )       #실수인가 아닌가
is.double( 5.5 )

is.integer( 5 )      #정수인가 아닌가
is.integer( 5.5 )

is.null( '' )        #널인가 아닌가
is.null( 0 )
is.null( NULL )

is.na( '' )
is.na( 0 )
is.na( NULL )
is.na( NA )

is.nan( NULL )
is.nan( 'A' )
is.nan( 6 )
is.nan( NaN )

#형변환
#자동 형변환   - 큰 자료형 > 작은 자료형

#강제 형변환
is.character( as.character( 5 ))
is.numeric( as.numeric( 'A' ))
is.numeric( as.numeric( '10' ))
is.double( 5.5 )
is.double( as.numeric( '5.5' ))
is.logical( as.logical( 1 ))


# 자료형 확인
a <- 10

class( a )
str( a )
class( 'A' )
class( T )
class( 5.5 )
class(c(1, 2, 3))
class(c('A', 'B', 'C'))




### 데이터셋 ###
## 배열 ##
# 벡터 #
? c
b <- c(10, 20, 'ABC')
class(b)
mean(b)

x <- c(43, 53, 67, 15, 87)
is.vector( x )          # 같은 자료형. 1차원 배열
is()
x
is.vector(a)
sqrt( x )

round( sqrt( x ))
trunc( sqrt( x ))

cumsum( x )       #누적합계
cumprod( x )      #누적곱
cummax( x )       #누적 최대값
cummin( x )       #누적 최소값

sort( x )
mean( x )
median( x )       #sort() 포함
range( x )
sd( x )
var( x )
IQR( x )          #4분위 편차

order( x )        #정렬한 인덱스 출력 (오름차순)
sort( x )
sort( x, decreasing = T )
length( x )
length( 'ABC' )
length( 'A', 'B', 'C' )

x
y <- sort( x )
y
y[1]            #인덱스 1부터
y[-1]

z <- y[c(1, 3, 5)]
z
y[3] <- 45
y
y + 1
y <- y+1
y
y[ y < 40]
y[ c(T,T,F,F,T)]
y[ y >= 50 & y <= 80]


#벡터의 이름 부여
names(y) <- LETTERS[1:5]  #A B C D E
y
y["C"]

#integer / numeric
m <- c(-5:5)
m
class(m)   #inteager

n <- 10
class(n)   #numeric

seq( from = 1, to = 10, by = 2 )
seq(1, 10, 2)


#난수 발생
sample( 1:20, 5)                      #항상 다른 값을 추출출
sort( sample ( 1:45, 6))
sort( sample (1:45, 10, replace = T))  #같은 값을 추출

o = c(10, 20, 30)
p = c(100, 200, 400)

append(o, p)
append(p, o)
replace( o, c(1, 2), c( 15, 20 ))   # c 인덱스 조합 c 값 조합


#같은 값 발생
rep( 10, 5 )
rep( 1:3, 5 )
rep( 1:3, each = 2 )


#벡터 연산
x <- c(1, 3, 5)
y <- c(2, 4, 6)
x + y
x - y
x * y
x / y
x > y
x < y
x == y
x != y
z = letters[1:26]
z
z = letters
z

10 -> a      #가독성이 좋지 않아 않씀
a


# 요약
x <- sort( sample ( 1:45, 10 ))
summary( x )
summary( letters )


# NA
a <- c(1, 3, 5, 7, 9)
b <- c(2, 4, 6, 8, NA)
a + b                #NA 연산은 NA

sum(b)
sum(b, na.rm = T)    #na.rm = na.remove = na 제외한 값
mean( b, na.rm = T )
d <- na.omit( b )    #na를 제거한 벡터를 새로 만들어줌
d                   


# which
temp <- sample ( -10 : 20, 20, replace = T )
temp
temp[ temp > 0 ]     # sort가 안 된 상태로 보여줌
which( temp > 0 )    # sort가 된 상태로 보여줌
which.max( temp )    # 위에서 처리된(0 보다 큰) 값 중에서 제일 큰 값 
which.min( temp )
max( temp )          # 전체 중에서 제일 큰 값
min( temp )


# 내장 벡터
LETTERS
letters

temp <- sample( -10:40, 12, replace = T )
month.name
month.date
month.korname <- c('1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월')
month.korname[ which.max( temp )]
month.name[ which.max( temp )]

ls()                 # 지금까지 만든 변수 보기
rm( list = ls() )    # 지금까지 만든 변수 삭제하기




## 배열 ##
# 메트릭스 #    행렬, 2차원 배열
# matrix( 값, nrow = 행 개수, ncol = 열 개수 )
# 2차원 배열은 1차원 배열의 배열이다.

#1차원 배열 여러 개로 2차원 배열을 만들 경우
v1 <- c(1, 2, 3)
v2 <- c(4, 5, 6)
v3 <- c(7, 8, 9)
m1 <- c(v1, v2, v3)
m1
m1 <- rbind(v1, v2, v3)   #행 기반
m1
m1 <- cbind(v1, v2, v3)   #열 기반
m1
(v4 <- m1[2, 2])      # 괄호 해주면 바로 V4 출력 해줌
(v4 <- m1[1:3])
(v4 <- m1[2:3, 2:3])
(v4 <- m1[1, 1:3])
(v4 <- m1[,3])
colnames(m1) <- c('A', 'B', 'C')
rownames(m1) <- c('가', '나', '다')
m1
m1['가', 'B']
m1['나':'다', 'B':'C']
m1[2:3, 2:3]
colnames(m1) <- NULL
colnames(m1) <- NULL


# matrix 함수를 이용하여 2차원 배열을 만들 경우
ma <- matrix( LETTERS )      #2차원 26x1
ma
ma <- matrix( LETTERS, nrow = 5 ) #나누어 떨어지지 않아 에러
ma
ma <- matrix( LETTERS[1:25], nrow = 5 )   #2차원 5x5
ma
ma <- matrix( LETTERS, ncol = 5 ) #나누어 떨어지지 않아 에러
ma
ma <- matrix( LETTERS[1:20], ncol = 5 )   #2차원 4x5
ma
ma <- matrix( LETTERS, nrow = 1, byrow = T )  #벡터 1x26
ma
ma <- matrix( c(1:25), nrow = 5)   # 5x5
ma
ma <- matrix( c(1:25), ncol = 5)   # 5x5  # by row = F :디폴트 값
ma
ma <- matrix( c(1:25), ncol = 5, byrow = T)   # 5x5
ma

mean(ma)         #전체 평균
sum(ma)          #전체 합계
mean(ma[1])      #1행 1열
sum(ma[1,])      #1행 전체열
sum(ma[,1])      #전체행 1열
sum(ma[1:2, ])
sum(ma[, 1:2])
rowSums( ma )    #행들의 합계
colSums( ma )    #열들의 합계

apply(ma, 1, mean)  #행별 평균  1 : 행, 2 : 열
apply(ma, 2, mean)  #열별 평균

apply(ma, 1, max)
apply(ma, 2, max)

apply(ma, 1, min)
apply(ma, 2, min)

apply(ma, 1, sum)
apply(ma, 2, sum)




## 배열 ##
m <- array( 1:20 )                 #1차원 배열
m <- array( 1:20, dim = c(4,5))    #2차원 배열
m <- array( 1:20, dim = c(2,5,2))  #3차원 배열 (면, 행, 열)
m

# 요인 Factor #
v <- c( 1, 3, 2, 4, 5, 2, 2, 1, 4, 5 )   #벡터
summary(v)
f <- factor(v)                           #펙터
f
summary(f)
day <- c('월','금','화','수','목','금','화','월','목' )
day <- factor(day)
summary(day)




### 데이터 프레임 ###
# 데이터 베이스의 테이블 형태를 관리하기 위한 자료형
iris
str( iris )
summary( iris )

(no <- c( 1:5 ))
(name <- c('Apple', 'Banana', 'Peach', 'Berry', 'Orange'))
(qty <- c( 5, 7, 2, 3, 9 ))                                 #신선도의 약자???
(price <- c(5000, 3000, 10000, 7000, 6000))

fruits <- data.frame(no, name, qty, price)

str(fruits)
fruits
is.data.frame( fruits )  #데이터 프레임인가?

colnames( fruits )
rownames( fruits )










########### 01_20 ###########

### 인덱싱
fruits['name']
fruits['qty']
fruits['price']
fruits[1,]
fruits[1:3,]
fruits
fruits[1, 2:3]
fruits[, 2:3]
fruits[, -1]
fruits[,]
fruits[, -1:-2]     #파이썬이랑 조금 다름!!!
fruits[-1:-3, -1]

( kor <- c(90, 70, 60, 40, 80))
( eng <- c(45, 68, 89, 55, 67))
( mat <- c(20, 30, 79, 83, 84))
( class <- c(1, 1, 2, 2, 1))
scores <- data.frame( kor, eng, mat, class )
scores

mean( scores[,1])

mean( scores['kor'])
mean( scores$kor )
scores['kor']       # 출력 차이 -> mean (O)
scores$kor          # 출력 차이 -> mean (X)

sum( scores$eng )

mean( scores[1, 1:3] )
mean( scores[2,])

scores$sum <- scores$kor + scores$eng + scores$mat
scores
scores$mean <- scores$sum / 3
scores
scores$rank <- 0
scores
scores$rank[5] <- 1
scores
ifelse( scores$sum[1] > scores$sum[2], '크다' : '작다')
    #ifelse( 조건, 참일 때 : 거짓일 때 ) -> 삼항연산과 유사??



### 제어문 ###
## if ~ else ##
num <- sample( 1:10, 1)    # 1부터 10 중에 한 숫자를 랜덤으로 뽑아라
if( num %% 2 == 0){
  cat( "짝수" )
} else {
  cat( "홀수" )
}

score <- sample( 1:100, 1 )
if( score >= 90 ) {
  cat( score, ':', 'A학점')
} else if( score >= 80 ) {
  cat( score, ':', 'B학점')
} else if( score >= 70 ) {
  cat( score, ':', 'C학점')
} else if( score >= 60 ) {
  cat( score, ':', 'D학점')
} else {
  cat( score, ':', 'F학점')
}



### 반복문 ###
# for( 초기값; 조건; 중감값 ) {}   ->  지원안함
# for( 변수 in 나열형 ) {}
for( name in month.name ) {
  print( name )
  cat( "\n" )    # 줄바꿈
}

for ( i in 1:10 )
  print( i )

sum <- 0
for ( i in 1:10 )
  sum = sum + i
cat( 'sum : ', sum )

for( i in 1:100 ) {
  if( i > 10 ) break;
  cat( 'i :', i, '\n' )
}

for( i in 1:100 ) {
  if( i > 10 ) break
  if( i %% 2 == 0 )
  cat( 'i :', i, '\n' )
}

i <- 1
while( i < 10 ){
  cat( i, '\t' )     # 탭
  i = i + 1
}

for( i in 1:100 ){
  if( i %% 2 == 0 ) next    # next = 파이썬의 continue와 같은 역할?
  if( i > 10 ) break
  cat( i, '\t' )
}


## switch 함수 ##
month <- sample( 1:12, 1 )
month <- paste( month, '월', sep = '')
switch( EXPR = month, 
        '12월'=, '1월'=, '2월' = '겨울',
        '3월'=, '4월'=, '5월' = '봄', 
        '6월'=, '7월'=, '8월' = '여름',
        '가을' )


## 함수 ##
#frunction( 매개변수 ){
#  실행문
#  return 값
#}

f1 <- function() print('함수')  # 구현
f1()                            # 호출

f2 <- function( num ) cat( 'num', num )
f2( 10 )     #매개변수

f3 <- function( a, b ) cat( 'sum', (a+b) )
f3( 3, 6 )

f4 <- function( a=10, b=20 ) cat( 'sum', (a+b) )  # 매개변수 초기값
f4()
f4( 20 )
f4( ,50 )
f4( 20, 50 )

f5 <- function( ... ){
  args <- c( ... )
  for( arg in args )
    cat( arg, '\t' )
}
f5( 10 )
f5( 10, 20 )
f5( 10, 20, 30 )
f5( 10, 20, 30, 40, 50 )
f5( 10, 'ABC', 30 )         #이런건 문제가 생길 수 있다
f5( 10, 'ABC', NULL, NA )   #이런건 문제가 생길 수 있다


## 리턴
f6 <- function() return( '리턴' )
f6()

f7 <- function( ... ) {
  datas <- c( ... )
  sum <- 0
  for( data in datas )
    sum = sum + data
  return( sum )
}
f7( 10, 20, 30 )


## 전역변수 지역변수
rm( list = ls() )
aa <- 10
bb <- 20
f8 <- function() {
  a <- 1
  b <- 2
  cat( '지역 a', a, '\n' )
  aa <<- 100
  cat( '전역 a', aa, '\n')
}
f8()
cat( 'aa', aa )   #전역변수
cat( 'a', a )     #지역변수


## 예외처리
testerror <- function( a ) {
  if ( a <= 0 )
    cat( '양수만 전달' )
  return( a )
}
testerror( -1 )
testerror( 0 )
testerror( 3 )

test <- function( x ){
  tryCatch( 
    {
      if( x == 0 ) {
        error()
      } else if ( x == 1 ) {
        warning()
      } else {
        cat( '정상 실행', '\n' )
      }
    }, error =  function( e ) {  
      cat( '오류', '\n' )
    }, warning = function( w ) { 
      cat( '경고', '\n' )
    }, finally = {                  # -> 에러가 있건 없건 무조건 실행되는 행
      cat( '프로그램 끝', '\n' )
      
    } )
}
test( 0 )
test( 1 )
test( 2 )


test <- function( x ){
  tryCatch( 
  {
    if( x == 0 ) {
      cat( '오류', '\n' )
    } else if ( x == 1 ) {
      cat( '경고', '\n' )
    } else {
      cat( '정상 실행', '\n' )
    }
  }, finally = {          # -> 에러가 있건 없건 무조건 실행되는 행
    cat( '프로그램 끝', '\n' )
  } )
}
test( 0 )
test( 1 )
test( 2 )


### 데이터 전처리 ###
## 파일 입출력  ##
# TXT #
nums <- scan( 'sample_num.txt' )  #숫자 형식
class( nums )                     #벡터 형식
nums
nums[1]

word_ansi <- scan( 'sample_ansi.txt', what = '' )  #숫자 형식
class( word_ansi )                                 #벡터 형식
word_ansi
word_ansi[1]

word_utf8 <- scan( 'sample_utf8.txt', what = '', encoding = 'utf-8' )
class( word_utf8 )
word_utf8                                          #한글이 깨진다
word_utf8[3]

line_ansi <- readLines( 'sample_ansi.txt' )
class( line_ansi )
line_ansi
line_ansi[1]

line_utf8 <- readLines( 'sample_utf8.txt', encoding = 'UTF-8' )
line_utf8

df1 <- read.csv( 'score.csv' )
class( df1 )
df1
mean( df1$math )
sum( df1[1, 3:5] )

df2 <- read.table( 'score.csv' )    #공백으로 구분 -> data.fram
clasS( df2 )
df2
df2[1, ]



## write.csv
## write.table

## 데이터 파악   data.frame에만 적용 가능
head( df1 )
tail( df1 )
View( df1 )
dim( df1 )   #몇 행 몇 열 인지
str( df1 )
summary( df1 )


## dplyr 패키지 ##
installed.packages()
install.packages( 'dplyr' )   #의존성
library( dplyr )

install.packages( 'ggplot2' )
ggplot2 :: mpg

df <- ggplot2 :: mpg
str( df )
head( df )
tail( df )
View( df )



## p.108
# manufacturer  제조사
#...
# trans         연속기
# drv           구동 방식
# cty           도심 연비
# hwy           고속도로 연비
# fl            연료 타입
# class         자동차 타입


## filter
df %>% filter( displ == 1.8 )
df %>% filter( class == 'compact' )
df %>% filter( hwy > 30 )
df %>% filter( manufacter == 'audi' & drv == 'f' )  # and
df %>% filter( displ %in% c(1.8, 2) )               # or
df %>% filter( displ == 1.8 | displ == 2 )          # or
filter( df, displ == 1.8 )


## select()
df %>% select( manufacturer, model )
df %>% select( -manufacturer, -model )
select( df, manufacturer, model)


## 체이닝
df %>% filter( displ == 1.8 ) %>% select( manufacturer, model, displ )


## 정렬 arrange()
df %>% arrange( year )
df %>% arrange( desc( year ) )
df %>% arrange( year, displ )


## 열 추가 mutate()
dim( df )             # 234 x 11
df %>% mutate( chy = (cty + hwy)/2) %>% select( manufacturer, chy )  #1회용 -> 따로 저장해야함
df <- df %>% mutate( chy = (cty + hwy)/2)
dim( df )             # 234 x 12
dim( ggplot2 :: mpg )

audi <- df %>% mutate( result = ifelse( chy >= 22, 'pass', 'fail')) %>% select( manufacturer, chy, result) %>% filter( manufacturer == 'audi') %>% arrange( desc( chy ))
audi


## summarise()
df %>% summarise( mcty = mean( cty ))
    ### 얘는 sql의 그룹함수처럼 한번만 계산함

mean( df$cty )   #결과는 윗줄과 똑같지만 체이닝을 할 수 없다는것이 단점이다

df %>% mutate( mcty = mean( cty )) %>% select( manufacturer, cty, mcty )
    ### sql과 달리 mean이 행개수만큼 계산함

df %>% summarise( mcty = mean(cty), mhwy = mean(hwy), scty = sum(cty), shwy = sum(hwy) ) %>% select( mcty, mhwy )


## group_by()
df %>% group_by( manufacturer ) %>% summarise( mcty = mean(cty), mhwy = mean(hwy)) %>% arrange( desc( mhwy ))

summarise( group_by( df, manufacturer ), mcty = mean(cty), mhwy = mean(hwy) )
summarise( group_by( df, manufacturer, model ), mcty = mean(cty), mhwy = mean(hwy) )

filter( arrange( summarise( group_by( df, manufacturer, model ), mcty = mean( cty ) ), desc(mcty) ), mcty > 21 )   #조건문

df %>% group_by( manufacturer, model ) %>% summarise( mcty = mean(cty)) %>% arrange( desc(mcty)) %>% filter( mcty > 21 ) #체이닝


## 가로 합치기  left_join()
df1 <- data.frame( id = c(1, 2, 3, 4, 5), mid = c( 60, 74, 67, 85, 77 ))
df2 <- data.frame( id = c(1, 2, 3, 4, 5), mid = c( 70, 88, 54, 98, 80 ))
df1
df2
total <- left_join( df1, df2, by = 'id')
total
names <- data.frame( id = c(1, 2, 3, 4, 5), name = c('kim', 'lee', 'park', 'jung', 'choi'))
total <- left_join( names, total, by ='id')
total


## 세로 합치기  bind_rows()
group <- data.frame( id = c(7,8,9), name = c( 'hong', 'cho', 'jang'), mid = c(56, 70, 89), final = c(54, 68, 99) )
total <- bind_rows( total, group )
total



### 결측값 ###
scores <- read.csv( 'score_NA.csv')
scores
str( scores )
is.na( scores )           # TRUE = NA , 비어있는 값 = NULL 값
table( is.na( scores ))           # NA 14개
table( is.na( scores$math ))      # NA 5개
table( is.na( scores$english ))   # NA 5개
table( is.na( scores$science ))   # NA 4개

# 변수 이름 바꾸기
scores <- rename( scores, mat = math )
scores <- rename( scores, eng = english )
scores <- rename( scores, sci = science )
str( scores )

scores %>% summarise( meng = mean( eng ) )  #NA


## 제거하는 방법
scores_del <- scores %>% filter( ! is.na(mat) & ! is.na(eng) & ! is.na(sci) )
dim( scores_del )

score_del <- na.omit( scores )         ## 위에랑 똑같은 코드
dim( score_del )


## 연산에서 배제시키는 방법
scores %>% summarise( meng = mean( eng ) )  #NA
scores %>% summarise( meng = mean( eng, na.rm = T ) )  #NA
scores %>% summarise( mmat = mean( mat, na.rm = T ) )  #NA
scores %>% summarise( msci = mean( sci, na.rm = T ) )  #NA
scores %>% summarise( ssci = sum( sci, na.rm = T ) )  #NA


## 평균값 또는 중간값으로 대체시키는 방법
scores_m <- ifelse( is.na(scores$mat), mean( scores$mat, na.rm = T ), scores$mat )
mean( scores_m )

scores_m <- ifelse( is.na(scores$mat), median( scores$mat, na.rm = T ), scores$mat )
mean( scores_m )









########### 01_21 ###########
### 이상치 outlier ###
## 범위를 벗어난 값. 편차가 너무 큰 값 -> NA로 대체
scores = read.csv( 'score_out.csv' )
str( scores )
dim( scores )     # 300 x 4
is.na( scores )
table( scores$mat )   # 빈도확인 (-9~-1 / 101~110 :이상치 )



is.na(df$mat)         # 무슨 값이 na냐?
table(is.na(df$mat))   # na가 5개
table(is.na(df$mat))   # na가 5개
table(is.na(df$mat))   # na가 5개

df <- scores

# df <- ifelse(조건,참,거짓)
df$mat <- ifelse( df$mat < 0 | df$mat > 100 , NA, df$mat )
df$eng <- ifelse( df$eng < 0 | df$eng > 100 , NA, df$eng )
df$sci <- ifelse( df$sci < 0 | df$sci > 100 , NA, df$sci )

is.na(scores$mat)         # 무슨 값이 na냐?
table(is.na(df$mat))   # na가 45개  -> 더 늘어남
table(is.na(df$eng))   # na가 24개  -> 더 늘어남
table(is.na(df$sci))   # na가 40개  -> 더 늘어남


## 이상치 -> 결측치 , 결측치 처리와 동일
df$mat <- ifelse( is.na( df$mat ), median( df$mat, na.rm = T ), df$mat )
df$eng <- ifelse( is.na( df$eng ), median( df$eng, na.rm = T ), df$eng )
df$sci <- ifelse( is.na( df$sci ), median( df$sci, na.rm = T ), df$sci )

table(is.na(df$mat))   # na가 0개
table(is.na(df$eng))   # na가 0개
table(is.na(df$sci))   # na가 0개




### 시각화 ###
installed.packages()
install.packages( 'ggplot2' )
library ( 'ggplot2' )

# qplot()   -> 전처리 단계에서 빠르게 확인
# ggplot()  -> 결과를 보여주기 위한 시각화

rm( list = ls())

x <- c('a', 'b', 'c', 'd', 'a', 'a', 'c')
qplot(x)


## 산점도
df <- ggplot2::mpg
str( df )
ggplot( data = df, aes( x=displ, y=hwy )) + geom_point()
ggplot( data = df, aes( x=displ, y=hwy )) + geom_point() + xlim(1,8) +ylim(0,100)

str( iris )
qplot( 1:10, 1:10 )
qplot( iris$Sepal.Length, iris$Sepal.Width )
qplot( iris$Petal.Length, iris$Petal.Width )  #더 상관도가 높아보인다.

plot( iris$Petal.Length, iris$Petal.Width )
plot( iris$Petal.Length, iris$Petal.Width, col = 'red', pch = 1, cex = 0.5 )
        # col : 색, pch : 모양, cex : 크기(비율)

plot( iris$Petal.Length, iris$Petal.Width, col = iris$Species, pch = '*', cex = 1, main = 'IRIS' , xlab = 'Length', ylab = 'Width')


## 막대 그래프 Bar Chart
library(dplyr)
mean_hwy <- df %>% group_by( manufacturer ) %>% summarise( mhwy = mean(hwy) )
ggplot( data = mean_hwy, aes( x = mhwy, y = manufacturer)) + geom_col()
ggplot( data = mean_hwy, aes( x = manufacturer, y = mhwy)) + geom_col()

ggplot( data = mean_hwy, aes( x = reorder(manufacturer, mhwy), y = mhwy)) + geom_col()    #reorder : 오름차순 정렬
ggplot( data = mean_hwy, aes( x = reorder(manufacturer, -mhwy), y = mhwy)) + geom_col()    #reorder : 내림차순 정렬

ggplot( data = mean_hwy, aes( x = reorder(manufacturer, -mhwy), y = mhwy)) + geom_col() + xlab('manufacturer')   # x축 이름 더 깔끔하게


## 빈도
str( df )
ggplot( data = df, aes( x = class )) + geom_bar()
ggplot( data = df, aes( x = drv )) + geom_bar()

barplot( table(df$drv))  #옛날 방식


## 선 그래프 Line Chart
# 시계열 데이터 (주가, 시세정보)
str( economics )
ggplot( data = economics , aes(x = date, y = unemploy)) + geom_line()


## 박스 플롯 Box Plot
ggplot(dat = df, aes( x = drv, y = hwy ))

boxplot( Petal.Length~Species, data = iris)
boxplot( Petal.Length~Species, data = iris, horizontal = T)
boxplot( Petal.Length~Species, data = iris, notch = T)    #중간값을 강조
boxplot( Petal.Length~Species, data = iris, col = c('red', 'blue', 'green'))


## 히스토그램 Histogram
#정확히 떨어지지 않는 값들을 연속적으로 출력
ggplot( data = df, aes( x = hwy)) + geom_histogram(binwidth = 0.5)  #binwidth :여백
ggplot( data = df, aes( x = hwy)) + geom_histogram(binwidth = 0.5, fill = '#B51D68')

hist( iris$Petal.Length )
hist( iris$Petal.Length, breaks = 4 ) #breaks : 막대 개수


## 파이 차트 Pie Chart
# 기본은 3시 방향이 시작점
ggplot( data = df, aes( x = drv)) + geom_bar() + coord_polar()
ggplot( data = df, aes( x = factor(1), fill = factor(drv))) + geom_bar() + coord_polar(theta = 'y')

a <- sample( 1, 10, 100 )
data <- data.frame( a )
str( data )
pie( data$a )
pie( data$a, col = rainbow(10) )


## ggplot 설정
# ggplot() + geom_ + theme_
# 데이터 + 시각화 + 테마
gg <- ggplot( iris, aes(x = iris$Petal.Length, y = iris$Petal.Width, color = iris$Species))
      # -> 데이터에 대한 설정일뿐!

gg + geom_point( size = 2, alpha = 0.5 )  #많이 겹친곳은 더 진해 보이게 해줌

install.packages( 'gridExtra' )  #도표를 여러개 그릴 수 있다
library( gridExtra )

gg1 <- gg + geom_point( size = 2, alpha = 0.5 )
gg2 <- gg + geom_point( size = 1 )

grid.arrange( gg1, gg2 )
grid.arrange( gg1, gg2, ncol = 2 )

#테마
install.packages( 'ggthemes' )
library( 'ggthemes' )

gg3 <- gg + geom_point( size = 2, alpha = 0.5 ) + theme_classic()
grid.arrange( gg1, gg3 )


## 이미지 출력

#png( 'myimg.png', 500, 200)  -> 안됨..
#pdf( 'myimg.pdf', 500, 200)  -> 안됨..

dev.list()
getwd()
ggsave( 'myimg.jpg' )
dev.off()




### p.208
### 데이터 분석 프로젝트 ###
install.packages( 'foreign' )   #SPSS, SAS, STATA 같은 외부 파일을 읽을 수 있게 해줌
install.packages( 'readxl' )    #엑셀 파일을 읽을 수 있게 해줌
library( 'foreign' )
library( 'readxl' )
library( 'dplyr' )
library( 'ggplot2')


## 데이터 가져오기
rm( list = ls())
welfare <- read.spss( file = 'Koweps_hpc10_2015_beta1.sav', to.data.frame = T )

dim( welfare )
str( welfare )
head( welfare)
View( welfare )
summary( welfare )


## 데이터 전처리
welfare <- rename( welfare, 
                   gender = h10_g3,         #성별
                   birth = h10_g4,          #생년
                   mariiage = h10_g10,      #결혼 여부
                   religion = h10_g11,      #종교
                   income = p1002_8aq1,     #수입
                   code_job = h10_eco9,     #직업 코드
                   code_region = h10_reg7 ) #지역코드


## 성별과 월급 ##

# 성별 전처리 -> 무응답(NA) 처리
table( welfare$gender )
table( is.na(welfare$gender) )  # na 0개

welfare$gender <- ifelse( welfare$gender == 1, 'male', 'female' )
table( welfare$gender )
qplot( welfare$gender )

# 월급 전처리
class( welfare$income )
summary( welfare$income )
table( welfare$income )
table( is.na(welfare$income) )  # na 12030개


# 0 무직 9999 무응답을 na로 바꿔줌
welfare$income <- ifelse( welfare$income %in% c( 0, 9999 ), NA, welfare$income )
table( is.na( welfare$income ) )  # na 12044개


# 분석
gender_income <- welfare %>% filter( ! is.na(income) ) %>% group_by( gender ) %>% summarise( mincome = mean( income ))

# 시각화
ggplot( data = gender_income, aes(x = gender, y = mincome)) + geom_col()



## 나이와 월급 ##
table( welfare$birth )
qplot( welfare$birth )
table( is.na( welfare$birth ))  # na 0개

welfare$age <- 2015 - welfare$birth + 1
qplot( welfare$age )
age_income <- welfare %>% filter( ! is.na(income) ) %>% group_by( age ) %>% summarise( mincome = mean( income ))
ggplot( data = age_income, aes( x=age, y =mincome)) + geom_col()
ggplot( data = age_income, aes( x=age, y =mincome)) + geom_line()



## 연령대와 월급 ##
# young : 청년, middle :중년, old :노년
welfare <- welfare %>% mutate( ageg = ifelse( age <= 30, 'young', ifelse( age <= 60, 'middle', 'old')))

table( welfare$ageg )
qplot( welfare$ageg )
table( is.na( welfare$ageg ))  # na 0개

ageg_income <- welfare %>% filter( ! is.na(income) ) %>% group_by( ageg ) %>% summarise( mincome = mean( income ))

ggplot( data = ageg_income, aes( x = ageg, y = mincome )) + geom_col() + scale_x_discrete( limits = c('young', 'middle', 'old'))   #scale_x_discrete : 순서 바꿔주는 함수


## 연령대와 성별과 월급 ##
ag_income <- welfare %>% filter( ! is.na(income) ) %>% group_by( ageg, gender ) %>% summarise( mincome = mean( income ))

ag_income

ggplot( data = ag_income, aes( x=ageg, y=mincome, fill = gender)) + geom_col( position = 'dodge' ) + scale_x_discrete( limits = c('young', 'middle', 'old'))
       # fill, position 함수를 통해 여남 분리 가능


## 직업과 월급 ##
class( welfare$code_job )
table( welfare$code_job )

jobs <- read_excel( 'Koweps_Codebook.xlsx', col_names = T, sheet = 2 )
dim( jobs )
head( jobs )

# join
welfare <- left_join( welfare, jobs, id = 'code_job' )   #(뭐, 뭐, 조인 조건)
dim( welfare )
# join 잘됐는지 확인
welfare %>% filter( ! is.na(code_job) ) %>% select(code_job, job, income) %>% head(10) 

job_income <- welfare %>% filter( ! is.na(job) & ! is.na(income) ) %>% group_by( job ) %>% summarise( mincome = mean(income) )

jitop10 <- job_income %>% arrange( desc(mincome) ) %>% head(10)
jitop10

ggplot( data = jitop10, aes( x= job, y = mincome)) + geom_col()
ggplot( data = jitop10, aes( x= job, y = mincome)) + geom_col() + coord_flip()
ggplot( data = jitop10, aes( x= reorder(job, mincome), y = mincome)) + geom_col() + coord_flip()




