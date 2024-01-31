/*****
���ϸ� : Or01SelectBasic.sql
ó������ �����غ��� ���Ǿ�(SQL�� Ȥ�� Query��)
�����ڵ� ���̿����� '����'�̶�� ǥ���ϱ⵵ �Ѵ�. 
���� : select, where �� ���� �⺻���� DQL�� ����غ��� 
******/

/*
SQL Developer���� �ּ� ����ϱ�
    �������ּ� : �ڹٿ� �����ϴ�. 
    ���δ����ּ� : -- ���๮��. ������ 2���� �������� �ۼ��Ѵ�.
*/

--select�� : ���̺� ����� ���ڵ带 ��ȸ�ϴ� SQL������ DQL���� �ش�.
/*
����]
    select �÷�1, �÷�2, ... Ȥ�� *
    from ���̺��
    where ����1 and ����2 or ����3
    order by �������÷� asc(��������), desc(��������);
*/
--������̺� ����� ��� ���ڵ带 ������� ��� �÷��� ��ȸ
select * from employees;
--�������� ��ҹ��ڸ� �������� �ʴ´�. 
SELECT * FROM employees;
/*
�÷����� �����ؼ� ��ȸ�ϰ� ���� �÷��� ��ȸ�Ѵ�. 
=> �����ȣ, �̸�, �̸���, �μ���ȣ�� ��ȸ�Ͻÿ�. 
*/
select employee_id, first_name, last_name, email, department_id
from employees;

/* ���̺��� ������ �÷��� �ڷ��� �� ũ�⸦ ������ش�. �� ���̺��� 
��Ű��(����)�� �˼��ִ�. */
desc employees; --�ϳ��� �������� ������ ;�� �ݵ�� ����ؾ��Ѵ�. 

/*
�÷��� ������(number)�� ��� ��������� �����ϴ�. 
-> 100�� �λ�� ������ �޿��� ��ȸ�Ͻÿ�.
*/
select employee_id, first_name, salary, salary+100
from employees;
--number(����)Ÿ���� �÷������� ������ �� �ִ�. 
select employee_id, first_name, salary, salary+commission_pct
from employees;

/*
AS(�˸��ƽ�) : ���̺� Ȥ�� �÷��� ��Ī(����)�� �ο��Ҷ� ����Ѵ�. 
    ���� ���ϴ� �̸�(����, �ѱ�)���� ������ �� ����� �� �ִ�. 
    Ȱ���] �޿�+�������� => SalComm �� ���� ���·� ��Ī�� �ο��Ѵ�.
*/
--��Ī�� �ѱ۷� ����� �� �ִ�. 
select first_name, salary, salary+100 as "�޿�100����" 
from employees;
--������ �������� ����ϴ°��� �����Ѵ�. 
select first_name, salary, commission_pct, 
    salary+(salary*commission_pct) as SalComm 
from employees;
--as�� ������ �� �ִ�. 
select employee_id "������̵�", first_name "�̸�", last_name "��"
from employees where first_name='William';

/* ����Ŭ�� �⺻������ ��ҹ��ڸ� �������� �ʴ´�. ������� ��� ��ҹ���
���о��� ����� �� �ִ�. */
SELECT employee_id "������̵�", first_name "�̸�", last_name "��"
FROM employees WHERE first_name='William';

/*��, ���ڵ��� ��� ��ҹ��ڸ� �����Ѵ�. ���� �Ʒ� SQL���� �����ϸ� 
�ƹ��� ����� ������� �ʴ´�. */
select employee_id "������̵�", first_name "�̸�", last_name "��"
from employees where first_name='WILLIAM';

/* where���� �̿��ؼ� ���ǿ� �´� ���ڵ� �����ϱ�
-> last_name�� Smith�� ���ڵ带 ����Ͻÿ�. */
select * from employees where last_name='Smith';

/* where���� 2�� �̻��� ������ �ʿ��Ҷ� and Ȥ�� or�� ����� �� �ִ�. 
-> last_name�� Smith�̸鼭 �޿��� 8000�� ����� �����Ͻÿ�.*/
--�÷��� �������̸� �̱������̼����� ���Ѵ�. ���ڶ�� �����Ѵ�. 
select * from employees where last_name='Smith' and salary=8000;
--�÷��� �������� ��� ������ �⺻������, ������ ������ �߻������ʴ´�.
select * from employees where last_name='Smith' and salary='8000';
--�������� �ݵ�� �̱��� ����ؾ��Ѵ�. ���� "�����߻�"��.
select * from employees where last_name=Smith and salary=8000;

