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
    left outer join product_tb pt on(pt.product_id = prt.product_id)
    left outer join product_size_tb pst on(pst.product_size_id = prt.product_size_id)
    left outer join product_color_tb pct on(pct.product_color_id = prt.product_color_id);
    
select
    prt.product_size_id,
    pst.product_size_name,
    count(prt.product_size_id) as count
from
	product_register_tb prt
    left outer join product_tb pt on(pt.product_id = prt.product_id)
    left outer join product_size_tb pst on(pst.product_size_id = prt.product_size_id)
    left outer join product_color_tb pct on(pct.product_color_id = prt.product_color_id)
group by
	prt.product_size_id,
    pst.product_size_name
order by
	prt.product_size_id;
    
    
select
	product_size_id,
    product_size_name,
    count(product_size_id) as product_size_count
from
	product_register_view
group by
	product_size_id,
    product_size_name;









    
    