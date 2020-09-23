CREATE TABLE t_user
(
    uiid CHAR(6) PRIMARY KEY,
    uname VARCHAR(20) NOT NULL,
    ubirthday DATETIME,
    usex CHAR(1) CHECK(usex='F' or usex='M'),
    uaddress VARCHAR(50),
    utelephone VARCHAR(20)
)

CREATE TABLE t_type
(
    gtid CHAR(6) PRIMARY KEY,
    gtname VARCHAR(20) NOT NULL
)

CREATE TABLE t_goods
(
    gid CHAR(6) PRIMARY KEY,
    gname VARCHAR(20) UNIQUE,
    gtid CHAR(6) REFERENCES t_type(gtid),
    gprice DECIMAL(12,3) CHECK(gprice>0),
    gdiscount DECIMAL(5,2) DEFAULT 1,
    gdatetime DATETIME,
    gminstocks DECIMAL(7,2) CHECK(gminstocks>=0),
    gmemo VARCHAR(50)
)

CREATE TABLE t_order
(
    omid CHAR(12) PRIMARY KEY,
    uiid CHAR(6) REFERENCES t_user(uiid),
    odatetime DATETIME,
    gid CHAR(6) REFERENCES t_goods(gid),
    oprice DECIMAL(8,2) CHECK(oprice>0),
    onum DECIMAL(8,2) CHECK(onum>0),
    omoney DECIMAL(12,3)
)