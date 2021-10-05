CASE 표현식 복잡한 조건 논리 처리

조건식을 여러개 적용할 때는 DECODE  보다 CASE를 사용하는 것이 편하다. DECODE 정확히 맞거나 틀린경우 조건을 처리하기 위운 반면 CASE는 조건의 범위가 다양한 경우 쉽게 처리.


SELECT employee_id, first_name, last_name, salary,
    CASE
        WHEN salary >= 9000 then '상위급여'
        WHEN salary BETWEEN 6000 AND 8999 THEN '중위급여'
        ELSE '하위급여'
    END AS 급여등급
FROM employees
WHERE job_id='IT_PROG';


#순위 매기기

RANK   공통 순위를 출력하되 공통 순위만큼 건너뛰어 다음 순위를 출력한다.    1,2,2,4,

DENSE-RANK 공통 순위를 출력하되 건너뛰지 않고 바로 다음 순위
 1, 2, 2, 3

ROW_NUMBER 공통 순위를 없이 출력한다. (1,2,3,4) 




SELECT employee_id,
        salary,
        RANK() OVER(ORDER BY salary DESC) Rank_급여
FROM employees




SELECT employee_id,
        salary,
        RANK() OVER(ORDER BY salary DESC) Rank_급여,
        DENSE_RANK() OVER(ORDER BY salary DESC) DENSE_급여,
        ROW_NUMBER() OVER(ORDER BY salary DESC) ROW_NUMBER_급여
FROM employees



그룹함수 - 집계함수, 기준열의 값에 대한 데이터 끼리 그룹으로 묶고 묶은 행에데해 연산을 수행한다. 


SELECT COUNT(salary)
FROM employees;

# COUNT 함수는 null 값도 행으로 계산한다. (대부분의 함수들은 null을 제외하고 연산)

SELECT SUM(salary), AVG(salary), SUM(salary)/COUNT(salary)
FROM employees;

# AVG 함수는 null값을 제외하고 연산, null값을 포함하여 평균을 계산하려면 NVL함수를 사용하여 AVG(NVL(salary,0))해야 계산이 된다. 

SELECT MAX(salary),MIN(salary), MAX(first_name), MIN(first_name)
FROM employees;


GROUP BY 특징
