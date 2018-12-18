package com.news24.listeners;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.news24.beans.News;
import com.news24.dao.NewsDao;


@WebListener
public class NewsListener implements ServletContextListener {

    
    public NewsListener() {}

    public void contextDestroyed(ServletContextEvent arg0)  {}

	
    public void contextInitialized(ServletContextEvent event)  { 
         
    	List<News> list = NewsDao.getAllNews();
    	System.out.println("Total News: "+list.size());
    	ServletContext context = event.getServletContext();
    	context.setAttribute("newsList", list);
    }
	
}
