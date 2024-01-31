/**********************************
���ϸ� : Or04TypeConvert.sql
����ȯ�Լ� / ��Ÿ�Լ�
���� : ������Ÿ���� �ٸ� Ÿ������ ��ȯ�ؾ� �Ҷ� ����ϴ� �Լ��� ��Ÿ�Լ�
***********************************/
/*
sysdate : ���糯¥�� �ð��� �� ������ ��ȯ���ش�. �ַ� �Խ����̳�
    ȸ�����Խ� ��¥�� �Է��ϱ� ���� ���ȴ�. ����Ŭ�� �⺻������
    XX/XX/XX�̹Ƿ� ��½� �ð����� ǥ�õ��� ������, ���Ĺ��ڸ� ����
    �ʴ������� ǥ���� �� �ִ�. 
*/
select sysdate from dual;

/*
��¥���� : ����Ŭ�� ��ҹ��ڸ� �������� �����Ƿ�, ���Ĺ��� ���� ���о���
    ����� �� �ִ�. ���� MM�� mm�� ������ ����� ����Ѵ�. 
*/
select to_char(sysdate, 'yyyy/mm/dd') from dual;
select to_char(sysdate, 'YY-MM-DD') from dual;

/*
�ó�����]���糯¥�� "������ 0000��00��00�� �Դϴ�"�� ���� �������� 
    ����ϴ� �������� �ۼ��Ͻÿ�.
*/
--��¥������ �ν����� ���� ������ �߻��ȴ�. 
select to_char(sysdate, '������ YYYY��MM��DD�� �Դϴ�') "�����ɱ�?"
    from dual;
/* -(������), /(������)�� ���� Ư����ȣ �̿ܿ��� �ν����� ���ϹǷ� 
�̸� ������ ������ ���ڿ��� "���� ������� �Ѵ�. ���Ĺ��ڸ� ���δ°�
�ƴϹǷ� �����ؾ� �Ѵ�. */    
select to_char(sysdate, '"������"YYYY"��"MM"��"DD"�� �Դϴ�"') "OK"
    from dual;

/*
�ó�����] ������̺����� ����� �Ի����� ������ ���� ����� �� �ִ� 
    �������� �ۼ��Ͻÿ�. 
    ���] 0000�� 00�� 00�� 0����
*/
--���Ĺ��� day�� "������", dy�� "��"�� ������ش�. 
select
    first_name, hire_date, 
    to_char(hire_date, 'yyyy"�� "mm"�� "dd"�� "dy"����"')
from employees;

select
    to_char(sysdate, 'day') "����(������)",
    to_char(sysdate, 'dy') "����(��)",
    to_char(sysdate, 'mon') "��(1��)",
    to_char(sysdate, 'mm') "��(01)",
    to_char(sysdate, 'month'),
    to_char(sysdate, 'ddd') "1���߸��°��"
from dual;

/*
��������
    0 : ������ �ڸ����� ��Ÿ���� �ڸ����� ���� �ʴ� ��� 0���� �ڸ���
        ä���. 
    9 : 0�� ����������, �ڸ����� �����ʴ� ��� �������� ä���. 
*/
select     
    to_char(123, '0000'),    
    to_char(123, '9999'), trim(to_char(123, '9999'))
from dual;

/*
���ڿ� ���ڸ����� �ĸ� ǥ���ϱ�
: �ڸ����� Ȯ���� ����ȴٸ� 0�� ����ϰ�, �ڸ����� �ٸ� �κп�����
9�� ����Ͽ� ������ �����Ѵ�. ��� ������ trim() �Լ��� ���� �����ϸ�ȴ�.
*/
select    
    12345, 
    to_char(12345, '000,000'),
    to_char(12345, '999,999'), ltrim(to_char(12345, '999,999')),
    ltrim(to_char(12345, 'L999,999'))
from dual;/* ���Ĺ��� L�� ���� ��ȭ ��ȣ�� ǥ���Ѵ�. */

/*
���ں�ȯ�Լ�
    to_number() : ������ �����͸� ���������� ��ȯ�Ѵ�. 
*/
--�ΰ��� ���ڰ� ���ڷ� ��ȯ�Ǿ� ������ ����� ����Ѵ�. 
select to_number('123')+to_number('456') from dual;
--���ڰ� �ƴ� ���ڰ� �����־� ������ �߻��Ѵ�.(��ġ�� �������ϴ�)
select to_number('123a')+to_number('456') from dual;

/*
�ó�����] '123,000'�̶�� ���ڿ��� �־������� ���ڷ� ��ȯ�� ��
    10�� ���� ����� ����ϴ� �������� �ۼ��Ͻÿ�. 
*/
--���������� ���ڿ� �޸��� ���ԵǾ� �����Ƿ� ���ڷ� ��ȯ�� �� ���� �����߻�.
select to_number('123,000')+10 from dual;
--replace()�� �޸��� ������ �� ���ڷ� ��ȯ�ϰ� ������ �����Ѵ�. 
select to_number(replace('123,000',',',''))+10 from dual;

