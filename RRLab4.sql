--Ryan Rendeiro february 17 2016 Lab 4 Subqueries
--1. get the city of agents making orders for customer with cid c002
select city
from agents
where aid in(select aid
             from orders
             where cid = 'c002');
--2. getting product ids from agents who order things for customers in dallas
select pid
from orders
where aid in(select aid
             from orders
             where cid in(select cid
                          from customers
                          where city = 'Dallas'))
                          order by pid desc;
--3. getting customer ids and names from customers who didn't order with agent a01
select cid, name
from customers
where cid in (select cid
              from orders
              where aid = 'a01');
--4. get customer ids fom customers who ordered combs and cases
select cid
from orders
where pid in(select pid
             from products
             where name = 'case');
--5. get ids of products not ordered by customers of agent a07 in descending order
--agent 7 doesn't exist
select pid
from products
where pid not in(select pid
	         from orders
	         where cid in(select cid
			      from orders
			      where aid in(select aid
					  from orders
					  where aid = 'a07')));
--6. get the name discounts, and city for all customers who pace orders through agents in london or new york
select name, discount, city
from customers
where cid in(select cid
             from orders
             where aid in(select aid
                          from agents
                          where city = 'London' or city = 'New York'));
--7. get all customers who have the same discount as customers from dallas or london
select *
from customers
where discount in(select discount
                  from customers
                  where city = 'London' or city = 'Dallas');
--Check constraints are integrity constraints that assure that databases and their tables aren't filled with invalid information such as a store containing negative items
--or those items being worth negative money. The advantage of check constraints is that it forces uers to insert data that is correct and doesn't conflict with logical reason 
--or the rules of the database. A store can't sell things for negative money because that would mean that they are paying someone money to take something from them 
--that they need to sell to support their store. Also a store can't have negative items because you can have something or you can have nothing, but you can't have the opposite of
--something being something and so negative items breaks common reason and good database formating. A type of constraint that would seem logical to execute in a database would 
--be for a person's social security number couldn't be null. This would seem to be logical all people who are born in america get social security numbers and so would be a necessary 
--piece of identifiable information for tht user, but not all people who live and work in america were born here or have social security numbers. Then the lack of social security 
--numbers becomes a propblem because the system needs a valid entry but there is a case where a user doesn't have one and so for users without social security numbers hindered in 
--acessing or denied acess to the system/database.
--
--
--
--
--
--
--
--
--
--
--
--