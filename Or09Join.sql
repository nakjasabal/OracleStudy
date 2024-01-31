/*********************
���ϸ� : Or09Join.sql
���̺�����
���� : �ΰ� �̻��� ���̺��� ���ÿ� �����Ͽ� �����͸� �����;� �Ҷ� 
����ϴ� SQL��
**********************/

--HR�������� �����մϴ�. 

/*
1] inner join(��������)
-���� ���� ����ϴ� ���ι����� ���̺��� ���������� ��� �����ϴ� 
���ڵ带 �˻��Ҷ� ����Ѵ�. 
-�Ϲ������� �⺻Ű(primary key)�� �ܷ�Ű(foreign key)�� ����Ͽ� 
join�ϴ� ��찡 ��κ��̴�. 
-�� ���� ���̺� ������ �̸��� �÷��� �����ϸ� "���̺��.�÷���"
���·� ����ؾ� �Ѵ�. 
-���̺��� ��Ī�� ����ϸ� "��Ī.�÷���" ���·� ����� �� �ִ�. 

����1(ǥ�ع��)
    select �÷�1, �÷�2
    from ���̺�1 inner join ���̺�2
        on ���̺�1.�⺻Ű�÷�=���̺�2.�ܷ�Ű�÷�
    where ����1 and ����2 ...;
*/

/*
�ó�����] ������̺�� �μ����̺��� �����Ͽ� �� ������ ��μ�����
    �ٹ��ϴ��� ����Ͻÿ�. ��, ǥ�ع������ �ۼ��Ͻÿ�.
    ��°�� : ������̵�, �̸�1, �̸�2, �̸���, �μ���ȣ, �μ���
*/
/* ù��° �������� �����ϸ� ���� ���ǰ� �ָ��ϴٴ� ������ �߻��Ѵ�. 
�μ���ȣ�� ���ϴ� department_id�� ���� ���̺� ��ο� �����ϹǷ�
� ���̺��� ������ �����ؾ����� ����ؾ� �Ѵ�. */
select
    employee_id, first_name, last_name, email, 
    /*�� �κп��� �����߻�*/department_id, department_name 
from employees inner join departments
    on employees.department_id=departments.department_id;

--���� ���ǰ� �ָ��� ��� �÷��տ� ���̺���� �߰��ϸ�ȴ�. 
select
    employee_id, first_name, last_name, email, 
    departments.department_id, department_name 
from employees inner join departments
    on employees.department_id=departments.department_id;    
    
--as(�˸��ƽ�)�� ���� ���̺� ��Ī�� �ο��ϸ� ����ȭ�� �� �ִ�. 
select
    employee_id, first_name, last_name, email, 
    Dep.department_id, department_name 
from employees Emp inner join departments Dep
    on Emp.department_id=Dep.department_id; 
/* ������������ �Ҽӵ� �μ��� ���� 1���� ������ ������ 106����
���ڵ尡 ����ȴ�. ��, inner join�� ������ ���̺� ���� ��� �����Ǵ�
���ڵ尡 �����ϰ� �ȴ�. */    


--3�� �̻��� ���̺� �����ϱ�
/*
�ó�����] seattle(�þ�Ʋ)�� ��ġ�� �μ����� �ٹ��ϴ� ������ ������
    ����ϴ� �������� �ۼ��Ͻÿ�. �� ǥ�ع������ �ۼ��Ͻÿ�. 
    ��°��] ����̸�, �̸���, �μ����̵�, �μ���, ���������̵�, 
        ��������, �ٹ�����
    �� ��°���� ���� ���̺� �����Ѵ�. 
    ������̺� : ����̸�, �̸���, �μ����̵�, ���������̵�
    �μ����̺� : �μ����̵�(����), �μ���, �����Ϸù�ȣ(����)
    ���������̺� : ��������, ���������̵�(����)
    �������̺� : �ٹ��μ�, �����Ϸù�ȣ(����)
*/
--1.���� ���̺��� ���� seattle�� ��ġ�� ���ڵ��� �Ϸù�ȣ�� ã�ƺ���.
--�����Ϸù�ȣ�� '1700'�� ���� Ȯ��. 
select * from locations where city=initcap('seattle');
--2.�����Ϸù�ȣ�� ���� �μ����̺��� ���ڵ带 Ȯ���Ѵ�. 
--21���� �μ��ΰ��� Ȯ�� 
select * from departments where location_id=1700;
--3.�μ��Ϸù�ȣ�� ���� ������̺��� ���ڵ带 Ȯ���Ѵ�. 
select * from employees where department_id=10;--1�� Ȯ��
select * from employees where department_id=30;--6�� Ȯ�� 
--4.�������� Ȯ���ϱ� 
select * from jobs where job_id='AD_ASST';--Administration Assistant
select * from jobs where job_id='PU_MAN';--Purchasing Manager
select * from jobs where job_id='PU_CLERK';--Purchasing Clerk
--5.join ������ �ۼ�
/* ���� ���̺� ���ÿ� �����ϴ� �÷��� ��쿡�� �ݵ�� ���̺���̳�
��Ī�� ����ؾ� �Ѵ�. */
select
    first_name, last_name, email, 
    employees.department_id, department_name, 
    city, state_province, 
    employees.job_id, job_title 
