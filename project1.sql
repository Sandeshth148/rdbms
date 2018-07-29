create database scholarshipp
 use scholarshipp;

 CREATE TABLE scholar (
  schid varchar(5) NOT NULL primary key,
  criter text NOT NULL,
  schamt int
);
alter table scholar add schamt int;
insert into scholar values ('SH001','STUDENT:Orphan,SSLC&&PUC%>=75',100000);
insert into scholar values ('SH002','MERIT:SPORT:INTERNATIONAL,SSLC&&PUC%>=90,INCOME<=250000',80000);
insert into scholar values ('SH003','CATEGORY:SC/ST,SSLC%>=70&&PUC%>=65,INCOME<=250000',60000);
insert into scholar values ('SH004','FEE CONCESSION:CATEGORY:OBC,SSLC&&PUC%>=80,INCOME<=250000',40000);
insert into scholar values ('SH005','SPORT:NATIONAL,SSLC&&PUC%>=60 & <89,INCOME<=250000',20000);
insert into scholar values ('SHXXX','NOT eligible:DISSATISFIED with the criteria',00000);
select * from scholar;

select criter,schamt from scholar where schid='SHXXX'
drop table scholar 


 CREATE TABLE college (
  collid varchar(6) NOT NULL primary key,
  collnme text NOT NULL,
  caddr text NOT NULL,
  phoneno varchar(10) NOT NULL CHECK (phoneno between '0000000000' AND '9999999999'),
  couoff text NOT NULL
);
insert into college values ('COLID1','STANFORD UNIVERSITY ','STANFORD','9886877978','BE');
insert into college values ('COLID2','HARVARD UNIVERSITY','CAMBRIDGE','8686868686','BE');
insert into college values ('COLID3','IMPERIAL COLLEGE','LONDON','7778889991','MBBS');
select * from college;
drop table college  

drop table application 

 CREATE TABLE application (
  appid varchar(15) NOT NULL UNIQUE,
  aadhar varchar(12) NOT NULL UNIQUE CHECK (aadhar between '000000000000' AND '999999999999'),
  sname varchar(100) NOT NULL,
  fname VARCHAR(100) ,
  mname VARCHAR(100) ,
  guardian VARCHAR(100),
  orphan varchar(6) NOT NULL,
  addres text NOT NULL,
  gen text NOT NULL,
  course varchar(5) NOT NULL,
  collid varchar(6) NOT NULL,
  DOB date NOT NULL CHECK (DOB between '1995-01-01' and '2000-01-31'),
  sslper varchar(3) NOT NULL ,
  puper varchar(3) NOT NULL,
  sports text NOT NULL,
  caste text NOT NULL,
  category text NOT NULL,
  income varchar(9) NOT NULL,
  schid varchar(5) NOT NULL,
  phone text NOT NULL,
  email text NOT NULL,
  bname text NOT NULL,
  baccn varchar(20) NOT NULL UNIQUE,
  doc text NOT NULL,
    primary key (appid,collid,schid),
  CONSTRAINT UNI
  UNIQUE(baccn,aadhar,appid),
  CONSTRAINT CID
  foreign key (collid) references college(collid) on delete cascade on update cascade,
  CONSTRAINT SHID
					  foreign key (schid) references scholar(schid) on delete cascade on update cascade,
);
select * from application;
insert into application  values ('S04112017120000','111122223333','NIKHIL M','MANJUNATH','MANJULA','NULL','false','KARKALA-573210'
,'male','BE','COLID1','1997-08-12','92','94','INTERNATIONAL','hindu','SC/ST','250000','SH002','9078654321','kh@gmail.com','hdfc','098765432123456','abc.rar');

insert into application  values ('S04112017120101','111122223335','RAHUL','RAVI B','KAMALA','NULL','false','TUMKUR-573200'
,'male','BE','COLID1','1996-09-22','90','80','NATIONAL','hindu','SC/ST','400000','SH003','9078654891','kLh@gmail.com','SBM','0987654321289','abIUK.rar');

insert into application  values ('S04112017120202','111122223338','RAGHU','RAMKRISHNA','LAKSHMI','NULL','false','KITTUR-573000'
,'male','BE','COLID1','1997-10-12','90','80','NATIONAL','hindu','SC/ST','250000','SH004','907865908','khPOP@gmail.com','SBI','098765432123406','abJOLc.rar');

