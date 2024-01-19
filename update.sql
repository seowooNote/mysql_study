SELECT * FROM db_study.product_color_tb;

update db_study.product_color_tb
set	product_color_name_kor = '블랙'
where product_color_name = 'Black';
update db_study.product_color_tb
set	product_color_name_kor = '화이트'
where product_color_name = 'White';
update db_study.product_color_tb
set	product_color_name_kor = '그린'
where product_color_name = 'Green';

update db_study.product_color_tb
set 
	product_color_name_kor = case
		when product_color_name = 'Black' then '블랙'
		when product_color_name = 'White' then '화이트'
		when product_color_name = 'Green' then '그린'
end;
        

	