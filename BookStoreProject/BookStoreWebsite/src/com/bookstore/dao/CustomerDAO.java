package com.bookstore.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;

import com.bookstore.entity.Customer;

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
		
		return null;
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
		
		return null;
	}

	@Override
	public long count() {
		
		return 0;
	}

}