from locations 
    inner join departments 
        on locations.location_id=departments.location_id
    inner join employees
        on employees.department_id=departments.department_id 
    inner join jobs
        on employees.job_id=jobs.job_id
where city=initcap('seattle');

--���̺��� ��Ī�� ����ϸ� �������� ���� �����ϰ� ������ִ�. 
select
    first_name, last_name, email, 
    E.department_id, department_name, 
    city, state_province, 
    E.job_id, job_title 
from locations L
    inner join departments D
        on L.location_id=D.location_id
    inner join employees E
        on E.department_id=D.department_id 
    inner join jobs J
        on E.job_id=J.job_id
where city=initcap('seattle');

/*
����2] ����Ŭ ���
    select �÷�1, �÷�2,...
    from ���̺�1, ���̺�2
    where  
        ���̺�1.�⺻Ű�÷�=���̺�2.�ܷ�Ű�÷� 
        and ����1 and ����2 ....;
ǥ�ع�Ŀ��� ����� inner join�� on�� �����ϰ� ������ ������
where���� ǥ���ϴ� ����̴�. 
*/

/*
�ó�����] ������̺�� �μ����̺��� �����Ͽ� �� ������ ��μ�����
    �ٹ��ϴ��� ����Ͻÿ�. ��, ����Ŭ������� �ۼ��Ͻÿ�.
    ��°�� : ������̵�, �̸�1, �̸�2, �̸���, �μ���ȣ, �μ���
*/
select
    employee_id, first_name, last_name, email,
    Emp.department_id, department_name 
from employees Emp , departments Dep
where Emp.department_id=Dep.department_id;

/*
�ó�����] seattle(�þ�Ʋ)�� ��ġ�� �μ����� �ٹ��ϴ� ������ ������
    ����ϴ� �������� �ۼ��Ͻÿ�. �� ����Ŭ������� �ۼ��Ͻÿ�. 
    ��°��] ����̸�, �̸���, �μ����̵�, �μ���, ���������̵�, 
        ��������, �ٹ�����
    �� ��°���� ���� ���̺� �����Ѵ�. 
    ������̺� : ����̸�, �̸���, �μ����̵�, ���������̵�
    �μ����̺� : �μ����̵�(����), �μ���, �����Ϸù�ȣ(����)
    ���������̺� : ��������, ���������̵�(����)
    �������̺� : �ٹ��μ�, �����Ϸù�ȣ(����)
*/
select
    first_name, last_name, email, 
    D.department_id, department_name, J.job_id, job_title, city 
from locations L, departments D, employees E, jobs J
where 
    L.location_id=D.location_id and 
    D.department_id=E.department_id and 
    E.job_id=J.job_id and 
    lower(city)='seattle';


/*
2] outer join(�ܺ�����)
outer join�� inner join�� �޸� �� ���̺� ���������� ��Ȯ�� ��ġ����
�ʾƵ� ������ �Ǵ� ���̺��� ���ڵ带 �����ϴ� ����̴�. 
outer join�� ����Ҷ��� �ݵ�� ������ �Ǵ� ���̺��� �����ϰ� ��������
�ۼ��ؾ��Ѵ�. 
    -> left(�������̺�), right(���������̺�), full(�������̺�)

����1(ǥ�ع��)
    select �÷�1, �÷�2....
    from ���̺�1 
        left[right, full] outer join 
            on ���̺�1.�⺻Ű=���̺�2.����Ű
    where ����1 and ����2 or ����3 ..;
*/
/*
�ó�����] ��ü������ �����ȣ, �̸�, �μ����̵�, �μ���, ������
�ܺ�����(left)�� ���� ����Ͻÿ�
*/
select
    employee_id, first_name, Em.department_id, 
    department_name, city 
