-- Thực thể USER login, regter 
create table users(
	UserID int primary key auto_increment,
    Username varchar(255) unique not null,
    PasswordHash varchar(255) not null,
    Email varchar(100) unique not null,
    Phonenumbers varchar(20),
    Isactivate boolean default true,
    LastLogin datetime
);
-- account
create table Accounts(
	AccountID int primary key auto_increment,
    UserID int,
    RegistrationDate datetime default current_timestamp,
    AccountType varchar(20),
    foreign key (UserID) references users(UserID)
);
-- Thực thể Menu

create table Menu(
	MenuID int primary key auto_increment,
	MenuName varchar(100),
	Description text,
	Price decimal(10,2)
);
-- Thực thể Danh mục 
create table Category(
	CategoryID int primary key auto_increment,
	CategoryName varchar(100) unique not null
);
-- Thực thể đặt bàn (Reservation)
create table Reservation(
	ReservationID int primary key auto_increment,
    UserID int,
    ReservationDate date,
    ReservationTime time,
    NumGuests int, SpectialRequets text,
    foreign key(UserID) references users(UserID)
);
-- Thực thể món ăn (Food Item) 
create table FoodItem(
	FoodItemID int primary key auto_increment,
    foodItemName varchar(100) unique not null,
    Description text,
    Price decimal(10,2),
    CategoryID int,
    foreign key(CategoryID) references Category(CategoryID)
);

-- Truy xuất thông tin Database

select * from users; -- truy xuất đến bảng users

-- insert informatin with users in the table users  

insert into users(Username, PasswordHash, Email, Phonenumbers, Isactivate, LastLogin)
values ('toitenpi1303', 'anhcanem1', 'tupi1303@gmail.com','0349196434', true, now());

select * from accounts;
insert into accounts(UserID, AccountType) values(1, 'Tupi');