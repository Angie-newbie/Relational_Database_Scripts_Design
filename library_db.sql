drop table if exists authors;
drop table if exists members;
drop table if exists publishers;
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
    phone varchar(20) not null
);

create table publishers (
    id serial primary key,
    name varchar(60) not null
);

create table categories(
    id serial primary key,
    name varchar(50) not null
);

create table books(
    id serial primary key,
    title varchar (100) not null,
    publish_date date,
    authors_id int not null,
    categories_id int not null,
    publishers_id int not null,
    foreign key (authors_id) references authors(id),
    foreign key (categories_id) references categories(id) on delete set null,
    foreign key (publishers_id) references publishers(id) on delete cascade
);

create table loans(
    id serial primary key,
    loan_date date not null,
    due_date date not null,
    members_id int not null,
    books_id int not null,
    foreign key (members_id) references members(id) on delete set null,
    foreign key (books_id) references books(id) on delete cascade
);



-- insert
-- authors
insert into authors (first_name, last_name)
values
    ('J.D.', 'Salinger'),
    ('J.K.', 'Rowling');

-- categories
insert into categories (name)
values
    ('Fantasy'),
    ('Science Fiction'),
    ('Dystopian'),
    ('Advanture'),
    ('Fiction');

-- publishers
insert into publishers (name)
values
    ('Little, Brown and Company'),
    ('Bloomsbury'),
    ('Arthur A. Levine Books')
    ;

-- books
insert into books (title, publish_date, authors_id, categories_id, publishers_id)
values
    ('The Catcher in the Rye', '1951-07-16', 1, 1, 1),
    ('Harry Potter and the Chamber of Secrets', '1998-07-02', 2, 1, 2),
    ('Fantastic Beasts and Where to Find Them', '2001-03-01', 1, 4, 3),
    ('The Casual Vacancy', '2012-09-27', 1, 5, 1)
    ;