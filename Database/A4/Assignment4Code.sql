USE dealership;


CREATE TABLE model(
ID INT NOT NULL AUTO_INCREMENT,
model VARCHAR(50) NOT NULL UNIQUE,
PRIMARY KEY (ID)
);

CREATE TABLE make(
ID INT NOT NULL AUTO_INCREMENT,
make VARCHAR(50) NOT NULL UNIQUE,
PRIMARY KEY (ID)
);

CREATE TABLE type(
ID INT NOT NULL AUTO_INCREMENT,
type VARCHAR(50) NOT NULL UNIQUE,
PRIMARY KEY (ID)
);

CREATE TABLE color(
ID INT NOT NULL AUTO_INCREMENT,
color VARCHAR (25) NOT NULL UNIQUE,
PRIMARY KEY (ID)
);

CREATE TABLE engine(
ID INT NOT NULL AUTO_INCREMENT,
engine VARCHAR(10) NOT NULL UNIQUE,
PRIMARY KEY (ID)
);

CREATE TABLE transmission(
ID INT NOT NULL AUTO_INCREMENT,
transmission VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (ID)
);

CREATE TABLE cylinders(
ID INT NOT NULL AUTO_INCREMENT,
cylinders VARCHAR(2) NOT NULL UNIQUE,
PRIMARY KEY (ID)
);

INSERT INTO model (model)
SELECT DISTINCT model
FROM vehicle;

INSERT INTO make (make)
SELECT DISTINCT make
FROM vehicle;

INSERT INTO type (type)
SELECT DISTINCT type
FROM vehicle;

INSERT INTO color (color)
SELECT DISTINCT color
FROM vehicle;

INSERT INTO engine (engine)
SELECT DISTINCT engine
FROM vehicle;

INSERT INTO transmission (transmission)
SELECT DISTINCT transmission
FROM vehicle;

INSERT INTO cylinders (cylinders)
SELECT DISTINCT cylinders
FROM vehicle;


SELECT * FROM make ORDER BY ID;

UPDATE vehicle
SET make = 1
WHERE make = 'BMW';

UPDATE vehicle
SET make = 2
WHERE make = 'Ford';

UPDATE vehicle
SET make = 3
WHERE make = 'Toyota';


SELECT * FROM model ORDER BY ID;

UPDATE vehicle
SET model = 1
WHERE model = '3 Series';

UPDATE vehicle
SET model = 2
WHERE model = '2 Series';

UPDATE vehicle
SET model = 3
WHERE model = '1 Series';

UPDATE vehicle
SET model = 4
WHERE model = '5 Series';

UPDATE vehicle
SET model = 5
WHERE model = '6 Series';

UPDATE vehicle
SET model = 6
WHERE model = '7 Series';

UPDATE vehicle
SET model = 7
WHERE model = '8 Series';

UPDATE vehicle
SET model = 8
WHERE model = 'F-150';

UPDATE vehicle
SET model = 9
WHERE model = 'F-250';

UPDATE vehicle
SET model = 10
WHERE model = 'F-350';

UPDATE vehicle
SET model = 11
WHERE model = 'Prius';

UPDATE vehicle
SET model = 12
WHERE model = 'Camry';

UPDATE vehicle
SET model = 13
WHERE model = 'Corolla';

UPDATE vehicle
SET model = 14
WHERE model = 'RAV4';

UPDATE vehicle
SET model = 15
WHERE model = '4Runner';


SELECT * FROM type ORDER BY ID;

UPDATE vehicle
SET type = 1
WHERE type = 'Sedan';

UPDATE vehicle
SET type = 2
WHERE type = 'Coupe';

UPDATE vehicle
SET type = 3
WHERE type = 'Convertible';

UPDATE vehicle
SET type = 4
WHERE type = 'Wagon';

UPDATE vehicle
SET type = 5
WHERE type = 'Truck (Regular Cab)';

UPDATE vehicle
SET type = 6
WHERE type = 'Truck (SuperCrew)';

UPDATE vehicle
SET type = 7
WHERE type = 'Truck (SuperCab)';

UPDATE vehicle
SET type = 8
WHERE type = 'Hatchback';

UPDATE vehicle
SET type = 9
WHERE type = 'SUV';


SELECT * FROM color ORDER BY ID;

UPDATE vehicle
SET color = 1
WHERE color = 'Alpine White';

UPDATE vehicle
SET color = 2
WHERE color = 'Potamaic Blue';

UPDATE vehicle
SET color = 3
WHERE color = 'Tanzanite Blue';

