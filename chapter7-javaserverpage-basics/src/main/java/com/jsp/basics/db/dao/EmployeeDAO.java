package com.jsp.basics.db.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;
import java.util.TreeSet;

import org.apache.log4j.Logger;

import com.jsp.basics.db.DbSQLQuery;
import com.jsp.basics.db.dao.model.Employee;

public class EmployeeDAO {

	private static final Logger logger = Logger.getLogger(EmployeeDAO.class);

	public Set<Employee> getAll() {
		
		Set<Employee> employees = new TreeSet<Employee>();
		ResultSet resultSet = DbSQLQuery.select("SELECT * FROM employees");
		
		try {
			
			if(resultSet == null) {
				return employees;
			}
			
			while(resultSet.next()) {
				employees.add(createEmployee(resultSet));
			}
		}
		catch (Exception e) {
			logger.error(e.getMessage());
		}
		return employees;
	}
	
	private Employee createEmployee(ResultSet resultSet) throws SQLException {
		
		Employee employee = new Employee();
		
		employee.setId(resultSet.getLong("emp_no"));
		employee.setName(resultSet.getString("first_name"));
		employee.setLastName(resultSet.getString("last_name"));
		employee.setGender(resultSet.getString("gender"));
		employee.setBirthDate(resultSet.getDate("birth_date"));
		employee.setHireDate(resultSet.getDate("hire_date"));
		
		return employee;
	}
	
}
