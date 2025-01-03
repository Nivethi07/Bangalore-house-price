     --# step 1 database in --restaurant--...!
     
--#Question: How can I create a new database named?
     
create database restaurant;

     --# step 2 use --restaurant--...!
     
--#Question: How can I select the database to be used for my queries?
     
use restaurant;

     --# step 3 create the table in --customer--...!
     
     
create table customer(customer_id int auto_increment primary key,first_name varchar(100),mobile_number int,mail_id varchar(100));

     --# step 4 create the table in --menu...!
     
create table menu (menu_id int,varity varchar (100)not null,price int unique,image int);

     --# step 5 create the table in --tables--...!
     
create table tables(table_id int,tablename varchar(100),seats varchar(100),satus varchar(100) default"avlible");

     --# step 6 create table in --orders--...!
     
create table orders(order_id int not null,menu_id int,quantity int not null,verify  varchar(100));

     --# step 7 create tha table in --reservation--...!
     
CREATE TABLE reservation(reservation_id INT PRIMARY KEY AUTO_INCREMENT,reservation_datetime DATETIME NOT NULL,table_id INT,customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id) );

     --# step 8 insert the table of --customer--...!
     
insert into customer (customer_id,first_name,mobile_number,mail_id) values (1,"hari",8248,"harihari@"),
(2,"pratha",3464,"perpar@"),
(3,"alen",2975,"aleale@"),
(4,"kumar",7502,"kumkum@"),
(5,"akesh",5963,"akak@");

     --# step 9 insert the table of --menu--...!
     
insert into menu(menu_id,varity,price,image)values(10,"dosa",50,2),
(11,"rice",80,4),
(12,"chicken",120,6),
(13,"noodles",140,5),
(14,"non veg",100,7);

     --# step 10 insert the table of --tables--...!
     
insert into tables (table_id,tablename,seats,satus)values(1,"A","5s","avible"),
(2,"B","2s","not"),
(3,"C","4s","avible"),
(4,"D","10s","avible"),
(5,"E","1s","not");

     --# step 11 insert the table of --orders--...!
     
insert into orders(order_id,menu_id,quantity,verify)values (12,10,100,"yes"),
(13,11,50,"yes"),
(148,56,260,"noo"),
(11,76,50,"yes"),
(24,35,67,"noo");

     --# step 12insert the table of --reservation--...!
     
INSERT INTO reservation (reservation_id, reservation_datetime, table_id, customer_id) VALUES (1, '2024-01-02 12:00:00', 1, 1),
(2,'2024-10-2 10:00:00',2,2),
(3,'2024-3-4 10:10:00',3,3),
(4,'2025-10-5 13:10:00',4,4),
(5,'2025-5-10 5:20:00',5,5);

     --# step 13 retrieve all records in --table--...!
     
 select*from customer;
 select*from menu;
 select*from tables;
 select*from  orders;
 select*from reservation;
 
      --# step 14 retrieve single --row--...!
      
 select *from reservation
where reservation_id = 3;
select*from tables 
where table_id =5;
 
      --# step 15 queries --alter--...!
      
--#Question: How can I add a new column  to the customers table? 
     
 alter table tables change tablename tab_n varchar (100);
 alter table customer add column last_name varchar(100);

	--# step 16 queries --update--...!
    
update customer set mail_id ="akesh@123"
where customer_id=5;
update tables set tab_n="ABCD"
where table_id=4;



     --# step 17 queries update--new one insert row--...!
     
--#Question: How can I update the a customer with a specific customer ID?

update customer set last_name ="g"
where customer_id =1;
update customer set last_name ="h"
where customer_id =2;

     --# step 18  using the queries --orderby--...!
     
--#Question:  How can I order the result set by order date in descending order?

select * from customer order by customer_id  desc;
select *from menu order by varity ASC LIMIT 4;

     --# step 19 using the queries --groupby--...!
     
--#Question: How can I calculate the average value of the table for each tables_name?

select reservation_id ,count(reservation_datetime)from reservation group by  reservation_id;
select  mobile_number,avg(mail_id)from customer group by mobile_number;

     --# step 20 using the queries --joints--...!
     
--#Question: How can I select all rows from one table and the matching rows from another table?

select c.customer_id,c.first_name,r.reservation_id
from customer AS c join reservation AS r on
c.customer_id=r.reservation_id;

select t.table_id,t.seats,t.satus,m.menu_id
from tables AS t  left join menu AS m on
t.table_id=m.menu_id ;

select o.order_id,o.menu_id,m.menu_id
from orders AS o right join menu AS m 
on o.order_id=m.menu_id;


     --# step 21 using the queries --right&orderby--...!

--#Question: How can I select all rows from one table and the matching rows from another table and using orderby? 

select o.order_id,o.menu_id,m.menu_id
from orders AS o right join menu AS m 
on o.order_id=m.menu_id order by "ass" limit 4;

     --# step 22 using the queries --cross&group--...!
     
     --#Question: How can I return the Cartesian product of two tables and using groupby?

select t.table_id,t.tab_n,t.seats,t.satus,o.order_id,o.quantity,o.verify
from tables AS t cross join orders AS o
on t.table_id=o.order_id group by t.table_id,t.tab_n,t.seats,t.satus,o.order_id,o.quantity,o.verify;


                                                 #END...!