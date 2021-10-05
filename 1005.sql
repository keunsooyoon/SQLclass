LTRIM / RTRIM  좌측 여백제거 우측 여백제거

LTRIM 은 왼쪽부터 지정한 문자를 삭제
RTRIM 은 오른쪽부터 지정한 문자를 삭제

SELECT job_id,
        LTRIM(job_id, 'F'),
        RTRIM(job_id, 'T')
FROM employees;

SELECT TRIM('   - space -    ')
FROM dual;


# 숫자 관련 함수

Round 지정한 자리에서 반올림하는 함수. 

 1  2  3 . 4 5 6 7
-3 -2 -1   0 1 2 3


SELECT salary 월급,
        round(salary/30, 0) 일급  
FROM employees;



TRUNC 지정한 자리에서 버림하는 함수


SELECT salary 월급,
        trunc(salary/30, 0) 일급  
FROM employees;


# 날짜...
날짜에 더하거나 빼면 날짜가 계산 된다. 

SELECT TO_CHAR(SYSDATE,'YY/MM/DD'),
FROM dual;


SELECT TO_CHAR(SYSDATE,'YY/MM/DD') today,
            SYSDATE + 1 tomorrow,
            SYSDATE -1 yesterday
FROM dual;


# 월계산

SELECT hire_date,
        ADD_MONTHS(hire_date, 3) AS After3M,
        ADD_MONTHS(hire_date, -3) AS Before3M
FROM employees
WHERE employee_id BETWEEN 100 AND 110;


# 요일계산
일요일이 1, 월요일은 2 ......
SELECT hire_date,
    NEXT_DAY(hire_date, 1) 가까운일요일,
    NEXT_DAY(hire_date, 6) 가까운금요일
FROM employees; 


last_day 그 달의 마지막 날짜 


SELECT hire_date,
    LAST_DAY(hire_date) 결과
from employees


날짜 반올림

SELECT hire_date,
    round(hire_date, 'MONTH') 결과,
    round(hire_date, 'YEAR') 결과2
from employees;




# 변환 함수...
각 열에 대해 데이터 타입이 규정된다. 그러므로 SQL문을 실행하기 위해 데이터 값의 데이터 타입을 변환할 때도 있다. 이때 사용하는 함수가 변환함수이다.

데이터 타입의 변환은 자동으로(암묵적으로) 또는 사용자에 의해 수동으로(명시적으로) 변환된다. 


SELECT 1 + '2'
FROM dual;

'2'는 작은따옴표로 묶여 있기때문에 숫자 가 아닌 문자다. 
하지만 결과는 3이라고 바르게 연산이 되었다. 자동으로 숫자 2로 변환하여 계산했기 때문이다. 

다만 자동 데이터 타입 변환을 이요할 수 있더라도 sql문의 성능과 안정성을 위해 수동 데이터 타입 변환을 권장한다. 


 TO_CHAR , TO_NUMBER, TO_DATE

SELECT TO_CHAR(SYSDATE, 'YY'),
        TO_CHAR(SYSDATE, 'YYYY'),
        TO_CHAR(SYSDATE, 'MM'),
        TO_CHAR(SYSDATE, 'YYMMDD')
FROM dual;




SELECT TO_CHAR(SYSDATE, 'HH:MI:SS PM'),
        TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS PM')
FROM dual;


SELECT TO_NUMBER('123')
FROM dual;


SELECT TO_DATE('20211005', 'YYMMDD')
FROM dual;


NULL  처리 
특정 열의 행에 대한 데이터 값이 없으면 null이된다. 
null은 그 자체로 의미가 있다. '값이 없다.'

null 을 가지지 못하게 지정할 수 있다.  이것을 not null 라고 한다. 

null값을 계산하면 산술 연산의 결과도 null이 나온다. 


SELECT * 
FROM employees
ORDER BY commission_pct;





SELECT salary * commission_pct  
FROM employees
ORDER BY commission_pct;





SELECT salary * NVL(commission_pct, 1)  
FROM employees
ORDER BY commission_pct;

# NVL 함수는 null 값을 어떤 특정한 값으로 변환하는데 사용한다. 



DECODE if

DECODE (열, 조건, 치환(true), 기본값(false))

SELECT first_name,
       department_id,
       salary 원래급여,
       DECODE(department_id, 60, salary*1.1, salary),
       DECODE(department_id, 60, '10%인상','미인상')
FROM employees;
       


       