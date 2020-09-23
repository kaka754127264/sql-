create table TBUser
(
	UIID CHAR(6) PRIMARY KEY,
	UNAME VARCHAR(20)NOT NULL,
	UPHONE VARCHAR(20)NOT NULL,
	USEX CHAR(2)CHECK ( USEX='ÄÐ'or USEX= 'Å®'),
	UADDRESS VARCHAR(50)NOT NULL
)
	
	select * from TBUser
	select * from TBShop
	select * from TBOrder
	select * from TBType

	delete from TBUser
	drop table TBUser
	drop table TBShop
	drop table TBOrder
	drop table TBType

create table TBType
(
	FID CHAR(6) PRIMARY KEY,
	FNAME VARCHAR(20),
	FOPRICE DECIMAL(8,2)CHECK(FOPRICE>0),
	FNUM DECIMAL(8,2)CHECK(FNUM>0)
)

create table TBOrder
(
	SID CHAR(60)PRIMARY KEY,
	SNAME VARCHAR(20)NOT NULL,
	FID CHAR(6)REFERENCES TBType(FID)

)
create table TBShop
(
	SNAME VARCHAR(20)NOT NULL,
	FID CHAR(6)REFERENCES TBType(FID)
)