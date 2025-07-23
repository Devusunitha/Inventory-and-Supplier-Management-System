-- 1. View: Full Product Details with Category and Supplier
CREATE VIEW ProductDetails AS
SELECT 
    p.product_id,
    p.product_name,
    c.category_name,
    s.supplier_name,
    p.unit_price,
    p.quantity_in_stock,
    p.reorder_level
FROM Products p
JOIN Categories c ON p.category_id = c.category_id
JOIN Suppliers s ON p.supplier_id = s.supplier_id;

-- 2. View: Products Below Reorder Level
CREATE VIEW LowStockProducts AS
SELECT 
    product_id,
    product_name,
    quantity_in_stock,
    reorder_level
FROM Products
WHERE quantity_in_stock < reorder_level;

-- 3. View: Supplier-wise Product List
CREATE VIEW SupplierProductList AS
SELECT 
    s.supplier_name,
    p.product_name,
    c.category_name,
    p.unit_price
FROM Suppliers s
JOIN Products p ON s.supplier_id = p.supplier_id
JOIN Categories c ON p.category_id = c.category_id
ORDER BY s.supplier_name;

-- 4. View: Monthly Purchases Summary
CREATE VIEW MonthlyPurchaseSummary AS
SELECT 
    DATE_FORMAT(purchase_date, '%Y-%m') AS month,
    SUM(total_cost) AS total_purchased_amount,
    COUNT(purchase_id) AS number_of_purchases
FROM Purchases
GROUP BY month
ORDER BY month DESC;

-- 5. View: Inventory Stock Value
CREATE VIEW StockValueReport AS
SELECT 
    product_name,
    unit_price,
    quantity_in_stock,
    (unit_price * quantity_in_stock) AS stock_value
FROM Products;
