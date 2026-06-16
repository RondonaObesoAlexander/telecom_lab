CREATE DATABASE IF NOT EXISTS asterisk_cdr;
CREATE USER IF NOT EXISTS 'cdruser'@'%' IDENTIFIED BY 'cdrpass';
GRANT ALL PRIVILEGES ON asterisk_cdr.* TO 'cdruser'@'%';
FLUSH PRIVILEGES;

USE asterisk_cdr;
CREATE TABLE IF NOT EXISTS cdr (
    calldate datetime NOT NULL,
    clid varchar(80) NOT NULL,
    src varchar(80) NOT NULL,
    dst varchar(80) NOT NULL,
    dcontext varchar(80) NOT NULL,
    channel varchar(80) NOT NULL,
    dstchannel varchar(80) NOT NULL,
    lastapp varchar(80) NOT NULL,
    lastdata varchar(80) NOT NULL,
    duration int(11) NOT NULL,
    billsec int(11) NOT NULL,
    disposition varchar(45) NOT NULL,
    amaflags int(11) NOT NULL,
    accountcode varchar(20) NOT NULL,
    uniqueid varchar(32) NOT NULL,
    userfield varchar(255) NOT NULL,
    PRIMARY KEY (uniqueid)
);