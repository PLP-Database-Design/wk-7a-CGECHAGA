
--  CREATE TABLE ProductDetail(
-- OrderID INT,
-- CustomerName(255),
-- Products varchar(255)
-- );
-- INSERT INTO ProductDetail(OrderID, CustomerName,Products)VALUES
-- (101,'John Doe', 'Laptop ,Mouse'),
-- (102,'Jane Smith', 'Tablet, Keyboard,Mouse'),
-- (103,'Emily Clark', 'Phone');
 
 WITH recursive split_products as(
select
OrderID,
 CustomerName,
TRIM(substring_index(Products, ',' ,1)) as Product,
substring(products,length(substring_index(products, ',', 1))+2) as rest
FROM ProductDetail
 union all
 select
	OrderID,
    CustomerName,
    trim(substring_index(rest, ',',1)),
    substring(rest,length(substring_index(rest, ',', 1)) +2)
    FROM split_products 
    where rest is not null and rest !=''
    )
    select
    orderID,
    CustomerName,
    Product
    from split_products;


create table Orders(
OrderID INT primary KEY,
CustomerName varchar(255)
);

insert into orders(orderID, CustomerName)
select distinct orderID, CustomerName
from orderDetails;

create table orderItems(
orderID INT,
Product varchar(255),
quantity int,
primary key (orderID,Product),
foreign key (orderID) references orders(orderID)
);
insert into orderItems(orderID, Product,quantity)
select orderID,Product,quantity
from orderDetails;