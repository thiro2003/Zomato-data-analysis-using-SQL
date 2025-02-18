
-- What is the average rating of all restaurants?
select round(avg(rate),2)  as average_rating from data;-- 3.63

-- Which restaurant has the highest rating?
select name,max(rate) from data group by name; -- Jalsa and  Spice Elephant

-- Which restaurant has the lowest rating?
select name,min(rate) from data group by name order by min(rate) asc ; -- Nandhini Deluxe

-- How many restaurants offer online ordering?
select count(online_order) from data ; -- 148

-- How many restaurants allow customers to book a table?
select count(name) from data where book_table='Yes'; -- 8

-- What is the total number of votes for all restaurants?
select sum(votes) from data; -- 39192

-- Which restaurant has the highest number of votes?
select name, votes from data order by votes desc limit 1; -- Empire Restaurant	4884

-- Which restaurant has the lowest number of votes?
select name, votes from data order by votes asc limit 1; -- Spicy Tandoor	0

-- What is the average cost for two people across all restaurants?
select avg(`approx_cost(for two people)`) from data; -- 418.2432

-- What is the total cost for two people across all restaurants?
select sum(`approx_cost(for two people)`) from data; -- 61900

-- Which type of restaurant (listed_in) has the highest average rating?
select 'listed_in(type)' from data;
select name,avg(rate) from data 
group by name having 'listed_in(type)'='listed_in(type)' 
order by avg(rate) desc limit 1; -- Onesta	4.6

-- Which type of restaurant has the lowest average rating?
select 'listed_in(type)' from data;
select name,avg(rate) from data 
group by name having 'listed_in(type)'='listed_in(type)' 
order by avg(rate) asc limit 1; -- Nandhini Deluxe	2.6

-- What is the average number of votes for restaurants that offer online ordering?
select name,avg(votes) from data group by name having online_order='Yes';

-- How many restaurants offer both online ordering and table booking?
use zomato;
select name from data where online_order='Yes' and  book_table='Yes';
-- Jalsa
-- Onesta
-- Cafe Shuffle
-- The Coffee Shack
-- Onesta
-- Wamama
-- Goa 0 Km
-- How many restaurants do not offer online ordering or table booking?
select name from data where online_order='Yes' or book_table='Yes';
-- Jalsa
-- Spice Elephant
-- San Churro Cafe
-- Timepass Dinner
-- Onesta
-- Penthouse Cafe
-- Smacznego
-- Village CafÃ©
-- Cafe Shuffle
-- The Coffee Shack
-- San Churro Cafe
-- Cafe Vivacity
-- Catch-up-ino
-- Kirthi's Biryani
-- 360 Atoms Restaurant And Cafe
-- The Vintage Cafe
-- Woodee Pizza
-- My Tea House
-- Coffee Tindi
-- Redberrys
-- Foodiction
-- Sweet Truth
-- Ovenstory Pizza
-- Faasos
-- Behrouz Biryani
-- Fast And Fresh
-- Szechuan Dragon
-- Empire Restaurant
-- Maruthi Davangere Benne Dosa
-- Chaatimes
-- McDonald's
-- Domino's Pizza
-- Onesta
-- Kitchen Garden
-- Recipe
-- Beijing Bites
-- Tasty Bytes
-- Shree Cool Point
-- Biryanis And More
-- FreshMenu
-- Banashankari Donne Biriyani
-- Wamama
-- XO Belgian Waffle
-- Goa 0 Km
-- Chinese Kitchen
-- Jeet Restaurant
-- Kabab Magic
-- Namma Brahmin's Idli
-- Burger King
-- The Good Bowl
-- Sri Guru Kottureshwara Davangere Benne Dosa
-- Devanna Dum Biriyani Centre
-- Kadalu Sea Food Restaurant
-- Frozen Bottle
-- Meghana Foods
-- Polar Bear
-- Bengaluru Coffee House
-- Anna Kuteera
-- Vijayalakshmi

-- Which restaurant has the highest approximate cost for two people?
select max(`approx_cost(for two people)`) from data; -- 950

-- Which restaurant has the lowest approximate cost for two people?
select min(`approx_cost(for two people)`) from data; -- 950
-- What is the average cost for two people for restaurants in each type (listed_in)?
select `listed_in(type)`,avg(`approx_cost(for two people)`) from data group by `listed_in(type)`;
-- Which type (listed_in) of restaurants has the highest average cost for two people?
select `listed_in(type)`,avg(`approx_cost(for two people)`) from data group by `listed_in(type)` order by `listed_in(type)` desc limit 1;
-- Which type (listed_in) of restaurants has the lowest average cost for two people?
select `listed_in(type)`,avg(`approx_cost(for two people)`) from data group by `listed_in(type)` order by `listed_in(type)` asc limit 1;
-- What is the total number of online orders across all restaurants?

