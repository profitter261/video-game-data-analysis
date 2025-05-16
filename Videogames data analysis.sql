-- Top 10 best selling games in the market
select * from vgsales
order by Global_Sales desc limit 10;

-- best selling genres in the market
select sum(Global_Sales) as total_sales, Genre from vgsales
group by genre 
order by total_sales desc;

-- region wise top genres
select Genre, sum(NA_sales) NA_total from vgsales
group by Genre
order by NA_total desc;

select Genre, sum(EU_sales) total_EU from vgsales
group by Genre
order by total_EU desc;

select Genre, sum(JP_sales) total_JP from vgsales
group by Genre
order by total_JP desc;

-- publisher with most games 
select count(Publisher) as games_produced, Publisher from vgsales
group by Publisher
having count(Publisher) > 60
order by games_produced desc;

-- global sales trend by year
select sum(Global_Sales) total_sales, Year from vgsales
Where Year is not NULL
group by Year
order by Year asc;

-- top platforms as per game count
select count(Platform) as games_produced, Platform from vgsales
group by Platform
order by games_produced desc;

-- publisher wise average sales
select avg(Global_Sales) as average_sales_per_publisher, Publisher from vgsales
group by Publisher
having avg(Global_sales) > 2.2
order by average_sales_per_publisher desc;

-- top games by a specific publisher
select Publisher, max(Global_sales) maximum from vgsales
group by Publisher
order by maximum desc;

-- genre performance over years
select Genre, sum(Global_Sales) total_sales from vgsales
group by Genre
order by total_sales desc;

-- sales distribution for each game
select sum(JP_Sales) jap_sales, sum(EU_Sales) eu_sales, sum(NA_sales) na_sales, sum(Other_Sales) oth_sales from vgsales
