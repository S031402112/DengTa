create database pharos;
use pharos;

create table users(
	usersid int primary key,
	studentid int,
	name char(20) not null, 
	sex char(2) check(sex in ('ÄĞ','Å®')),
	label char,
	birthday date,
	age int,
	major char(20),
	college char(20),
	usersname char(20),
	passwords char(20),
	ban int,
	direction char(2000)
);

create table userstolearnplan(
	usersid int,
	learnplanid int
);

create table learnplan(
	learnplantitle char(20),
	learnplanbegin date,
	learnplanend date,
	learnplanowner int,
	learnplanid int,
	learnplanmajor char(20),
	learnplandoingid int,
	toplabel int,
	advance char(20),
	content char(2000)
	
	foreign key (usersid) references users(usersid)
	on delete cascade
	on update cascade,
);

create table administer(
	usersname char(20),
	passwords char(20)
);
	
create table otherlearnplan(
	learnplanid int,
	viewnumber int,
	likenumber int,
	commentnumber int,
	comment char(2000),
	floors int,
	replylabel int,
	watch int
);
	
create table powers(
	roleid int,
	powerslevel int,
	powersstyle int,
	powersarea char(20)
);

create table likes(
	laerbplanid int,
	usersid int
);

create table learnplanperiod(
	learnplanperiodtitle char(20)
	learnplanperiodbegin date,
	learnplanperiodend date,
	periodlabel int,
	periodcontent char(2000)
	periodlikes int,
	signinlabel int,
	picture file,
	gains char(2000),
	music file
);



create table forum(
	learnplanownerid int primary key,
	usersid int,
	usersfloor int,
	comment char(2000),
	commenttime time,
	title char(20) unique not null,
	foreign key (studentid) references student(studentid)
	on delete cascade
	on update cascade,
);
	
