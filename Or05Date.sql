/*****************
���ϸ� : Or05Date.sql
��¥�Լ�
���� : ��, ��, ��, ��, ��, ���� �������� ��¥������ �����ϰų� 
    ��¥�� ����Ҷ� Ȱ���ϴ� �Լ���
*******************/
/*
months_between() : ���糯¥�� ���س�¥ ������ �������� ��ȯ�Ѵ�. 
    ����] months_between(���糯¥, ���س�¥[���ų�¥]);
*/
--2020�� 1�� 1�Ϻ��� ���ݱ��� ���� ��������??
select
    months_between(sysdate, '2020-01-01'),
    ceil(months_between(sysdate, '2020-01-01')) "�ø�ó��",
    floor(months_between(sysdate, '2020-01-01')) "����ó��"
from dual;
--���� "2020��01��01��" ���ڿ��� �״�� �����ؼ� ����Ϸ���??
select
    months_between(sysdate, 
        to_date('2020��01��01��','yyyy"��"mm"��"dd"��"'))
from dual;

/*
����] employees ���̺� �Էµ� �������� �ټӰ������� ����Ͽ� ����Ͻÿ�
    ��, �ټӰ������� ������������ �����Ͻÿ�.
*/
select
    first_name, hire_date,
    months_between(sysdate, hire_date) "�ټӰ�����1",
    trunc(months_between(sysdate, hire_date)) "�ټӰ�����2"
from employees
/*order by "�ټӰ�����1" asc;*/
order by trunc(months_between(sysdate, hire_date)) asc;
/* select ����� �����ϱ� ���� order by�� ����� �� �÷����� ���Ͱ���
2���� ���·� ����� �� �ִ�. 
���1 : ������ ���Ե� �÷��� �״�� ����Ѵ�. 
���2 : ��Ī�� ����Ѵ�. */

/*
last_day() : �ش���� ������ ��¥�� ��ȯ�Ѵ�. 
*/
select last_day('22-04-03') from dual;--4���� 30�ϱ��� ���� 
select last_day('24-02-01') from dual;--24���� �����̹Ƿ� 29�� ���
select last_day('23-02-03') from dual;--������ 28�� ���

--�÷��� date Ÿ���� ��� ������ ��¥������ �����ϴ�. 
select
    sysdate "����", 
    sysdate-1 "����",
    sysdate+1 "����"
from dual;





