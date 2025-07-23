-- 1. Procedure: Add a new purchase and update stock & log
DELIMITER //

CREATE PROCEDURE AddPurchase (
    IN prod_id INT,
    IN supp_id INT,
    IN qty INT,
    IN cost DECIMAL(10,2)
)
BEGIN
    DECLARE purchaseDate DATE;
    SET purchaseDate = CURDATE();
    
    -- Insert into Purchases
    INSERT INTO Purchases (product_id, supplier_id, purchase_date, quantity, total_cost)
    VALUES (prod_id, supp_id, purchaseDate, qty, cost);
    
    -- Update stock in Products table
    UPDATE Products
    SET quantity_in_stock = quantity_in_stock + qty
    WHERE product_id = prod_id;
    
    -- Add entry to Inventory_Log
    INSERT INTO Inventory_Log (product_id, change_type, quantity_changed, change_date, remarks)
    VALUES (prod_id, 'Added', qty, NOW(), 'Auto-insert via AddPurchase procedure');
END;
//

DELIMITER ;

-- Usage:
-- CALL AddPurchase(1, 1, 10, 75000.00);


-- 2. Procedure: Reduce product stock manually (simulate order or damage)
DELIMITER //

CREATE PROCEDURE ReduceStock (
    IN prod_id INT,
    IN qty INT,
    IN reason VARCHAR(100)
)
BEGIN
    -- Update stock in Products
    UPDATE Products
    SET quantity_in_stock = quantity_in_stock - qty
    WHERE product_id = prod_id;

    -- Insert into Inventory_Log
    INSERT INTO Inventory_Log (product_id, change_type, quantity_changed, change_date, remarks)
    VALUES (prod_id, 'Removed', qty, NOW(), reason);
END;
//

DELIMITER ;

-- Usage:
-- CALL ReduceStock(2, 5, 'Damaged in storage');
