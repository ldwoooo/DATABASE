-- 조회(SELECT)
-- SELECT <원하는 필드> FROM <테이블> 구조로 작성

-- 전체 필드 조회
SELECT * FROM superhero;

-- 특정 필드 조회
SELECT 이름 FROM superhero;
SELECT 이름, 소속회사 FROM superhero;

-- 없는 필드면 no such column 이라는 에러 뜲
SELECT 없는 필드 FROM superhero;

-- 별칭 지어주기
SELECT 이름 AS 활동명 FROM superhero;
SELECT 이름 AS 활동명, 소속회사 AS 팀 FROM superhero;

-------------------------------------------------------------

-- 정렬(ORDER BY)
-- SELECT <원하는 필드> FROM <테이블>
-- ORDER BY <필드>

-- 나이가 적은 순으로 정렬하여 출력
-- ORDER BY <필드> (ASC)
SELECT * FROM superhero ORDER BY 나이;

-- 문자열도 정렬 가능
SELECT * FROM superhero ORDER BY 이름;

-- 나이가 많은 순으로 정렬
-- ORDER BY <필드> DESC
SELECT * FROM superhero ORDER BY 나이 DESC;


-- 여러 필드로 정렬하기
-- 소속회사 별로 나이가 많은 순으로 조회하기
SELECT 이름, 나이, 소속회사 FROM superhero ORDER BY 소속회사, 나이 DESC;

-------------------------------------------------------------

-- 중복 제거하기(DISTINCT)
-- SELECT DISTINCT <원하는 필드> FROM <테이블>

-- 소속회사 중복 제거
SELECT DISTINCT 소속회사 FROM superhero;
-- 여러 필드를 사용하면, 모두 동일한 데이터를 삭제
SELECT DISTINCT 직업, 소속회사 FROM superhero;

-- 나이, 소속회사가 겹치지 않는 사람들 중
-- 소속회사, 나이 순으로 정렬
SELECT DISTINCT 나이, 소속회사 FROM superhero ORDER BY 소속회사, 나이;

-------------------------------------------------------------

-- 조건문 (WHERE)

-- 직업이 악당인 사람들만 조회
SELECT * FROM superhero WHERE 직업 = '악당';

-- 비교연산자 사용하기
-- 나이가 50살이 넘는 사람들만 조회
SELECT * FROM superhero WHERE 나이 > 50;

-- 가입날짜가 2000년 1월 1일 이전인 사람 조회
-- 문자열로 적혀 있어서 문자열로도 가능
SELECT * FROM superhero WHERE 가입날짜 < '2000-01-01';
-- 그렇지 않다면 내장함수? DATE 사용!!
SELECT * FROM superhero WHERE 가입날짜 < DATE('2000-01-01');

-- 소속회사가 마블이고 직업이 영웅인 사람들만 조회
SELECT * FROM superhero WHERE 소속회사 = '마블' and 직업 = '영웅';

-- 국적이 미국이거나 러시아인 사람들만 조회
SELECT * FROM superhero WHERE 국적 = '미국' or 국적 = '러시아';

-------------------------------------------------------------

-- 특정 패턴에 만족하는 데이터를 조회
-- EX) 2글자인 데이터, ~~맨 으로 끝나는 데이터 ...

-- LIKE Operator
-- 1. %(percent) : 글자 수 제한 없이 패턴을 만족하면 조회
-- 이름이 ~~맨 으로 끝나는 사람들 조회
SELECT * FROM superhero WHERE 이름 LIKE '%맨';

-- 2. _(underscore) : 언더바 개수 만큼 글자 수 제한하여 패턴을 만족하면 조회
-- 이름이 두 글자인 사람들만 조회
SELECT * FROM superhero WHERE 이름 LIKE '__';
SELECT * FROM superhero WHERE 능력 LIKE '%술%';

-- 특정 데이터에 포함여부(IN)
-- 마블, DC 소속의 사람들을 조회
SELECT * FROM superhero WHERE 소속회사 = '마블' or 소속회사 = 'DC';
-- 같은 의미 IN을 사용한 것이 더 직관적이다
SELECT * FROM superhero WHERE 소속회사 IN ('마블', 'DC');
SELECT * FROM superhero WHERE 소속회사 NOT IN ('마블', 'DC');

-------------------------------------------------------------

-- 특정 조건 사이에 존재하는 데이터 조회 (BETWEEN ... AND ...)

-- 나이가 100~500살 사이의 사람들을 조회
-- [참고] BETWEEN은 이상, 이하를 의미함
SELECT * FROM superhero WHERE 나이 BETWEEN 100 AND 500;

-------------------------------------------------------------

-- 원하는 행 개수만큼만 조회(LIMIT)
-- 위에서부터 순서대로 뽑아줌
SELECT * FROM  superhero LIMIT 1;
SELECT * FROM  superhero LIMIT 3;

-- 나이가 가장 적은 사람 1명
SELECT * FROM superhero ORDER BY 나이 LIMIT 1;
-- 소속회사가 마블인 사람 중 나이가 가장 적은 1명
SELECT * FROM superhero WHERE 소속회사 ='마블' ORDER BY 나이 LIMIT 1;
-- 나이가 많은 10명
SELECT * FROM superhero ORDER BY 나이 DESC LIMIT 10;

-------------------------------------------------------------

-- N 번째 데이터부터 조회 - 기준점을 변경 (OFFSET)
-- 검색 기준점 : OFFSET + 1 부터
-- 나이가 10번째로 많은 사람
SELECT * FROM superhero ORDER BY 나이 DESC LIMIT 1 OFFSET 9 ;


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