use `db_study`; # 데이터 베이스 선택

# INSERT INTO VALUES 데이터 삽입
insert into student_tb(student_id, name, age, address) values (0, '홍길동', 20, '서울');
insert into student_tb(address, name, age, student_id) values ('서울', '홍길동', 20, 3);
insert into student_tb(name) values ('홍길동');
insert into student_tb values (0, '홍길동', null, null);
insert into student_tb values (0, '홍길동', null, null), (0, '홍길동2', null, null);

insert into
	student_tb
    (student_id, name, age, address)
values 
	(0, '홍길동', null, null),
	(0, '홍길동2', null, null);