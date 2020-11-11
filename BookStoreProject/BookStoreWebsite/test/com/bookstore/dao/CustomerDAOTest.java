package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.EntityManager;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Category;
import com.bookstore.entity.Customer;

public class CustomerDAOTest extends BaseDAOTest{
	private static CustomerDAO customerDAO;
	
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		BaseDAOTest.setUpBeforeClass();
		
		customerDAO = new CustomerDAO(entityManager);

	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		BaseDAOTest.tearDownAfterClass();
	}

	@Test
	public void testCreateCustomer() {
		Customer newcus = new Customer();
		
		
		newcus.setEmail("tom@gmail.com");
		newcus.setFullname("Tom Cruise");
		newcus.setCity("New York");
		newcus.setCountry("USA");
		newcus.setAddress("100 North Avenue");
		newcus.setPassword("123");
		newcus.setPhone("18001900");
		newcus.setZipcode("10000");
		
		Customer create = customerDAO.create(newcus);
		
		assertTrue(create.getCustomerId() > 0);
		
	}

	@Test
	public void testGet() {
		Integer customerId = 1;
		Customer customer = customerDAO.get(customerId);
		
		assertNotNull(customer);
	}

	@Test
	public void testUpdateCustomer() {
		Customer customer = customerDAO.get(1);
		
		String fullName = "Tom Cruise World";
		customer.setFullname(fullName);
		
		Customer updateCustomer = customerDAO.update(customer);
		
		
		assertTrue(updateCustomer.getFullname().equals(fullName));
	}
	
	@Test
	public void testDeleteObject() {
		Integer customerId = 1;
		 customerDAO.delete(customerId);		
		 assertTrue(true);
	}
	
	
	@Test
	public void testListAll() {
		List<Customer> listCustomer = customerDAO.listAll();
		
		
		assertFalse(listCustomer.isEmpty());
	}
}
