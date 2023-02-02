USE dealership;

CREATE TABLE cityState(
city VARCHAR(90) NOT NULL,
state CHAR(2) NOT NULL,
zipCode CHAR(5) NOT NULL UNIQUE,
PRIMARY KEY (zipCode)
);

INSERT INTO cityState (city, state, zipCode)
VALUES
('Piscataway', 'NJ', 08854),
('Clover', 'SC', 29710),
('Duluth', 'GA', 30096),
('Nashville', 'TN', 37205),
('Willoughby', 'OH', 44094),
('Jupiter', 'FL', 33458),
('Huntington Beach', 'CA', 92647),
('Memphis', 'TN', 38117),
('Abingdon', 'VA', 24210),
('San Marcos', 'CA', 92078),
('Jefferson', 'LA', 70121),
('Covington', 'LA', 70433),
('Ontario', 'CA', 91764),
('Cuyahoga Falls', 'OH', 44223),
('Battle Creek', 'MI', 49016),
('Scottsdale', 'AZ', 85260),
('Glenarden', 'MD', 20706);

ALTER TABLE employee ADD CONSTRAINT FOREIGN KEY (zipCode) REFERENCES cityState(zipCode);

ALTER TABLE customer ADD CONSTRAINT FOREIGN KEY (zipCode) REFERENCES cityState(zipCode);


CREATE VIEW customerView AS
SELECT firstName, lastname, address, city, state, cityState.zipCode, phone, email
FROM customer, cityState
WHERE customer.zipCode = cityState.zipCode;

CREATE VIEW employeeView AS
SELECT firstName, lastname, address, city, state, cityState.zipCode, phone, email 
FROM employee, cityState
WHERE employee.zipCode = cityState.zipCode;

CREATE TABLE sale(
employeeId INT NOT NULL,
customerId INT NOT NULL,
vehicleId INT NOT NULL,
salePrice DECIMAL(8,2) NOT NULL,
PRIMARY KEY (employeeId, customerId, vehicleId),
FOREIGN KEY (employeeId) REFERENCES employee(ID),
FOREIGN KEY (customerId) REFERENCES customer(ID),
FOREIGN KEY (vehicleId) REFERENCES vehicle(ID)
);