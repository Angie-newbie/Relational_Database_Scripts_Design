drop table if exists authors;
drop table if exists members;
drop table if exists categories;
drop table if exists books;
drop table if exists loans;


create table authors (
    id serial primary key,
    first_name varchar(50),
    last_name varchar(50)
);

create table members (
    id serial primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(150) not null,
    dob date,
    phone varchar(100) not null
);

create table categories(
    id serial primary key,
    name varchar(50) not null
);

create table books(
    id serial primary key,
    title varchar (100) not null,
    publisher varchar(100),
    publish_date date,
    authors_id int not null,
    categories_id int not null,
    foreign key (authors_id) references authors(id),
    foreign key (categories_id) references categories(id) on delete set null
);

create table loans(
    id serial primary key,
    loan_date date not null,
    due_date date not null,
    members_id int not null,
    books_id int not null,
    foreign key (members_id) references members(id),
    foreign key (books_id) references books(id)
);