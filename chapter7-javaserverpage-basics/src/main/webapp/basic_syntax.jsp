<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Basic Syntax</title>
</head>
<body>
	
	<%!
		public String convertToDate(Date date) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String formattedDate = formatter.format(date);
			return formattedDate;
		}
	
		int greetingCount = 0;
	%>
	
	<p>Current Date-1: <%= convertToDate(new Date())%> </p>
	
	<p>Current Date-2: 
		<%
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			String formattedDate = formatter.format(new Date());
			
			out.println(formattedDate);
		%>
	</p>
	
	<ul>
		<% for(int i=0; i < 10; i++) { %>
			
			<li>Sayı: <%= i %></li>
		
		<% } %>
	</ul>
	
	<% if(greetingCount == 0) { %>
		
		<p>Greeting count <%= greetingCount %> </p>
		
	<% } else { %>
		
		<p>Greeting count <%= greetingCount %></p>
		
	<% } %>
	
</body>
</html>