CREATE TABLE cats
	(
		cat_id INT NOT NULL AUTO_INCREMENT,
		name VARCHAR(100),
		age INT,
		PRIMARY KEY(cat_id)
	);

INSERT INTO cats(name, age)
VALUES('Connie', 10);

INSERT INTO cats(name, age)
VALUES('Charlie', 17);

SELECT * FROM cats;