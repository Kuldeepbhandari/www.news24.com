<!DOCTYPE html>
<%@page import="com.news24.beans.News"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta charset="utf-8">
<title>Shows | Admin</title>
<link rel="stylesheet" type="text/css" href="../mystyle.css">
</head>
<body>
	<%@include file="../header.jsp" %>
	<%@include file="adminMenu.jsp" %>
	<h3>List of Registerd News</h3>
	<table border="1">
		<tr>
			<th>News Id</th>
			<th>Title</th>
			<th>Category</th>
			<th>Detail</th>
			<th>Image</th>
			<th>Author</th>
			<th>Date</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
	<%List<News> list = (List)application.getAttribute("newsList");
		for(News n :list){
	%>
		<tr>
			<td><%=n.getNewsId() %></td>
			<td><%=n.getTitle() %></td>
			<td><%=n.getCategory() %></td>
			<td><%=n.getDetail() %></td>
			<td><img src="../uploaded/<%=n.getImage()%>"></td>
			<td><%=n.getAuthor() %></td>
			<td><%=n.getNewsDt() %></td>
			<td><a href="updateNews.jsp?newsId=<%=n.getNewsId()%>">Update</a></td>
			<td><a href="deleteNews.jsp?newsId=<%=n.getNewsId()%>">Delete</a></td>
			
		</tr>
	<%} %>
	</table>
</body>
</html>