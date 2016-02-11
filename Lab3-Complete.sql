--Ryan Rendeiro, february 10, 2016 Lab 3: CAP database
--1.
select ordno, dollars
from orders;
--2.
--the check for the value of a field in a table is done after the from statement 
select city, name
from agents
where name = 'Smith';
--3.
select pid, name, priceusd
from products
where quantity > 208000;
--4.
select name, city
from customers
where city = 'Dallas'
--5.
--the check needs and so as to not pull up all the agents because the agents can't have multiple cities for therir city attribute 
select name
from agents
where city != 'New York' and city != 'Tokyo';
--6.
select *
from products
where city != 'Dallas' and city != 'Duluth' and priceusd >= 1;
--7.
select *
from orders
where mon = 'jan' or mon = 'mar';
--8.
select *
from orders
where mon = 'feb' and dollars < 500;
--9.
--this query returns nothing because there are no orders from the customer whose cid is c005 
select *
from orders
where cid = 'c005';

