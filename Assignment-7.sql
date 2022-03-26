||MAHARSHII BANERJEE THAKURTA_05_CSE||
||ASSIGNMENT - 7||

create table EMP1452125(EMPNO number,
					ENAME varchar2(10),
					JOB char(15),
					MGR number,
					HIREDATE date,
					SAL number,
					COMM number,
					DEPT_NAME number);
insert into EMP1452125 values(&EMPNO,'&ENAME','&JOB',&MGR,'&HIREDATE',&SAL,&COMM,&DEPTNO);

#1
select ENAME from EMP1452125 where SAL = (select max(SAL) from EMP1452125);
#2
select ENAME from EMP1452125 where SAL = (select max(SAL) from EMP1452125 where JOB = 'Salesman');
#3
select ENAME from EMP1452125 where SAL = (select min(SAL) from EMP1452125 where JOB = 'Clerk');
#4
select DEPT_NAME from EMP1452125 having avg(SAL) = (
	select max(AVG) from (
	select DEPT_NAME ,avg(SAL) as "AVG" from EMP1452125 group by DEPT_NAME)) group by DEPT_NAME;
#5
select ENAME from EMP1452125 where SAL > (select SAL from EMP1452125 where ENAME = 'Turner');
#6
select ENAME from EMP1452125 where HIREDATE > (select HIREDATE from EMP1452125 where ENAME = 'Allen');
#7
select DEPT_NAME from EMP1452125 where ENAME = 'Ford';
#8
select DEPT_NAME from EMP1452125 where SAL = (select max(SAL) from EMP1452125);
#9
select LOC from DEPT_15 where DEPTNO = (select DEPT_NAME from EMP1452125 where ENAME = 'Smith');
#10
select LOC from DEPT_15 where DEPTNO in (select DEPT_NAME from EMP1452125 where JOB = 'Manager');
#11
select SAL from EMP1452125 where ENAME='Martin';
#12
select ENAME from EMP1452125 where SAL > (
	select max(SAL) from EMP1452125 where DEPT_NAME in (
	select DEPTNO from DEPT_15 where LOC = 'Dallas'));
#13
select DEPT_NAME from EMP1452125 having count(*) = 0 group by DEPT_NAME;
#14
select ENAME from EMP1452125 where HIREDATE = (select HIREDATE from EMP1452125 where ENAME = 'Adams');
#15
select distinct DEPT_NAME from EMP1452125 where COMM <> 0;
#16
select ENAME, SAL from EMP1452125 where SAL in (select min(SAL) from EMP1452125 group by DEPT_NAME);