insert into 
	product_color_tb
	(product_color_name)
values
	('Black'),
	('White'),
	('Navy');
    
insert into 
	product_size_tb
	(product_size_name)
values
	('SS'),
	('S'),
	('M'),
	('L'),
	('XL'),
	('XXL');
    
insert into 
	product_tb
	(product_name, product_price)
values
	('모헤어 브이넥 앙고라 니트', 37400),
	('콘테 코듀로이 와이드 밴딩 팬츠', 38000),
	('버티칼 투웨이 골지 양털 집업', 49000),
	('반집업 꽈배기 카라니트', 48000),
	('후드 MA-1 패딩 점퍼', 62000);
    
insert into 
	product_register_tb
	(product_id, product_size_id, product_color_id)
values
	(1, 2, 1),
    (1, 3, 1),
    (1, 4, 1),
    (1, 5, 1),
    (2, 2, 2),
    (2, 3, 2),
    (2, 4, 2),
    (2, 5, 2),
    (2, 6, 2),
    (3, 3, 3),
    (3, 4, 3),
    (3, 5, 3),
    (3, 6, 3),
    (4, 1, 2),
    (4, 2, 2),
    (4, 3, 2),
    (4, 4, 2),
    (4, 5, 2),
    (5, 2, 1),
    (5, 3, 1),
    (5, 4, 1),
    (5, 5, 1);
    
select
	*
from 
	product_register_tb
    left outer join product_color_tb on (product_color_tb.product_color_id = product_register_tb.product_color_id)
    left outer join product_size_tb on (product_size_tb.product_size_id = product_register_tb.product_size_id);

select
	*
from 
	product_register_tb as prt
    left outer join product_color_tb as pct on (pct.product_color_id = prt.product_color_id)
    left outer join product_size_tb as pst on (pst.product_size_id = prt.product_size_id);

create view product_register_view as
select
	prt.product_register_id,
    prt.product_id,
    pt.product_name,
    pt.product_price,
    prt.product_size_id,
    pst.product_size_name,
    prt.product_color_id,
    pct.product_color_name
from 
	product_register_tb prt
    left outer join product_tb pt on (pt.product_id = prt.product_id)
    left outer join product_size_tb pst on (pst.product_size_id = prt.product_size_id)
    left outer join product_color_tb pct on (pct.product_color_id = prt.product_color_id);
    
select
    prt.product_size_id,
    pst.product_size_name,
    count(prt.product_size_id) as count
from 
	product_register_tb prt
    left outer join product_tb pt on (pt.product_id = prt.product_id)
    left outer join product_size_tb pst on (pst.product_size_id = prt.product_size_id)
    left outer join product_color_tb pct on (pct.product_color_id = prt.product_color_id)
group by
	prt.product_size_id,
	pst.product_size_name
order by
	prt.product_size_id;
    
select
    prt.product_color_id,
    pct.product_color_name,
    count(prt.product_color_id) as count
from 
	product_register_tb prt
    left outer join product_tb pt on (pt.product_id = prt.product_id)
    left outer join product_size_tb pst on (pst.product_size_id = prt.product_size_id)
    left outer join product_color_tb pct on (pct.product_color_id = prt.product_color_id)
group by
	prt.product_color_id,
	pct.product_color_name;

select
	product_size_id,
    product_size_name,
    count(product_size_id) as product_size_count
from
	product_register_view
where
	product_size_id >= 4 or
	product_size_name like '%L'
group by
	product_size_id,
    product_size_name;
    
    
    
    
    
    
    
    
    
    