select * from student_tb;
# *의 의미는 전체 컬럼

select 
	student_id, 
    name,
    age
from 
	student_tb 
where
	not name = '김준일'
    and name = '김준이';
    
select
	*
from
	student_tb
where
	name in ('김준일', '김준이');
    
select
	*
from
	student_tb
where
	student_id in (1, 2, 3);
    
truncate table student_tb;

/*
	10명의 학생 정보 추가
    김도균 27 부산 금정구
    김도훈 25 부산 부산진구
    김범수 33 부산 금정구
    김상현 26 부산 남구
    이재영 26 부산 서구
    이정찬 29 부산 부산진구
    이지언 26 부산 동래구
    이편원 30 경상남도 양산시
    전주환 30 부산 부산진구
    심재원 29 부산 남구
*/

insert into student_tb
values
	(0, '김도균', 27, '부산 금정구'),
	(0, '김도훈', 25, '부산 부산진구'),
	(0, '김범수', 33, '부산 금정구'),
	(0, '김상현', 26, '부산 남구'),
	(0, '이재영', 26, '부산 서구'),
	(0, '이정찬', 29, '부산 부산진구'),
	(0, '이지언', 26, '부산 동래구'),
	(0, '이평원', 30, '경상남도 양산시'),
	(0, '전주환', 30, '부산 부산진구'),
	(0, '심재원', 29, '부산 남구');
    
select
	*
from
	student_tb;
    
select
	*
from
	student_tb
where
	age between 20 and 29;

select
	*
from
	student_tb
where
	age >= 30
    and age <= 39;
    
select
	*
from
	student_tb
where
	name like '%도%'
	or name like '%원';
    
# 집계(그룹화)
select
	name,
	address,
	count(*) as address_count
from
	student_tb
group by
	name,
	address
order by
	address_count desc,
    address desc;
    
select
	*
from
	student_tb
union all
select
	100,
    '김준일',
    31,
    '부산 동래구';
    
    
    