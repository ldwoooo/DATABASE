-- JOIN 을 테스트 하기 위해 랜덤으로 NULL 값을 넣음
UPDATE hero SET 가입날짜 = NULL WHERE id = 10;
UPDATE hero SET 가입날짜 = NULL WHERE id = 20;
UPDATE hero SET 가입날짜 = NULL WHERE id = 25;
UPDATE hero SET job_id = NULL WHERE id = 30;
UPDATE hero SET job_id = NULL WHERE id = 40;
UPDATE hero SET job_id = NULL WHERE id = 50;
UPDATE hero SET company_id = NULL WHERE id = 64;
UPDATE hero SET company_id = NULL WHERE id = 75;
UPDATE hero SET company_id = NULL WHERE id = 88;
UPDATE hero SET country_id = NULL WHERE id = 16;
UPDATE hero SET country_id = NULL WHERE id = 46;
UPDATE hero SET country_id = NULL WHERE id = 57;

-------------------------------------------------------------------

-- JOIN
-- : 여러 테이블을 합쳐서 원하는 데이터를 조회하는 기법


-- CROSS JOIN
-- 두 테이블 간 가능한 모든 조합을 선택
-- 잘 안씀
SELECT * FROM hero, job;

-- INNER JOIN
-- 두 테이블에서 일치하는 값을 가진 행들만 선택
-- SELECT <필드> FROM 테이블1
-- INNER JOIN 테이블2
-- ON 조건
-- 전체 사람들의 이름, 직업을 조회하여라
SELECT hero.id, hero.이름, job.직업
FROM hero
INNER JOIN job
ON hero.job_id = job.id;


-- LEFT JOIN
-- 왼쪽 테이블의 모든 행과 오른쪽 테이블에서 일치하는 값을 가진 행을 선택
-- 일치하는 값이 없는 경우에는 NULL 값을 가짐
SELECT hero.id, hero.이름, job.직업
FROM hero
LEFT JOIN job
ON hero.job_id = job.id;

-- 똑같은 코드 다른 표현 방식
-- 필드명이 겹치지 않는 부분은 명시하지 않을 수 있다
-- 권장 X
SELECT hero.id, 이름, 직업
FROM hero
INNER JOIN job
ON hero.job_id = job.id;

-- 똑같은 코드 다른 표현 방식2
-- 각 테이블에 별칭을 주어서 표현
SELECT A.id, A.이름, B.직업
FROM hero AS A
INNER JOIN job AS B
ON A.job_id = B.id;

-- 영웅들의 id, 이름, 능력을 조회하여라.
SELECT A.id, A.이름, B.능력
FROM hero AS A
LEFT JOIN power AS B아메리카	영웅	숨가쁜 디딤돌 던지기, 강력한 힘, 고양이 보호하기	미국	마블	98	1968-06-09
3	토르	영웅	망치로 적들 때리기, 번개 날리기	아스가르드	마블	1500
ON A.job_id = B.id;

-- 영웅들의 직업, 소속회사를 조회하여라
SELECT job.직업, company.소속회사
FROM hero
LEFT JOIN job, company
ON hero.job_id = job_id AND hero.company_id = company.id;

