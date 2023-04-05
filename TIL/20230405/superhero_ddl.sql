-- SQL문 작성 시 주의사항
-- 세미콜론(;) 기준으로 하나의 SQL문을 판별

-- id, 이름, 직업, 능력, 국적, 소속회사, 나이, 가입날짜
-- 새로운 테이블을 생성하기
CREATE TABLE superheroes (
    -- 필드명 타입 제약조건 순으로 작성
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    이름 TEXT NOt NULL,
    직업 TEXT NOT NULL,
    능력 TEXT,
    국적 TEXT,
    소속회사 TEXT,
    나이 INTEGER
);

-- 테이블명 변경하기
ALTER TABLE 바꿔 RENAME TO superhero;

-- 새로운 컬럼 추가
ALTER TABLE superhero ADD COLUMN 가입날짜 DATE;

-- 임시 컬럼 추가 후 이름 변경
ALTER TABLE superhero ADD COLUMN 임시 TEXT;
ALTER TABLE superhero RENAME COLUMN 임시 TO 곧삭제;
