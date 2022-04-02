create table if not exists genre (
	id serial primary key,
	title varchar(80) not null
);
create table if not exists perfomers (
	id serial primary key,
	perfomers_name varchar(80) not null
);
create table if not exists album (
	id serial primary key,
	title varchar(80) not null,
	yars_of_issue date not null
);
create table if not exists compilation (
	id serial primary key,
	title varchar(80) not null,
	yars_of_issue date not null
);
create table if not exists perfomers_genre (
	perfomers_id integer references perfomers (id),
	genre_id integer references genre (id),
	constraint pk1 primary key (genre_id, perfomers_id)
);
create table if not exists album_perfomers (
	perfomers_id integer references perfomers (id),
	album_id integer references album (id),
	constraint pk2 primary key (perfomers_id, album_id)
);
create table if not exists track_list (
	id serial primary key,
	title varchar(80) not null,
	duration numeric not null check(duration > 0),
	album_id integer references album (id)
);
create table if not exists copilation_track (
	compilation_id integer references compilation (id),
	track_list_id integer references track_list (id),
	constraint pk3 primary key (compilation_id, track_list_id)
);