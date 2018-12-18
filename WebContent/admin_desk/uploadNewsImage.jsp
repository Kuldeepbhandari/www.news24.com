
<%@page import="java.io.File"%>
<%@page import="com.news24.dao.NewsDao"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%
	int MAX_FILE_SIZE = 1024*1024*2;
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setSizeThreshold(MAX_FILE_SIZE);
	ServletFileUpload uploade = new ServletFileUpload(factory);
	List<FileItem>	list = uploade.parseRequest(request);
	
	FileItem item = list.get(0);
	String fileName = item.getName();
	String fType = item.getContentType();//image/jpg
	long fSize = item.getSize();
	
	if(fSize < MAX_FILE_SIZE){
		if(fType.equals("image/jpg") || fType.equals("image/jpeg") || fType.equals("image/png")){
			int status = NewsDao.addNewsImage(fileName);
			if(status > 0){
				int itemId = NewsDao.getMaxNewsId();
				String path = "D:/j2ee_workspace/www.news24.com/WebContent/uploaded";
			
				File file = new File(path+"/"+itemId+"_"+fileName);
				item.write(file);		
				
				response.sendRedirect("showNews.jsp");
			}else{
				response.sendRedirect("errorPage.jsp");
			}
		}else{
			response.sendRedirect("errorPage.jsp");
		}
	}else{
		response.sendRedirect("errorPage.jsp");
	}
	
	
	

%>