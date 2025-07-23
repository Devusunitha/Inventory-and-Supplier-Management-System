-- Insert into Categories
INSERT INTO Categories (category_name) VALUES 
('Electronics'),
('Stationery'),
('Groceries'),
('Furniture');

-- Insert into Suppliers
INSERT INTO Suppliers (supplier_name, contact_person, phone, email, address) VALUES 
('ElectroMart', 'Rajesh Kumar', '9876543210', 'rajesh@electromart.com', 'Chennai'),
('OfficeSupplyCo', 'Meena Das', '9988776655', 'meena@officeco.com', 'Bangalore'),
('FreshMart', 'John Dsouza', '9123456789', 'john@freshmart.com', 'Kochi'),
('HomeFit', 'Aarti Singh', '9090909090', 'aarti@homefit.com', 'Hyderabad');

-- Insert into Products
INSERT INTO Products (product_name, category_id, unit_price, quantity_in_stock, reorder_level, supplier_id) VALUES 
('LED Monitor', 1, 7500.00, 10, 5, 1),
('USB Keyboard', 1, 600.00, 50, 20, 1),
('Notebook Pack', 2, 120.00, 100, 30, 2),
('Rice 10kg', 3, 550.00, 40, 15, 3),
('Dining Table', 4, 8500.00, 5, 2, 4),
('Pen Set', 2, 35.00, 200, 50, 2),
('Mouse Wireless', 1, 450.00, 60, 25, 1),
('Detergent', 3, 180.00, 80, 20, 3);

-- Insert into Purchases
INSERT INTO Purchases (product_id, supplier_id, purchase_date, quantity, total_cost) VALUES 
(1, 1, '2025-07-01', 5, 37500.00),
(2, 1, '2025-07-05', 30, 18000.00),
(3, 2, '2025-07-07', 50, 6000.00),
(4, 3, '2025-07-10', 20, 11000.00),
(5, 4, '2025-07-15', 2, 17000.00),
(6, 2, '2025-07-17', 100, 3500.00),
(7, 1, '2025-07-18', 25, 11250.00);

-- Insert into Inventory_Log
INSERT INTO Inventory_Log (product_id, change_type, quantity_changed, change_date, remarks) VALUES 
(1, 'Added', 5, '2025-07-01 10:15:00', 'Stock purchased'),
(2, 'Added', 30, '2025-07-05 14:30:00', 'Restocked'),
(3, 'Added', 50, '2025-07-07 09:45:00', 'New stock'),
(4, 'Added', 20, '2025-07-10 11:00:00', 'Regular supply'),
(5, 'Added', 2, '2025-07-15 16:20:00', 'New arrival'),
(6, 'Added', 100, '2025-07-17 12:00:00', 'Bulk purchase'),
(7, 'Added', 25, '2025-07-18 08:55:00', 'Reorder');
