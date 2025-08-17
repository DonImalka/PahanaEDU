<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pahana Edu - Billing System Dashboard</title>
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
        }
        
        .container {
            max-width: 1200px;
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
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
        }
        
        .stat-card h3 {
            color: #333;
            margin-bottom: 10px;
            font-size: 24px;
        }
        
        .stat-card .number {
            font-size: 48px;
            font-weight: bold;
            color: #667eea;
            margin-bottom: 10px;
        }
        
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .menu-card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: all 0.3s ease;
            text-decoration: none;
            color: inherit;
        }
        
        .menu-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }
        
        .menu-card h3 {
            color: #333;
            margin-bottom: 15px;
            font-size: 20px;
        }
        
        .menu-card p {
            color: #666;
            margin-bottom: 20px;
        }
        
        .menu-card .icon {
            font-size: 48px;
            margin-bottom: 15px;
            color: #667eea;
        }
        
        .logout-btn {
            background: #dc3545;
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
        
        .logout-btn:hover {
            background: #c82333;
        }
        
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        
        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        
        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        
        @media (max-width: 768px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }
            
            .menu-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Pahana Edu Billing System</h1>
            <p>Welcome to the comprehensive billing management system</p>
        </div>
        
        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
        </c:if>
        
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>
        
        <div class="stats-grid">
            <div class="stat-card">
                <h3>Total Customers</h3>
                <div class="number">${totalCustomers}</div>
                <p>Registered customers</p>
            </div>
            
            <div class="stat-card">
                <h3>Total Products</h3>
                <div class="number">${totalProducts}</div>
                <p>Available items</p>
            </div>
            
            <div class="stat-card">
                <h3>Total Bills</h3>
                <div class="number">${totalBills}</div>
                <p>Generated bills</p>
            </div>
        </div>
        
        <div class="menu-grid">
            <a href="customer?action=list" class="menu-card">
                <div class="icon">👥</div>
                <h3>Customer Management</h3>
                <p>Add, edit, and manage customer accounts</p>
            </a>
            
            <a href="product?action=list" class="menu-card">
                <div class="icon">📚</div>
                <h3>Product Management</h3>
                <p>Manage books and other products</p>
            </a>
            
            <a href="bill?action=list" class="menu-card">
                <div class="icon">💰</div>
                <h3>Billing System</h3>
                <p>Create and manage customer bills</p>
            </a>
            
            <c:if test="${sessionScope.role == 'admin'}">
                <a href="user-management?action=list" class="menu-card">
                    <div class="icon">👤</div>
                    <h3>User Management</h3>
                    <p>Manage system users and permissions</p>
                </a>
            </c:if>
            
            <a href="dashboard?action=help" class="menu-card">
                <div class="icon">❓</div>
                <h3>Help & Support</h3>
                <p>System usage guidelines and support</p>
            </a>
        </div>
        
        <div style="text-align: center;">
            <a href="dashboard?action=logout" class="logout-btn">Logout</a>
        </div>
    </div>
</body>
</html> 