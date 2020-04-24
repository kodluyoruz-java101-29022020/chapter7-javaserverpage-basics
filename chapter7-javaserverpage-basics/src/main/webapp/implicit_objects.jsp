<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Implicit Objects</title>
</head>
<body>

	<%
		Integer hitsCount = (Integer) application.getAttribute("hitCounter");
		if (hitsCount == null || hitsCount == 0) {
			out.println("Welcome to my website!");
			hitsCount = 1;
		} else {
			out.println("Welcome back to my website!");
			hitsCount += 1;
		}

		// application is an implicit object!
		application.setAttribute("hitCounter", hitsCount);

		// request is an implicit object!
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");

		Cookie user = new Cookie("fullName", name + surname);
		user.setMaxAge(60 * 60);

		// response is an implicit object!
		response.addCookie(user);
	%>

	<p>
		Total visit count: <%=hitsCount%>
	</p>
	
	<p>Your IP Address: <% out.println(request.getRemoteAddr()); %></p>

</body>
</html>