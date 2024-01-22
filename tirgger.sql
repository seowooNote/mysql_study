select * from user_mst_tb; # 해당 테이블의 trigger(event) 설정
select * from user_dtl_tb;

insert into user_mst_tb
values(0, 'abc', '1234');

delete
from
	user_mst_tb
where username = 'abc';