<%@page import="com.news24.dao.NewsDao"%>
<%@page import="com.news24.beans.News"%>
<%@page import="java.sql.Date"%>
<%
	String title = request.getParameter("title");
	String cat = request.getParameter("category");
	String dtl = request.getParameter("detail");
	String author = "Amin";
	
	Date dt = new Date(System.currentTimeMillis());
	
	News n = new News();
	n.setTitle(title);
	n.setCategory(cat);
	n.setDetail(dtl);
	n.setAuthor(author);
	n.setNewsDt(dt);
	
	int status = NewsDao.addNewsToDb(n);
	if(status > 0){
		response.sendRedirect("newsSuccess.jsp");
	}else{
		response.sendRedirect("newsError.jsp");
	}
	

%>