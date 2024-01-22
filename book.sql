# temp_book_tb
SELECT
	* 
FROM
	db_study.temp_book_tb;
    
SELECT
	book_name,
    count(book_name) over(partition by book_name),
    author,
    count(author) over(partition by author),
    publisher,
    count(publisher) over(partition by publisher)
FROM
	db_study.temp_book_tb;

SELECT
	book_symbol,
    count(book_symbol) over(partition by book_symbol)
FROM
	db_study.temp_book_tb;
    
# author_tb
insert into author_tb
SELECT
	0,
	author
FROM
	temp_book_tb
group by
	author
order by
	author;
    
select
	*
from
	author_tb;
    
# publisher_tb
insert into publisher_tb(publisher_name)
select
	publisher
from
	temp_book_tb
group by
	publisher
order by
	publisher;
    
insert into publisher_tb
select
	0,
	publisher
from
	temp_book_tb
group by
	publisher
order by
	publisher;
    
select
	*
from
	publisher_tb;
    
# book_tb
select
	*
from
	book_tb;

insert into book_tb
select
	0,
    tbt.book_name,
    at.author_id,
    pt.publisher_id
from
	temp_book_tb as tbt
	left outer join author_tb at on(at.author_name = tbt.author)
	left outer join publisher_tb pt on(pt.publisher_name = tbt.publisher)
group by
	tbt.book_name,
    at.author_id,
    pt.publisher_id
order by
	tbt.book_name,
    at.author_id,
    pt.publisher_id;
    
# book_register_tb
insert into book_register_tb
select
	0,
	tbt.book_code,
    nbt.book_id,
    tbt.loans_count
from
	temp_book_tb tbt
    left outer join (select
						bt.book_id,
						bt.book_name,
                        at.author_name,
                        pt.publisher_name
					from
						book_tb bt
						left outer join author_tb at on(at.author_id = bt.author_id)
						left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)) nbt
	on(nbt.book_name = tbt.book_name and nbt.author_name = tbt.author and nbt.publisher_name = tbt.publisher);

select * from book_register_tb;

# 전체 Join
select
	rank() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) rank_ranking,
	row_number() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) row_numebr_ranking,
    brt.book_id,
    bt.book_name,
    bt.author_id,
    at.author_name,
    bt.publisher_id,
    pt.publisher_name,
    sum(brt.loans_count) as total_loans_count
from
	book_register_tb brt
    left outer join book_tb bt on(bt.book_id = brt.book_id)
    left outer join author_tb at on(at.author_id = bt.author_id)
    left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)
group by
	brt.book_id,
    bt.author_id,
    bt.publisher_id;


select
	*
from
	(select
		rank() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) rank_ranking,
		row_number() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) row_numebr_ranking,
		brt.book_id,
		bt.book_name,
		bt.author_id,
		at.author_name,
		bt.publisher_id,
		pt.publisher_name,
		sum(brt.loans_count) as total_loans_count
	from
		book_register_tb brt
		left outer join book_tb bt on(bt.book_id = brt.book_id)
		left outer join author_tb at on(at.author_id = bt.author_id)
		left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)
	group by
		brt.book_id,
		bt.author_id,
		bt.publisher_id) nt
where
	nt.row_numebr_ranking = 1;
    
	
		
    
    
    
