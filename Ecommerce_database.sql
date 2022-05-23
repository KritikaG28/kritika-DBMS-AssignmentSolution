create database if not exists data_store;
use  data_store;
 -- 1. create tables supplier,customer,category,product,supplier_pricing,order,rating
create table if not exists supplier (
SUPP_ID INT PRIMARY KEY,
SUPP_NAME VARCHAR(50) NOT NULL,
SUPP_CITY VARCHAR(50) NOT NULL,
SUPP_PHONE VARCHAR(50) NOT NULL
);

create table if not exists customer (
CUS_ID INT PRIMARY KEY,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY VARCHAR(30) NOT NULL,
CUS_GENDER CHAR
);

create table if not exists category (
CAT_ID INT PRIMARY KEY,
CAT_NAME VARCHAR(20) NOT NULL
);

create table if not exists product (
PRO_ID INT PRIMARY KEY,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT,
FOREIGN KEY (CAT_ID) REFERENCES category (CAT_ID)
);

create table if not exists supplier_pricing (
PRICING_ID INT PRIMARY KEY,
PRO_ID INT,
SUPP_ID INT,
SUPP_PRICE INT DEFAULT 0,
FOREIGN KEY (PRO_ID) REFERENCES product (PRO_ID),
FOREIGN KEY (SUPP_ID) REFERENCES supplier (SUPP_ID)
);

create table if not exists `order` (
ORD_ID INT PRIMARY KEY,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE NOT NULL,
CUS_ID INT ,
PRICING_ID INT ,
FOREIGN KEY (CUS_ID) REFERENCES customer (CUS_ID),
FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing (PRICING_ID)
);

create table if not exists rating (
RAT_ID INT PRIMARY KEY,
ORD_ID INT ,
RAT_RATSTARS INT NOT NULL,
FOREIGN KEY (ORD_ID) REFERENCES `order` (ORD_ID)
);

 -- 2. Insert values in the tables
Insert into supplier values(1,"Rajesh Retails" ,"Delhi", 1234567890);
Insert into supplier values(2, "Appario Ltd.", "Mumbai", 2589631470);
Insert into supplier values(3, "Knome products", "Banglore", 978546231);
Insert into supplier values(4, "Bansal Retails", "Kochi", 8975463285);
Insert into supplier values(5, "Mittal Ltd.", "Lucknow", 7898456532);


Insert into customer values(1, "AAKASH", 9999999999, "DELHI", "M");
Insert into customer values(2, "AMAN", 9785463215, "NOIDA", "M");
Insert into customer values(3, "NEHA", 9999999999, "MUMBAI", "F");
Insert into customer values(4, "MEGHA", 9994562399, "KOLKATA", "F");
Insert into customer values(5, "PULKIT", 7895999999, "LUCKNOW", "M");


Insert into category values(1,"BOOKS");
Insert into category values(2, "GAMES");
Insert into category values(3, "GROCERIES");
Insert into category values(4, "ELECTRONICS");
Insert into category values(5, "CLOTHES");


