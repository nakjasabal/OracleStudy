/************
���ϸ� : Or15PLSQL2.sql
PL/SQL
���� : ����Ŭ���� �����ϴ� ���α׷��� ���
*************/

--���(���ǹ�) : if��, case���� ���� ���ǹ��� �н��Ѵ�. 

--����7] if�� �⺻
--if�� : Ȧ���� ¦���� �Ǵ��ϴ� if�� �ۼ�
declare 
    --����ο��� ����Ÿ���� ������ ���� 
    num number;
begin 
    --�ʱⰪ���� 10�� �Ҵ� 
    num := 10; 
    --mod(����, ����) : ������ ������ ���� �������� ��ȯ�ϴ� �Լ�.
    if mod(num,2) = 0 then  
        dbms_output.put_line(num ||'�� ¦��');
    else
        dbms_output.put_line(num ||'�� Ȧ��');
    end if;
end;
/

--����8] if~elsif��
/*
�ó�����] �����ȣ�� ����ڷκ��� �Է¹����� �ش� ����� ��μ�����
�ٹ��ϴ����� ����ϴ� PL/SQL���� �ۼ��Ͻÿ�. ��, if~elsif���� ����Ͽ�
�����Ͻÿ�.
*/
declare
    --ġȯ�����ڴ� �̿Ͱ��� ����ο� ����ص��ȴ�. �����ȣ�� �Է¹޴´�.
    emp_id employees.employee_id%type := &emp_id;
    emp_name varchar2(50);
    emp_dept employees.department_id%type; 
    --�μ����� ����� ���ÿ� �ʱ�ȭ�Ѵ�. 
    dept_name varchar2(30) := '�μ���������'; 
begin
    --�Է¹��� �����ȣ�� ���� select�� �� ������ ���� �Ҵ��Ѵ�.
    select employee_id, last_name, department_id
        into emp_id, emp_name, emp_dept
    from employees
    where employee_id = emp_id; 
    
    /* �������� ������ ����� ��� Java�� ���� else if�� ������� �ʰ�
    elsif�� ����ؾ� �Ѵ�. ���� �߰�ȣ ��� then�� end if;�� 
    ���ȴ�. */
    if emp_dept = 50 then
        dept_name := 'Shipping';
    elsif emp_dept = 60 then
        dept_name := 'IT';
    elsif emp_dept = 70 then
        dept_name := 'Public Relations';
    elsif emp_dept = 80 then
        dept_name := 'Sales';
    elsif emp_dept = 90 then
        dept_name := 'Executive';
    elsif emp_dept = 100 then
        dept_name := 'Finance';
    end if;   

    dbms_output.put_line('�����ȣ'|| emp_id ||'������');
    dbms_output.put_line('�̸�:'|| emp_name 
            ||', �μ���ȣ:'|| emp_dept ||', �μ���:'|| dept_name );   
end;
/

/*
case�� : java�� switch���� ����� ���ǹ�
    ����]
        case ����
            when ��1 then '�Ҵ簪1'
            when ��2 then '�Ҵ簪2'
            .....��N
        end;
*/
/*
�ó�����] �տ��� if~elsif�� �ۼ��� PL/SQL���� case~when������ �����Ͻÿ�.
*/
declare 
    --ġȯ�����ڸ� ���� �����ȣ�� �Է¹޴´�. 
    emp_id employees.employee_id%type := &emp_id;
    emp_name varchar2(50);
    emp_dept employees.department_id%type;
    dept_name varchar2(30) := '�μ���������'; 
