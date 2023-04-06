-------------------------내일 예습------------------------------------
-- 전체 데이터 수를 구하여라
SELECT COUNT(*) AS count FROM superhero;

-- 조건문과 함께 활용
-- 직업이 악당인 사람의 수
SELECT COUNT(*) AS count FROM superhero WHERE 직업 IN ('악당');

-- 전체 평균 나이. 문자열은 안나옴
SELECT AVG(나이) AS 평균나이 FROM superhero;

-- 마블 영웅들의 평균 나이를 구하여라
SELECT 소속회사, AVG(나이) AS 평균나이 FROM superhero WHERE 소속회사 = '마블';

-- 그룹 별 계산(GROUP BY)
-- 각 소속회사의 평균 나이를 구하여라
SELECT 소속회사, AVG(나이) AS 평균나이 FROM superhero GROUP BY 소속회사;

----------------------------------------------------------------------

-- 평균나이 : GROUP BY + AVG의 결과
-- 평균나이가 40살 이상인 소속회사를 구하여라

-- 뒤에서부터 해서된다
-- 소속회사 별로 그룹 -> 40살 이상인 데이터만 조회 -> 평균 계산
SELECT 소속회사, AVG(나이) AS 평균나이 
FROM superhero
WHERE 나이 >= 40
GROUP BY 소속회사;

-- 그룹화 후에 조건주기(HAVING)
-- 평균나이가 40살 이상인 소속회사를 구하여라
SELECT 소속회사, AVG(나이) AS 평균나이 
FROM superhero
GROUP BY 소속회사
HAVING AVG(나이) >= 40;

-- 그룹화 이전에 조건문을 걸어야 한다면, WHERE 사용
-- 그룹화 이후에 조건을 줘야한다면, HAVING 사용 !!!!!!!!!!!!!!!!!!!!!!!!









