delete
from
	product_register_tb
where
	product_color_id in (select
							product_color_id
						from
							product_color_tb
						where
							product_color_name = 'Black');

select
	*
from
	product_register_view;
    
# 트랜잭션, 트리거, 저장프로시저, 일반함수 