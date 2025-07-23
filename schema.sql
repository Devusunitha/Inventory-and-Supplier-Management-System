CREATE DATABASE InventoryDB;
USE InventoryDB;

-- Categories table
CREATE TABLE Categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL
);

-- Suppliers table
CREATE TABLE Suppliers (
  supplier_id INT AUTO_INCREMENT PRIMARY KEY,
  supplier_name VARCHAR(100),
  contact_person VARCHAR(100),
  phone VARCHAR(20),
  email VARCHAR(100),
  address VARCHAR(255)
);

-- Products table
CREATE TABLE Products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(100),
  category_id INT,
  unit_price DECIMAL(10,2),
  quantity_in_stock INT,
  reorder_level INT,
  supplier_id INT,
  FOREIGN KEY (category_id) REFERENCES Categories(category_id),
  FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- Purchases table
CREATE TABLE Purchases (
  purchase_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  supplier_id INT,
  purchase_date DATE,
  quantity INT,
  total_cost DECIMAL(10,2),
  FOREIGN KEY (product_id) REFERENCES Products(product_id),
  FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- Inventory_Log
CREATE TABLE Inventory_Log (
  log_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  change_type VARCHAR(20),
  quantity_changed INT,
  change_date DATETIME,
  remarks VARCHAR(255),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
