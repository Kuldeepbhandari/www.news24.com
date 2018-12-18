<!DOCTYPE html>
<%@page import="com.news24.listeners.NewsListener"%>
<%@page import="com.news24.dao.NewsDao"%>
<%@page import="com.news24.beans.News"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta charset="utf-8">
<title>index</title>
<link rel="stylesheet" type="text/css" href="mystyle.css">
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="menu.jsp" %>
	
	<%
		NewsListener listener = new NewsListener();	
		ServletContextEvent event = new ServletContextEvent(getServletContext());
		listener.contextInitialized(event);
	
		String category = request.getParameter("cat");
		List<News> list = NewsDao.getNewsByCategory(category);
		if(list.size() > 0){
		for(News n : list){		
	%>	
		<div>
			<div class="imgDiv">
				<img alt="" src="uploaded/<%=n.getImage()%>">
			</div>
			<div class="newsDetail">
				<h3><%=n.getTitle() %></h3>
				<p><%=n.getDetail() %></p>
				<span>Posted by <%=n.getAuthor() %> on <%=n.getNewsDt() %></span>
			</div>
		
		</div>
		<hr>
	
	<%}}else{ %>
		<h3>No news found as per select category</h3>
	<%} %>
		
		
		
</body>
</html>