/*
�񱳿����ڸ� ���� ������ �ۼ�
: �̻�, ���Ͽ� ���� ���ǿ� >, <=�� ���� �񱳿����ڸ� ����� �� �ִ�. 
��¥�� ��� ����, ���Ŀ� ���� ���ǵ� �����ϴ�. 
*/
--�޿��� 5000�̸��� ����� ������ �����Ͻÿ�. 
select * from employees where salary<5000;
--�Ի����� 04��01��01�� ������ ��� ������ �����Ͻÿ�
select * from employees where hire_date>='04/01/01';

/*
in������
: or �����ڿ� ���� �ϳ��� �÷��� �������� ������ ������ �ɰ������
����Ѵ�. 
    => �޿��� 4200, 6400, 8000�� ����� ������ �����Ͻÿ�.
*/
--���1 : or�� ����Ѵ�. �̶� �÷����� �ݺ������� ����ؾ� �ϹǷ� �����ϴ�.
select * from employees where salary=4200 or salary=6400 
    or salary=8000;
--���2 : in�� ����ϸ� �÷����� �ѹ��� ����ص� �ǹǷ� ���ϴ�.    
select * from employees where salary in (4200, 6400, 8000);

/*
not������
: �ش������� �ƴ� ���ڵ带 �����Ѵ�. 
-> �μ���ȣ�� 50�� �ƴ� ��������� ��ȸ�ϴ� SQL���� �ۼ��Ͻÿ�.
*/
select * from employees where department_id<>50;
select * from employees where not (department_id=50);
select * from employees where department_id!=50;

/*
between and ������
    : �÷��� ������ ���� �˻��Ҷ� ����Ѵ�. 
    => �޿��� 4000~8000 ������ ����� �����Ͻÿ�. 
*/
--���1
select * from employees where salary>=4000 and salary<=8000; 
--���2
select * from employees where salary between 4000 and 8000;

/*
distinct
: �÷����� �ߺ��Ǵ� ���ڵ带 �����Ҷ� ����Ѵ�. 
Ư�� �������� select������ �ϳ��� �÷����� �ߺ��Ǵ� ���� �ִ°��
�ߺ����� ������ �� ����� ����� �� �ִ�. 
-> ������ ���̵� �ߺ��� ������ �� ����Ͻÿ�
*/
--��ü ����� ���� ���������� �����
select job_id from employees;
--�ߺ��� ���ŵǾ� 19���� ���������� ����ȴ�. 
select distinct job_id from employees;

/*
like������
    : Ư�� Ű���带 ���� ���ڿ��� �˻��Ҷ� ����Ѵ�. 
    ����] �÷��� like '%�˻���%'
    ���ϵ�ī�� ����
        % : ��� ���� Ȥ�� ���ڿ��� ��ü�Ѵ�. 
        Ex) D�� ���۵Ǵ� �ܾ� : D% => Da, Dae, Daewoo
            Z�� ������ �ܾ� : %Z => aZ, abxZ
            C�� ���ԵǴ� �ܾ� : %C% -> aCb, abCde, Vitamin-C
        _ : ����ٴ� �ϳ��� ���ڸ� ��ü�Ѵ�. 
        Ex) D�� �����ϴ� 3������ �ܾ� : D__ -> Dab , Ddd, Dxy
            A�� �߰��� ���� 3������ �ܾ� : _A_ -> aAa, xAy    
*/
--first_name�� 'D'�� �����ϴ� ������ �˻��Ͻÿ� 
select * from employees where first_name like 'D%';
--first_name�� ����°���ڰ� a�� ������ �����Ͻÿ�.
select * from employees where first_name like '__a%';
--last_name���� y�� ������ ������ �����Ͻÿ�.
select * from employees where first_name like '%y';
--��ȭ��ȣ�� 1344�� ���Ե� ���� ��ü�� �����Ͻÿ�.
select * from employees where phone_number like '%1344%';

