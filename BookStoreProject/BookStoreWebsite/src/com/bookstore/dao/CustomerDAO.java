package com.bookstore.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

import com.bookstore.entity.Category;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Users;

public class CustomerDAO extends JpaDAO<Customer> implements GenericDAO<Customer> {

	public CustomerDAO(EntityManager entityManager) {
		super(entityManager);
		
	}

	
	@Override
	public Customer create(Customer customer) {
		customer.setRegisterDate(new Date());
		return super.create(customer);
	}

	@Override
	public Customer update(Customer customer) {
		
		return super.update(customer);
	}

	@Override
	public Customer get(Object id) {
		
		return super.find(Customer.class, id);
	}

	@Override
	public void delete(Object id) {
		
		super.delete(Customer.class, id);
	}

	@Override
	public List<Customer> listAll() {
		
		return super.findWithNamedQuery("Customer.findAll");
	}

	@Override
	public long count() {
		
		return super.countWithNamedQuery("Customer.countAll");
	}

	public Customer findByEmail(String email) {
		List<Customer> listCustomer = super.findWithNamedQuery("Customer.findByEmail", "email", email);
		if(listCustomer != null && listCustomer.size() > 0) {
			return listCustomer.get(0);
		}
	return null;
	}
	
	public boolean checkLogin(String email, String password) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("email", email);
		parameters.put("password", password);
		List<Customer> listCustomers = super.findWithNamedQuery("Customer.checkLogin", parameters);
		if(listCustomers.size() == 1) {
			return true;
		}
		return false;
		
	}
}
