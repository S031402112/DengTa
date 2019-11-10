create database if not exist pharos3;
use pharos3;

/*用户表*/
create table if not exist `users`(
	/*用户id*/ `usersid` int,
	/*姓名*/ `name` char(20) not null, 
	/*性别*/ `sex` char(2) check(sex in (`男`,`女`)),
	/*高中生&本科生&管理员标记*/ `label` char,
	/*生日*/ `birthday` date,
	/*年龄*/ `age` int,
	/*专业*/ `major` char(20),
	/*学校*/ `userschool` char(20),
	`usermajor` char(20),
	`direction` char(20),
	/*用户名*/ `usersnam` char(20),
	/*密码*/ `passwords` char(20),
	/*封禁标志*/ `ban` int,
	 PRIMARY KEY ( `usersid` )
);

/*学习计划映射表*/
create table `userstolearnplan`(
	/*用户id*/`usersid` int,
	/*学习计划表id*/`learnplanid` int,
	 PRIMARY KEY ( `usersid` )
);

/*学习计划表*/
create table `learnplan`(
	/*标题名称*/`learnplantitle` char(20),
	/*起始时间*/`learnplanbegin` datetime,
	/*结束时间*/`learnplanend` datetime,
	/*学习计划拥有者id*/`learnplanownerid` int,
	/*学习计划表id*/`learnplanid` int,
	/*学习的专业方向*/`learnplanmajor` char(20),
	/*当前实施的学习计划id*/`learnplandoingid` int,
	/*置顶标记*/`toplabel` int,
	/*进度标记*/`advance` char(20),
	/*学习计划内容大纲*/`content` char(200),
	 PRIMARY KEY ( `learnplanid` )
);

/*管理员*/
create table `administer`(
	usersid int,
	/*帐户名*/`usersname` char(20),
	/*密码*/`passwords` char(20),
	 PRIMARY KEY ( `usersid` )
);

/*其他人的学习计划展示园地*/
create table `otherlearnplan`(
	/*学习计划表id*/`learnplanid` int,
	/*浏览数*/`viewnumber` int,
	/*点赞数*/`likenumber` int,
	/*评论数*/`commentnumber` int,
	/*评论内容*/`comment` char(200),
	/*楼层*/`floors` int,
	/*回复楼层标记*/`replylabel` int,
	/*关注他人id*/`watch` int,
	 PRIMARY KEY ( `learnplanid` )
);

/*权限表*/
create table `powers`(
	/*角色id*/`roleid` int,
	/*权限等级*/`powerslevel` int,
	/*权限类型*/`powersstyle` int,
	/*权限范围*/`powersarea` char(20),
	 PRIMARY KEY ( `roleid` )
);

/*点赞表*/
create table likes(
	/*计划表表主id*/`learnplanid` int,
	/*用户id*/`usersid` int,
	 PRIMARY KEY ( `learnplanid` )
);



/*学习计划子表*/
create table `learnplanperiod`(
	/*阶段标题名称*/`learnplanperiodtitle` char(20),
	/*阶段起始时间*/`learnplanperiodbegin` datetime,
	/*阶段结束时间*/`learnplanperiodend` datetime,
	/*第几个阶段标示*/`periodlabel` int,
	/*学习计划子表id*/`learnplanperiodid` int,
	/*阶段学习计划内容大纲*/`periodcontent` char(200),
	/*学习计划的点赞数*/`periodlikes` int,
	/*签到标记*/`signinlabel` int,
	/*图片*/`picture` LONGTEXT,
	/*学习感悟*/`gains` char(200),
	/*音乐*/`music` LONGTEXT,
	 PRIMARY KEY ( `learnplanperiodid` )
);

/*评论*/
create table `forum`(
	/*学习计划表表主id*/`learnplanownerid` int,
	/*评论者id*/`usersid` int,
	/*评论楼层*/`usersfloor` int,
	/*评论内容*/`comment` char(200),
	/*评论时间*/`commenttime` time,
	 PRIMARY KEY ( `usersid` )
);








