# set @book_name = '혼자 공부하는 SQL';
# set @author = '우재남';
# set @publisher = '한빛미디어';
set @new_author_id = 0;
set @new_publisher_id = 0;

insert into author_tb
values(0, @author);

select
	max(author_id) into @new_author_id
from
	author_tb;

insert into publisher_tb
values(0, @publisher);

select
	max(publisher_id) into @new_publisher_id
from
	publisher_tb;

insert into book_tb
values(0, @book_name, @new_author_id, @new_publisher_id);

select * from book_tb order by book_id desc;


call p_insert_book('테스트', '테스트', '테스트', 0);
select * from book_tb order by book_id desc;

delete
from book_tb
where book_id = 261;

delete
from author_tb
where author_id = 131;

delete
from publisher_tb
where publisher_id = 131;

select * from book_tb order by book_id desc;
select * from author_tb order by author_id desc;
select * from publisher_tb order by publisher_id desc;

set @book_name = '송사무장의 실전경매2';
set @author_name = '송희창2';
set @publisher_name = '지혜로2';
set @p_insert_book_status = 0;
call p_insert_book(@book_name, @author_name, @publisher_name, @p_insert_book_status);
select @new_book_id;