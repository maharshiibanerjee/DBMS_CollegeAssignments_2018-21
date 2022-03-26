

create table salespeople1452125(SNUM number primary key,
							SNAME varchar2(20),
							CITY varchar2(20),
							COMM number);
create table customer1452125(CNUM number primary key,
						CNAME varchar2(20),
						CITY varchar2(20),
						RATING number,
						SNUM number references salespeople1452125(SNUM));
create table order_15(ONUM number primary key,
						AMT number,
						ODATE date,
						CNUM number references customer1452125(CNUM),
						SNUM number references salespeople1452125(SNUM));
insert into salespeople1452125 values(1001, 'Peel', 'London', 0.12);
insert into salespeople1452125 values(1002, 'Serees', 'SanJose', 0.13);
insert into salespeople1452125 values(1003, 'Motika', 'London', 0.11);
insert into salespeople1452125 values(1004, 'Rifkin', 'Barcelona', 0.15);
insert into salespeople1452125 values(1005, 'Amelrood', 'New York', 0.10);

insert into customer1452125 values(2001, 'Hoffman', 'London', 100, 1001);
insert into customer1452125 values(2002, 'Giovanni', 'Rome', 200, 1003);
insert into customer1452125 values(2003, 'Lill', 'San Junipere', 200, 1002);
insert into customer1452125 values(2004, 'Gass', 'Berlin', 300, 1002);
insert into customer1452125 values(2005, 'Clemens', 'London', 100, 1001);
insert into customer1452125 values(2006, 'Cineros', 'SanJose', 300, 1005);
insert into customer1452125 values(2007, 'Pereira', 'Rome', 100, 1004);

insert into order_15 values(3001, 18.69, '10-Mar-90', 2006, 1005);
insert into order_15 values(3003, 767.19, '10-Mar-90', 2001, 1001);
insert into order_15 values(3002, 1901.10, '10-Mar-90', 2007, 1004);
insert into order_15 values(3005, 5160.45, '10-Mar-90', 2003, 1002);
insert into order_15 values(3006, 1698.16, '10-Mar-90', 2006, 1005);
insert into order_15 values(3009, 1713.23, '10-Apr-90', 2002, 1003);
insert into order_15 values(3008, 75.75, '10-Apr-90', 2004, 1002);

create view view1 as 
	select CNAME from customer1452125
	where RATING = 
	(select max(RATING) from customer1452125);

select * from view1;

create view view2 as
	select city, count(*) as "NUMBER" from salespeople1452125 group by CITY;

create view view3 as
	select SNUM, sum(AMT) as "Total", avg(AMT) as "AVERAGE" from order_15
	group by SNUM;

create view view4 as
	select salespeople1452125.SNAME, customer1452125.CNAME from salespeople1452125, customer1452125
	where salespeople1452125.SNUM = customer1452125.SNUM;

create view salespeople_customer_orders as
	select salespeople1452125.SNAME, customer1452125.CNAME, order_15.ONUM
	from salespeople1452125, customer1452125, order_1
	where salespeople1452125.SNUM = order_15.SNUM and customer1452125.CNUM = order_15.CNUM;

create view salespeople as
	select SNUM, COMM from salespeople1452125;
insert into salespeople values(1006,0.17);
update salespeople set COMM = 100 where COMM > 0.1 and COMM < 0.15;