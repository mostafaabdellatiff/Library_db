create database Library_system;
use Library_system;

CREATE TABLE Authors (
  AuthorID integer PRIMARY KEY AUTO_INCREMENT,
  FirstName varchar(100) COMMENT 'Author First Name',
  LastName varchar(100) COMMENT 'Author Last Name'
);

CREATE TABLE Books (
  BookID integer PRIMARY KEY AUTO_INCREMENT,
  Book_Title varchar(255) COMMENT 'Book Title',
  AuthorID integer,
  Publish_date date COMMENT 'Date of Publication',
  Genre varchar(100) COMMENT 'Genre of the Book',
  FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Members (
  MemberID integer PRIMARY KEY AUTO_INCREMENT,
  FirstName varchar(100) COMMENT 'Member First Name',
  LastName varchar(100) COMMENT 'Member Last Name',
  Email varchar(100) COMMENT 'Member Email',
  Phone varchar(15) COMMENT 'Member Phone'
);

CREATE TABLE Loans (
  LoanID integer PRIMARY KEY AUTO_INCREMENT,
  BookID integer,
  MemberID integer,
  Loan_date date COMMENT 'Date book was borrowed',
  Return_date date COMMENT 'Date book was Returned',
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

INSERT INTO Authors (FirstName, LastName)
VALUES ('John', 'Doe'), ('Jane', 'Smith'), ('Alice', 'Brown'), ('Peter', 'Chris'), ('Richard', 'Cross');
select * from Authors;

INSERT INTO Books (Book_title, AuthorID, Publish_date, Genre)
VALUES ('Crime Series',3, '1998-09-09', 'Horror'), ('Laugh Stories',1, '2000-04-30', 'Comedy'), ('Real Titanic',5, '1973-10-06', 'Romance'), ('Mickey Mouse',2, '2011-01-25', 'Kids'), ('Quantum Computing',4, '2015-06-09' ,'Science');
select * from Books;

select * from Members;

INSERT INTO Loans (BookID, MemberID, Loan_date, Return_date)
VALUES (1,3, '2024-12-24', '2025-4-25'), (4,1, '2025-05-02', '2025-05-16'), (5,4, '2025-03-28', '2025-04-27'), (2,5, '2023-12-17', '2024-02-23'), (3,3, '2025-04-16' ,'2025-05-05');
select * from Loans;

select * from Books;

insert into Books (Book_Title, AuthorID, Publish_date, Genre)
values ('Intro to Coding', 1, '2003-12-14','Learning');
select * from Books;

select b.AuthorID, b.BookID, b.Book_Title, a.FirstName, a.LastName, b.Publish_date, b.Genre
from Books b
join Authors a on b.AuthorID = a.AuthorID;

select b.AuthorID, b.BookID, b.Book_Title, a.FirstName, a.LastName, b.Publish_date, b.Genre
from Books b
join Authors a on b.AuthorID = a.AuthorID
where a.AuthorID = 1;

select * from Loans;

UPDATE Loans SET Return_date = '2025-04-30' WHERE MemberID = 5;
select * from Loans;


select * from Members;

insert into Members (FirstName, Lastname, Email, Phone)
values ('Tarek', 'Ahmed', 'Tarek55@gmail.com','01501795428');

Delete from Members where MemberID = 6;