insert into application  values ('S04112017120303','111122240637','SITA','JANAKA','RANI','NULL','false','MYSORE-575510'
,'female','MBBS','COLID2','1998-12-31','75','80','NATIONAL','hindu','OBC','250000','SH005','9078688888','kWQWh@gmail.com','VIJAYA','0987654321234444','abAEc.rar');

insert into application  values ('S04112017120404','111122224444','RATHI','VISHNU','LATHA','NULL','false','BANGALORE-583210'
,'female','MBBS','COLID2','1997-06-02','70','70','NONE','hindu','GEN','250000','SHXXX','9078690899','kWERh@gmail.com','SYND','0987654321234565','abcST.rar');

insert into application  values ('S04112017120505','111144443333','NIKHILRAJ','NULL','NULL','KAMESHAPPA','true','KAKAD-570010'
,'male','MBBS','COLID3','1997-08-12','90','80','INTERNATIONAL','hindu','SC/ST','100000','SH001','8478654321','khM@gmail.com','CANARA','098765432127890','abcQ22.rar');

insert into application  values ('S04112017120606','111122225555','PUSPHIL','RAMESH','ROOPA0','NULL','false','MANGALORE-588210'
,'male','BE','COLID3','1997-04-12','70','70','NONE','MUSLIM','OBC','300000','SHXXX','873254321','kFGHHh@gmail.com','KARNATAKA','09876540003456','abcRTW.rar');

insert into application  values ('S04112017120707','111122678833','DARDAE','CHANNABASAVAPPA','KAVITHA','NULL','false','CALIFORNIA-987654','male','MBBS'
,'COLID1','1998-01-16','90','98','INTERNATIONAL','hindu','GEN','200000','SH002','9078974321','khRR@gmail.com','FEDERAL','0987654344490896','abc345.rar');

insert into application  values ('S04112017120808','111122678834','MANOJ','SANTHOSH','ROJA','NULL','false','HASSAN-573990','male','MBBS'
,'COLID2','1997-10-12','75','80','NATIONAL','hindu','GEN','210000','SH005','9078974321','khIURR@gmail.com','AXIS','0987654364490896','abc345.RAR');

insert into application  values ('S04112017120909','888122225555','PAVITHRA','RAMAPPA','RIYA','NULL','false','UDUPI-580210'
,'male','BE','COLID1','1998-07-10','70','70','NONE','JAIN','OBC','300000','SHXXX','803254321','kF98GHHh@gmail.com','UNITED BANK','098765400030989','abcRTWER.rar');

SELECT * FROM application where schid like 'SH0__';


SELECT * FROM application where  schid like 'SHX__'  order by sname;

SELECT * FROM application where schid='SH001';

SELECT * FROM application where schid='SH002' order by sname;

SELECT * FROM application where schid='SH003' order by sname;

SELECT * FROM application where schid='SH004' order by sname;

SELECT * FROM application where schid='SH005' order by sname;

SELECT * FROM application where collid='COLID1' and schid like 'SH0__'  order by sname;

SELECT * FROM application where collid='COLID1' and schid like 'SHX__'  order by sname;

SELECT * FROM application where collid='COLID2' and schid like 'SH0__'  order by sname;

SELECT * FROM application where collid='COLID2' and schid like 'SHX__'  order by sname;

SELECT * FROM application where collid='COLID3' and schid like 'SH0__'  order by sname;

SELECT * FROM application where collid='COLID3' and schid like 'SHX__'  order by sname;

SELECT * FROM application where course='BE' and schid like 'SHX__'  order by sname;

SELECT * FROM application where course='BE' and schid like 'SH0__'  order by sname;

SELECT * FROM application where course='MBBS' and schid like 'SHX__'  order by sname;

SELECT * FROM application where course='MBBS' and schid like 'SH0__'  order by sname;


select A.sname,A.addres,C.collnme,B.criter,B.schamt
 FROM application A,college C,scholar B
  where A.collid=C.collid and A.schid=B.schid and appid='S04112017120404' and aadhar='111122224444';