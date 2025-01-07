
create database contact_manager;

use contact_manager;

# Q.1 Statement to create the Contact table
create table contact
(
contactID int primary key,
CompanyID int,
FirstName varchar(45),
LastName varchar(45),
Street varchar(45),
City varchar(45),
State varchar(45),
Zip varchar(10),
IsMain boolean,
Email varchar(45),
Phone varchar(45)
);

#Q.2 Statement to create the Employee table
create table Employee
(
EmployeeID int primary key,
FirstName varchar(45),
LastName varchar(45),
Salary decimal(10,2),
HireDate date,
JobTitle varchar(45),
Email varchar(45),
Phone varchar(12)
);

#Q.3 Statement to create the ContactEmployee table
create table ContactEmployee
(
ContactEmployeeID int primary key,
ContactID int,
EmployeeID int,
ContactDate date,
Descriptions varchar(100)
);
insert into employee (EmployeeID,FirstName,LastName,salary,hiredate,jobtitle,email,phone)
values (1,"Lesley","Bland's",59688.03,20240815
,"data analytics", "lesleybland50@gmail.com", 1234567890);

update employee set JobTitle = "data analytics" where EmployeeID = 1 ;

#Q.4 In the Employee table, the statement that changes Lesley Bland's phone number to 215-555-8000.
update employee set Phone = 2155558800 where FirstName = 'Lesley' ;

#Q.5 In the company table, the statement that changes the name of "Urban Outfitters, Inc." to "Urban Outfitters".
create table company
(
CompanyID int primary key,
CompanyName varchar(45),
Street varchar(45),
City varchar(45),
State varchar(45),
Zip varchar(10)
); 
insert into company values (5,"Urban Outfitters,Inc.","maninagar",
"ahmedabad","Gujarat","382356");

update company set CompanyName = "Urban Outitters" where CompanyID = 5;

#Q.6 In contactemployee table, the statement that removes Daianne Connor's contact event with jack lee.

insert into employee values (3,"Jack Lee", "Jong",56800.00,"2024-05-08","PHP",
"jacklee1@gmail.com","9897564351");
insert into contact values (8, 10,"Dianne","Connor","balmukund","raipur",
"CG",382365,1,'dianneconnor85@gmail.com','9825528700');

insert into contactemployee values (11,8,3,"2024-12-31","positive");

delete from contactemployee where contactid = (select contactid from contact
where firstname = "Dianne") and employeeid = (select employeeid
from employee where firstname = "jack lee");


/*Q.7 write the SQL SElECT query that displays the names of the
employees that have contacted Toll Brothers (one statement).
Run the SQL SELECT query in MySQL Workbench. Copy the results below
as well. */

select * from employee, company, contactemployee, contact
where (employee.employeeid = contactemployee.employeeid) and 
(contactemployee.contactid = contact.contactid) and 
(company.companyname = "Toll brothers");





/*Q.8 What is the significance of "%" and "_" operators in the Like statement?

Ans:  % Represents zero or more characters. It is used as a wildcard to match
any sequence of characters.
Example: Where name Like "jo%" matches "Hohn", "Hohn", etc.
		_: Represents exactly one character. It issued to match a single character
        in a specific position.
        Example: Where Name Like 'J_n' matches "Jan", "jon", etc
	*/

/*Q.9 Explain normalization in the contex of databases.

Ans. Normalization in databases is the process of organizing data to reduce
redundancy and improve efficiency. It involves breaking down a large table
into smaller, ralated tables and defining relationships between them. The 
goal is to ensure that each piece of data is stored only once, which reduce the 
risk of inconsistencies. For example, instead of storing customer details in
every order record, a separate customer table is created and linked to the
orders table. Normalization follows rules called normal forms, each aiming
to eliminate specific types of redundancy and dependency. This makes the 
database more organized, easier to maintain, and scalable.alter
*/

#Q.10 What does a join in MySQL mean?
 /*Ans. A join in MYSQL is used to combine data from two or more tables based 
 on a related column. It allows you to retrieve connected information from
 different tables in a single query. For example, if you have a table for 
 customers and another for orders, you can use a JOIN to find which customer
 placed which order.

*/

#Q.11 What do you understand about DDL, DCL, and DML in MySQL?

/*
DDL (Data Definition Language): Used to define or modify the structure
 of a database and its objects (like tables and indexes).
 Examples: CREATE, ALTER and DROP
 
 DML (Data Manipulation Language): Used to interact with the data
 inside tables.
 Examples: INSERT, UPDATE, DELETE and SELECT
 
 DCL (Data Control Language): Used to control access to the database. 
 Examples: GRANT and REVOKE
 */
 
 #Q.12 What is the role of the MySQL JOIN clause in a query, and what are some common types of joins? 
 /* Ans. The MYSQL Join Clause is used in a query to combine rows from two or more 
 tables based on a related column, allowing you to work with data spread across
 multiple tables. It helps fetch meaningful results by linking the tables
 logically. 
  Common types of joins include:
 INNER JOIN : Returns rows with matching data in both tables.
 LEFT JOIN : Returns all rows from the left table and matching rows 
 from the right table (or Null if no match).
 RIGHT JOIN : Similar to LEFT JOIN but includes all rows from the right table.
 FULL JOIN : Combines LEFT and RIGHT JOIN to include all rows from both tables.
 */
 
 