package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;


import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Users;

public class UserDAOTest extends BaseDAOTest{
	

	private static UserDAO userDAO;

	
	@BeforeClass

	public static void setUpClass() throws Exception {
		BaseDAOTest.setUpBeforeClass();
		userDAO = new UserDAO(entityManager);
	}
	
	@Test
	public void testUserDAO() {
		fail("Not yet implemented");
	}

	@Test
	public void testCreateUsers() {
		
		Users user1 = new Users();
		user1.setEmail("hainguyen1961@gmail.com");
		user1.setPassword("123456");
		user1.setFullName("Nguyen Quy Hai");

		user1 = userDAO.create(user1);
		assertTrue(user1.getUserId() > 0);
	}

	@Test(expected = PersistenceException.class)
	public void testCreateUsersFieldsNotSet() {
		Users user1 = new Users();
		user1 = userDAO.create(user1);
		

	}
	@Test
	public void testUpdateUsers() {
		Users user = new Users();
		user.setUserId(22);
		user.setEmail("david@gmail.com");
		user.setFullName("David Backham");
		user.setPassword("HelloWorld");
		user = userDAO.update(user);
		String expected = "HelloWorld";
		String actual = user.getPassword();
		assertEquals(expected, actual);
	} 
	@Test
	public void testGetUsersFound() {
		Integer userId = 19;
		Users user = userDAO.get(userId);
		if (user !=null) {
			System.out.println(user.getEmail());
		}
		assertNotNull(user);
	}
	@Test
	public void testGetUsersNotFound() {
		Integer userId = 1;
		Users user = userDAO.get(userId);
		if (user == null) {
			System.out.println("No User");
		}
		assertNull(user);
	}
	@Test
	public void testDeleteUsers () {
		Integer userId = 31;
		userDAO.delete(userId);
		Users user = userDAO.get(userId);
		if (user == null) {
			System.out.println("Delete User");
		}
		assertNull(user);
	}
	@Test (expected = Exception.class)
	public void testDeleteNonExistUsers() {
		Integer userId = 24;
		userDAO.delete(userId);
		
	}
	@Test 
	public void testListAll() {
		List<Users> listUsers = userDAO.listAll();
		for(Users user : listUsers ) {
			System.out.println(user.getEmail());
		}
		assertTrue(listUsers.size() > 0 );
	}
	@Test (expected = Exception.class)
	public void testCount() {
		long totalUsers = userDAO.count();
		assertEquals(1, totalUsers);
	}
	
	
	@Test
	public void testCheckLoginSuccess() {
		String email = "tranky1992@gmail.com";
		String password = "123";
		
		boolean loginResult = userDAO.checkLogin(email, password);
		
		assertTrue(loginResult);
	}
	
	@Test
	public void testCheckLoginFailed() {
		String email = "tranky1992@gmail.com";
		String password = "14523";
		
		boolean loginResult = userDAO.checkLogin(email, password);
		
		assertFalse(loginResult);
	}
	
	@Test
	public void testFindByEmail() {
		String email = "tranky1992@gmail.com";
		Users user = userDAO.findByEmail(email);
		assertNotNull(user);
	}
	@AfterClass
	public static void tearDownClass() throws Exception {
		BaseDAOTest.setUpBeforeClass();
	}
}
