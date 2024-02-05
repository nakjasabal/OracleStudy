/************
���ϸ� : Or15PLSQL.sql
PL/SQL
���� : ����Ŭ���� �����ϴ� ���α׷��� ���
*************/
/*
PL/SQL(Procedural Language)
    : �Ϲ� ���α׷��� ���� ������ �ִ� ��Ҹ� ��� ������ ������ 
    DB������ ó���ϱ� ���� ����ȭ�� ����̴�
*/
--HR�������� �ǽ��մϴ�. 

--����1] PL/SQL ������
--ȭ��� ������ ����ϰ� ������ on���� �����Ѵ�. off�϶��� ��µ��� �ʴ´�.
set serveroutput on;
declare --����� : �ַ� ������ �����Ѵ�. 
    cnt number; --����Ÿ������ ������ �����Ѵ�. 
begin --����� : begin~end�� ���̿� ������ ���� ������ ����Ѵ�. 
    cnt := 10; --������ 10�� �����Ѵ�. ���Կ����ڴ� :=�� ����Ѵ�. 
    cnt := cnt + 1;
    dbms_output.put_line(cnt); --java�� println()�� �����ϴ�. 
end;
/
/*
    PL/SQL������ ������ �ݵ�� /�� �ٿ��� �ϴµ�, ���� ������ 
    ȣ��Ʈȯ������ ���������� ���Ѵ�. �� PL/SQL���� Ż���ϱ� ���� �ʿ��ϴ�.
    ȣ��Ʈȯ���̶� �������� �Է��ϱ� ���� SQL> ������Ʈ�� �ִ� ���¸�
    ���Ѵ�. 
*/


--����2] �Ϲݺ��� �� into
/*
�ó�����] ������̺��� �����ȣ�� 120�� ����� �̸��� ����ó�� ����ϴ�
    PL/SQL���� �ۼ��Ͻÿ�.
*/
select * from employees where employee_id=120;
--�ó����� ���ǿ� �´� select���� �ۼ��Ѵ�.  
select concat(first_name||' ', last_name), phone_number 
from employees where employee_id=120;

declare
    /* ����ο��� ������ �����Ҷ��� ���̺� �����ÿ� �����ϰ� �����Ѵ�.
    => ������ �ڷ���(ũ��)
    ��, ������ ������ �÷��� Ÿ�԰� ũ�⸦ �����Ͽ� �����ϴ°� ����. 
    �Ʒ� '�̸�'�� ��� 2���� �÷��� ������ �����̹Ƿ� ���� �� �˳���
    ũ��� �������ִ°��� ����. */
    empName varchar2(50);
    empPhone varchar2(20);
begin
    /* ����� : select ������ ������ ����� ����ο��� ������ ������
        1:1�� �����Ͽ� ���� �����Ѵ�. �̶� into�� ����Ѵ�. */
    select concat(first_name||' ', last_name), phone_number 
        into empName, empPhone
    from employees where employee_id=120;
    
    dbms_output.put_line(empName||' '||empPhone);
end;
/



--����3] ��������1(�ϳ��� �÷� ����) 
/*
    �������� : Ư�� ���̺��� �÷��� �����ϴ� �����ν� ������ �ڷ�����
        ũ��� �����ϰ� ������ ����Ѵ�. 
        ����] ���̺��.�÷���%type
            => ���̺��� '�ϳ�'�� �÷����� �����Ѵ�. 
*/
/*
�ó�����] �μ���ȣ 10�� ����� �����ȣ, �޿�, �μ���ȣ�� �����ͼ� 
    �Ʒ� ������ ������ ȭ��� ����ϴ� PL/SQL���� �ۼ��Ͻÿ�. 
    ��, ������ �������̺��� �ڷ����� �����ϴ� '��������'�� �����Ͻÿ�.
*/
--�ó������� ���ǿ� �´� select���� �ۼ��Ѵ�. 
select employee_id, salary, department_id
from employees where department_id=10;

declare  
    --������̺��� Ư�� �÷��� Ÿ�԰� ũ�⸦ �״�� �����ϴ� ������ �����Ѵ�.
    empNo employees.employee_id%type; --NUMBER(6,0)
    empSal employees.salary%type; --NUMBER(8,2)
    deptId employees.department_id%type; --NUMBER(4,0)�� �����ϰ� ����ȴ�.
