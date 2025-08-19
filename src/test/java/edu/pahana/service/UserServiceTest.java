package edu.pahana.service;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.AfterEach;

import edu.pahana.model.User;

/**
 * JUnit tests for UserService class
 * Note: These tests require a test database connection
 */
public class UserServiceTest {
    
    private UserService userService;
    private String testUsername1 = "testuser1";
    private String testUsername2 = "testuser2";
    private String testPassword = "testpass123";
    
    @BeforeEach
    void setUp() {
        userService = UserService.getInstance();
    }
    
    @AfterEach
    void tearDown() throws SQLException {
        // Clean up test data after each test
        try {
            User user1 = userService.getUserByUsername(testUsername1);
            if (user1 != null) {
                userService.deleteUser(user1.getUserId());
            }
            
            User user2 = userService.getUserByUsername(testUsername2);
            if (user2 != null) {
                userService.deleteUser(user2.getUserId());
            }
        } catch (SQLException e) {
            // Ignore cleanup errors
        }
    }
    
    @Test
    void testRegisterUser_NewUser_ReturnsTrue() throws SQLException {
        // Act
        boolean result = userService.registerUser(testUsername1, testPassword, "user");
        
        // Assert
        assertTrue(result, "Should successfully register new user");
        
        // Verify user was actually created
        User createdUser = userService.getUserByUsername(testUsername1);
        assertNotNull(createdUser, "User should exist after registration");
        assertEquals(testUsername1, createdUser.getUsername());
        assertEquals("user", createdUser.getRole());
    }
    
    @Test
    void testRegisterUser_ExistingUser_ReturnsFalse() throws SQLException {
        // Arrange - First register a user
        userService.registerUser(testUsername1, testPassword, "user");
        
        // Act - Try to register same username again
        boolean result = userService.registerUser(testUsername1, "differentpass", "admin");
        
        // Assert
        assertFalse(result, "Should not allow duplicate username registration");
        
        // Verify original user unchanged
        User user = userService.getUserByUsername(testUsername1);
        assertEquals("user", user.getRole(), "Original user role should be unchanged");
    }
    
    @Test
    void testAuthenticate_ValidCredentials_ReturnsUser() throws SQLException {
        // Arrange - Register a test user first
        userService.registerUser(testUsername1, testPassword, "admin");
        
        // Act
        User result = userService.authenticate(testUsername1, testPassword);
        
        // Assert
        assertNotNull(result, "Should return user for valid credentials");
        assertEquals(testUsername1, result.getUsername());
        assertEquals("admin", result.getRole());
    }
    
    @Test
    void testGetAllUsers_ReturnsUserList() throws SQLException {
        // Arrange - Register test users
        userService.registerUser(testUsername1, testPassword, "user");
        userService.registerUser(testUsername2, testPassword, "admin");
        
        // Act
        List<User> allUsers = userService.getAllUsers();
        
        // Assert
        assertNotNull(allUsers, "Should return user list");
        assertTrue(allUsers.size() >= 2, "Should contain at least our test users");
        
        // Verify our test users are in the list
        boolean found1 = allUsers.stream().anyMatch(u -> testUsername1.equals(u.getUsername()));
        boolean found2 = allUsers.stream().anyMatch(u -> testUsername2.equals(u.getUsername()));
        
        assertTrue(found1, "Should contain first test user");
        assertTrue(found2, "Should contain second test user");
    }
}