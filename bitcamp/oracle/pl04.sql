/*
    3대 요소
    procedure   insert, delete, update
    function    select
    공통점 : 호출해야 실행, return 값이 반드시 있어야 한다.
    
    trigger     촉발시키다. 스스로 발생
    insert      old없음,
    delete      new 없음,
    update      old new 모두 사용
    스스로 호출되지만 강제 호출은 안된다 
*/

SET SERVEROUTPUT ON

-- triger는 밖에서 호출하는 게 아니기 때문에 매개변수가 없다
CREATE OR REPLACE TRIGGER triger_test
    BEFORE
    -- departments 테이블에서 update가 실행되기 전에
        UPDATE ON departments
        FOR EACH ROW 
        -- 모든 ROW에 적용
BEGIN
    DBMS_OUTPUT.PUT_LINE('변경전 컬럼의 값 : ' || :OLD.department_name);
    DBMS_OUTPUT.PUT_LINE('변경후 컬럼의 값 : ' || :NEW.department_name);
END;
/

UPDATE departments
SET department_name = '개발부'
WHERE department_id = 60;

ROLLBACK;

-- 실행전에 triger를 실행 시킬 수도 있고 실행후에 triger를 실행 시킬 수도 있다
CREATE OR REPLACE TRIGGER sum_triger
    BEFORE
        INSERT OR UPDATE ON employees
        -- INSERT를 하거나 UPDATE를 할 때
        FOR EACH ROW
DECLARE
    avg_sal NUMBER;
BEGIN
    SELECT ROUND(AVG(salary), 3) INTO avg_sal
    FROM employees;
    
    DBMS_OUTPUT.PUT_LINE('급여평균 : ' || avg_sal);
END;
/

SELECT ROUND(AVG(salary), 3)
FROM employees;

INSERT INTO employees(employee_id, last_name,
    hire_date, department_id, job_id, salary, email)
VALUES(510, 'tiger', sysdate, 60, 'IT_PROG', 10000, 'tiger123r@naver.com');



-- 사번을 수정하지 못하게 할 경우
-- 삭제 할 수 없게 할 경우
-- 입력 할 수 없게 할 경우
CREATE OR REPLACE TRIGGER emp_trigger
    BEFORE
    UPDATE OR DELETE OR INSERT ON employees
    FOR EACH ROW
BEGIN
    IF UPDATING THEN
        IF :OLD.employee_id = '100' THEN
            RAISE_APPLICATION_ERROR(-20001, '이번호는 수정할 수 없습니다');
        END IF;
    END IF;

END;
/

UPDATE employees
SET salary = 2500
WHERE employee_id = 100;


-- 트리거는 반드시 지우자!!!
DROP TRIGGER EMP_TRIGGER;
DROP TRIGGER SUM_TRIGER;
DROP TRIGGER TRIGER_TEST;









