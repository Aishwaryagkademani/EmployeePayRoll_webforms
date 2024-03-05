create database EmployeePayRoll_WebForm_DB

create table EmployeePayRoll(
EmployeeId int primary key identity(1,1),
FullName varchar(50),
ImagePath varchar(50),
Gender varchar(10),
Department varchar(10),
Salary decimal(10,2),
StartDate date,
notes varchar(10)
)

alter proc InsertEmployee(
@FullName varchar(50),
@ImagePath varchar(50),
@Gender varchar(10),
@Department varchar(50),
@Salary dec(10,2),
@StartDate date,
@Notes varchar(10))
as
begin
insert into EmployeePayRoll(FullName,ImagePath,Gender,Department,Salary,StartDate,notes) values 
(@FullName,@ImagePath,@Gender,@Department,@Salary,@StartDate,@Notes)
end

select * from EmployeePayRoll




--Stored procedure for get all employees
create proc GetAllEmployees
as
begin
select * from EmployeePayRoll;
end

create proc login_sp(
@Eid int,
@FullName varchar(50))
as
begin
select * from EmployeePayRoll where EmployeeId=@Eid and FullName=@FullName;
end

--Update employee SP
create procedure UpdateEmployee(
@EmployeeId int,
@FullName varchar(50),
@ImagePath varchar(50),
@Gender char,
@Department varchar(50),
@Salary dec(10,2),
@StartDate date,
@Notes varchar(10)
)
as
begin
update EmployeePayRoll set FullName=@FullName,ImagePath=@ImagePath,Gender=@Gender,Department=@Department,Salary=@Salary,
StartDate=@StartDate,notes=@Notes  
where EmployeeId=@EmployeeId;
end


--stored procedure for deleting by id
create proc DeleteEmployee(
@EmployeeId int )
as 
begin
delete from EmployeePayRoll where EmployeeId=@EmployeeId;
end


--stored procedure for get employee by name or Employee Id
alter proc GetEmpByNameOrId(
@EmployeeId int,
@FullName varchar(50))
as
begin
select * from EmployeePayRoll where  (FullName=@FullName) or( EmployeeId=@EmployeeId);
end