package com.jsp.basics.db.service;

import java.util.Set;

import com.jsp.basics.db.dao.EmployeeDAO;
import com.jsp.basics.db.dao.model.Employee;

public class EmployeeService {

	private EmployeeDAO employeeDAO;
	
	public EmployeeService(EmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}
	
	public Set<Employee> findAll() {
		
		return this.employeeDAO.getAll();
	}
}
