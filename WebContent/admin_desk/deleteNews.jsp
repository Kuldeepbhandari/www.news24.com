<%@page import="com.news24.listeners.NewsListener"%>
<%@page import="com.news24.dao.NewsDao"%>
<%
	String id = request.getParameter("newsId");
	int newsId = Integer.parseInt(id);
	
	int status = NewsDao.deleteNewsById(newsId);
	
	if(status > 0){		
		response.sendRedirect("showNews.jsp");
	}else{
		response.sendRedirect("errorPage.jsp");
	}

%>