<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="facebook4j.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<a href="./logout">logout</a>
	<h1>Welcome ${facebook.name} (${facebook.id})</h1>
	<form action="./post" method="post">
		<textarea cols="80" rows="2" name="message"></textarea>
		<input type="submit" name="post" value="statuses" />
	</form>
	<%
		ResponseList<Post> lista = (ResponseList<Post>) request
				.getAttribute("posts");

		for (Post pp : lista) {
	%>
	<p><%=pp.getMessage()%></p>
	<p><%=pp.getUpdatedTime()%></p>
	<%
		}
	%>
</body>
</html>