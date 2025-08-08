<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pahana Edu - Help & Support</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            line-height: 1.6;
        }
        
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .header {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            text-align: center;
        }
        
        .header h1 {
            color: #333;
            margin-bottom: 10px;
        }
        
        .header p {
            color: #666;
            font-size: 18px;
        }
        
        .help-section {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        
        .help-section h2 {
            color: #333;
            margin-bottom: 20px;
            border-bottom: 2px solid #667eea;
            padding-bottom: 10px;
        }
        
        .help-section h3 {
            color: #555;
            margin: 20px 0 10px 0;
            font-size: 18px;
        }
        
        .help-section p {
            color: #666;
            margin-bottom: 15px;
        }
        
        .help-section ul {
            margin-left: 20px;
            margin-bottom: 15px;
        }
        
        .help-section li {
            color: #666;
            margin-bottom: 8px;
        }
        
        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin: 20px 0;
        }
        
        .feature-card {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            border-left: 4px solid #667eea;
        }
        
        .feature-card h4 {
            color: #333;
            margin-bottom: 10px;
        }
        
        .feature-card p {
            color: #666;
            font-size: 14px;
        }
        
        .back-btn {
            background: #667eea;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            transition: background 0.3s ease;
        }
        
        .back-btn:hover {
            background: #5a6fd8;
        }
        
        .contact-info {
            background: #e3f2fd;
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
        }
        
        .contact-info h3 {
            color: #1976d2;
            margin-bottom: 15px;
        }
        
        .contact-info p {
            color: #424242;
            margin-bottom: 8px;
        }
        
        @media (max-width: 768px) {
            .feature-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Help & Support</h1>
            <p>System usage guidelines and support information</p>
        </div>
        
        <div class="help-section">
            <h2>System Overview</h2>
            <p>The Pahana Edu Billing System is a comprehensive web-based solution designed to manage customer accounts, products, and billing information efficiently. This system provides all the necessary tools for a modern bookshop to operate smoothly.</p>
            
            <div class="feature-grid">
                <div class="feature-card">
                    <h4>User Authentication</h4>
                    <p>Secure login system with username and password protection to ensure only authorized users can access the system.</p>
                </div>
                
                <div class="feature-card">
                    <h4>Customer Management</h4>
                    <p>Add, edit, and manage customer accounts with unique account numbers, contact information, and billing history.</p>
                </div>
                
                <div class="feature-card">
                    <h4>Product Management</h4>
                    <p>Manage inventory of books and other products with pricing, descriptions, and stock tracking.</p>
                </div>
                
                <div class="feature-card">
                    <h4>Billing System</h4>
                    <p>Create, view, and print bills with automatic calculations and professional formatting.</p>
                </div>
            </div>
        </div>
        
        <div class="help-section">
            <h2>How to Use the System</h2>
            
            <h3>1. User Authentication (Login)</h3>
            <ul>
                <li>Enter your username and password on the login page</li>
                <li>Default admin credentials: username: "admin", password: "admin123"</li>
                <li>Always log out when you're done to maintain security</li>
            </ul>
            
            <h3>2. Customer Management</h3>
            <ul>
                <li><strong>Add New Customer:</strong> Click "Add Customer" and fill in all required fields including account number, name, address, and telephone</li>
                <li><strong>Edit Customer:</strong> Click the edit button next to any customer to modify their information</li>
                <li><strong>View Customers:</strong> Browse the customer list to see all registered customers</li>
                <li><strong>Search Customers:</strong> Use the search function to find specific customers quickly</li>
            </ul>
            
            <h3>3. Product Management</h3>
            <ul>
                <li><strong>Add Products:</strong> Add new books and items with name, description, and price</li>
                <li><strong>Edit Products:</strong> Update product information including prices and descriptions</li>
                <li><strong>Delete Products:</strong> Remove products that are no longer available</li>
                <li><strong>View Inventory:</strong> Browse all available products in the system</li>
            </ul>
            
            <h3>4. Billing System</h3>
            <ul>
                <li><strong>Create Bill:</strong> Select a customer and add products with quantities</li>
                <li><strong>Calculate Bill:</strong> System automatically calculates totals based on quantities and prices</li>
                <li><strong>Print Bill:</strong> Generate professional-looking bills for customers</li>
                <li><strong>View Bill History:</strong> Access all previous bills for any customer</li>
                <li><strong>Update Bill Status:</strong> Mark bills as paid, pending, or cancelled</li>
            </ul>
            
            <h3>5. Dashboard</h3>
            <ul>
                <li>View system statistics including total customers, products, and bills</li>
                <li>Quick access to all major functions</li>
                <li>Monitor system activity and performance</li>
            </ul>
        </div>
        
        <div class="help-section">
            <h2>Best Practices</h2>
            
            <h3>Data Entry</h3>
            <ul>
                <li>Always enter complete and accurate customer information</li>
                <li>Use consistent formatting for phone numbers and addresses</li>
                <li>Double-check product prices before adding to bills</li>
                <li>Verify quantities before finalizing bills</li>
            </ul>
            
            <h3>Security</h3>
            <ul>
                <li>Never share your login credentials</li>
                <li>Always log out when leaving the system</li>
                <li>Regularly backup important data</li>
                <li>Keep customer information confidential</li>
            </ul>
            
            <h3>System Maintenance</h3>
            <ul>
                <li>Regularly update product information</li>
                <li>Keep customer records current</li>
                <li>Archive old bills periodically</li>
                <li>Monitor system performance</li>
            </ul>
        </div>
        
        <div class="help-section">
            <h2>Troubleshooting</h2>
            
            <h3>Common Issues</h3>
            <ul>
                <li><strong>Login Problems:</strong> Verify username and password are correct</li>
                <li><strong>Bill Not Saving:</strong> Ensure all required fields are filled</li>
                <li><strong>Product Not Found:</strong> Check if the product exists in the system</li>
                <li><strong>Calculation Errors:</strong> Verify quantities and prices are valid numbers</li>
            </ul>
            
            <h3>Error Messages</h3>
            <ul>
                <li><strong>"Customer not found":</strong> The customer ID is invalid or customer was deleted</li>
                <li><strong>"Product not found":</strong> The product ID is invalid or product was deleted</li>
                <li><strong>"Invalid input":</strong> Check that all required fields are properly filled</li>
                <li><strong>"Database error":</strong> Contact system administrator</li>
            </ul>
        </div>
        
        <div class="contact-info">
            <h3>Contact Information</h3>
            <p><strong>Pahana Edu Bookshop</strong></p>
            <p>Address: Colombo City, Sri Lanka</p>
            <p>Phone: +94 11 2345678</p>
            <p>Email: info@pahanaedu.com</p>
            <p>For technical support, please contact the system administrator.</p>
        </div>
        
        <div style="text-align: center; margin-top: 30px;">
            <a href="dashboard" class="back-btn">Back to Dashboard</a>
        </div>
    </div>
</body>
</html> 