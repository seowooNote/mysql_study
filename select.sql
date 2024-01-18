select * from student_tb;
# * 의 의미는 전체 컬럼

select
	student_id,
    name,
    age
from
	student_tb
where
	not name = '홍길동2'
    or name = '홍길동';
    
select
	*
from
	student_tb
where
	name in ('홍길동', '홍길동2');
    
select
	*
from
	student_tb
where
	student_id in (1, 2, 3);
    
truncate table student_tb;

insert into 
	student_tb
	(name, age, address)
values
	('김도균', 27, '부산 금정구'),
	('김도훈', 25, '부산 부산진구'),
	('김범수', 33, '부산 금정구'),
	('김상현', 26, '부산 남구'),
	('이재영', 26, '부산 서구'),
	('이정찬', 29, '부산 부산진구'),
	('이지언', 26, '부산 동래구'),
	('이평원', 30, '경상남도 양산시'),
	('전주환', 30, '부산 부산진구'),
	('심재원', 29, '부산 남구');

# 20대 1)
select
	*
from
	student_tb
where
	age between 20 and 29;
    
# 20대 2)
select
	*
from
	student_tb
where
	age >= 20
	and age <= 29;

# 30대 1)
select
	*
from
	student_tb
where
	age >= 30;

# 30대 2)
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
	name like '김%';
    
select
	*
from
	student_tb
where
	name like '김__';
    
select
	*
from
	student_tb
where
	name like '%원';

select
	*
from
	student_tb
where
	name like '이%원%';
    
select
	*
from
	student_tb
where
	name like '%도%'
    or name like '%원';
    
# 집계(그룹화)
select
	address,
	count(*) as address_count
from
	student_tb
group by
	address
having
	count(*) >= 2
order by
	address_count desc,
    address desc;