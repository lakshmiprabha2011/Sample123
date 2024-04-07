use lb5thNov

---- Rules to keep the data in a structured manners and avoid analomies
--- SQL Constraints

Select *from Emp


---1. Primary key-- (Unique and Not null)

--- Let's find out who joined on 2012-03-15 (15th March 2012)

select *from emp
where doj='2012-03-15'

--- let's find out the eligible field  for primary key 
--- Doj?-- NE
---DOB?/- NE
---Email?-NE
--Phone??- may or may not
--City??- NE
--addr1 & Addr2?- NE
--Name??- NE
--EID -- Eligible

--- How to set a primary key constraint in a table
-- syntax- alter table table_name add constraint constraint_name constraint_type (column)
-- You can have only on primary key in a table

Alter table emp
add constraint prk001 Primary key(EID)

alter table emp
drop constraint prk001

--- Not Null constraint- which defines the rule on a column that , won't accept the null value
--- syntax- alter table table_name alter column column_name dtype(limit) Not Null
-- I am changing the behaviour of accepting the value on DOB column (from Null to Not Null)

alter table emp
alter column DOB date not null 

--- let's validate the constraint (Primary key)

select *from emp
where EID='E1120'

insert into emp
values('',' Sagar Thapliyal', '12 Cross road','ITI layout','Bangalore','8754646466','erf@gmail.com','1989-07-26','2020-05-11')

delete from emp
where EID=''

--- so we need to provide one more constraint which ensure the condition should match or with the negation vice versa

--Check constraint--
alter table emp
add constraint ckh01 check(EID not like '['']%')  

--- assignment-- need to provide the check constraint on EID column to avoid any insertion for other than
-- A-Z0-9

--- I want to provide the check constraint for DOb as well
-- where DOB should not be lesser than '1980-01-04'

select min(dob) from emp

alter table emp
add constraint ck001 Check(DOB>='1980-01-04')

--- Validate the Check constraint

INSERT INTO emp
VALUES ('E1181', 'Sagar Thapa', '11 Cross road', 'ITI layout', 'Bangalore', '8750646466', 'e1f@gmail.com', '1979-05-26', '2020-05-11')


---- this recruitment is for other cities, do not accept the forms from Ranchi

alter table emp
add constraint ckcity check(city !='Ranchi')

INSERT INTO emp
VALUES ('E1181', 'Sagar Thapa', '11 Cross road', 'Palam vihaar%', 'Delhi', '8750646466', 'e1f@gmail.com', '1989-05-26', '2020-05-11')

select *from emp

alter table emp
add constraint ckaddr check (addr2 !='Palam vihar%')

-- Default Constraint
--- company assigned the temp deprt as default depart for new joinees
-- if user is not providing a value explicitly then sql filled up the values assigned as a default value
select *from emp_sal

--- add default constraint

alter table emp_sal
add constraint dfdept default 'temp' for Dept

-- Validate the Default constraint

insert into emp_sal(EID,Desi,Salary)
values('E1165','Trainee',25000)


--- Unique- accepting the unique values , there is a difference in unique and Primary key. i,e. Priamry key won't accept Null
-- but Unique does(becasue Null itself considered a unique value-

alter table emp
add constraint unq unique(Phone)

select *from emp

INSERT INTO emp
VALUES ('E1181', 'Sagar Thapa', '11 Cross road', 'Palam vihaar II', 'Delhi', '8754646466', 'e1f@gmail.com', '1989-05-26', '2020-05-11')

--- foreign key-- reference key - to create the child and parent relationship between two tables

select *from emp
select *from emp_sal

select max(EID) from emp
select max(EID) from Emp_sal


Insert into emp_sal
values('E1181','HR','manager',75000)

delete from emp_sal
where eid='E1181'


--- how to restrict this-- for of now SQL doesn't find any relation between two tables, so it is accepting the record

-- to avoid such kind entries through the Child table-- we create a relation-- by creating a foreign key into the child table

alter table emp_salary
add constraint fkeid foreign key(EID) references Emp(EID)

--- Count clause- which count the not null values 

select count(*) from Emp

SELECT COUNT(salary)
FROM Emp_sal

select *from emp_sal
where salary is null

use lb6jan

alter table emp_sal
add constraint fkeid foreign key(EID) references Employee(EID)

-- validate the foreign key

insert into emp_sal
values('E1161','HR','Manager',75000)

