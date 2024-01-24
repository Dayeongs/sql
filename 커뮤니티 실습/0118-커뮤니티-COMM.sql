create SYNONYM departments for hr.departments;

create SYNONYM employees for hr.employees;

select
    department_id		as id,
    department_name 	as name
from
    departments
where
    manager_id is not null
order by
    department_id asc;
    
select
    employee_id		as id,
    first_name		as firstName,
    last_name		as lastName,
    hire_date		as hireDate,
    job_id			as jobId,
    salary			as salary
from
    employees
where
    department_id = 10
order by
    employee_id asc;