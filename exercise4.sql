
1. Write a query which will change the yearmodel to 2019 if the idcar=7

UPDATE car SET yearmodel="2019" WHERE idcar=7; 

2. Write a query which will change the model to A5 if the idcar=1

UPDATE car SET model="A5" WHERE idcar=1

3. Write a query which will insert a car with this data(VW, Golf, 2015)

INSERT INTO car(model) VALUES ('Golf');
UPDATE car SET brand='VW' WHERE idcar=11;
UPDATE car SET yearmodel='2015' WHERE idcar=11;


4. Write a query which will remove the previous car

DELETE FROM car WHERE idcar=11; 


5. Write a procedure named min_year which will return all cars which yearmodel is bigger than the argument. So example if the user calls the procedure like this:

CALL min_year(2016) the query will return cars made after 2016§

DELIMITER $$
create procedure min_year(IN ln VARCHAR(50))
BEGIN
SELECT * FROM car WHERE yearmodel=>2016; 
END $$
DELIMITER; 