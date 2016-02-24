--Ryan Rendeiro Lab 5 2/24/2016
--1. Show the cities of agents who booked orders for customers whith he cid c002, using joins and no subqueries
select a.city
from agents a, orders o
where o.cid = 'c002' and a.aid = o.aid;

--2. Show the ids of products ordered through any agent who makes at least one order for a customer in dallas, sorted by pid highest to lowest, use joins no subqueries
select o.pid
from orders o, customers c
where o.aid in ('a05','a03') and c.cid=o.cid
order by o.pid desc;

--3. Show the names of customers who have never placed an order, use subqueries
select name
from customers
where cid not in(select cid
                 from orders);

--4. Show the names of customers who never place an order by using an outer join
select c.name
from customers c
Left Outer Join orders o ON c.cid = o.cid
WHERE o.cid is NULL;

--5. Show the names of customers who placed at least one order through an agent in their own city, along with those agents' names.
select distinct c.name, a.name
from customers c, agents a, orders o
where c.city = a.city and a.aid = o.aid and c.cid = o.cid; 

--6. show the names of customers and agents who live in the same city along with the name of the city, regardless of if the customer made an order or not
select c.name, a.name, c.city
from customers c, agents a
where c.city=a.city

--7. Show the name and city of customers who live in the city that produces the fewest kinds of products
select c.name, c.city
from customers c
where c.city in (select city
                 from products
                 group by city
                 order by count(pid) asc
                 limit 1);