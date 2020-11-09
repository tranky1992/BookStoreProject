package com.bookstore.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;
import com.bookstore.entity.Users;

public class CategoryServices {
	//private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	private CategoryDAO categoryDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	
	public CategoryServices(EntityManager entityManager,
			HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		this.entityManager = entityManager;

		categoryDAO = new CategoryDAO(entityManager);
	}
	public void listCategory()
			throws ServletException, IOException{
		listCategory(null);
		
	}
	public void listCategory(String message) 
			throws ServletException, IOException {
		List<Category> listCategory = categoryDAO.listAll();
		
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("listCategory", listCategory);
       if (message != null) {
        	request.setAttribute("message", message);
        }
		String listPage = "category_list.jsp";
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}
	public void createCategory() throws ServletException, IOException{
		
		String name = request.getParameter("name");
		
		
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
		Category existCategory = categoryDAO.findByName(name);
		if(existCategory != null) {
			
			String message = "Không thể tạo thể loại." + "Thể loại với tên là: " + name + " đã tồn tại"; 
			request.setAttribute("message", message);
			//RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			//requestDispatcher.forward(request, response);
			
		}else {
			Category newCategory = new Category(name);
			categoryDAO.create(newCategory);
			String message = "Thể loại đã được tạo thành công.";
			listCategory(message);
		}
		
	}
	
	
	public void editCategory() throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int categoryId = Integer.parseInt(request.getParameter("id"));	
		Category category = categoryDAO.get(categoryId);
		
		String editPage = "category_form.jsp";
		request.setAttribute("category",category);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}
	
	
	public void updateCategory() throws ServletException, IOException {

		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String name = request.getParameter("name");

		Category categoryById = categoryDAO.get(categoryId);
		Category categoryByName = categoryDAO.findByName(name);
		if (categoryByName != null && categoryByName.getCategoryId() != categoryById.getCategoryId()) {
			
			String message = "Không thể cập nhật thông tin thể loại. Thể loại với tên "+ name + "đã tồn tại trong hệ thống.";
			
			request.setAttribute("message", message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);
		
		}else {
			
			Category category = new Category(categoryId, name);
			categoryDAO.update(category);
			
			String message = "Thông tin thể loại đã được cập nhật thành công.";
			listCategory(message);
		}
		
	}
	public void deleteCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		categoryDAO.delete(categoryId);
		
		String message = "Thể loại với ID là: "+ categoryId + " đã được xoá thành công";
		listCategory(message);
		
		
	}

}