UPDATE vehicle
SET color = 4
WHERE color = 'Mineral Grey';

UPDATE vehicle
SET color = 5
WHERE color = 'Sunset Orange';

UPDATE vehicle
SET color = 6
WHERE color = 'Mediterranean Blue';

UPDATE vehicle
SET color = 7
WHERE color = 'Dravit Grey Metallic';

UPDATE vehicle
SET color = 8
WHERE color = 'Black Sapphire';

UPDATE vehicle
SET color = 9
WHERE color = 'Velocity Blue';

UPDATE vehicle
SET color = 10
WHERE color = 'Guard';

UPDATE vehicle
SET color = 11
WHERE color = 'Antimatter Blue';

UPDATE vehicle
SET color = 12
WHERE color = 'Space White';

UPDATE vehicle
SET color = 13
WHERE color = 'Carbonized Gray';

UPDATE vehicle
SET color = 14
WHERE color = 'Oxford White';

UPDATE vehicle
SET color = 15
WHERE color = 'Iconic Silver';

UPDATE vehicle
SET color = 16
WHERE color = 'Rapid Red';

UPDATE vehicle
SET color = 17
WHERE color = 'Agate Black';

UPDATE vehicle
SET color = 18
WHERE color = 'Red';

UPDATE vehicle
SET color = 19
WHERE color = 'White';

UPDATE vehicle
SET color = 20
WHERE color = 'Black';

UPDATE vehicle
SET color = 21
WHERE color = 'Grey';


SELECT * FROM engine ORDER BY ID;

UPDATE vehicle
SET engine = 1
WHERE engine = '2.0';

UPDATE vehicle
SET engine = 2
WHERE engine = '3.0';

UPDATE vehicle
SET engine = 3
WHERE engine = '3.3';

UPDATE vehicle
SET engine = 4
WHERE engine = '5.0';

UPDATE vehicle
SET engine = 5
WHERE engine = '2.7';

UPDATE vehicle
SET engine = 6
WHERE engine = '3.5';

UPDATE vehicle
SET engine = 7
WHERE engine = '1.8';

UPDATE vehicle
SET engine = 8
WHERE engine = '1.5';


SELECT * FROM transmission ORDER BY ID;

UPDATE vehicle
SET transmission = 1
WHERE transmission = '8-speed shiftable automatic';

UPDATE vehicle
SET transmission = 2
WHERE transmission = '6-speed manual';

UPDATE vehicle
SET transmission = 3
WHERE transmission = '10-speed shiftable automatic';

UPDATE vehicle
SET transmission = 4
WHERE transmission = '6-speed shiftable automatic';

UPDATE vehicle
SET transmission = 5
WHERE transmission = 'continuously variable-speed automatic';


SELECT * FROM cylinders ORDER BY ID;

UPDATE vehicle
SET cylinders = 1
WHERE cylinders = 'I4';

UPDATE vehicle
SET cylinders = 2
WHERE cylinders = 'I6';

UPDATE vehicle
SET cylinders = 3
WHERE cylinders = 'V6';

UPDATE vehicle
SET cylinders = 4
WHERE cylinders = 'V8';


ALTER TABLE vehicle MODIFY COLUMN make INT NOT NULL;
ALTER TABLE vehicle MODIFY COLUMN model INT NOT NULL;
ALTER TABLE vehicle MODIFY COLUMN type INT NOT NULL;
ALTER TABLE vehicle MODIFY COLUMN color INT NOT NULL;
ALTER TABLE vehicle MODIFY COLUMN engine INT NOT NULL;
ALTER TABLE vehicle MODIFY COLUMN transmission INT NOT NULL;
ALTER TABLE vehicle MODIFY COLUMN cylinders INT NOT NULL;


ALTER TABLE vehicle ADD CONSTRAINT FOREIGN KEY (make) REFERENCES make(ID);
ALTER TABLE vehicle ADD CONSTRAINT FOREIGN KEY (model) REFERENCES model(ID);
ALTER TABLE vehicle ADD CONSTRAINT FOREIGN KEY (type) REFERENCES type(ID);
ALTER TABLE vehicle ADD CONSTRAINT FOREIGN KEY (color) REFERENCES color(ID);
ALTER TABLE vehicle ADD CONSTRAINT FOREIGN KEY (engine) REFERENCES engine(ID);
ALTER TABLE vehicle ADD CONSTRAINT FOREIGN KEY (transmission) REFERENCES transmission(ID);
ALTER TABLE vehicle ADD CONSTRAINT FOREIGN KEY (cylinders) REFERENCES cylinders(ID);