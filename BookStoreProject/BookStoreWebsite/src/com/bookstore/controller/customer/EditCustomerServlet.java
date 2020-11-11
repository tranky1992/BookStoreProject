package com.bookstore.controller.customer;

import com.bookstore.controller.BaseServlet;
import com.bookstore.service.CustomerService;
import com.bookstore.service.UserServices;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/admin/edit_customer")
public class EditCustomerServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;


    public EditCustomerServlet() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			CustomerService customerService = new CustomerService(entityManager, request, response);
		
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("utf-8");
		
			customerService.editCustomer();
	}
}