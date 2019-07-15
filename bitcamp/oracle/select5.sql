/*
JOIN
카티션 곱 : 데이터끼리 맞춰놓는 것
F 외래키, 프라이머리 키
조인하기 위해서는 외래키라는 조건이 있어야한다
조인의 목적 : 우리 테이블에 없는 데이터를 꺼내온다
*/
/*
    Join
    두개 이상의 테이블을 연결해서 데이터를 검색하는 방법이다.
    보통 둘이상의 행(row)들의 공통된 값 primary Kay(기본키),
    Foreign Key(외래키) 값을 사용해서 Join한다
    
    Primary Key(기본키) - 테이블에 내장, 중복되지 않는 키 -> id, seq
    Foreign Key(외래키) - 다른 테이블에서 Primary Key, 고유키이 가능성이 높다.
    
    inner Join *****
    cross Join X
    outer Join
        left   ***
        right  ***
    self Join  *****
    
    SQL : Oracle, Ansi SQL
*/

-- inner Join
-- Ansi SQL
-- employees에만 있으면 e를 지워도 된다
SELECT e.employee_id, e.first_name, e.salary, 
    e.department_id, d.department_id, 
    d.department_name, d.location_id
FROM employees e INNER JOIN departments d
    ON e.department_id = d.department_id;
    -- employees 테이블에 있는 E.department_id 이걸 갖고
    -- d.department_id와 만났다 departments 간다

-- employees - 교집합이다
-- 부서번호가 없는 데이터
SELECT *
FROM employees
where department_id is null;


-- Oracle
SELECT e.employee_id, e.first_name, e.salary,
    e.department_id, d.department_id,
    d.department_name, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id;


-- Shanta의 title을 알 수 있다
SELECT e.first_name, e.job_id, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
    AND e.first_name = 'Shanta';



-- 사원번호 147 부서명, 업무명을 출력
-- employees, departments, jobs
SELECT e.employee_id,
    e.department_id, d.department_id, d.department_name,
    e.job_id, j.job_id, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
    AND e.job_id = j.job_id
    AND e.employee_id = 147;
-- employees 테이블에 있는 컬럼 employee_id의 데이터를 지정해서
-- employees 테이블에 없는 컬럼 department_name, job_title의
-- 데이터를 볼 수 있다




-- cross Join
-- ansi SQL
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e CROSS JOIN departments d;
-- Oracle
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e, departments d;




-- full outer Join 교집합 제외된 것
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e FULL OUTER JOIN departments d
    ON e.department_id = d.department_id
WHERE e.department_id IS NULL OR d.department_id IS NULL;
--       킴벌리                       110 이상되는 부서번호




-- outer Join
-- left
-- Ansi
-- employees 테이블을 전부 보여준다
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id;
-- Oracle
-- employees 테이블을 전부 보여준다
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);
-- + 기호가 없는 쪽이 주인공

-- 합집합 - departments
-- 즉, employees 테이블에서 departments와 교집합을 뺀 부분
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
    AND e.department_id IS NULL;





-- self Join : 동일한 테이블을 Join
-- 같은 테이블이지만 다른 테이블이라고 생각하자
-- employees 테이블에서 manager_id는 상사의 사원번호이다
SELECT a.employee_id, a.first_name,
    a.manager_id, b.employee_id,
    b.first_name
FROM employees a, employees b
WHERE a.manager_id = b.employee_id;
-- 너의 상사는 누구니? 그 상사의 사원번호
-- a(사원) : 매니저번호, b(매니저)



-- 계층형 구조
SELECT a.employee_id, a.first_name as "사원",
    a.manager_id as "사원의 상사", b.employee_id,
    b.first_name as "상사"
FROM employees a, employees b
WHERE a.manager_id = b.employee_id(+)
CONNECT by PRIOR a.manager_id = a.employee_id; -- 상향식
--CONNECT by a.manager_id = PRIOR a.employee_id; -- 하향식








