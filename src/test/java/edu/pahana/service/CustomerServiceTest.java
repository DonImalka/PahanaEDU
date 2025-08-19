package edu.pahana.service;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.AfterEach;

import edu.pahana.model.Customer;

/**
 * JUnit tests for CustomerService class
 * Note: These tests require a test database connection
 */
public class CustomerServiceTest {
    
    private CustomerService customerService;
    private String testAccountNumber1 = "TEST001";
    private String testAccountNumber2 = "TEST002";
    private String testCustomerName = "Test Customer";
    
    @BeforeEach
    void setUp() {
        customerService = CustomerService.getInstance();
    }
    
    @AfterEach
    void tearDown() throws SQLException {
        // Clean up test data after each test
        try {
            Customer customer1 = customerService.getCustomerByAccountNumber(testAccountNumber1);
            if (customer1 != null) {
                customerService.deleteCustomer(customer1.getCustomerId());
            }
            
            Customer customer2 = customerService.getCustomerByAccountNumber(testAccountNumber2);
            if (customer2 != null) {
                customerService.deleteCustomer(customer2.getCustomerId());
            }
        } catch (SQLException e) {
            // Ignore cleanup errors
        }
    }
    
    @Test
    void testAddCustomer_NewCustomer_ReturnsTrue() throws SQLException {
        // Arrange
        Customer testCustomer = new Customer(testAccountNumber1, testCustomerName, "test@email.com", "123-456-7890");
        
        // Act
        boolean result = customerService.addCustomer(testCustomer);
        
        // Assert
        assertTrue(result, "Should successfully add new customer");
        
        // Verify customer was actually created
        Customer createdCustomer = customerService.getCustomerByAccountNumber(testAccountNumber1);
        assertNotNull(createdCustomer, "Customer should exist after addition");
        assertEquals(testAccountNumber1, createdCustomer.getAccountNumber());
        assertEquals(testCustomerName, createdCustomer.getName());
    }
    
    @Test
    void testAddCustomer_DuplicateAccountNumber_ReturnsFalse() throws SQLException {
        // Arrange - First add a customer
        Customer customer1 = new Customer(testAccountNumber1, "First Customer", "first@email.com", "123-456-7890");
        customerService.addCustomer(customer1);
        
        // Act - Try to add another customer with same account number
        Customer customer2 = new Customer(testAccountNumber1, "Second Customer", "second@email.com", "098-765-4321");
        boolean result = customerService.addCustomer(customer2);
        
        // Assert
        assertFalse(result, "Should not allow duplicate account number");
        
        // Verify original customer is unchanged
        Customer existingCustomer = customerService.getCustomerByAccountNumber(testAccountNumber1);
        assertEquals("First Customer", existingCustomer.getName(), "Original customer should be unchanged");
    }
    
    @Test
    void testGenerateAccountNumber_EmptyDatabase_ReturnsFirstNumber() throws SQLException {
        // Note: This test assumes the database might have existing customers
        // Act
        String accountNumber = customerService.generateAccountNumber();
        
        // Assert
        assertNotNull(accountNumber, "Should generate an account number");
        assertTrue(accountNumber.startsWith("CUST"), "Account number should start with 'CUST'");
        assertTrue(accountNumber.matches("CUST\\d{3}"), "Account number should follow CUST### format");
    }
    
    @Test
    void testGetAllCustomers_WithTestData_ReturnsCustomerList() throws SQLException {
        // Arrange - Add test customers
        Customer customer1 = new Customer(testAccountNumber1, "Customer One", "one@email.com", "111-111-1111");
        Customer customer2 = new Customer(testAccountNumber2, "Customer Two", "two@email.com", "222-222-2222");
        
        customerService.addCustomer(customer1);
        customerService.addCustomer(customer2);
        
        // Act
        List<Customer> allCustomers = customerService.getAllCustomers();
        
        // Assert
        assertNotNull(allCustomers, "Should return customer list");
        assertTrue(allCustomers.size() >= 2, "Should contain at least our test customers");
        
        // Verify our test customers are in the list
        boolean found1 = allCustomers.stream().anyMatch(c -> testAccountNumber1.equals(c.getAccountNumber()));
        boolean found2 = allCustomers.stream().anyMatch(c -> testAccountNumber2.equals(c.getAccountNumber()));
        
        assertTrue(found1, "Should contain first test customer");
        assertTrue(found2, "Should contain second test customer");
    }
}