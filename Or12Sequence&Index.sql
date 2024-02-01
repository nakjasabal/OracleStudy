/****************** 
���ϸ� : Or12Sequence&Index.sql
������ & �ε���
���� : ���̺��� �⺻Ű �ʵ忡 �������� �Ϸù�ȣ�� �ο��ϴ� ��������
    �˻��ӵ��� ����ų�� �ִ� �ε��� 
******************/

--study �������� �н��մϴ�. 

/*
������(sequence)
-���̺��� �÷�(�ʵ�)�� �ߺ����� �ʴ� �������� �Ϸù�ȣ�� �ο��Ѵ�. 
-�������� ���̺� ������ ������ ������ �Ѵ�. �� �������� ���̺��
    ���������� ����ǰ� �����ȴ�. 

[������ ��������]    
create sequence ��������
    [Increment by N] -> ����ġ����
    [Start with N]   -> ���۰�����
    [Minvalue n | NoMinvalue] -> ������ �ּҰ� ���� : ����Ʈ1
    [Maxvalue n | NoMaxvalue] -> ������ �ִ밪 ���� : ����Ʈ1.00E+28
    [Cycle | NoCycle] -> �ִ�/�ּҰ��� ������ ��� ó������ �ٽ�
                    �������� ���θ� ����(cycle�� �����ϸ� �ִ밪����
                    ������ �ٽ� ���۰����� �� ���۵�)
    [Cache | NoCache] -> cache �޸𸮿� ����Ŭ������ ����������
                        �Ҵ��ϴ°� ���θ� ����    

������ ������ ���ǻ���
1.start with�� minvalue���� �������� ������ �� ����. �� start with
���� minvalue�� ���ų� Ŀ���Ѵ�. 
2.nocycle�� �����ϰ� �������� ��� ���ö� maxvalue�� ��������
�ʰ��ϸ� ������ �߻��Ѵ�. 
3.primary key���� cycle�ɼ��� ���� �����ϸ� �ȵȴ�. 
*/
create table tb_goods(
    idx number(10) primary key, 
    g_name varchar2(30)
);
insert into tb_goods values (1, '��Ϲ���Ĩ');
insert into tb_goods values (1, '���±�');

create sequence seq_serial_num
    increment by 1 /* ����ġ : 1*/
    start with 100 /* �ʱⰪ(���۰�) : 100 */
    minvalue 99    /* �ּҰ� : 99 */
    maxvalue 110   /* �ִ밪 : 110 */
    cycle   /* �ִ밪 ���޽� �ּҰ����� ��������� ���� : Yes*/
    nocache;/* ĳ�ø޸� ��� ���� : No */   
    
--�����ͻ������� ������ �������� Ȯ�� 
select * from user_sequences;
/* ������ ���� �� ���� ����ÿ��� currval�� ������ �� ���� ������ 
�߻��Ѵ�. nextval�� ���� �����ؼ� �������� ���� �� ����ؾ��Ѵ�. */
select seq_serial_num.currval from dual;
/* ���� �Է��� �������� ��ȯ�Ѵ�. �����Ҷ����� ������ ����ġ��ŭ
������ ���� ��ȯ�ȴ�. */
select seq_serial_num.nextval from dual;
/*
�������� nextval�� ����ϸ� ��� ���ο� ���� ��ȯ�ϹǷ� �Ʒ��� ����
insert���� ����� �� �ִ�. ���� ���� ������ ������ �����ϴ��� ��������
�Էµȴ�. 
*/
insert into tb_goods values (seq_serial_numnextval, '���±�');
/*
    ��, �������� cycle �ɼǿ� ���� �ִ밪�� �����ϸ� �ٽ� ó������ 
    �Ϸù�ȣ�� �����ǹǷ� ���Ἲ �������ǿ� ����ȴ�. �� PK�÷��� 
    ����� �������� cycle �ɼ��� ������� �ʾƾ��Ѵ�. 
*/
select * from tb_goods;

/*
������ ���� : ���̺�� �����ϰ� alter�� ����Ѵ�. 
    ��, start with�� ������ �� ����. 
*/
alter sequence seq_serial_num
    increment by 1
    minvalue 99
    nomaxvalue
    nocycle
    nocache;

--������ ����
drop sequence seq_serial_num;
select * from user_sequences;

/* �Ϲ����� ������ ������ �Ʒ��� ���� �ϸ�ȴ�. 
PK�� ������ �÷��� �Ϸù�ȣ�� �Է��ϴ� �뵵�� �ַ� ���ǹǷ� 
�ִ밪, ����Ŭ, ĳ�ô� ������� �ʴ°��� ����. */
create sequence seq_serial_num
    increment by 1
    start with 1
    minvalue 1  /* ����ġ, ���۰�, �ּҰ��� 1�� ���� */
    nomaxvalue
    nocycle
    nocache;    /* �ִ밪, ����Ŭ, ĳ�ô� ������� �ʴ´�. */
/* �ִ밪�� �������� �ʴ� ��� �������� ǥ���� �� �ִ� ���� ū������
�ڵ� �����ȴ�. */
   
   
/*
�ε���(Index)
-���� �˻��ӵ��� ����ų �� �ִ� ��ü
-�ε����� �����(create index)�� �ڵ���(primary key, unique)����
������ �� �ִ�. 
-�÷��� ���� �ε����� ������ ���̺� ��ü�� �˻��Ѵ�. 
-�� �ε����� ������ ������ ����Ű�� ���� �� �����̴�. 
-�ε����� �Ʒ��� ���� ��쿡 �����Ѵ�. 
    1.where�����̳� join���ǿ� ���� ����ϴ� �÷�
    2.�������� ���� �����ϴ� �÷�
    3.���� null���� �����ϴ� �÷�
*/
desc tb_goods;

--�ε��� �����ϱ�
create index tb_goods_name_idx on tb_goods (g_name);

/* ������ �������� Ȯ���ϱ�(����� ���� PK Ȥ�� Unique�� ������ �÷���
�ڵ����� �ε����� �����Ǿ� �ִ°��� �����ִ�. ) */
select * from user_ind_columns;

--�ε��� ���� 
drop index tb_goods_name_idx;

--�ε��� ������ �Ұ����ϴ�. �ʿ��ϴٸ� ������ �ٽ� �����ؾ��Ѵ�.
   
   
   
   
    
    