select `listed_in(type)`,count(online_order) from data group by `listed_in(type)` having online_order='Yes';
describe data;
-- How many restaurants have more than 100 votes?
select count(*) from data where votes>100;
-- What is the most common type (listed_in) of restaurant?
select `listed_in(type)`,count(*) from data group by `listed_in(type)`; -- Dining	110
-- Which type of restaurant has the most votes?
select `listed_in(type)`,sum(votes) from data group by `listed_in(type)` order by `listed_in(type)` desc limit 1; -- other	9367
-- What is the total number of restaurants with a rating above 4?
select count(*) from data where rate>4 ; -- 24
-- Which restaurant has the most expensive approximate cost for two people in a specific type (listed_in)?
select name,max(`approx_cost(for two people)`) from data group by name;
-- What is the average number of votes for restaurants that do not offer online ordering?
select round(avg(votes),1) from data where online_order='No';  -- 75.2

-- What percentage of restaurants offer online ordering? -- 39.18919%
select * from data;
select online_order,count(*) as Total_orders,
(count(*)*100.0/sum(count(*))over()) as percentage
from data
group by online_order;

-- What percentage of restaurants offer table booking? -- 5.40541
select * from data;
select book_table,count(*) as Total_booking,
(count(*)*100.0/sum(count(*))over()) as Percentage
from data
group by book_table;
-- How many restaurants have an approximate cost for two people above $50?
select * from data where `approx_cost(for two people)`>50;
-- Which restaurant has the lowest rating and the highest number of votes?
select name,min(rate),max(votes) from data group by name order by min(rate);
select * from data where min(rate) and max(votes);
select * from data;
-- Which type (listed_in) of restaurant has the lowest number of votes on average?
select * from data;
select  `listed_in(type)`,avg(votes) from data group by  `listed_in(type)` order by avg(votes) limit 1  ; -- Dining	185.1182
-- How many restaurants are in each type (listed_in)?
select `listed_in(type)`,count(*) from data group by `listed_in(type)`;



-- What is the distribution of ratings across different types (listed_in)?  
select `listed_in(type)`,rate,count(*) as Total,
(count(*)*100.0/sum(count(*))over()) as Percent 
from data
group by `listed_in(type)`,rate;



-- Which restaurant has the highest number of votes and does not offer online ordering?
select * from data where online_order='Yes' and votes=(select max(votes) from data); -- Empire Restaurant	Yes	No	4884	750	other	4.4
-- Which restaurant has the lowest number of votes and does not allow table booking?
select * from data where book_table='No' and votes=(select min(votes) from data) ;
-- What is the average cost for two people of restaurants that offer table booking?
select avg(`approx_cost(for two people)`) from  data where book_table='Yes'; -- 693.7500
-- How many restaurants offer table booking but do not offer online ordering?
select count(*) from data where book_table='Yes' and online_order='No'; -- 1
-- Which restaurant has the most votes and the highest rating?
select name from data where votes=(select max(votes) from data) and rate=(select max(rate) from data);
-- What is the highest average rating for a type of restaurant with an approximate cost less than $30 for two people?
select name  from data  data group by name having `approx_cost(for two people)`<30 and rate=(select max(avgrate) from (select avg(rate) as avgrate from data));
-- What is the most expensive restaurant in each type (listed_in)?
select `listed_in(type)`,max(`approx_cost(for two people)`) from data group by `listed_in(type)` order by max(`approx_cost(for two people)`) desc limit 1;
-- What is the percentage of restaurants that allow customers to book tables and offer online ordering?

-- Which type of restaurant has the highest average number of votes?
with av as (
 select `listed_in(type)`,avg(votes) as avge from data group by `listed_in(type)`
)
select `listed_in(type)`, max(avge) from av group by `listed_in(type)`;
-- What is the average number of votes for restaurants in each price range (approximate cost)?
select `approx_cost(for two people)`,round(avg(rate),2) from data group by `approx_cost(for two people)`;
-- Which restaurant has the lowest rating but is in the highest price range (approximate cost)?
select * from data where rate=(select min(rate)) and `approx_cost(for two people)`=(select max(`approx_cost(for two people)`) from data);

-- Which restaurant has the highest rating but is in the lowest price range (approximate cost)?
select * from data where rate=(select max(rate)) and `approx_cost(for two people)`=(select min(`approx_cost(for two people)`) from data);
-- How many restaurants are there in total that do not have a rating?
select count(*) from data where rate is null or rate=0;
-- How many restaurants have an approximate cost for two people between $20 and $40?
select * from data where `approx_cost(for two people)` between 20 and 40;
-- What is the most common rating among restaurants that offer online ordering?
select name,max(count(rate)) from data group by name having online_order='Yes';