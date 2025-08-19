package edu.pahana.service;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.AfterEach;

import edu.pahana.model.Product;

/**
 * JUnit tests for ProductService class
 * Note: These tests require a test database connection
 */
public class ProductServiceTest {
    
    private ProductService productService;
    private String testProductName1 = "Test Product 1";
    private String testProductName2 = "Test Product 2";
    private double testPrice = 99.99;
    
    // Store test product IDs for cleanup
    private Integer testProductId1;
    private Integer testProductId2;
    
    @BeforeEach
    void setUp() {
        productService = ProductService.getInstance();
    }
    
    @AfterEach
    void tearDown() throws SQLException {
        // Clean up test data after each test
        try {
            if (testProductId1 != null) {
                productService.deleteProduct(testProductId1);
                testProductId1 = null;
            }
            
            if (testProductId2 != null) {
                productService.deleteProduct(testProductId2);
                testProductId2 = null;
            }
        } catch (SQLException e) {
            // Ignore cleanup errors
        }
    }
    
    @Test
    void testAddProduct_ValidProduct_ProductAdded() throws SQLException {
        // Arrange
        Product testProduct = new Product();
        testProduct.setName(testProductName1);
        testProduct.setPrice(testPrice);
        
        // Act
        productService.addProduct(testProduct);
        
        // Assert - Verify product was added by checking if it exists in the list
        List<Product> allProducts = productService.getAllProducts();
        assertNotNull(allProducts, "Product list should not be null");
        
        boolean productFound = allProducts.stream().anyMatch(p -> 
            testProductName1.equals(p.getName()) && 
            testPrice == p.getPrice()
        );
        
        assertTrue(productFound, "Added product should be found in the product list");
        
        // Store ID for cleanup (assuming the product has an ID after being added)
        Product addedProduct = allProducts.stream()
            .filter(p -> testProductName1.equals(p.getName()))
            .findFirst()
            .orElse(null);
        if (addedProduct != null) {
            testProductId1 = addedProduct.getProductId();
        }
    }
    
    @Test
    void testGetAllProducts_ReturnsProductList() throws SQLException {
        // Arrange - Add test products
        Product product1 = new Product();
        product1.setName(testProductName1);
        product1.setPrice(testPrice);
        
        Product product2 = new Product();
        product2.setName(testProductName2);
        product2.setPrice(testPrice + 10);
        
        productService.addProduct(product1);
        productService.addProduct(product2);
        
        // Act
        List<Product> allProducts = productService.getAllProducts();
        
        // Assert
        assertNotNull(allProducts, "Should return product list");
        assertTrue(allProducts.size() >= 2, "Should contain at least our test products");
        
        // Verify our test products are in the list
        boolean found1 = allProducts.stream().anyMatch(p -> testProductName1.equals(p.getName()));
        boolean found2 = allProducts.stream().anyMatch(p -> testProductName2.equals(p.getName()));
        
        assertTrue(found1, "Should contain first test product");
        assertTrue(found2, "Should contain second test product");
        
        // Store IDs for cleanup
        allProducts.stream()
            .filter(p -> testProductName1.equals(p.getName()))
            .findFirst()
            .ifPresent(p -> testProductId1 = p.getProductId());
            
        allProducts.stream()
            .filter(p -> testProductName2.equals(p.getName()))
            .findFirst()
            .ifPresent(p -> testProductId2 = p.getProductId());
    }
    
    @Test
    void testUpdateProduct_ExistingProduct_ReturnsTrue() throws SQLException {
        // Arrange - Add a product first
        Product originalProduct = new Product();
        originalProduct.setName(testProductName1);
        originalProduct.setPrice(testPrice);
        
        productService.addProduct(originalProduct);
        
        // Get the added product to get its ID
        List<Product> products = productService.getAllProducts();
        Product addedProduct = products.stream()
            .filter(p -> testProductName1.equals(p.getName()))
            .findFirst()
            .orElse(null);
        
        assertNotNull(addedProduct, "Product should be added successfully");
        testProductId1 = addedProduct.getProductId();
        
        // Modify the product
        addedProduct.setName("Updated Product Name");
        addedProduct.setPrice(149.99);
        
        // Act
        boolean result = productService.updateProduct(addedProduct);
        
        // Assert
        assertTrue(result, "Should successfully update existing product");
        
        // Verify the product was actually updated
        Product updatedProduct = productService.getProductById(testProductId1);
        assertNotNull(updatedProduct, "Updated product should exist");
        assertEquals("Updated Product Name", updatedProduct.getName());
        assertEquals(149.99, updatedProduct.getPrice(), 0.01);
    }
    
    @Test
    void testDeleteProduct_ExistingProduct_ReturnsTrue() throws SQLException {
        // Arrange - Add a product first
        Product testProduct = new Product();
        testProduct.setName(testProductName1);
        testProduct.setPrice(testPrice);
        
        productService.addProduct(testProduct);
        
        // Get the added product to get its ID
        List<Product> products = productService.getAllProducts();
        Product addedProduct = products.stream()
            .filter(p -> testProductName1.equals(p.getName()))
            .findFirst()
            .orElse(null);
        
        assertNotNull(addedProduct, "Product should be added successfully");
        int productId = addedProduct.getProductId();
        
        // Act
        boolean result = productService.deleteProduct(productId);
        
        // Assert
        assertTrue(result, "Should successfully delete existing product");
        
        // Verify the product was actually deleted
        Product deletedProduct = productService.getProductById(productId);
        assertNull(deletedProduct, "Deleted product should not exist");
        
        // No need to store ID for cleanup since it's already deleted
    }
}