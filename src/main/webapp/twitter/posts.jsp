<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="twitter4j.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		ResponseList<Status> lista = (ResponseList<Status>) request
				.getAttribute("posts");

		for (Status pp : lista) {
	%>
	<p><%=pp.getText()%></p>
	<p><%=pp.getUser().getName()%></p>
	<p><%=pp.getUser().getCreatedAt()%></p>
	<%
		}
	%>
</body>
</html>