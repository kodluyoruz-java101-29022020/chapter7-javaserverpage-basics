<%@page import="com.jsp.basics.db.dao.model.Employee"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		Set<Employee> employees = (Set<Employee>)request.getAttribute("employees");
		System.out.println(employees);
	%>
	
	<c:set var="employees" value="<%= employees %>"></c:set>

	<table border="1" width="100%">
		<tr>
			<th>Çalışan ID</th>
			<th>İsim</th>
			<th>Soyisim</th>
			<th>Cinsiyet</th>
			<th>Doğum Tarihi</th>
			<th>İşe Başlangıç Tarihi</th>
		</tr>

		<c:forEach var="employee" items="${employees}">
			<tr>
				<td><c:out value="${employee.id}"/></td>
				<td><c:out value="${employee.name}"/></td>
				<td><c:out value="${employee.lastName}"/></td>
				<td><c:out value="${employee.gender}"/></td>
				<td><c:out value="${employee.birthDate}"/></td>
				<td><c:out value="${employee.hireDate}"/></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>