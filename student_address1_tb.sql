SELECT * FROM db_study.student_address1_tb;

truncate table student_address1_tb;

# 도/시
insert into 
	student_address1_tb
	(student_address1_name)
values
	('부산광역시'),
    ('경상남도 양산시');
