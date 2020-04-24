<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSTL SQL</title>
</head>
<body>

	<sql:setDataSource var="employeeDataSource"
		url="jdbc:mysql://localhost:3306/company_db?useSSL=false" user="root"
		password="root" driver="com.mysql.jdbc.Driver" />

	<sql:query dataSource="${employeeDataSource}" var="employeeResult">
		SELECT * FROM employees;
	</sql:query>

	<table border="1" width="100%">
		<tr>
			<th>Çalışan ID</th>
			<th>İsim</th>
			<th>Soyisim</th>
			<th>Cinsiyet</th>
			<th>Doğum Tarihi</th>
			<th>İşe Başlangıç Tarihi</th>
		</tr>

		<c:forEach var="row" items="${employeeResult.rows}">
			<tr>
				<td><c:out value="${row.emp_no}"/></td>
				<td><c:out value="${row.first_name}"/></td>
				<td><c:out value="${row.last_name}"/></td>
				<td><c:out value="${row.gender}"/></td>
				<td><c:out value="${row.birth_date}"/></td>
				<td><c:out value="${row.hire_date}"/></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>