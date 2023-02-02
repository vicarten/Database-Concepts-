USE dealership;

DELIMITER $$
DROP PROCEDURE IF EXISTS commissionCheck$$ 
CREATE PROCEDURE commissionCheck (
    IN employeeNum INT,
    INOUT commission VARCHAR(4000))
BEGIN
DECLARE v_finished integer DEFAULT 0;
DECLARE v_lines varchar(100) DEFAULT " -------------------------------------------------------------------------------- ";
DECLARE v_eFirst varchar(100) DEFAULT "";
DECLARE v_eLast varchar(100) DEFAULT "";
DECLARE v_eAddress varchar(100) DEFAULT "";
DECLARE v_eCity varchar(100) DEFAULT "";
DECLARE v_eState varchar(100) DEFAULT "";
DECLARE v_eZip varchar(100) DEFAULT "";
DECLARE v_retail decimal(8,2) DEFAULT 0.0;
DECLARE v_pay decimal(8,2) DEFAULT 0.0;
DECLARE v_count integer DEFAULT 0;
DECLARE v_eight decimal(3,2) DEFAULT .08;
DECLARE v_ten decimal(3,2) DEFAULT .10;
DECLARE v_fifteen decimal(3,2) DEFAULT .15;
DECLARE v_twenty decimal(3,2) DEFAULT .20;

DECLARE employee_cursor CURSOR FOR

SELECT firstName, lastName, address, city, state, zipCode, salePrice
FROM employee, cityState, sale
WHERE sale.employeeId = employeeNum;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;

OPEN employee_cursor;

get_employee: LOOP

Fetch employee_cursor INTO v_eFirst;
Fetch employee_cursor INTO v_eLast;
Fetch employee_cursor INTO v_eAddress;
Fetch employee_cursor INTO v_eCity;
Fetch employee_cursor INTO v_eState;
Fetch employee_cursor INTO v_eZip ;
Fetch employee_cursor INTO v_retail;

IF v_finished = 1 THEN
LEAVE get_employee;
END IF;

SET v_count = v_count + 1;

IF v_count = 1 THEN
IF v_retail >= 40000 THEN
SET v_pay = v_retail * 0.2;
ELSEIF v_retail >= 30000 THEN
SET v_pay = v_retail * 0.15;
ELSEIF v_retail >= 20000 THEN
SET v_pay = v_retail * 0.1;
ELSE 
SET v_pay = v_retail * 0.08;
END IF;

Set commission = CONCAT(commission, '\From:\n');
Set commission = CONCAT(commission, '\nCGS 2545 Car Dealership\n');
Set commission = CONCAT(commission, '\UCF\n');
Set commission = CONCAT(commission, '\MSB 260\n\n');
Set commission = CONCAT(commission, 'Pay to the order of:\n\n');
Set commission = CONCAT(commission, v_eFirst, '', v_eLast, '\n');
Set commission = CONCAT(commission, v_eAddress, '\n');
Set commission = CONCAT(commission, v_eCity, '', v_eState, '', v_eZip, '\n');
Set commission = CONCAT(commission, 'In the amount of:\n\n');
Set commission = CONCAT(commission, '$', v_pay, '\n');
Set commission = CONCAT(commission, '\n', v_lines, '\n');

END IF;

END LOOP get_employee;
 
CLOSE employee_cursor;

END$$
 
DELIMITER ;

SET @commission = "";
CALL commissionCheck(sale.employeeId, @commission);
SELECT @commission;