from employees Em 
    left outer join departments De 
        on Em.department_id=De.department_id
    left outer join locations Lo
        on De.location_id=Lo.location_id;
/* �������� ���� �������ΰ��� �ٸ��� 107���� ����ȴ�. �μ��� �������� 
���� ������� ����Ǳ� �����ε�, �� ��� �μ��ʿ� ���ڵ尡 �����Ƿ� null
�� ��µȴ�. */

/*
����2(����Ŭ���)
     select �÷�1, �÷�2
     from ���̺�1, ���̺�2
     where
        ���̺�1.�⺻Ű=���̺�2.�ܷ�Ű(+)
        and ����1 or ����2;
==> ����Ŭ ������� ����ÿ��� outer join �������� (+)�� �ٿ��ش�. 
==> ���� ��� ���� ���̺��� ������ �ȴ�. 
==> ������ �Ǵ� ���̺��� �����Ҷ��� ���̺��� ��ġ�� �Ű��ش�. (+)�� 
    �ű��� �ʴ´�.        
*/

/*
�ó�����] ��ü������ �����ȣ, �̸�, �μ����̵�, �μ���, ������
�ܺ�����(left)�� ���� ����Ͻÿ�. �� ����Ŭ������� �ۼ��Ͻÿ�.
*/
select
    employee_id, first_name, De.department_id, department_name,
    city, state_province
from employees Em, departments De, locations Lo
where 
    Em.department_id=De.department_id (+) and 
    De.location_id=Lo.location_id (+);

/*
����] 2007�⿡ �Ի��� ����� ��ȸ�Ͻÿ�. ��, �μ��� ��ġ���� ����
������ ��� <�μ�����>���� ����Ͻÿ�. ��, ǥ�ع������ �ۼ��Ͻÿ�.
����׸� : ���, �̸�, ��, �μ���
*/
--�켱 ����� ���ڵ带 �����ϰ� Ȯ���Ѵ�. 
select first_name, hire_date, to_char(hire_date, 'yyyy') 
    from employees;
--2007�⿡ �Ի��� ����� �����Ѵ�. 
select first_name, hire_date from employees
    where to_char(hire_date, 'yyyy')='2007';
select first_name, hire_date from employees
    where hire_date like '07%';
/* �ܺ������� ǥ�ع������ �ۼ��� �� ����� Ȯ���Ѵ�. nvl() �Լ��� ����
null���� ������ ������ �������ش�. ����� 19�� �����. */    
select employee_id, first_name, last_name, 
    nvl(department_name,'<�μ�����>')
from employees E left outer join departments D
    on E.department_id=D.department_id
where to_char(hire_date,'yyyy')='2007';

/*
����] �� �������� ����Ŭ������� �����Ͻÿ�. 
*/
select
    employee_id, first_name, last_name, 
    nvl(department_name,'<�μ�����>')
from employees E, departments D
where 
    E.department_id=D.department_id (+) and
    hire_date like '07%';
    

/*
3] self join(��������)
���������� �ϳ��� ���̺� �ִ� �÷����� �����ؾ� �ϴ� ��� ����Ѵ�. 
�� �ڱ��ڽ��� ���̺�� ������ �δ°��̴�. 
�������ο����� ��Ī�� ���̺��� �����ϴ� �������� ������ �ϹǷ� ������
�߿��ϴ�. 
����] select ��Ī1.�÷�, ��Ī2.�÷� ..
        from ���̺�A ��Ī1, ���̺�A ��Ī2
        where ��Ī1.�÷�=��Ī2.�÷� ; 
*/

/*
�ó�����] ������̺��� �� ����� �޴������̵�� �޴����̸��� ����Ͻÿ�.
    ��, �̸��� fist_name�� last_name�� �ϳ��� �����ؼ� ����Ͻÿ�.
*/
select
    empClerk.employee_id "�����ȣ",
    empClerk.first_name||' '||empClerk.last_name "����̸�",
    empManager.employee_id "�޴��������ȣ", 
    concat(empManager.first_name||' ', empManager.last_name) "�޴����̸�"
