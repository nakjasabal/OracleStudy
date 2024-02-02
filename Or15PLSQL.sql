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
 