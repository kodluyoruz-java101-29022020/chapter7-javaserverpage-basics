package com.jsp.basics.bundle.servlet;

import java.io.IOException;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.basics.db.dao.EmployeeDAO;
import com.jsp.basics.db.dao.model.Employee;
import com.jsp.basics.db.service.EmployeeService;

@WebServlet(name = "employeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {

	private static final long serialVersionUID = -5079215218251087629L;
	
	
	private EmployeeService employeeService;
	
	
	@Override
	public void init() throws ServletException {
		
		employeeService = new EmployeeService(new EmployeeDAO());
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		Set<Employee> employees = employeeService.findAll();
		req.setAttribute("employees", employees);
        req.getRequestDispatcher("employee_list.jsp").forward(req, resp);
	}
	
	
	@Override
	public void destroy() {
		employeeService = null;
	}
	
	
}