/*
���ڵ� �����ϱ�(Sorting)
    �������� ���� : order by �÷��� asc (Ȥ�� ��������)
    �������� ���� : order by �÷��� desc
    
    2���̻��� �÷����� �����ؾ� �� ��� �޸��� �����ؼ� �����Ѵ�. 
    ��, �̶� ���� �Է��� �÷����� ���ĵ� ���¿��� �ι�° �÷��� ���ĵȴ�. 
*/
/*
������� ���̺��� �޿��� ���� �������� ���� ������ ����ǵ��� �����Ͽ�
��ȸ�Ͻÿ�.
������÷� : �̸�, �޿�, �̸���, ��ȭ��ȣ
*/
select first_name, salary, email, phone_number from employees
order by salary asc;
select first_name, salary, email, phone_number from employees
order by salary; -- asc(��������)�� ������ �� �ִ�. 

/*
�μ���ȣ�� ������������ ������ �� �ش� �μ����� ���� �޿��� �޴� ������ 
���� ��µǵ��� �ϴ� SQL���� �ۼ��Ͻÿ�.
����׸� : �����ȣ, �̸�, ��, �޿�, �μ���ȣ
*/
select employee_id, first_name, last_name, salary, department_id
from employees 
order by department_id desc, salary asc;

/*
is null Ȥ�� is not null
    : ���� null�̰ų� null�� �ƴ� ���ڵ� ��������. 
    �÷��� null���� ����ϴ� ��� ���� �Է����� ������ null����
    �Ǵµ� �̸� ������� select�Ҷ� ����Ѵ�. 
*/
--���ʽ����� ���� ����� ��ȸ�Ͻÿ�
select * from employees where commission_pct is null;
--��������̸鼭 �޿��� 8000�̻��� ����� ��ȸ�Ͻÿ�
select * from employees where salary>=8000 
    and commission_pct is not null;
    
------------------------------------------------
--��������
--(������ʹ� scott �������� �ǽ��մϴ�.)
/*
1. ���� �����ڸ� �̿��Ͽ� ��� ����� ���ؼ� $300�� �޿��λ��� 
������� �̸�, �޿�, �λ�� �޿��� ����Ͻÿ�.
*/
--���� ���ڵ� Ȯ���ϱ� 
select * from emp;
--300�� �λ�� �޿� �����ؼ� select�ϱ� 
select ename, sal, sal+300 from emp;

/* 2. ����� �̸�, �޿�, ������ ������ �����ͺ��� 
���������� ����Ͻÿ�. ������ ���޿� 12�� ������ $100�� 
���ؼ� ����Ͻÿ�.*/
--���������� �����ϴ� �÷����� ����
select ename, sal, sal*12+100 as "����"
from emp order by sal desc;
--AS�� ���� �ο��� ��Ī���� ����
select ename, sal, sal*12+100 as "����"
from emp order by "����" desc;
--������ �״�� �÷����� �����Ͽ� ���� 
select ename, sal, sal*12+100 
from emp order by sal*12+100 desc;

/* 3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� ������������ 
�����Ͽ� ����Ͻÿ� */
select ename, sal 
from emp where sal>2000 order by ename desc, sal desc;

/* 4. �����ȣ��  7782�� ����� �̸��� �μ���ȣ�� ����Ͻÿ�.*/
select ename, deptno
from emp where empno=7782;

/*
5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� 
�̸��� �޿��� ����Ͻÿ�. 
*/
select ename, sal 
from emp where not (sal>=2000 and sal<=3000);
select ename, sal 
from emp where not (sal between 2000 and 3000);

/* 6. �Ի����� 81��2��20�� ���� 81��5��1�� ������ ����� 
�̸�, ������, �Ի����� ����Ͻÿ�. */
select ename, job, hiredate 
from emp where hiredate>='81/02/20' and hiredate<='81/05/01';
select ename, job, hiredate 
from emp where hiredate between '81/02/20' and '81/05/01';


select * from emp where ename=ALLEN;--����
select * from emp where ename='ALLEN';--�������
select * from emp where ename="ALLEN";--����

select sal from emp where ename='ALLEN';--����
select sal as salary from emp where ename='ALLEN';--����
select sal as �޿� from emp where ename='ALLEN';--����
select sal "�޿�" from emp where ename='ALLEN';--����
select sal as '�޿�' from emp where ename='ALLEN';--����

