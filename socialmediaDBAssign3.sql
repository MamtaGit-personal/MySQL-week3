create database if not exists socialmedia;
use socialmedia;


drop table if exists comments;
drop table if exists posts;
drop table if exists users;

CREATE TABLE users(
	id int(11) not null auto_increment,
	username varchar(30) not null,
	password varchar(30) not null,
	email varchar(40) not null,
	phone_number varchar(16) not null,
	first_name varchar(20) not null,
	last_name varchar(20),
	primary key(id)

);


CREATE TABLE posts(
	id int(11) not null auto_increment,
	user_id int(11) not null,
	post Text not null,
	creation_time DATETIME default current_timestamp,
	primary key(id),
	foreign key (user_id) references users(id)
	
);


CREATE TABLE comments(
	user_id int(11) not null,
	post_id int(11) not null,
	comment Text not null,
	creation_time DATETIME default current_timestamp,
	primary key(user_id, post_id),
	foreign key (user_id) references users(id),
	foreign key (post_id) references posts(id)
);