/*
to_date() : ���ڿ� �����͸� ��¥�������� ��ȯ�ؼ� ������ش�. �⺻������
    ��/��/�� ������ �����ȴ�. 
*/
/* ��¥�� �Ʒ��� 3���� �������� ����ϴ� ��쿡�� ������ ���Ĺ��� ���̵�
�ν��ϰԵȴ�. */
select
    to_date('2024-01-29') "��¥����1",
    to_date('2024/01/29') "��¥����2",
    to_date('20240129') "��¥����3"
from dual;

--���������� ��¥�� ��쿡�� �Ʒ��� ���� ������ �Ұ����ϴ�. 
select '2024-01-29'+1 from dual;
/* ��¥�� ���� ������ �ϰ��ʹٸ� �Ʒ��� ���� ��¥ ��ȯ�Լ��� ����ؾ��Ѵ�. 
��¥�� 1�� ���ϴ°��� ������ ��¥�� ��ȯ�ްԵȴ�. */
select to_date('2024-01-29')+1 from dual;
/* ���� �Ʒ��� ���� ��¥������ ��-��-�� �� �ƴ� ��쿡�� ����Ŭ�� �ν�����
���� ������ �߻��ȴ�. �̶��� ��¥������ �̿��ؼ� ����Ŭ�� �ν��� �� �ֵ���
ó���ؾ��Ѵ�. */
select to_date('01-29-2024') "�����߻�" from dual;

/*
�ó�����] ������ �־��� ��¥������ ���ڿ��� ���� ��¥�� �ν��� �� �ֵ���
    �������� �����Ͻÿ�. 
    '14-10-2021' => 2021-10-14�� �ν�
    '04-19-2022' => 2022-04-19�� �ν�
*/
/*
to_date('14-10-2021') �̿� ���� ����ϸ� ��¥�� ������ �ν����� ���ϹǷ�
�Ʒ��� ���� ���Ĺ��ڸ� ���� ��,��,���� ��ġ�� �˷��ָ� �ȴ�. 
*/
select
    to_date('14-10-2021', 'dd-mm-yyyy'),
    to_date('04-19-2022', 'mm-dd-yyyy')
from dual;

/*
����] '2020-10-14 15:30:21'�� ���� ������ ���ڿ��� ��¥�� �ν��Ҽ� 
    �ֵ��� �������� �ۼ��Ͻÿ�. 
*/ 
select to_date('2020-10-14 15:30:21') from dual;
/*
���1 : ��¥������ ���ڿ��� substr()�� ��¥�κи� �߶� �� ����Ѵ�. 
    �־��� ���ڿ��� ��-��-�� �����̹Ƿ� �״�� ����� �� �ִ�. 
*/
select 
    substr('2020-10-14 15:30:21',1,10) "���ڿ��ڸ���",
    to_date(substr('2020-10-14 15:30:21',1,10)) "��¥���ĺ�ȯ"
from dual;
/*
���2 : ��¥�� �ð����� ������ Ȱ���Ѵ�. 
*/
select 
    to_date('2020-10-14 15:30:21','yyyy-mm-dd hh24:mi:ss') 
        "�ð�������������"
from dual;

/*
����] ���ڿ� '2021��01��01��'�� � �������� ��ȯ�Լ��� ���� ����غ��ÿ�.
    �� ���ڿ��� ���Ƿ� ������ �� �����ϴ�. 
*/
--��¥ ������ �˼������Ƿ� �����߻� 
select to_date('2021��01��01��') from dual;

select 
    to_date('2021��01��01��', 'yyyy"��"mm"��"dd"��"') "��¥��������",
    to_char(to_date('2021��01��01��', 'yyyy"��"mm"��"dd"��"'),
        'day') "�������"
from dual;--���� : �ݿ��� 

/*
nvl() : null���� �ٸ� �����ͷ� �����ϴ� �Լ�
    ����] nvl(�÷���, ��ü�Ұ�)
*/
/* �Ʒ��� ���� ���������� �ϸ� ��������� �ƴ� ��쿡�� �޿���
null�� ��µȴ�. ���� null���� ���� �÷��� ������ ó���� �ʿ��ϴ�.*/
select salary+commission_pct from employees;
--null���� 0���� ������ �� ������ �����ϸ� �������� ����� �����ִ�. 
select first_name, commission_pct,
    salary+nvl(commission_pct,0) from employees;

