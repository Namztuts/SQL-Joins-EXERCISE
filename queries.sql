-- write your queries here

--PART ONE

--Join the two tables 
SELECT * FROM owners o
    FULL JOIN vehicles v
    ON o.id = v.owner_id;

--Count the number of cars for each owner
SELECT o.first_name, o.last_name, COUNT(v.id) AS cars FROM owners o
    JOIN vehicles v
    ON o.id = v.owner_id
    GROUP BY o.first_name, o.last_name
    ORDER BY cars;

--Count the number of cars for each owner and display the average price for each of the cars as integers
SELECT o.first_name, o.last_name, CAST(AVG(v.price) AS INTEGER) AS average, COUNT(v.id) AS cars 
    FROM owners o
    JOIN vehicles v
    ON o.id = v.owner_id
    GROUP BY o.first_name, o.last_name
    HAVING AVG(v.price) > 10000 AND COUNT(v.id) > 1
    ORDER BY o.first_name desc;
