package com.bookstore.controller.customer;

import com.bookstore.controller.BaseServlet;
import com.bookstore.service.CustomerService;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/admin/delete_customer")
public class DeleteCustomerServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

  
    public DeleteCustomerServlet() {
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			CustomerService customerService = new CustomerService(entityManager, request, response);
			customerService.deleteCustomer();
	}

}
