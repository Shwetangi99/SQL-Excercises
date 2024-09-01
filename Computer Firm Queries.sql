-- SOME SIMPLE SELECT OPTION EXERCISES:

--Q1 Get pairs of PC models with identical speeds and the same RAM capacity. Each resulting pair should be displayed only once, i.e. (i, j) but not (j, i).
-------Result set: model with the bigger number, model with the smaller number, speed, and RAM.
SELECT DISTINCT A.model, B.model, A.speed, A.ram
FROM pc A
CROSS JOIN pc B
WHERE A.speed=B.speed AND A.ram=B.ram AND A.model>B.model

--Q2 Find the makers of the cheapest color printers.
-------Result set: maker, price.
SELECT DISTINCT A.maker, B.price
FROM product A
INNER JOIN printer B
ON A.model=B.model
WHERE color='y' AND price= (SELECT min(price) as price FROM printer
                WHERE color='y')

--Q3 Find the makers producing at least three distinct models of PCs.
-------Result set: maker, number of PC models
SELECT DISTINCT maker, count(model) as num_pc
FROM product
WHERE type='PC'
GROUP BY maker
HAVING count(model)>=3

--Q4 Get the makers producing both PCs having a speed of 750 MHz or higher and laptops with a speed of 750 MHz or higher.
-------Result set: maker
SELECT A.maker
FROM product A
INNER JOIN pc B
ON A.model=B.model
WHERE B.speed>=750
INTERSECT
SELECT C.maker
FROM product C
INNER JOIN laptop D
ON C.model=D.model
WHERE D.speed>=750

--Q5 List the models of any type having the highest price of all products present in the database.
WITH tempfile (model, price) AS (
Select model, max(price) as price FROM pc
GROUP BY model
UNION
Select model, max(price) as price FROM laptop
GROUP BY model
UNION
Select model, max(price) as price FROM printer
GROUP BY model
)
SELECT model FROM tempfile
WHERE price = (SELECT max(price) FROM tempfile)

--Q7 Find the printer makers also producing PCs with the lowest RAM capacity and the highest processor speed of all PCs having the lowest RAM capacity.
-------Result set: maker
Select distinct maker from product
where type='Printer'
intersect 
Select distinct pro.maker from product as pro
inner join pc as p
on p.model=pro.model
where p.ram in (select min(ram) from pc) and p.speed = (SELECT MAX(speed) FROM pc WHERE ram = (SELECT MIN(ram) FROM pc))


--Q8 For each maker who has models at least in one of the tables PC, Laptop, or Printer, determine the maximum price for his products. 
-------Output: maker; if there are NULL values among the prices for the products of a given maker, display NULL for this maker, otherwise, the maximum price.

SELECT A.maker,
       CASE 
           WHEN MAX(B.price) IS NULL THEN NULL
           ELSE MAX(B.price)
       END AS max_price
FROM product A
LEFT JOIN (
    SELECT model, price 
    FROM pc
    UNION ALL
    SELECT model, price 
    FROM laptop
    UNION ALL
    SELECT model, price 
    FROM printer
) B ON A.model = B.model
GROUP BY A.maker