begin
    --select���� into�� ���� ������ ���� �Ҵ��Ѵ�. 
    select employee_id, salary, department_id
        into empNo, empSal, deptId
    from employees where department_id=10;
    
    dbms_output.put_line(empNo||' '||empSal||' '||deptId);
end;
/


--����4] ��������2(��ü�÷��� ����)
/*
�ó�����] �����ȣ�� 100�� ����� ���ڵ带 �����ͼ� emp_row������ ��ü�÷���
������ �� ȭ�鿡 ���� ������ ����Ͻÿ�.
��, emp_row�� ������̺��� ��ü�÷��� ������ �� �ִ� ���������� �����ؾ��Ѵ�.
������� : �����ȣ, �̸�, �̸���, �޿�
*/
declare
    /* ������̺��� ��ü�÷��� �����ϴ� ���������� �����Ѵ�. �̶� ���̺��
    �ڿ� %rowtype�� �ٿ� �����Ѵ�. */
    emp_row employees%rowtype;
begin
    /* ���ϵ�ī�� *�� ���� ���� ��ü�÷��� ���� emp_row�� �Ѳ�����
    ������ �� �ִ�. */
    select * into emp_row
    from employees where employee_id=100;
    /* emp_row���� ��ü�÷��� ������ ����ǹǷ� ��½� ������.�÷���
    ���·� ����ؾ� �Ѵ�. */ 
    dbms_output.put_line(emp_row.employee_id||' '||
                        emp_row.first_name||' '||
                        emp_row.email||' '||
                        emp_row.salary);
end;
/

set serveroutput on;
--����5] ���պ���
/*
class�� �����ϵ� �ʿ��� �ڷ����� ���� �ϳ��� �ڷ����� ������ 
�����ϴ� ������ ���Ѵ�. 
����] type ���պ����ڷ��� is recode (
        �÷���1 �ڷ���(ũ��),
        �÷���2 ���̺��.�÷���%type
     );
     �տ��� ������ �ڷ����� ������� ������ �����Ѵ�. 
     ���պ��� �ڷ����� ���鶧�� �Ϲݺ����� �������� 2������ �����ؼ�
     ����� �� �ִ�. 
*/
/*
�ó�����] �����ȣ, �̸�(first_name+last_name), ���������� ������ �� �ִ� 
���պ����� ������ ��, 100�� ����� ������ ����ϴ� PL/SQL�� �ۼ��Ͻÿ�.
*/
-- ���ǿ� �´� ������ ���� 
select employee_id, first_name||' '||last_name, job_id
from employees where employee_id=100;

declare
    --3���� ���� ������ �� �ִ� ���պ��� �ڷ����� �����Ѵ�. 
    type emp_3type is record(
        /* ������̺��� �÷��� �����ϴ� ���������� ���� */
        emp_id employees.employee_id%type,
        /* �Ϲݺ����� ���� */
        emp_name varchar2(50),
        emp_job employees.job_id%type
    );
    /* �տ��� ������ ���պ��� �ڷ����� ���� ������ �����Ѵ�. �ش� 
    ���պ����� ���� 3���� ���� ������ �� �ִ�. */
    record3 emp_3type;
begin
    --select������ ������ 3���� ���� ���պ����� �����Ѵ�. 
    select employee_id, first_name||' '||last_name, job_id
        into record3
    from employees where employee_id=100;
    --����� ����Ѵ�. 
    dbms_output.put_line(record3.emp_id||' '||
                        record3.emp_name||' '||
                        record3.emp_job);
end;
/


/*
���ε庯��
    : ȣ��Ʈȯ�濡�� ����� �����ν� �� PL/SQL�����̴�. 
    ȣ��Ʈȯ���̶� PL/SQL�� ���� ������ ������ �κ��� ���Ѵ�. 
    �ܼ�(CMD)������ SQL> ���������Ʈ�� �ִ� ���¸� ���Ѵ�. 
    
    ����]
        var ������ �ڷ���;
        Ȥ��
        variable ������ �ڷ���; 
*/
--ȣ��Ʈȯ�濡�� ���ε� ���� ���� 
var return_var number;  
--PL/SQL �ۼ�
declare 
    --����ο��� �̿Ͱ��� �ƹ� ������ �������� �ִ�. 
