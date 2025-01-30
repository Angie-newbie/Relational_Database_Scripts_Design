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
    ('J.K.', 'Rowling'),
    ('Suzanne', 'Collins'),
    ('George', 'Orwell');

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
    ('Arthur A. Levine Books'),
    ('Scholastic Press')
    ;

-- books
insert into books (title, publish_date, authors_id, categories_id, publishers_id)
values
    ('The Catcher in the Rye', '1951-07-16', 1, 1, 1),
    ('Harry Potter and the Chamber of Secrets', '1998-07-02', 2, 2, 2),
    ('Fantastic Beasts and Where to Find Them', '2001-03-01', 2, 4, 3),
    ('The Casual Vacancy', '2012-09-27', 2, 5, 1),
    ('The Hunger Games', '2008-09-14', 3, 3, 4),
    ('The Lightning Thief', '2005-05-01', 2, 2, 2),
    ('The Golden Compass', '1995-07-04', 1, 1, 1),
    ('1984', '1949-06-08', 1, 3, 1),
    ('Animal Farm', '1945-08-17', 1, 3, 1)
    ;

-- members
insert into members (first_name, last_name, email, dob, phone)
values
    ('Alice', 'Johnson', 'alice.johnson@example.com', '1985-06-15', '555-1234'),
    ('Bob', 'Smith', 'bob.smith@example.com', '1990-09-22', '555-5678'),
    ('Charlie', 'Brown', 'charlie.brown@example.com', '1978-03-11', '555-8765'),
    ('Diana', 'Miller', 'diana.miller@example.com', '2000-02-28', '555-3456'),
    ('Eve', 'Wilson', 'eve.wilson@example.com', '1989-12-04', '555-6543'),
    ('Frank', 'Taylor', 'frank.taylor@example.com', '1995-01-17', '555-4321');

-- count
select count(id) as total_numbers_of_books from books;
select title as the_newest_book from books where publish_date = (select max(publish_date) from books); 