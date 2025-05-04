
CREATE TABLE ProductDetail(
OrderID INT,
CustomerName(100),
Products varchar(100)
 );
 INSERT INTO ProductDetail(OrderID, CustomerName,Products)VALUES
(101,'John Doe', 'Laptop'),
(101,'John Doe', 'Mouse'),
(102,'Jane Smith', 'Tablet'),
(102,'Jane Smith', 'Keyboard'),
(102,'Jane Smith', 'Mouse'),
(103,'Emily Clark', 'Phone');
 
 

create table Orders(
OrderID INT primary KEY,
CustomerName varchar(100)
);

insert into orders(orderID, CustomerName)
values
(101,'John Doe')
(102,'Jane Smith')
(103,'Emily Clark');

create table Product(
orderID INT,
Product varchar(100),
quantity int,
primary key (orderID,Product),
foreign key (orderID) references orders(orderID)
);
insert into Product(orderID, Product,quantity)
values
(101,'Laptop', 2)
(101,'Mouse', 1)
(102,'Tablet', 3)
(102,'Keyboard', 1)
(102,'Mouse', 2)
(103,'Phone', 2);