/*
decode() : Java�� switch���� ����ϰ� Ư������ �ش��ϴ� ��¹��� �ִ�
    ��쿡 ����Ѵ�.
    ����] decode(�÷���, 
                ��1, ���1, ��2, ���2 ...
                �⺻��)
    �س������� �ڵ尪�� ���ڿ��� ��ȯ�Ͽ� ����Ҷ� ���� ���ȴ�.
*/
/*
�ó�����] ������̺����� �� �μ���ȣ�� �ش��ϴ� �μ����� ����ϴ� ��������
    decode()�� �̿��ؼ� �ۼ��Ͻÿ�. 
*/
select
    first_name, last_name, department_id,
    decode(department_id, /* �÷��� ���� */
        90, 'Executive', /* ����start*/
        60, 'IT',
        100, 'Finance',
        30, 'Purchasing', 
        50, 'Shipping', 
        80, 'Sales',    /* ����end */
        '�μ���Ȯ�ξȵ�' /* ���ǿ� ������� �ʴ� ������ */) 
            as department_name
from employees;

/*
case() : Java�� if~else�� ����� ������ �ϴ� �Լ�
    ����] case
            when ����1 then ��1
            when ����2 then ��2
            ...
            else �⺻��
        end
*/
/*
�ó�����] ������̺����� �� �μ���ȣ�� �ش��ϴ� �μ����� ����ϴ� ��������
    case���� �̿��ؼ� �ۼ��Ͻÿ�. 
*/
select
    first_name, last_name, department_id,
    case
        when department_id=90 then 'Executive'
        when department_id=60 then 'IT'
        when department_id=100 then 'Finance'
        when department_id=30 then 'Purchasing'
        when department_id=50 then 'Shipping'
        when department_id=80 then 'Sales'
        else '�μ�����'
    end TeamName
from employees;


/*************************
����
*************************/
--scott�������� �����մϴ�.

/*
1. substr() �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� 
����Ͻÿ�.
*/
select * from emp;
select
    hiredate, substr(hiredate,1,5), 
    to_char(hiredate, 'yy-mm'), 
    to_char(hiredate, 'yyyy"��"mm"��"')
from emp ;

/*
2. substr()�Լ��� ����Ͽ� 4���� �Ի��� ����� ����Ͻÿ�. 
��, ������ ������� 4���� �Ի��� ������� ��µǸ� �ȴ�.
*/
select * from emp where substr(hiredate, 4, 2)='04';
--to_char()�� ����ϴ� ���(���Ĺ��ڸ� ���� ��¥�� ���� �����´�)
select * from emp where to_char(hiredate, 'mm')='04';
--like�� ����ϴ� ���
select * from emp where hiredate like '___04___';

/*
3. mod() �Լ��� ����Ͽ� �����ȣ�� ¦���� ����� ����Ͻÿ�.
*/
select * from emp where mod(empno, 2)=0;

/*
4. �Ի����� ������ 2�ڸ�(YY), ���� ����(MON)�� ǥ���ϰ� ������ 
���(DY)�� �����Ͽ� ����Ͻÿ�.
*/
select
    hiredate, 
    to_char(hiredate, 'yy') "�Ի�⵵", 
    to_char(hiredate, 'mon') "�Ի��",
    to_char(hiredate, 'day') "�Ի����1",
    to_char(hiredate, 'dy') "�Ի����2"
from emp;

/*
5. ���� ��ĥ�� �������� ����Ͻÿ�. ���� ��¥���� ���� 1��1���� �� 
����� ����ϰ� TO_DATE()�Լ��� ����Ͽ� ������ ���� ��ġ ��Ű�ÿ�. 
��, ��¥�� ���´� ��01-01-2023�� �������� ����Ѵ�. 
�� sysdate - ��01-01-2023�� �̿Ͱ��� ������ �����ؾ��Ѵ�. 
*/
--�����߻�
select to_date('01-01-2023') from dual;
--���Ĺ��ڸ� ���� ��¥�� �νĽ�Ŵ 
select to_date('01-01-2023','dd-mm-yyyy') from dual;
select
    sysdate - to_date('01-01-2023','dd-mm-yyyy') "�Ϲ����γ�¥����",
    trunc(sysdate - to_date('01-01-2023','dd-mm-yyyy')) "�Ҽ�������"
from dual; 


/*
6. ������� �޴��� ����� ����ϵ� �޴����� ���� ����� ���ؼ��� 
NULL�� ��� 0���� ����Ͻÿ�.
*/
select * from emp;
select ename, nvl(mgr, 0) from emp;

/*
7. decode �Լ��� ���޿� ���� �޿��� �λ��Ͽ� ����Ͻÿ�. 
��CLERK���� 200, ��SALESMAN���� 180, ��MANAGER���� 150, 
��PRESIDENT���� 100�� �λ��Ͽ� ����Ͻÿ�.
*/
select 
    ename, sal,
    decode(job, 
        'CLERK', sal+200, 
        'SALESMAN', sal+180,
        'MANAGER', sal+150,
        'PRESIDENT', sal+100, 
        sal) as "�λ�ȱ޿�"
from emp;








 