<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib uri="WEB-INF/string_builder.tld" prefix="batux" %>  


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%!
		public List<Cookie> prepareCookieList(HttpServletRequest request) {
			
			return Arrays.asList(request.getCookies());
		}
	
		List<String> names = Arrays.asList(
				"Mehmet Ali",
				"Mehmet Emmi", 
				"Ayşe Ulusoy", 
				"Fatma Karagül", 
				"Mustafa Kemal", 
				"Yaşar Kemal",
				"Gülizar Yurt",
				"Nuri Ufuk");
	%>
	
	<%	
		// Her dakikada bir sayfayı refresh eder.
		response.setIntHeader("Refresh", 60);
		
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		
		Cookie user = new Cookie("fullName", name + surname);
		user.setMaxAge(60*60);
		
		response.addCookie(user);
		
		Integer hitsCount = (Integer)application.getAttribute("hitCounter");
		
		if( hitsCount ==null || hitsCount == 0 ) {
		   out.println("Welcome to my website!");
		   hitsCount = 1;
		} else {
		   out.println("Welcome back to my website!");
		   hitsCount += 1;
		}
		
		application.setAttribute("hitCounter", hitsCount);
    %>
	
	<p>Total visit count: <%= hitsCount %></p>
	
	
	<c:set var="servletName" value="<%= config.getServletName() %>" />
	<c:set var="cookies" value="<%= prepareCookieList(request) %>" />
	<c:set var="totalHitCount" value="<%= hitsCount %>" />
	
	<c:choose>
		<c:when test="${ totalHitCount < 1000 }">
			<p>Your daily visitor count is not too much!</p>
		</c:when>
		<c:when test="${ totalHitCount > 1000 }">
			<p>You have too much daily visitors!</p>
		</c:when>
	</c:choose>
	
	<p>
		<c:out value="Current Date: ${ formattedDate }" />
	</p>
	<p>
		<c:out value="Servlet Name: ${ servletName }" />
	</p>
	
	<p>Cookie Listesi</p>
	<table>
		<tr>
			<td>İsmi</td>
			<td>Değeri</td>
		</tr>
		<c:forEach var="cookie" items="${ cookies }">
			
			<%
				Cookie cookie = (Cookie)pageContext.findAttribute("cookie");
				String cookieName = cookie.getName();
				String cookieValue = cookie.getValue();
			%>
			
			<c:set var="cookieName" value="<%= cookieName %>" />
			<c:set var="cookieValue" value="<%= cookieValue %>" />
		
			<tr>
				<td><c:out value="${cookieName}"></c:out></td>
				<td><c:out value="${cookieValue}"></c:out></td>
			</tr>
		</c:forEach>
	</table>


	<fmt:setLocale value = "en"/>
	<fmt:bundle basename = "com.jsp.basics.bundle.LocaleResourceBundle" prefix="page.message.">
		<fmt:message key = "title" /><br/>
		<fmt:message key = "footer" /><br/>
		<fmt:message key = "warning" /><br/>
		<fmt:message key = "success" /><br/>
		<fmt:message key = "fail" /><br/>
	</fmt:bundle>
	
	<fmt:setLocale value = "tr"/>
	<fmt:bundle basename = "com.jsp.basics.bundle.LocaleResourceBundle" prefix="page.message.">
		<fmt:message key = "title" /><br/>
		<fmt:message key = "footer" /><br/>
		<fmt:message key = "warning" /><br/>
		<fmt:message key = "success" /><br/>
		<fmt:message key = "fail" /><br/>
	</fmt:bundle>
	
	
	<c:set var = "creditBalance" value = "1250003.350" />
    <fmt:parseNumber var = "creditBalanceAsNumber" type = "number" value = "${creditBalance}" />
    <c:out value="${creditBalanceAsNumber}" />

	<c:set var="nameList" value="<%= names %>" />
	<c:forEach var="name" items="${nameList}">
		<c:if test="${ fn:endsWith(name, 'Kemal') }">
			<p><c:out value="${ name }" /></p>
		</c:if>
	</c:forEach>
	
	<c:forEach var="name" items="${nameList}">
		<c:if test="${ fn:startsWith(name, 'Mehmet') }">
			<p><c:out value="${ name }" /></p>
		</c:if>
	</c:forEach>
	
	<p>
		<batux:MyStringBuilder parts="<%= new String[] { \"merhabalar\", \"kodluyoruz\", \"java\", \"takımı\"} %>" />
	</p>
	
</body>
</html>