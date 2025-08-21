<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pahana Edu - Create Bill</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: #333;
            line-height: 1.6;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .header {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }
        
        .header h1 {
            color: #333;
            font-size: 1.8rem;
            font-weight: 600;
        }
        
        .header-buttons {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
        
        .btn {
            background: #667eea;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s ease;
            font-size: 14px;
            font-weight: 500;
            min-height: 44px;
            justify-content: center;
        }
        
        .btn:hover {
            background: #5a6fd8;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
        }
        
        .btn:active {
            transform: translateY(0);
        }
        
        .btn-secondary {
            background: #6c757d;
        }
        
        .btn-secondary:hover {
            background: #5a6268;
            box-shadow: 0 4px 12px rgba(108, 117, 125, 0.3);
        }
        
        .btn-success {
            background: #28a745;
        }
        
        .btn-success:hover {
            background: #218838;
            box-shadow: 0 4px 12px rgba(40, 167, 69, 0.3);
        }
        
        .btn-danger {
            background: #dc3545;
        }
        
        .btn-danger:hover {
            background: #c82333;
            box-shadow: 0 4px 12px rgba(220, 53, 69, 0.3);
        }
        
        .btn-sm {
            padding: 8px 16px;
            font-size: 13px;
            min-height: 36px;
        }
        
        .form-container {
            background: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #333;
            font-size: 14px;
        }
        
        .form-group select,
        .form-group input {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e1e5e9;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
            background: white;
        }
        
        .form-group select:focus,
        .form-group input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        
        .form-group select:invalid,
        .form-group input:invalid {
            border-color: #dc3545;
        }
        
        .items-section {
            margin-top: 35px;
            padding-top: 25px;
            border-top: 2px solid #f1f3f4;
        }
        
        .items-section h3 {
            margin-bottom: 25px;
            color: #333;
            font-size: 1.4rem;
            font-weight: 600;
        }
        
        .item-row {
            display: grid;
            grid-template-columns: 2fr 100px 120px 120px auto;
            gap: 15px;
            align-items: center;
            margin-bottom: 20px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
            border: 1px solid #e9ecef;
            transition: box-shadow 0.2s ease;
        }
        
        .item-row:hover {
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }
        
        .item-row select,
        .item-row input {
            padding: 10px 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
        }
        
        .item-row input[readonly] {
            background-color: #f8f9fa;
            color: #6c757d;
        }
        
        .item-labels {
            display: grid;
            grid-template-columns: 2fr 100px 120px 120px auto;
            gap: 15px;
            margin-bottom: 15px;
            padding: 0 20px;
            font-weight: 600;
            font-size: 13px;
            color: #6c757d;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .total-section {
            margin-top: 35px;
            padding: 25px;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 10px;
            text-align: right;
            border: 2px solid #e9ecef;
        }
        
        .total-section h3 {
            color: #333;
            margin-bottom: 10px;
            font-size: 1.2rem;
        }
        
        .total-amount {
            font-size: 28px;
            font-weight: 700;
            color: #667eea;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }
        
        .alert {
            padding: 16px 20px;
            margin-bottom: 25px;
            border-radius: 8px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        
        .alert::before {
            content: '⚠️';
            font-size: 18px;
        }
        
        .form-actions {
            text-align: center;
            margin-top: 35px;
            padding-top: 25px;
            border-top: 1px solid #e9ecef;
        }
        
        .empty-state {
            text-align: center;
            padding: 40px;
            color: #6c757d;
        }
        
        .empty-state svg {
            width: 64px;
            height: 64px;
            margin-bottom: 16px;
            opacity: 0.5;
        }
        
        /* Loading state */
        .loading {
            opacity: 0.7;
            pointer-events: none;
        }
        
        /* Responsive Design */
        @media (max-width: 992px) {
            .item-row,
            .item-labels {
                grid-template-columns: 1fr 80px 100px 100px auto;
            }
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }
            
            .header {
                flex-direction: column;
                text-align: center;
                padding: 20px;
            }
            
            .header h1 {
                font-size: 1.5rem;
            }
            
            .form-container {
                padding: 25px 20px;
            }
            
            .item-labels {
                display: none;
            }
            
            .item-row {
                grid-template-columns: 1fr;
                gap: 15px;
                position: relative;
            }
            
            .item-row > * {
                width: 100%;
            }
            
            .item-row select::before,
            .item-row input::before {
                content: attr(data-label);
                display: block;
                font-weight: 600;
                font-size: 12px;
                color: #6c757d;
                margin-bottom: 4px;
                text-transform: uppercase;
            }
            
            .total-section {
                text-align: center;
                padding: 20px;
            }
            
            .total-amount {
                font-size: 24px;
            }
        }
        
        @media (max-width: 480px) {
            .header-buttons {
                width: 100%;
                justify-content: center;
            }
            
            .btn {
                flex: 1;
                min-width: 0;
            }
        }
        
        /* Focus management for accessibility */
        .visually-hidden {
            position: absolute !important;
            width: 1px !important;
            height: 1px !important;
            padding: 0 !important;
            margin: -1px !important;
            overflow: hidden !important;
            clip: rect(0, 0, 0, 0) !important;
            white-space: nowrap !important;
            border: 0 !important;
        }
        
        /* Animation for smooth interactions */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .item-row {
            animation: fadeIn 0.3s ease;
        }
        
        /* Print styles */
        @media print {
            body {
                background: white;
            }
            
            .header-buttons,
            .btn {
                display: none;
            }
            
            .form-container {
                box-shadow: none;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>Create New Bill</h1>
            <div class="header-buttons">
                <a href="bill?action=list" class="btn btn-secondary" aria-label="Go back to bills list">
                    ← Back to Bills
                </a>
                <a href="dashboard" class="btn" aria-label="Go to dashboard">
                    🏠 Dashboard
                </a>
            </div>
        </header>
        
        <main>
            <c:if test="${not empty error}">
                <div class="alert alert-error" role="alert">
                    <span class="visually-hidden">Error:</span>
                    ${error}
                </div>
            </c:if>
            
            <div class="form-container">
                <form action="bill" method="post" id="bill-form" novalidate>
                    <input type="hidden" name="action" value="create">
                    
                    <div class="form-group">
                        <label for="customerId">Select Customer <span style="color: #dc3545;">*</span></label>
                        <select name="customerId" id="customerId" required aria-describedby="customer-help">
                            <option value="">Choose a customer...</option>
                            <c:forEach var="customer" items="${customers}">
                                <option value="${customer.customerId}">
                                    ${customer.name} (${customer.accountNumber})
                                </option>
                            </c:forEach>
                        </select>
                        <small id="customer-help" class="visually-hidden">Select the customer for this bill</small>
                    </div>
                    
                    <section class="items-section" aria-labelledby="items-heading">
                        <h3 id="items-heading">Bill Items</h3>
                        
                        <div class="item-labels" aria-hidden="true">
                            <span>Product</span>
                            <span>Quantity</span>
                            <span>Unit Price</span>
                            <span>Subtotal</span>
                            <span>Actions</span>
                        </div>
                        
                        <div id="items-container" role="group" aria-labelledby="items-heading">
                            <div class="item-row" data-item-index="0">
                                <select name="productId" required aria-label="Select product">
                                    <option value="">Select Product...</option>
                                    <c:forEach var="product" items="${products}">
                                        <option value="${product.productId}" data-price="${product.price}">
                                            ${product.name} - Rs. ${product.price}
                                        </option>
                                    </c:forEach>
                                </select>
                                <input type="number" name="quantity" placeholder="Qty" min="1" value="1" required aria-label="Quantity">
                                <input type="text" class="unit-price" placeholder="Unit Price" readonly aria-label="Unit price" tabindex="-1">
                                <input type="text" class="subtotal" placeholder="Subtotal" readonly aria-label="Subtotal" tabindex="-1">
                                <button type="button" class="btn btn-danger btn-sm" onclick="removeItem(this)" aria-label="Remove this item">
                                    Remove
                                </button>
                            </div>
                        </div>
                        
                        <button type="button" class="btn btn-success" onclick="addItem()" aria-label="Add another item to the bill">
                            + Add Another Item
                        </button>
                    </section>
                    
                    <div class="total-section" role="region" aria-labelledby="total-heading">
                        <h3 id="total-heading">Total Amount: <span class="total-amount" id="total-amount" aria-live="polite">Rs. 0.00</span></h3>
                    </div>
                    
                    <div class="form-actions">
                        <button type="submit" class="btn" id="submit-btn" aria-describedby="submit-help">
                            Create Bill
                        </button>
                        <small id="submit-help" class="visually-hidden">Create the bill with the selected items</small>
                    </div>
                </form>
            </div>
        </main>
    </div>
    
    <script>
        let itemCounter = 1;
        
        function addItem() {
            const container = document.getElementById('items-container');
            const template = container.children[0].cloneNode(true);
            
            // Update data attribute
            template.setAttribute('data-item-index', itemCounter++);
            
            // Clear the values
            template.querySelector('select').value = '';
            template.querySelector('input[name="quantity"]').value = '1';
            template.querySelector('.unit-price').value = '';
            template.querySelector('.subtotal').value = '';
            
            // Update ARIA labels for accessibility
            const select = template.querySelector('select');
            const quantityInput = template.querySelector('input[name="quantity"]');
            const removeBtn = template.querySelector('button');
            
            select.setAttribute('aria-label', `Select product for item ${itemCounter}`);
            quantityInput.setAttribute('aria-label', `Quantity for item ${itemCounter}`);
            removeBtn.setAttribute('aria-label', `Remove item ${itemCounter}`);
            
            // Add event listeners
            addEventListeners(template);
            
            container.appendChild(template);
            
            // Focus the new product select for better UX
            template.querySelector('select').focus();
        }
        
        function removeItem(button) {
            const container = document.getElementById('items-container');
            if (container.children.length > 1) {
                const row = button.closest('.item-row');
                row.style.opacity = '0';
                row.style.transform = 'translateX(-20px)';
                
                setTimeout(() => {
                    row.remove();
                    calculateTotal();
                }, 200);
            } else {
                // Provide feedback when trying to remove the last item
                button.style.transform = 'scale(0.95)';
                setTimeout(() => {
                    button.style.transform = '';
                }, 150);
            }
        }
        
        function addEventListeners(row) {
            const select = row.querySelector('select');
            const quantityInput = row.querySelector('input[name="quantity"]');
            const unitPriceInput = row.querySelector('.unit-price');
            const subtotalInput = row.querySelector('.subtotal');
            
            select.addEventListener('change', function() {
                const selectedOption = this.options[this.selectedIndex];
                const price = selectedOption.getAttribute('data-price');
                unitPriceInput.value = price ? 'Rs. ' + parseFloat(price).toFixed(2) : '';
                calculateSubtotal(row);
                
                // Validate selection
                this.setCustomValidity(this.value ? '' : 'Please select a product');
            });
            
            quantityInput.addEventListener('input', function() {
                // Ensure minimum quantity
                if (this.value < 1) this.value = 1;
                calculateSubtotal(row);
                
                // Validate quantity
                this.setCustomValidity(this.value && this.value >= 1 ? '' : 'Please enter a valid quantity');
            });
            
            // Add input validation
            quantityInput.addEventListener('blur', function() {
                if (!this.value || this.value < 1) {
                    this.value = 1;
                    calculateSubtotal(row);
                }
            });
        }
        
        function calculateSubtotal(row) {
            const select = row.querySelector('select');
            const quantityInput = row.querySelector('input[name="quantity"]');
            const unitPriceInput = row.querySelector('.unit-price');
            const subtotalInput = row.querySelector('.subtotal');
            
            const selectedOption = select.options[select.selectedIndex];
            const price = selectedOption.getAttribute('data-price');
            const quantity = quantityInput.value;
            
            if (price && quantity && quantity > 0) {
                const subtotal = parseFloat(price) * parseInt(quantity);
                subtotalInput.value = 'Rs. ' + subtotal.toFixed(2);
            } else {
                subtotalInput.value = '';
            }
            
            calculateTotal();
        }
        
        function calculateTotal() {
            const subtotals = document.querySelectorAll('.subtotal');
            let total = 0;
            
            subtotals.forEach(subtotal => {
                const value = subtotal.value.replace('Rs. ', '');
                if (value) {
                    total += parseFloat(value);
                }
            });
            
            const totalElement = document.getElementById('total-amount');
            totalElement.textContent = 'Rs. ' + total.toFixed(2);
            
            // Update submit button state
            const submitBtn = document.getElementById('submit-btn');
            if (total > 0) {
                submitBtn.disabled = false;
                submitBtn.textContent = 'Create Bill';
            } else {
                submitBtn.disabled = false; // Keep enabled for form validation
                submitBtn.textContent = 'Create Bill';
            }
        }
        
        // Form validation
        function validateForm() {
            const form = document.getElementById('bill-form');
            const customerId = document.getElementById('customerId');
            const productSelects = document.querySelectorAll('select[name="productId"]');
            const quantityInputs = document.querySelectorAll('input[name="quantity"]');
            
            let isValid = true;
            
            // Validate customer selection
            if (!customerId.value) {
                customerId.setCustomValidity('Please select a customer');
                isValid = false;
            } else {
                customerId.setCustomValidity('');
            }
            
            // Validate at least one product is selected
            let hasValidItems = false;
            productSelects.forEach((select, index) => {
                const quantity = quantityInputs[index];
                if (select.value && quantity.value && quantity.value > 0) {
                    hasValidItems = true;
                }
            });
            
            if (!hasValidItems) {
                productSelects[0].setCustomValidity('Please add at least one valid item');
                isValid = false;
            }
            
            return isValid;
        }
        
        // Initialize form
        document.addEventListener('DOMContentLoaded', function() {
            const initialRow = document.querySelector('.item-row');
            addEventListeners(initialRow);
            
            // Add form submit handler
            const form = document.getElementById('bill-form');
            form.addEventListener('submit', function(e) {
                if (!validateForm()) {
                    e.preventDefault();
                    
                    // Focus first invalid field
                    const firstInvalid = form.querySelector(':invalid');
                    if (firstInvalid) {
                        firstInvalid.focus();
                        firstInvalid.scrollIntoView({ behavior: 'smooth', block: 'center' });
                    }
                    return false;
                }
                
                // Add loading state
                const submitBtn = document.getElementById('submit-btn');
                submitBtn.textContent = 'Creating Bill...';
                submitBtn.disabled = true;
                form.classList.add('loading');
            });
            
            // Add keyboard shortcuts
            document.addEventListener('keydown', function(e) {
                if (e.ctrlKey || e.metaKey) {
                    if (e.key === 'Enter') {
                        e.preventDefault();
                        form.dispatchEvent(new Event('submit', { cancelable: true }));
                    } else if (e.key === '=' || e.key === '+') {
                        e.preventDefault();
                        addItem();
                    }
                }
            });
        });
    </script>
</body>
</html>