begin
    select employee_id, last_name, department_id
        into emp_id, emp_name, emp_dept
    from employees
    where employee_id = emp_id; 
    /* case~when���� if���� �ٸ����� �Ҵ��� ������ ���� ������ ��
    ���峻���� ������ �Ǵ��Ͽ� �ϳ��� ���� �Ҵ��ϴ� ����̴�. ����
    ������ �ߺ����� ������� �ʾƵ��ȴ�. */
    dept_name := 
        case emp_dept
            when 50 then 'Shipping'
            when 60 then 'IT'
            when 70 then 'Public Relations'
            when 80 then 'Sales'
            when 90 then 'Executive'
            when 100 then 'Finance'
        end;     

    dbms_output.put_line('�����ȣ'|| emp_id ||'������');
    dbms_output.put_line('�̸�:'|| emp_name 
            ||', �μ���ȣ:'|| emp_dept 
            ||', �μ���:'|| dept_name );   
end;
/



----------------------------------------------------------
--���(�ݺ���)
/*
�ݺ���1 : Basic loop��
    Java�� do~while���� ���� ����üũ���� �ϴ� loop�� ������ �� 
    Ż�������� �ɶ����� �ݺ��Ѵ�. Ż��ÿ��� exit�� ����Ѵ�. 
*/
declare 
    --������ ����Ÿ������ ���� �� 0���� �ʱ�ȭ 
    num number := 0; 
begin
    --���� üũ���� ������ �����Ѵ�. 
    loop
        --0~10���� ����Ѵ�. 
        dbms_output.put_line(num);  
        /* ���������ڳ� ���մ��Կ����ڰ� �����Ƿ� �Ϲ����� ������� 
        ������ �������Ѿ� �Ѵ�. */
        num := num + 1;      
        /* num�� 10�� �ʰ��ϸ� loop���� Ż���Ѵ�. exit�� Java��
        break�� �����ϰ� �ݺ����� Ż���Ѵ�. */
        exit when (num>10);
    end loop;
end;
/

/*
�ó�����] Basic loop������ 1���� 10������ ������ ���� ���ϴ� 
    ���α׷��� �ۼ��Ͻÿ�. 
*/
declare     
    i number := 1;  
    /* �������� �����ϱ� ���� ������, Java������ ���� sum�̶�� 
    �������� ���������, Oracle������ �׷��Լ� sum()�� �����Ƿ�
    �Ʒ��� ���� �ٸ� �̸��� ����ؾ��Ѵ�. */
    sumNum number := 0; 
begin
    loop
        --�����ϴ� ���� i�� �����ؼ� �����ش�. 
        sumNum := sumNum + i;  
        --���� i�� 1�� �����Ѵ�. 
        i := i + 1;  
        --10�� �ʰ��ϸ� Ż���Ѵ�. 
        exit when (i>10);
    end loop;
    dbms_output.put_line('1~10����������:'|| sumNum);
end;
/

/*
�ݺ���2 : while��
    Basic loop�ʹ� �ٸ��� ������ ���� Ȯ���� �� �����Ѵ�. 
    ��, ���ǿ� ���� �ʴ´ٸ� �ѹ��� ������� ���� �� �ִ�. 
    �ݺ��� ������ �����Ƿ� Ư���� ��찡 �ƴ϶�� exit�� ������� 
    �ʾƵ��ȴ�.
*/
declare
    num1 number := 0;
begin  
    --while�� �������� ������ ���� Ȯ���Ѵ�. 
    while num1<11 loop  
        dbms_output.put_line('�̹����ڴ�:'|| num1);
        num1 := num1 + 1;
    end loop;
end;
/
/*
�ó�����] while loop������ ������ ���� ����� ����Ͻÿ�.
*
**
***
****
*****
*/
--����]2���� while loop�� ���� ����(Java�� ������ ���)
declare
    starStr varchar2(100); 
    i number := 1;
    j number := 1;
begin
    while i<=5 loop
        while j<=5 loop
            starStr := starStr || '*';  
            exit when(j<=i);
            j := j + 1;
        end loop;
        dbms_output.put_line(starStr);
        i := i + 1;        
        j := 1;
    end loop;
end;
/
--���ļ���]�ݺ��� 1���� ������ ��� 
declare  
    --*�� �����ؼ� ������ ������ ������ �����Ѵ�. 
    starStr varchar2(100); 
    --�ݺ��� ���� ���� 
    i number := 1;