begin  
    --���ε庯���� �Ϲݺ������� ������ ���� :(�ݷ�)�� �߰��ؾ��Ѵ�. 
    :return_var := 999; 
    dbms_output.put_line(:return_var);
end;
/
/* ȣ��Ʈȯ�濡�� ���ε庯���� ����Ҷ��� print�� ����Ѵ�. */
print return_var;
/* CMD������ ������ ���������� �����ص� ������ ������, �𺧷��ۿ�����
���ε庯������ ������ print������ ������ ������ �� �����ؾ� �����
����� �����Եȴ�.(�ణ�� ȯ������ ���̰� �ִٰ� ��������)*/

/*
��������] �Ʒ� ������ ���� PL/SQL���� �ۼ��Ͻÿ�.
1.���պ�������
- �������̺� : employees
- ���պ����ڷ����� �̸� : empTypes
        ���1 : emp_id -> �����ȣ
        ���2 : emp_name -> �������ü�̸�(�̸�+��)
        ���3 : emp_salary -> �޿�
        ���4 : emp_percent -> ���ʽ���
������ ������ �ڷ����� �̿��Ͽ� ���պ��� rec2�� ������ �����ȣ 108���� 
������ �Ҵ��Ѵ�.
2.1�� ������ ����Ѵ�.
3.�� ������ �Ϸ����� 'ġȯ������'�� ����Ͽ� �����ȣ�� ����ڷκ��� 
�Է¹��� �� �ش� ����� ������ ����Ҽ��ֵ��� �����Ͻÿ�.[����]
*/
--���ǿ� �´� select�� �ۼ�
select
    employee_id, first_name||' '||last_name, 
    salary, nvl(commission_pct,0)
from employees where employee_id=108;

declare
    --4���� ����� ���� ���պ��� �ڷ����� �����Ѵ�. 
    type empTypes is record (
        emp_id employees.employee_id%type, 
        emp_name varchar2(50), 
        emp_salary employees.salary%type, 
        emp_percent employees.commission_pct%type 
    );
    --���պ��� �ڷ����� ���� ������ �����Ѵ�. 
    rec2 empTypes;
begin
    select
        employee_id, first_name||' '||last_name, 
        salary, nvl(commission_pct,0) into rec2
    from employees where employee_id=108;
    
    dbms_output.put_line('�����ȣ / ����� / �޿� / ���ʽ���');
    dbms_output.put_line(rec2.emp_id||' '||rec2.emp_name||' '||
                rec2.emp_salary||' '||rec2.emp_percent);
end;
/

/*
ġȯ������ : PL/SQL���� ����ڷκ��� �Է¹����� ����ϴ� �����ڷ�
    �����տ� &�� �ٿ��ָ� �ȴ�. ����� �Է�â�� ���. 
*/
--�տ��� �ۼ��ߴ� ���������� ġȯ�����ڸ� �����Ѵ�. 
declare
    --4���� ����� ���� ���պ��� �ڷ����� �����Ѵ�. 
    type empTypes is record (
        emp_id employees.employee_id%type, 
        emp_name varchar2(50), 
        emp_salary employees.salary%type, 
        emp_percent employees.commission_pct%type 
    );
    --���պ��� �ڷ����� ���� ������ �����Ѵ�. 
    rec2 empTypes;
    --ġȯ�����ڸ� ���� �Է¹��� ���� �Ҵ��� ������ �����Ѵ�. 
    inputNum number(3);
begin
    select
        employee_id, first_name||' '||last_name, 
        salary, nvl(commission_pct,0) into rec2
    from employees where employee_id=&inputNum;
    
    dbms_output.put_line('�����ȣ / ����� / �޿� / ���ʽ���');
    dbms_output.put_line(rec2.emp_id||' '||rec2.emp_name||' '||
                rec2.emp_salary||' '||rec2.emp_percent);
end;
/






 
 