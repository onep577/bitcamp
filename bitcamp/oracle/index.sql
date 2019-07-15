/*
    index : 검색하기 위한 색인
    원하는 정보의 위치를 빠르고 정확하게 알아낼 수 있는 방법
    -- 자동생성 : Primary key, Unique
    -- 수동생성 : Query
    
    잘라서 검색한다
    a 검색 다 하고 b 검색 다 하고 c 검색 하는 게 아니라 a 아니야? 그럼 b
    b도 아니야? 그럼 c 맞아? c를 검색
    
    생성해야 좋은 경우
    1. where절이나 join 조건안에 자주 사용되는 컬럼  department_id
    2. null 값이 많이 포함되어 있는 컬럼            manager_id
    3. where절이나 join 조건안에 두개 이상의 컬럼
    
    생성해야 안 좋은 경우
    1. 테이블의 크기(row)가 작을 때(3000개 이하)
    -- 데이터가 많을 때 생성하면 속도가 느려진다
    2. 테이블이 자주 갱신될 때
    
*/

CREATE TABLE EMP_COPY
AS
SELECT * FROM employees;

-- 자동생성
ALTER TABLE EMP_COPY
ADD
CONSTRAINT PK_EMPCOPY_01 PRIMARY KEY(EMPLOYEE_ID);

-- INDEX 확인 모든 INDEX가 다 나온다
-- INDEX 명칭과 PRIMARY KEY 명칭은 같은 이름이 나온다
SELECT *
FROM ALL_INDEXES
WHERE index_name IN ('PK_EMPCOPY_01');

-- 강제 생성
CREATE INDEX EMP_INDEX01
ON EMP_COPY(MANAGER_ID);

DROP INDEX EMP_INDEX01;




