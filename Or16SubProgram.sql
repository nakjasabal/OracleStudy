/************
���ϸ� : Or16SubProgram.sql
�������α׷�
���� : �������ν���, �Լ� �׸��� ���ν����� ������ Ʈ���Ÿ� �н�
***************/

/*
�������α׷�(Sub Program)
-PL/SQL������ ���ν����� �Լ���� �ΰ��� ������ �������α׷��� �ִ�.
-Select�� �����ؼ� �ٸ� DML���� �̿��Ͽ� ���α׷������� ��Ҹ� ����
��밡���ϴ�. 
-Ʈ���Ŵ� ���ν����� �������� Ư�� ���̺� ���ڵ��� ��ȭ�� �������
�ڵ����� ����ȴ�. 
-�Լ��� �������� �Ϻκ����� ����ϱ� ���� �����Ѵ�. �� �ܺ� ���α׷�����
ȣ���ϴ� ���� ���� ����.
-���ν����� �ܺ� ���α׷����� ȣ���ϱ� ���� �����Ѵ�. ���� Java, 
JSP��� ������ ȣ��� ������ ������ ������ �� �ִ�. 
*/

/*
1.�������ν���(Stored Procedure)
-���ν����� return���� ���� ��� out�Ķ���͸� ���� ���� ��ȯ�Ѵ�. 
-���ȼ��� ���� �� �ְ�, ��Ʈ��ũ�� ���ϸ� ���� �� �ִ�. 
����] create [or replace] procedure ���ν����� [( 
        �Ű����� in �ڷ���, �Ű����� out �ڷ���
    )]
    is [��������]
    begin
        ���๮��
    end;
    /
�� �Ķ���� ������ �ڷ����� ����ϰ�, ũ��� ������� �ʴ´�.      
*/

/*
�ó�����] 100�� ����� �޿��� select�Ͽ� ����ϴ� �������ν����� �����Ͻÿ�.
*/ 
--���ν��� ������ or replace�� �߰��ϴ°��� ����. 
create or replace procedure pcd_emp_salary
is  
    /* PL/SQL������ declare���� ������ ����������, ���ν���������
    is���� �����Ѵ�. ���� ������ �ʿ���ٸ� ������ �� �ִ�. */
    --������̺��� �޿� �÷��� �����ϴ� ���������� ���� 
    v_salary employees.salary%type;
begin   
    --100�� ����� �޿��� into�� ���� ������ �����Ѵ�. 
    select salary into v_salary from employees 
        where employee_id=100;
    dbms_output.put_line('�����ȣ 100�� �޿��� '||v_salary||'�Դϴ�');
end;
/  
--�����ͻ������� Ȯ���Ѵ�. ������ �빮�ڷ� �ǹǷ� ��ȯ�Լ��� �̿��Ѵ�. 
select * from user_source 
    where name like upper('%pcd_emp_salary%');  
--���ν����� ������ ȣ��Ʈȯ�濡�� execute ����� �̿��Ѵ�.  
execute pcd_emp_salary;


/*
In�Ķ���͸� ����� ���ν��� ����

�ó�����] ����� �̸��� �Ű������� �޾Ƽ� ������̺��� ���ڵ带 ��ȸ����
�ش����� �޿��� ����ϴ� ���ν����� ���� �� �����Ͻÿ�.
�ش� ������ in�Ķ���͸� ������ ó���Ѵ�.
����̸�(first_name) : Bruce, Neena
*/ 
--���ν��� ������ in�Ķ���͸� �����Ѵ�. first_name�� �����ϴ� ��������
--�� �����Ѵ�. 
create or replace procedure pcd_in_param_salary
    (param_name in employees.first_name%type) 
is 
    /* ������ is������ �����ϰ�, �ʿ���� ��� ������ �� �ִ�. */
    valSalary number(10);  
begin
    /* ���Ķ���ͷ� ���޵� ������� �������� �޿��� ���� �� ������
    �Ҵ��Ѵ�. �ϳ��� ����� ��µǹǷ� into�� select������ ����Ѵ�.*/
    select salary into valSalary
    from employees where first_name = param_name;
    --����� �̸��� �޿��� �Բ� ����Ѵ�.  
    dbms_output.put_line(param_name||'�� �޿��� '|| valSalary 
        ||' �Դϴ�');
end;
/   
--�����ͻ������� �ۼ��� ���� Ȯ�� 
select * from user_source 
    where name like upper('%pcd_in_param_salary%');  
--����� �̸��� �Ķ���ͷ� �����ؼ� ���ν����� ȣ���Ѵ�. 
execute pcd_in_param_salary('Bruce');
execute pcd_in_param_salary('Neena');


/*
Out �Ķ���͸� ����Ͽ� ���ν��� ����

�ó�����] �� ������ �����ϰ� ������� �Ű������� ���޹޾Ƽ� �޿��� ��ȸ�ϴ�
���ν����� �����Ͻÿ�. ��, �޿��� out�Ķ���͸� ����Ͽ� ��ȯ�� ����Ͻÿ�
*/ 
/* �ΰ��� ������ �Ķ���͸� �����Ѵ�. �Ϲݺ���, ���������� ���� ����ؼ�
�����Ͽ���. �Ķ���ʹ� �뵵�� ���� in, out�� ���� ����Ѵ�. �Ķ����
���ǽÿ��� ũ��� ������ ������� �ʴ´�. */
create or replace procedure pcd_out_param_salary (        
    param_name in varchar2, 
    param_salary out employees.salary%type
) 
is  
    /* select�� ����� out�Ķ���Ϳ� ������ ���̹Ƿ� ������ ������
    �ʿ����� �ʾ� is ���� ����д�. �̿Ͱ��� ���������� ������ �� �ִ�.*/
begin   
    /* in�Ķ���ʹ� where���� �������� ����ϰ�, select�� �������
    into������ out�Ķ���Ϳ� �����Ѵ�. 
    ����� ���� ���ν��� �ܺη� ��ȯ�ȴ�. */
    select salary into param_salary
    from employees where first_name = param_name;
end;
/  
--ȣ��Ʈȯ�濡�� ���ε� ������ �����Ѵ�. variable�ε� ������ �� �ִ�.
var v_salary varchar2(30);
/* ���ν��� ȣ��� ������ �Ķ���͸� ����Ѵ�. Ư�� ���ε庯���� :��
�ٿ����Ѵ�. out�Ķ������ param_salary�� ����� ���� v_salary��
���޵ȴ�. */ 
execute pcd_out_param_salary('Matthew', :v_salary); 
--���ν��� ���� �� out�Ķ���͸� ���� ���޵� ���� ����Ѵ�. 
print v_salary;







