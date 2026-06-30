create database world
USE world;
SHOW TABLES;


--Question 1: Count how many cities are there in each country?

select countrycode, count(*) AS TOTAL_CITIES
FROM city
group by countrycode

--Question 2 : Display all continents having more than 30 countries.

select continent, count(code) as TOTAL_COUNTRIES
from country
group  by continent
having count(code)>30

--Question 3 : List regions whose total population exceeds 200 million.

select Region, sum(population) as TOTAL_POPULATION
from country
GROUP BY Region
having sum(population)>200000000

--Question 4 : Find the top 5 continents by average GNP per country.

select Continent, avg(GNP) as AVERAGE_GNP
FROM Country
group by continent
order by avg(GNP) DESC
limit 5

--Question 5 : Find the total number of official languages spoken in each continent.

SELECT c.continent, count(cl.language) as total_off_lng
from country as c join countrylanguage as cl on c.code = cl.countrycode
where cl.IsOfficial = 'T'
group by c.continent

--Question 6 : Find the maximum and minimum GNP for each continent.

select continent,
max(GNP) AS MAX_GNP,
min(GNP) AS MIN_GNP
FROM country
group by continent

--Question 7: Find the country with the highest average city population.

select countrycode, avg(population) as Highest_Population
from city
group by countrycode
order by avg(population) desc
limit 1

--Question 8 : List continents where the average city population is greater than 200,000.

select continent, avg(population) as AVG_Population
from country
group by continent
having avg(population) >200000

--Question 9 : Find the total population and average life expectancy for each continent, ordered by average life 
expectancy descending.

select continent,
sum(population) as TOTAL_POPULATION,
avg(LifeExpectancy) as AVG_LIFE_EXPECTANCY
from country
group by continent
order by AVG_LIFE_EXPECTANCY DESC

--Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where 
the total population is over 200 million.

select continent,
sum(population) as TOTAL_POPULATION,
avg(lifeexpectancy) as HIGHEST_LIFE_EXPECTANCY
from country
group by continent
having sum(population) > 200000000
order by HIGHEST_LIFE_EXPECTANCY desc
limit 3



