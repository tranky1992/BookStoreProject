package com.bookstore.service;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.CustomerDAO;
import com.bookstore.dao.UserDAO;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Users;

public class CustomerService {
	private EntityManager entityManager;
	private CustomerDAO customerDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	
	

	public CustomerService(EntityManager entityManager,
			HttpServletRequest request, HttpServletResponse response) {
		this.entityManager = entityManager;
		this.request = request;
		this.response = response;
		
		customerDAO = new CustomerDAO(entityManager);
	}

	public void listCustomer()
			throws ServletException, IOException{
		listCustomer(null);
		
	}
	
	
	public void listCustomer(String message)
			throws ServletException, IOException{
		
		List<Customer> listCustomer = customerDAO.listAll();
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
		
        request.setAttribute("listCustomer", listCustomer);
		if (message != null) {
			request.setAttribute("message",message);
		}
		String listPage = "customer_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);

	}
	
	
	public void createCustomer() 
			throws ServletException, IOException{
		
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullname");
		String city = request.getParameter("city");
		String country = request.getParameter("country");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");		
		String password = request.getParameter("password");
		
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
		Customer existCustomer = customerDAO.findByEmail(email);
		if(existCustomer != null) {
			String message = "Không thể tạo người dùng do email " + email + " đã tồn tại"; 
			request.setAttribute("message", message);
		//	RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
		//	requestDispatcher.forward(request, response);
		}else {
			Customer newCustomer = new Customer();
			newCustomer.setEmail(email);
			newCustomer.setFullname(fullName);
			newCustomer.setPassword(password);
			newCustomer.setAddress(address);
			newCustomer.setPhone(phone);
			newCustomer.setCity(city);
			newCustomer.setCountry(country);
			newCustomer.setZipcode(zipcode);
			
			
			customerDAO.create(newCustomer);
			listCustomer("Người dùng đã được tạo thành công.");
		}
		
	}

	public void editCustomer() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int customerId = Integer.parseInt(request.getParameter("id"));	
		Customer customer = customerDAO.get(customerId);
		
		String editPage = "customer_form.jsp";
		request.setAttribute("customer",customer);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}

	public void updateCustomer() throws ServletException, IOException {

		int customerId = Integer.parseInt(request.getParameter("customerId"));
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullname");
		String city = request.getParameter("city");
		String country = request.getParameter("country");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");	
		
		
		String password = request.getParameter("password");

		Customer customerById = customerDAO.get(customerId);
		Customer customerByEmail = customerDAO.findByEmail(email);
		if (customerByEmail != null && customerByEmail.getCustomerId() != customerById.getCustomerId()) {
			String message = "Không thể cập nhật thông tin người dùng. Người dùng với email "+ email + "đã tồn tại trong hệ thống.";
			request.setAttribute("message", message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);
		}else {
			
			customerById.setEmail(email);
			customerById.setFullname(fullName);
			customerById.setPassword(password);
			customerById.setAddress(address);
			customerById.setPhone(phone);
			customerById.setCity(city);
			customerById.setCountry(country);
			customerById.setZipcode(zipcode);
			
			
			customerDAO.update(customerById);
			
			String message = "Thông tin người dùng đã được cập nhật thành công.";
			listCustomer(message);
		}
		
	}

	public void deleteCustomer() throws ServletException, IOException {
		int customerId = Integer.parseInt(request.getParameter("id"));
		customerDAO.delete(customerId);
		
		String message = "Người dùng đã được xoá thành công";
		listCustomer(message);
		
		
	}
}
