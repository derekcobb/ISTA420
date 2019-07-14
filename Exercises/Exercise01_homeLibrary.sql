.echo on
.headers on

--Name: T-SQL Exercise 01
--Author: Derek Cobb
--Date: July 8, 2019

drop table if exists homeLibrary;

create table homeLibrary (
	ISBN integer,
	first_pub integer,
	num_pages integer,
	author text,
	title text,
);

insert into homeLibrary values (9780758258861, 2011, 279, 'Cheryl Crane', 'The Bad Always die Twice');
insert into homeLibrary values (9781250020611, 2014, 386, 'Charles Cumming', 'A Colder War');
insert into homeLibrary values (9780399156434, 2010, 436, 'Clive Cussler', 'The Spy');
insert into homeLibrary values (99780871406613, 2016, 190, 'Michael Patrick', 'The Internet of Us');
insert into homeLibrary values (9781476767727, 2016, 270, 'Justin Peters', 'The Idealist');
insert into homeLibrary values (9781615470105, 2012, 176, 'Bob Umlas', 'Excel Outside the Box');
