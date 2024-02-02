---------------------------------
--JDBC�ǽ��� ���� 
---------------------------------

--Java���� ù��° JDBC���α׷��� �غ���
--Ŭ������ : HRSelected.java
--HR�������� ����
select * from employees where department_id=50
order by employee_id desc;

--CRUD �۾��� ���� ���̺� ���� 
--Ŭ������ : MyConnection.java 
--study�������� ����
create table member (
	id varchar2(30),    
	pass varchar2(40) not null,  
	name varchar2(50) not null,  
	regidate date default sysdate, 
	primary key (id)
);
desc member;
select * from member;
select * from user_cons_columns;

--���ڵ� �Է��ϱ� 
insert into member values ('test9','9999','�׽���9',sysdate); 
insert into member (id, pass, name) values 
    ('test3','3333','�׽���3'); 
commit;

--���ڵ� �����ϱ� 
update member set pass='9876', name='������'
where id='dddd';
commit;

--���ڵ� �����ϱ� 
delete from member where id='test3';
commit;

--���ڵ� ��ȸ�ϱ�1 
select id, pass, name, regidate, 
    to_char(regidate, 'yyyy.mm.dd hh24:mi') d1 
from member;

--���ڵ� ��ȸ�ϱ�2(�˻�)
select * from member where name like '%����%';
select * from member where name like '%��%';


