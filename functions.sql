-- 1. Function: Get total stock value of all products
DELIMITER //

CREATE FUNCTION GetTotalStockValue()
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
    DECLARE total_value DECIMAL(15,2);
    
    SELECT SUM(unit_price * quantity_in_stock)
    INTO total_value
    FROM Products;
    
    RETURN total_value;
END;
//

DELIMITER ;

-- Usage:
-- SELECT GetTotalStockValue();


-- 2. Function: Check if a product needs restocking
DELIMITER //

CREATE FUNCTION NeedsRestocking(pid INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE qty INT;
    DECLARE reorder INT;
    DECLARE status VARCHAR(10);
    
    SELECT quantity_in_stock, reorder_level
    INTO qty, reorder
    FROM Products
    WHERE product_id = pid;
    
    IF qty < reorder THEN
        SET status = 'Yes';
    ELSE
        SET status = 'No';
    END IF;
    
    RETURN status;
END;
//

DELIMITER ;

-- Usage:
-- SELECT NeedsRestocking(1);


-- 3. Function: Get product count in a category
DELIMITER //

CREATE FUNCTION CountProductsInCategory(cat_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE product_count INT;
    
    SELECT COUNT(*)
    INTO product_count
    FROM Products
    WHERE category_id = cat_id;
    
    RETURN product_count;
END;
//

DELIMITER ;

-- Usage:
-- SELECT CountProductsInCategory(2);
