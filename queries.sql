-- 1. List all products with category and supplier names
SELECT 
    p.product_name,
    c.category_name,
    s.supplier_name,
    p.unit_price,
    p.quantity_in_stock
FROM Products p
JOIN Categories c ON p.category_id = c.category_id
JOIN Suppliers s ON p.supplier_id = s.supplier_id;

-- 2. Products that need restocking (quantity < reorder level)
SELECT 
    product_name,
    quantity_in_stock,
    reorder_level
FROM Products
WHERE quantity_in_stock < reorder_level;

-- 3. All purchases made in the last 30 days
SELECT 
    pr.purchase_id,
    p.product_name,
    s.supplier_name,
    pr.quantity,
    pr.total_cost,
    pr.purchase_date
FROM Purchases pr
JOIN Products p ON pr.product_id = p.product_id
JOIN Suppliers s ON pr.supplier_id = s.supplier_id
WHERE pr.purchase_date >= CURDATE() - INTERVAL 30 DAY;

-- 4. Total number of products per category
SELECT 
    c.category_name,
    COUNT(p.product_id) AS total_products
FROM Categories c
LEFT JOIN Products p ON c.category_id = p.category_id
GROUP BY c.category_name;

-- 5. Products and their last stock change log
SELECT 
    p.product_name,
    l.change_type,
    l.quantity_changed,
    l.change_date
FROM Products p
JOIN Inventory_Log l ON p.product_id = l.product_id
WHERE l.change_date = (
    SELECT MAX(l2.change_date)
    FROM Inventory_Log l2
    WHERE l2.product_id = p.product_id
);

-- 6. Supplier-wise total purchase amount
SELECT 
    s.supplier_name,
    SUM(pu.total_cost) AS total_purchase_value
FROM Suppliers s
JOIN Purchases pu ON s.supplier_id = pu.supplier_id
GROUP BY s.supplier_name;

-- 7. Product-wise total stock value
SELECT 
    product_name,
    unit_price * quantity_in_stock AS stock_value
FROM Products;

-- 8. Products supplied by each supplier
SELECT 
    s.supplier_name,
    p.product_name
FROM Suppliers s
JOIN Products p ON s.supplier_id = p.supplier_id
ORDER BY s.supplier_name;

-- 9. Top 3 most frequently purchased products
SELECT 
    p.product_name,
    SUM(pr.quantity) AS total_purchased
FROM Products p
JOIN Purchases pr ON p.product_id = pr.product_id
GROUP BY p.product_name
ORDER BY total_purchased DESC
LIMIT 3;

-- 10. List of all categories and their available stock totals
SELECT 
    c.category_name,
    SUM(p.quantity_in_stock) AS total_stock
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
GROUP BY c.category_name;
