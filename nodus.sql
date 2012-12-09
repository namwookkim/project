CREATE DATABASE web2012 DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON web2012.* TO 'web'@'localhost' IDENTIFIED BY 'asdf';

use web2012;

CREATE TABLE User (
	email VARCHAR(64) NOT NULL PRIMARY KEY,	-- email address
	pw_hash VARCHAR(40) NOT NULL,			-- SHA1-hashed user password
	nickname VARCHAR(32) NOT NULL,			-- nickname
	status INT NOT NULL,					-- status
	created_at DATETIME NOT NULL
);


CREATE TABLE Session (
	session_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(96) NOT NULL,
	is_public BOOLEAN NOT NULL,
	max_users INT NOT NULL,
	summary VARCHAR(255) NOT NULL,
	start_node_id INT NOT NULL,
	created_at DATETIME NOT NULL
);

CREATE TABLE Participant (
	session_id INT NOT NULL PRIMARY KEY,
	email VARCHAR(64) NOT NULL PRIMARY KEY,
	is_operator BOOLEAN NOT NULL,
	is_online BOOLEAN NOT NULL,
	created_at DATETIME NOT NULL
);

CREATE TABLE Node (
	node_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	session_id INT NOT NULL,
	email VARCHAR(64) NOT NULL,
	title VARCHAR(64) NOT NULL,
	content TEXT NOT NULL,
	created_at DATETIME NOT NULL
);

CREATE TABLE Edge (
	edge_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	from_id INT NOT NULL,
	to_id INT NOT NULL,
	created_at DATETIME NOT NULL
);

CREATE TABLE Talk (
	talk_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	session_id INT NOT NULL,
	email VARCHAR(64) NOT NULL,
	content TEXT NOT NULL,
	created_at DATETIME NOT NULL
);

CREATE TABLE Invitation (
	invite_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	from_email VARCHAR(64) NOT NULL,
	to_email VARCHAR(64) NOT NULL,
	session_id INT NOT NULL,
	flag INT NOT NULL,
	created_at DATETIME NOT NULL
);

CREATE TABLE Abuse_word (
	abuse_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	keyword VARCHAR(64) NOT NULL,
	admin_email VARCHAR(64) NOT NULL,
	created_at DATETIME NOT NULL
);

CREATE TABLE Snapshot (
	snapshot_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	snapshot_title VARCHAR(96) NOT NULL,
	email VARCHAR(64) NOT NULL,
	start_node_id INT NOT NULL,
	created_at DATETIME NOT NULL
);