begin
    --5�� �ݺ��Ѵ�. 
    while i<=5 loop
        --�ݺ��� ������ *�� ������ �����Ѵ�. 
        starStr := starStr || '*';  
        /* PL/SQL���� �ٹٲ��� ���� print()���� ������ �����Ƿ�
        �̿� ���� ���ڿ��� ������Ų �� ����ؾ��Ѵ�. */
        dbms_output.put_line(starStr);
        i := i + 1;        
    end loop;
end;
/

/*
�ó�����] while loop������ 1���� 10������ ������ ���� ���ϴ� 
    ���α׷��� �ۼ��Ͻÿ�. 
*/
declare
    i number := 1;
    total number := 0;
begin
    while i<=10 loop --����
        total := total + i;
        i := i + 1;--������
    end loop;
    dbms_output.put_line('1~10��������:'|| total);
end;
/

/*
�ݺ���3 : for��
    �ݺ��� Ƚ���� �����Ͽ� ����� �� �ִ� �ݺ�������, �ݺ��� ���� ������
    ������ �������� �ʾƵ��ȴ�. �׷��Ƿ� Ư���� ������ ���ٸ� 
    �����(declare)�� ������� �ʾƵ� �ȴ�. 
*/
declare  
    -- ����ο� ������ ������ ����. 
begin 
    -- �ݺ��� ���� ������ ������ ������� for������ ����Ҽ��ִ�. 
    for num2 in 0 .. 10 loop
        dbms_output.put_line('for��¯�ε�:'|| num2);
    end loop;
end;
/ 

--���������� �ʿ���ٸ� declare�� ������ �� �ִ�. 
begin     
    for num3 in reverse 0 .. 10 loop
        dbms_output.put_line('�Ųٷ�for��:'|| num3);
    end loop;
end;
/ 

/*
��������] for loop������ �������� ����ϴ� ���α׷��� �ۼ��Ͻÿ�. 
*/
--�ٹٲ� �Ǵ� ���� 
begin
    --�ܿ� �ش��ϴ� ����
    for dan in 2 .. 9 loop
        dbms_output.put_line(dan ||'��');
        --���� �ش��ϴ� ���� 
        for su in 1 .. 9 loop
            dbms_output.put_line(dan ||'*'|| su ||'='|| (dan*su));
        end loop;
    end loop;
end;
/

--�ٹٲ� ���� �ϳ��� �ܾ� ��µǴ� ���� 
declare
    --�����ܿ��� �ϳ��� ���� �����ϱ� ���� ������ ���� ���� 
    guguStr varchar2(1000);
begin
    --�ܿ� �ش��ϴ� ���� 
    for dan in 2 .. 9 loop
        --���� �ش��ϴ� ���� 
        for su in 1 .. 9 loop
            /* �ϳ��� ���� ������ ������ �����ؼ� �����Ѵ�. ������
            �κп��� ���⸦ ���� �����̽��� �ϳ� �߰����ش�. */
            guguStr := guguStr || dan||'*'||su||'='||(dan*su)||' ';
        end loop;
        --�ϳ��� ���� ��� �����Ǹ� ��� ����Ѵ�. 
        dbms_output.put_line(guguStr);
        --�� ���� ���� �����ϱ� ���� �ʱ�ȭ�Ѵ�. 
        guguStr := '';
    end loop;
end;
/

