/******************************* 
���ϸ� : Or13DCL.sql
DCL : Data Control Language(������ �����)
����ڱ���
���� : ���ο� ����ڰ����� �����ϰ� �ý��۱����� �ο��ϴ� ����� �н�
*******************************/

/*
[����� ���� ���� �� ���Ѽ���]
�ش� �κ��� DBA������ �ִ� �ְ������(sys, system)���� ������ �� 
�����ؾ��Ѵ�. 
���ο� ����� ������ ������ �� ���� �� �������� �׽�Ʈ�� CMD(���������Ʈ)
���� �����Ѵ�. 
*/

/*
1]����� ���� ���� �� ��ȣ����
����]
    create user ���̵� identified by �н�����;
*/
/* ����Ŭ 12C ���ĺ��ʹ� �Ϲ� ������ �����Ҷ� ���ξ�� C##�� �������
������ ���������� �����ȴ�. */
create user c##test_user1 identified by 1234;

/* ������ ������ C##�� ���̴°��� ���� �����ϹǷ� �Ʒ��� ���� session
�� �����ϴ� ����� ������ �� ������ �����ϸ� ���ξ� ���� ������ �� �ִ�.*/
alter session set "_ORACLE_SCRIPT"=true;
create user test_user1 identified by 1234;
/*
    ���� ���� ���� CMD���� sqlplus ������� ������ �õ��غ���
    create session ������ ���� ������ �� ���ٴ� �����޼����� ���. 
*/

/*
2] ������ ����� ������ ���� Ȥ�� ���� �ο�
����] grant �ý��۱���1, ����2 Ȥ�� ����(Role)  
        to ����ڰ��� 
            [with grant �ɼ�]
*/
grant create session to test_user1;
/*
    create session ���� �ο� �� ���ӿ��� ����������, ���̺��� 
    �������� �ʴ´�. �̤�
*/
--���̺� ���� ���� �ο� 
grant create table to test_user1;
/*
    create table ���� �ο� �� ���̺� ���� �� desc������� ��Ű����
    Ȯ���� �� �ִ�. 
*/

/*
3]��ȣ����
    alter user ����ڰ��� identified by �����Ҿ�ȣ;
*/
alter user test_user1 identified by 4321;
/*
    exit Ȥ�� quit ����� ���� ������ ������ �� �ٽ� �����ϸ� ������
    ��ȣ�δ� ���ӵ��� �ʴ´�. ������ ��ȣ�� �����ؾ��Ѵ�. 
*/

/*
4] Role(��, ����)�� ���� �������� ������ ���ÿ� �ο��ϱ�
    : ���� ����ڰ� �پ��� ������ ȿ�������� ������ �� �ֵ��� ���õ�
    ���ѳ��� ����������� ���Ѵ�. 
�ؿ츮�� �ǽ��� ���� ���Ӱ� ������ ������ connect, resource���� �ַ� 
�ο��Ѵ�.     
*/
--�ι�° ���� ������ Role�� ���� ������ �ο��Ѵ�. 
--���� �� ���̺������ ���������� �ȴ�. 
create user test_user2 identified by 1234;
--�Ʒ� 2���� Role�� ����Ŭ���� �⺻������ �����ȴ�. 
grant connect, resource to test_user2;

/*
4-1] Role�����ϱ� : ����ڰ� ���ϴ� ������ ���� ���ο� ���� �����Ѵ�.
*/
create role my_role;

/*
4-2] Role�� ���� �ο��ϱ�
*/
--���Ӱ� ������ Role�� 3���� ������ �ο��Ѵ�. 
grant create session, create table, create view to my_role;
create user test_user3 identified by 1234;
--�츮�� ������ Role�� ���� ������ �ο��Ѵ�. 
grant my_role to test_user3;

/*
4-3] Role �����ϱ�
*/
drop role my_role;
/*
    test_user3�� my_role�� ���� ������ �ο��޾����Ƿ� �ش� Role�� 
    �����ϸ� �ο��޾Ҵ� ��� ������ ȸ��(Revoke) �ȴ�. 
    ��, Role�����Ŀ��� ������ �� ����. 
*/

/*
5] ��������(ȸ��)
    ����] revoke ���� Ȥ�� ���� from ����ڰ���;
*/
revoke create session from test_user1;
/*
    ���ӱ��� ȸ�� �� ������ �õ��ϸ� ��й�ȣ�� Ʋ����쿡�� '������'
    ������ �߻��ϰ�, ��й�ȣ�� ��ġ�ϸ� create session������ ���ٰ�
    ���´�. 
*/

/*
6] ����� ���� ����
    ����] drop user ����ڰ��� [cascade];
��cascade�� ����ϸ� ����ڰ����� ���õ� ��� �����ͺ��̽� ��Ű���� 
�����ͻ������� ���� �����ǰ� ��� ��Ű�� ��ü�� ���������� �����ȴ�. 
*/
--���� ������ ����� ����� Ȯ���� �� �ִ� �����ͻ��� 
select username from dba_users;
select * from dba_users where username=upper('test_user2');
select * from dba_users where username like upper('%test%');

--������ �����ϸ鼭 ��� �������� ��Ű������ ���� �����Ѵ�. 
drop user test_user1 cascade;

/*
���̺� �����̽���?
    ��ũ ������ �Һ��ϴ� ���̺�� ��, �׸��� �� ���� �ٸ� �����ͺ��̽�
    ��ü���� ����Ǵ� ����̴�. ���� ��� ����Ŭ�� ���ʷ� ��ġ�ϸ�
    hr������ �����͸� �����ϴ� user��� ���̺� �����̽��� �ڵ�����
    �����ȴ�. 
*/

--���̺����̽��� ��ȸ�� �� �ִ� �����ͻ��� 
desc dba_tablespaces;
--���� ����Ŭ �ý��ۿ��� �� 5���� ���̺����̽��� �����Ǿ��ִ�. 
select tablespace_name, status, contents from dba_tablespaces;
--�츮�� ������ ����� ������ � ���̺����̽��� ����ϴ��� ��ȸ 
select username, default_tablespace from dba_users
where username in upper('test_user2');
--����ڿ��� ���̺����̽��� �Ҵ��Ѵ�. (2m�� 2MB�� ���Ѵ�)
alter user test_user2 quota 2m on users;
/*
     �� test_user2 ����ڰ� users��� ���̺����̽��� 2Mb�� 
     ������ ����� �� �ֵ��� ������ �ο��ϴ°��̴�. 
     CMD���� insert �غ��� ���������� �Էµȴ�. 
*/