Insert into product values(1, "GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2);
Insert into product values(2, "TSHIRT", "SIZE-L with Black, Blue and White variations", 5);
Insert into product values(3, "ROG LAPTOP", "Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4);
Insert into product values(4, "OATS", "Highly Nutritious from Nestle", 3);
Insert into product values(5, "HARRY POTTER", "Best Collection of all time by J.K Rowling", 1);
Insert into product values(6, "MILK", "1L Toned MIlk", 3);
Insert into product values(7, "Boat Earphones", "1.5Meter long Dolby Atmos", 4);
Insert into product values(8, "Jeans", "Stretchable Denim Jeans with various sizes and color", 5);
Insert into product values(9, "Project IGI", "compatible with windows 7 and above", 2);
Insert into product values(10, "Hoodie", "Black GUCCI for 13 yrs and above", 5);
Insert into product values(11, "Rich Dad Poor Dad", "Written by RObert Kiyosaki", 1);
Insert into product values(12, "Train Your Brain", "By Shireen Stephen", 1);


Insert into supplier_pricing values(1, 1, 2, 1500);
Insert into supplier_pricing values(2, 3, 5, 30000);
Insert into supplier_pricing values(3, 5, 1, 3000);
Insert into supplier_pricing values(4, 2, 3, 2500);
Insert into supplier_pricing values(5, 4, 1, 1000);
Insert into supplier_pricing values(6, 6, 2, 1250);
Insert into supplier_pricing values(7, 8, 4, 1000);
Insert into supplier_pricing values(8, 7, 1, 1200);
Insert into supplier_pricing values(9, 9, 1, 3000);
Insert into supplier_pricing values(14, 12, 1, 2000);

Insert into `order` values(101, 1500, '2021-10-06', 2, 1);
Insert into `order` values(102, 1000, '2021-10-12', 3, 5);
Insert into `order` values(103, 30000, '2021-09-16', 5, 2);
Insert into `order` values(104, 1500, '2021-10-05', 1, 1);
Insert into `order` values(105, 3000, '2021-08-16', 4, 3);
Insert into `order` values(106, 1450, '2021-08-18', 1, 9);
Insert into `order` values(107, 789, '2021-09-01', 3, 7);
Insert into `order` values(108, 780, '2021-09-07', 5, 6);
Insert into `order` values(109, 3000, '2021-00-10', 5, 3);
Insert into `order` values(110, 2500, '2021-09-10', 2, 4);
Insert into `order` values(111, 1000, '2021-09-15', 4, 5);
Insert into `order` values(112, 789, '2021-09-16', 4, 7);
Insert into `order` values(113, 31000, '2021-09-16', 1, 8);
Insert into `order` values(114, 1000, '2021-09-16', 3, 5);
Insert into `order` values(115, 3000, '2021-09-16', 5, 3);
Insert into `order` values(116, 99, '2021-09-17', 2, 14);

Insert into rating values(1, 101, 4);
Insert into rating values(2, 102, 3);
Insert into rating values(3, 103, 1);
Insert into rating values(4, 104, 2);
Insert into rating values(5, 105, 4);
Insert into rating values(6, 106, 3);
Insert into rating values(7, 107, 4);
Insert into rating values(8, 108, 4);
Insert into rating values(9, 109, 3);
Insert into rating values(10, 110, 5);
Insert into rating values(11, 111, 3);
Insert into rating values(12, 112, 4);
Insert into rating values(13, 113, 2);
Insert into rating values(14, 114, 1);
Insert into rating values(15, 115, 1);
Insert into rating values(16, 116, 0);

-- 3. Display the total number of customers based on gender who have placed orders of worth at least Rs.3000
select count(c2.CUS_GENDER) as NoOfCustomers, c2.CUS_GENDER from 
(select c1.CUS_ID,c1.CUS_GENDER,c1.ORD_AMOUNT,c1.CUS_NAME from
(select o.*, c.CUS_GENDER, c.CUS_NAME from `order` o inner join customer c where o.CUS_ID=c.CUS_ID having o.ORD_AMOUNT>=3000)
 as c1 group by c1.cus_Id) as c2 group by c2.cus_gender;

-- 4. Display all the orders along with product name ordered by a customer having Customer_Id=2
 Select o.*, p.pro_name from `order` o, product p, supplier_pricing sp where o.CUS_ID=2 and
 o.PRICING_ID=sp.PRICING_ID and sp.PRO_ID=p.pro_ID;
 
 -- 5. Display the Supplier details who can supply more than one product.
Select s.* from supplier s where s.SUPP_ID in
 (Select SUPP_ID from supplier_pricing group by SUPP_ID having count(SUPP_ID)>1) group by s.SUPP_ID;
 
 -- 6. Find the least expensive product from each category and print the table with category id, name, product name and price of the product
 Select c.CAT_ID, c.CAT_NAME, t3.PRO_NAME, min(t3.MIN_PRICE) as MIN_PRICE from category c inner join 
 (Select p.CAT_ID, p.PRO_NAME, t2.* from product p inner join
  (Select sp.PRO_ID, min(sp.SUPP_PRICE) as Min_Price from supplier_pricing sp group by sp.PRO_ID)
  as t2 where t2.PRO_ID=p.PRO_ID)
  as t3 where t3.CAT_ID= c.CAT_ID group by t3.CAT_ID;
  
 -- 7. Display the Id and Name of the Product ordered after “2021-10-05”.
  Select product.PRO_ID, product.PRO_NAME from `order` o inner join supplier_pricing sp 
  on sp.PRICING_ID=o.PRICING_ID inner join product on product.PRO_ID=sp.PRO_ID where o.ORD_DATE>"2021-10-05";
 
 -- 8. Display customer name and gender whose names start or end with character 'A'
 Select c.CUS_NAME, c.CUS_GENDER from customer c where c.CUS_NAME like 'A%' or c.CUS_NAME like '%A';
 
 /* 9.Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent
Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”. */
DELIMITER &&
CREATE procedure show_rating()
BEGIN
      Select report.SUPP_ID, report.SUPP_NAME, report.Rating,
      CASE
      WHEN report.Rating = 5 THEN 'Excellent Service'
      WHEN report.Rating >4 THEN 'Good Service'
      WHEN report.Rating >2 THEN 'Average Service'
      ELSE 'Poor Service'
      END AS Type_Of_Service 
      from (Select final.SUPP_ID, supplier.SUPP_NAME, final.Rating from
(Select test2.SUPP_ID, sum(test2.RAT_RATSTARS)/count(test2.RAT_RATSTARS) as Rating from
(Select supplier_pricing.SUPP_ID, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing inner join
(Select `order`.PRICING_ID, rating.ORD_ID, rating.RAT_RATSTARS from `order` inner join rating on
rating.ORD_ID=`order`.ORD_ID) as test
 on test.PRICING_ID = supplier_pricing.PRICING_ID)
as test2 group by supplier_pricing.SUPP_ID)
as final inner join supplier where final.SUPP_ID = supplier.SUPP_ID) as report;
END &&
DELIMITER ;

 
call show_rating()