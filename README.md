# Inventory and Supplier Management System  
### SQL Project – Elevate Lab Internship

This project is part of the Elevate Lab SQL Internship and demonstrates the design and implementation of a fully functional Inventory and Supplier Management System using SQL. It focuses on database creation, normalization, data population, reporting, and automation through SQL constructs.

---

## 📌 Project Objective

To develop a relational database that manages suppliers, inventory stock, purchases, and historical stock changes. The system helps in identifying low stock items, linking suppliers to products, tracking purchases, and generating reports to support inventory decisions.

---

## 🧱 Database Schema

The database consists of the following core tables:

| Table Name       | Description |
|------------------|-------------|
| `Categories`     | Product categories (Electronics, Stationery, etc.) |
| `Suppliers`      | Supplier details with contact and location info |
| `Products`       | Inventory items, pricing, supplier and stock info |
| `Purchases`      | Records of purchases from suppliers |
| `Inventory_Log`  | Tracks changes in stock quantity with timestamps |

---

## ⚙️ Features Implemented

- Track inventory items with quantity and reorder level
- Link each product to a supplier and category
- Log stock changes (add/remove with reason and time)
- View product details with category and supplier info
- Analyze purchase trends and supplier performance
- Identify products needing restock
- Calculate total stock value using a function
- Use procedures to handle purchase and stock automation

---

## 💾 Project Files

| File | Description |
|------|-------------|
| `schema.sql`        | Contains all CREATE TABLE statements |
| `insert_data.sql`   | Sample data for all tables |
| `queries.sql`       | Complex SELECTs, JOINs, filters |
| `views.sql`         | SQL views for common reports |
| `functions.sql`     | User-defined functions for automation |
| `procedures.sql`    | Stored procedures to update stock and purchases |
| `project_report.pdf`| Final report with abstract and documentation |

---

## 🛠️ Tech Stack

- **Database**: MySQL  
- **IDE**: MySQL Workbench / DBeaver  
- **Design Tool**: dbdiagram.io  
- **Version Control**: GitHub

---

## 📎 How to Run

1. Open `schema.sql` in MySQL Workbench and execute to create all tables.
2. Run `insert_data.sql` to populate tables with sample data.
3. Use `queries.sql`, `views.sql`, `functions.sql`, and `procedures.sql` to test and analyze the system.
4. Refer to `project_report.pdf` for full documentation.

---

## 👤 Author

**Devu S**  
SQL Developer Intern – Elevate Lab  
College of Engineering Chengannur  
