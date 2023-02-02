USE dealership;

UPDATE employee
SET email = REPLACE(email, 'renovations', 'dealership');

ALTER TABLE sale MODIFY salePrice decimal(8,2) NOT NULL DEFAULT(0.0);

INSERT INTO sale (employeeId, customerId, vehicleId)
VALUES
(1, 14, 3),
(2, 30, 32),
(3, 8, 15),
(5, 18, 21),
(8, 12, 9),
(10, 31, 35);

UPDATE sale 
SET salePrice = (SELECT retail FROM vehicle WHERE sale.vehicleId = vehicle.ID);

CREATE VIEW saleView AS
SELECT
CONCAT(customer.firstName,' ', customer.lastName) AS 'Customer Name',
CONCAT(customer.address,' ', cityState.city,' ', cityState.state,' ', cityState.zipCode) AS 'Customer Address',
customer.phone AS 'Customer Phone',
customer.email AS 'Customer Email',
CONCAT(employee.firstName,' ', employee.lastName) AS 'Sales Associate',
employee.phone AS 'Sales Associate Phone',
employee.email AS 'Sales Associate Email',
vehicle.year AS 'Year',
make.make AS 'Make',
model.model AS 'Model',
color.color AS 'Color',
type.type AS 'Type',
vehicle.vin AS 'VIN',
sale.salePrice AS 'Sale Price'
FROM customer, cityState, employee, vehicle, make, model, color, type, sale
WHERE customer.ID = sale.customerId 
AND customer.zipCode = cityState.zipCode
AND employee.ID = sale.employeeId
AND vehicle.ID = sale.vehicleId
AND model.ID = vehicle.model
AND color.ID = vehicle.color
AND type.ID = vehicle.type
AND make.ID = vehicle.make;

