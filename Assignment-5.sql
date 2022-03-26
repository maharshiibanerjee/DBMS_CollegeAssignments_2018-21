

CREATION OF TABLE:

ZIPCODES TABLE:-
Create table Zipcodes(Zip Number(6) Primary Key,
City Varchar2(15));

EMPLOYEES TABLE:-
Create table Employees(Eno Number(3) Primary Key,
Ename Varchar2(25),
Zip Number(6) references Zipcodes(Zip) on delete cascade,
Hdate Date);

PARTS TABLE:-
Create table Parts(Pno Number(5) Primary Key,
Pname Varchar2(9),
Qoh Number(4),
Price Number(6),
Lvl Number(2));

CUSTOMERS TABLE:-
Create table Customers(Cno Number(3) Primary Key,
Cname varchar2(25),
Street Varchar2(30),
Zip Number(6) references Zipcodes(Zip) on delete cascade,
Phone Number(10));

ORDERS TABLE:-
Create table Orders(Ono Number(4) Primary Key,
Cno Number(3) references Customers(Cno) on delete cascade,
Eno Number(3) references Employees(Eno) on delete cascade,
Received Date,
Shipped Date);

ODETAILS TABLE:-
Create table Odetails(Ono Number(4) references Orders(Ono) on delete cascade,
Pno Number(5) references Parts(Pno) on delete cascade,
Qty Number(3));


INSERTION OF VALUES:

ZIPCODES TABLE:-
insert into Zipcodes values(700001,'Kolkata');
insert into Zipcodes values(736101,'Coochbehar');
insert into Zipcodes values(712246,'Hooghly');

EMPLOYEES TABLE:-
insert into Employees values(700,'Raj',700001,'18-Feb-2010');
insert into Employees values(704,'Abhishek',736101,'20-Dec-2012');
insert into Employees values(710,'Paul',712246,'07-March-2011');

PARTS TABLE:-
insert into Parts values(11200,'Mobile',100,65,10);
insert into Parts values(11201,'Cover',35,15,5);
insert into Parts values(11302,'Pendrive',20,25,3);
insert into Parts values(11303,'Memory Card',15,12,5);

CUSTOMERS TABLE:-
insert into Customers values(201,'Samrat','B.R Street',712246,8319745628);
insert into Customers values(203,'Rik','R Avenue',736101,78496582117);
insert into Customers values(204,'Arka','Deshbandu road',700001,8547961459);
insert into Customers values(207,'Sagnik','Vidyasagrar road',736101,6489321456);

ORDERS TABLE:-
insert into Orders values(110,204,700,'10-Apr-17','17-Apr-17');
insert into Orders values(111,201,704,'01-Apr-17',NULL);
insert into Orders values(112,204,710,'12-Apr-17','16-Apr-17');
insert into Orders values(115,207,707,'15-Apr-17',NULL);

ODETAILS TABLE:-
insert into Odetails values(110,11200,3);
insert into Odetails values(115,11202,1);
insert into Odetails values(111,11302,2);
insert into Odetails values(112,11200,1);
insert into Odetails values(110,11302,1);


QUERIES:-

select Pno,Pname from Parts where Price<20;

select distinct(Pno) from Parts;

select * from Customers where Cname like 'S%';

select Ono,Cname from Orders,Customers where
Shipped is NULL and
Customers.Cno=Orders.Cno;

select Ename from Employees where Hdate like (select min(Hdate) from Employees);

select Pno,Pname,Price from Parts where Price>20 order by Pno;