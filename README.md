# Pahana Edu Billing System

A comprehensive web-based billing management system designed for Pahana Edu Bookshop in Colombo City, Sri Lanka. This system provides efficient management of customer accounts, products, and billing information.

## Features

### 1. User Authentication (Login)
- Secure login system with username and password
- Session management for authorized access
- Default admin credentials: username: "admin", password: "admin123"

### 2. Customer Management
- **Add New Customer Accounts**: Register customers with unique account numbers
- **Edit Customer Information**: Update customer details including name, address, telephone
- **Display Account Details**: View and search customer information
- **Customer Search**: Find customers quickly by name or account number

### 3. Product Management
- **Add Products**: Add new books and items with descriptions and pricing
- **Edit Products**: Update product information including prices and descriptions
- **Delete Products**: Remove products that are no longer available
- **View Inventory**: Browse all available products in the system

### 4. Billing System
- **Create Bills**: Generate bills for customers with multiple items
- **Calculate Bills**: Automatic calculation of totals based on quantities and prices
- **Print Bills**: Generate professional-looking bills for customers
- **View Bill History**: Access all previous bills for any customer
- **Update Bill Status**: Mark bills as paid, pending, or cancelled
- **Bill Management**: List, view, and manage all bills in the system

### 5. Dashboard
- **System Statistics**: View total customers, products, and bills
- **Quick Access**: Easy navigation to all major functions
- **Activity Monitoring**: Track system performance and usage

### 6. Help Section
- **System Guidelines**: Comprehensive usage instructions
- **Best Practices**: Tips for efficient system usage
- **Troubleshooting**: Common issues and solutions
- **Contact Information**: Support details

### 7. Exit System
- **Secure Logout**: Proper session termination
- **Session Management**: Automatic cleanup of user sessions

## Technology Stack

- **Backend**: Java Servlets, JSP
- **Database**: MySQL
- **Frontend**: HTML5, CSS3, JavaScript
- **Build Tool**: Maven
- **Server**: Jakarta EE compatible application server

## Database Schema

The system uses the following database tables:

### User Table
- `user_id` (Primary Key)
- `username` (Unique)
- `password`
- `role`
- `created_at`

### Customer Table
- `customer_id` (Primary Key)
- `account_number` (Unique)
- `name`
- `address`
- `telephone`
- `created_at`
- `updated_at`

### Product Table
- `product_id` (Primary Key)
- `name`
- `description`
- `price`
- `stock_quantity`
- `created_at`
- `updated_at`

### Bill Table
- `bill_id` (Primary Key)
- `customer_id` (Foreign Key)
- `bill_date`
- `total_amount`
- `status`

### BillItem Table
- `bill_item_id` (Primary Key)
- `bill_id` (Foreign Key)
- `product_id` (Foreign Key)
- `quantity`
- `unit_price`
- `subtotal`

## Installation and Setup

### Prerequisites
- Java 17 or higher
- MySQL 8.0 or higher
- Maven 3.6 or higher
- Jakarta EE compatible application server (e.g., Tomcat 10+)

### Database Setup
1. Create a MySQL database
2. Run the SQL script from `updated_database_script.sql`
3. Update database connection settings in `DBConnectionFactory.java`

### Application Setup
1. Clone the repository
2. Configure database connection in `src/main/java/edu/pahana/dao/DBConnectionFactory.java`
3. Build the project: `mvn clean package`
4. Deploy the WAR file to your application server
5. Access the application at `http://localhost:8080/online-app-version3`

## Usage Guide

### Login
1. Access the application URL
2. Use default credentials: admin/admin123
3. You'll be redirected to the dashboard

### Adding Customers
1. Navigate to Customer Management
2. Click "Add Customer"
3. Fill in all required fields
4. Submit the form

### Managing Products
1. Navigate to Product Management
2. Add, edit, or delete products as needed
3. Set appropriate prices and descriptions

### Creating Bills
1. Navigate to Billing System
2. Click "Create New Bill"
3. Select a customer
4. Add products with quantities
5. Review the calculated total
6. Submit to create the bill

### Printing Bills
1. View any bill from the bill list
2. Click "Print Bill"
3. Use browser print function or the print button

## Security Features

- **Session Management**: Secure user sessions
- **Input Validation**: Server-side validation of all inputs
- **SQL Injection Prevention**: Prepared statements for all database queries
- **Authentication**: Required login for all system functions

## File Structure

```
src/
├── main/
│   ├── java/
│   │   └── edu/pahana/
│   │       ├── controller/
│   │       │   ├── AuthController.java
│   │       │   ├── BillController.java
│   │       │   ├── CustomerController.java
│   │       │   ├── DashboardController.java
│   │       │   └── ProductController.java
│   │       ├── dao/
│   │       │   ├── BillDAO.java
│   │       │   ├── BillItemDAO.java
│   │       │   ├── CustomerDAO.java
│   │       │   ├── DBConnection.java
│   │       │   ├── DBConnectionFactory.java
│   │       │   ├── ProductDAO.java
│   │       │   └── UserDAO.java
│   │       ├── model/
│   │       │   ├── Bill.java
│   │       │   ├── BillItem.java
│   │       │   ├── Customer.java
│   │       │   ├── Product.java
│   │       │   └── User.java
│   │       └── service/
│   │           ├── BillService.java
│   │           ├── CustomerService.java
│   │           ├── ProductService.java
│   │           └── UserService.java
│   ├── resources/
│   └── webapp/
│       ├── WEB-INF/
│       │   ├── view/
│       │   │   ├── dashboard.jsp
│       │   │   ├── help.jsp
│       │   │   ├── listBills.jsp
│       │   │   ├── createBill.jsp
│       │   │   ├── viewBill.jsp
│       │   │   └── printBill.jsp
│       │   └── web.xml
│       └── index.jsp
└── test/
```

## Default Data

The system comes with sample data:
- **Admin User**: admin/admin123
- **Sample Customers**: John Smith, Mary Johnson, David Williams
- **Sample Products**: Java Programming, Data Structures, Web Development, etc.

## Support

For technical support or questions about the system:
- Email: info@pahanaedu.com
- Phone: +94 11 2345678
- Address: Colombo City, Sri Lanka

## License

This project is developed for Pahana Edu Bookshop. All rights reserved.

## Version History

- **Version 3.0**: Complete billing system with all features
- **Version 2.0**: Basic product management
- **Version 1.0**: Initial customer management system