/*
Ŀ��(Cursor)
    : select ���忡 ���� �������� ��ȯ�Ǵ� ��� �� �࿡ �����ϱ� ���� 
    ��ü
    ������] Cursor Ŀ���� Is
               Select ������. �� into���� ���� ���·� ����Ѵ�. 
            
    Open Cursor 
      : ������ �����϶�� �ǹ�. �� Open�Ҷ� Cursor������� select������
    ����Ǿ� ������� ��Եȴ�. Cursor�� �� ������� ù��°�࿡ 
    ��ġ�ϰԵȴ�. 
    Fetch~Into~
      : ����¿��� �ϳ��� ���� �о���̴� �۾����� ������� ����(Fetch)
    �Ŀ� Cursor�� ���������� �̵��Ѵ�. 
    Close Cursor
      : Ŀ�� �ݱ�� ������� �ڿ��� �ݳ��Ѵ�. select������ ��� ó����
    �� Cursor�� �ݾ��ش�. 

    Cursor�� �Ӽ�
      %Found : ���� �ֱٿ� ����(Fetch)�� ���� Return�ϸ� True, 
        �ƴϸ� False�� ��ȯ�Ѵ�. 
      %NotFound : %Found�� �ݴ��� ���� ��ȯ�Ѵ�. 
      %RowCount : ���ݱ��� Return�� ���� ������ ��ȯ�Ѵ�. 
*/
/*
�ó�����] �μ����̺��� ���ڵ带 Cursor�� ���� ����ϴ� PL/SQL����
    �ۼ��Ͻÿ�.
*/
declare  
    --�μ����̺��� ��ü�÷��� �����ϴ� ���������� �����Ѵ�. 
    v_dept departments%rowtype;   
    /* Ŀ������ : �μ����̺��� ��� ���ڵ带 ��ȸ�ϴ� select������
    into ���� ���� ���·� �������� �ۼ��Ѵ�. ������ �������� cur1��
    ����ȴ�. */
    cursor cur1 is
        select 
            department_id, department_name, location_id
        from departments;
begin 
    /* �ش� �������� �����ؼ� �����(ResultSet)�� �����´�. 
    ������̶� ����(����)���� ������ �� ��ȯ�Ǵ� ���ڵ��� �����
    ���Ѵ�. */
    open cur1; 
    
    --basic���������� ���� ������� ������ŭ �ݺ��Ͽ� �����Ѵ�. 
    loop  
        --fetch�� ����� ���������� ���� �����Ѵ�. 
        fetch cur1 into 
            v_dept.department_id,
            v_dept.department_name,
            v_dept.location_id;
        
        --Ż���������� �� �̻� ������ ���� ������ exit�� ����ȴ�. 
        exit when cur1%notfound;
        
        dbms_output.put_line(v_dept.department_id||' '||
                                v_dept.department_name||' '||
                                v_dept.location_id);
    end loop;--basic loop���� ����
        
    dbms_output.put_line('��������ǰ���:'|| cur1%rowcount);
    --Ŀ���� �ڿ� �ݳ� 
    close cur1;
end;
/

/*
�ó�����]  Cursor�� ����Ͽ� ������̺��� Ŀ�̼��� null�� �ƴ� ����� 
�����ȣ, �̸�, �޿��� ����Ͻÿ�. 
��½ÿ��� �̸��� ������������ �����Ͻÿ�.
*/
--��������� �����ϸ� �� 35���� ���ڵ尡 ����ȴ�. 
select employee_id, first_name, salary
from employees where commission_pct is not null 
order by first_name asc;

--Cursor�� �ִ� PL/SQL�� �ۼ� 
declare     
    --�ۼ��� ������ ���� Ŀ���� �����Ѵ�. 
    cursor curEmp is
        select employee_id, last_name, salary
        from employees
        where commission_pct is not null
        order by last_name asc;
    --������̺��� ��ü�÷��� �����ϴ� �������� ����     
    varEmp employees%rowType;
begin  
    --Ŀ���� �����ؼ� �������� ���� 
    open curEmp;      
    loop 
        --basic loop���� ���� Ŀ���� ����� ������� �����Ѵ�.
        fetch curEmp 
            into varEmp.employee_id, varEmp.last_name, varEmp.salary;
        
        --������ ������� ������ loop���� Ż���Ѵ�.  
        exit when curEmp%notFound;
        dbms_output.put_line(varEmp.employee_id ||' '||
                                varEmp.last_name||' '||
                                varEmp.salary);            
    end loop; 
    --Ŀ���� �ݾ� �ڿ��� �ݳ��Ѵ�. 
    close curEmp;
end;
/