from employees empClerk, employees empManager
where empClerk.manager_id=empManager.employee_id;


/*
�ó�����] self join�� ����Ͽ� "Kimberely / Grant" ������� �Ի����� 
���� ����� �̸��� �Ի����� ����Ͻÿ�. 
��¸�� : first_name, last_name, hire_date
*/
--Kimberely�� ����Ȯ��
select * from employees where first_name='Kimberely' 
    and last_name='Grant';
--07/05/24 ���Ŀ� �Ի��� ����� ���ڵ� ���� (�� 20�� �����)
select * from employees where hire_date>'07/05/24';

select
    Clerk.first_name, Clerk.last_name, Clerk.hire_date
from employees Kim, employees Clerk
where
    Clerk.hire_date>Kim.hire_date 
    and Kim.first_name='Kimberely' and Kim.last_name='Grant';

/*
using : join������ �ַ� ����ϴ� on���� ��ü�� �� �ִ� ����
����] on ���̺�1.�÷�=���̺�2.�÷�
    => using(�÷�)
*/
/*
�ó�����] seattle(�þ�Ʋ)�� ��ġ�� �μ����� �ٹ��ϴ� ������ ������
    ����ϴ� �������� �ۼ��Ͻÿ�. �� using�� ����ؼ� �ۼ��Ͻÿ�. 
    ��°��] ����̸�, �̸���, �μ����̵�, �μ���, ���������̵�, 
        ��������, �ٹ�����
*/  
select
    first_name, last_name, email, 
    department_id, department_name, 
    city, state_province, 
    job_id, job_title 
from locations 
    inner join departments using(location_id)
    inner join employees using(department_id)
    inner join jobs using(job_id)
where city=initcap('seattle');
/*
    using���� ���� �����÷��� ��� select������ ��Ī�� ���̸� ������
    ������ �߻��Ѵ�. 
    using���� ���� �÷��� ������ ���̺� ���ÿ� �����ϴ� �÷��̶��
    ���� ����� �ۼ��Ǳ� ������ ���� ��Ī�� ����� ������ ���⶧���̴�. 
    �� using�� ���̺��� ��Ī �� on���� �����Ͽ� �� �� �����ϰ� 
    join�������� �ۼ��� �� �ְ� ���ش�. 
*/

/*
 ����] 2005�⿡ �Ի��� ������� California(STATE_PROVINCE) / 
 South San Francisco(CITY)���� �ٹ��ϴ� ������� ������ ����Ͻÿ�.
 ��, ǥ�ع�İ� using�� ����ؼ� �ۼ��Ͻÿ�.
 
 ��°��] �����ȣ, �̸�, ��, �޿�, �μ���, �����ڵ�, ������(COUNTRY_NAME)
        �޿��� ���ڸ����� �ĸ��� ǥ���Ѵ�. 
 ����] '������'�� countries ���̺� �ԷµǾ��ִ�. 
*/
--2005�⿡ �Ի��� ���(���:29��)
select first_name, hire_date, substr(hire_date,1,2) "����1"
    , to_char(hire_date, 'yyyy') "����2" from employees;
select * from employees where substr(hire_date,1,2)='05';
select * from employees where to_char(hire_date, 'yyyy')='2005';
--�������� �־��� ���ø����� �μ���ȣ�� Ȯ���Ѵ�.(���:������ȣ 1500) 
select * from locations where city='South San Francisco' 
    and state_province='California';
--������ȣ 1500�� ���� �ش� ��ġ�� �ִ� �μ��� Ȯ���Ѵ�.(���:�μ���ȣ 50) 
select * from departments where location_id=1500;
--������ Ȯ���� ������ ���� ������ �ۼ�
select * from employees where department_id=50 and 
    to_char(hire_date, 'yyyy')='2005';
/* 2005�⿡ �Ի��߰�, 50�� �μ�(Shipping)�� �ٹ��ϴ� ����� ������
�����ؾ��Ѵ�. */
--join������ �ۼ��ϱ�
select
    employee_id, first_name, last_name, 
    (to_char(salary,'$0,000')), 
    department_name, country_id, country_name 
from employees 
    inner join departments using(department_id)
    inner join locations using(location_id)
    inner join countries using(country_id) 
where     
    to_char(hire_date, 'yyyy')='2005' and 
    city='South San Francisco' and state_province='California';
    
    
    
    
    
    
    
    
    









