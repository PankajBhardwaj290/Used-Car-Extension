create database used_car;
use used_car;
create table extension (
model_year int not null,
brand varchar(50),
model varchar(100),
type varchar(20),
miles_per_gallon int,
premium_version int,
msrp int,
collection_car int
);
select * from extension;
-- *Total count of cars by type
select type ,count(type) from extension
group by type;

-- Average miles per gallon by vehicle type*
select type,avg(miles_per_gallon) from extension 
group by type;

-- Top 5 most expensive cars
select brand,model,msrp from extension
order by msrp desc;

-- Number of premium version cars vs non-premium cars*:
select premium_version,count(premium_version) from extension
group by premium_version;

-- *Average MSRP of cars made after 2010*:
select model,round(avg(msrp),2) as avg_msrp from extension 
where model_year>2010
group by model
;

-- Fuel efficiency (miles_per_gallon) comparison for collection cars and non-collection cars*
select collection_car,avg(miles_per_gallon) as avg_mpg from extension
group by collection_car;

-- Count of cars for each brand*:
select brand,count(model) as total_cars from extension
group by brand
order by count(model) desc;

-- Cars with the highest fuel efficiency per type
select type,brand,model,miles_per_gallon from extension
order by miles_per_gallon desc
limit 5;

SELECT type, brand, model, miles_per_gallon FROM  extension order by  miles_per_gallon DESC LIMIT 1;

-- Write a query to count how many cars of each type were manufactured in each year
SELECT model_year, COUNT(*) AS car_count
FROM extension
GROUP BY model_year
order by  car_count desc;

