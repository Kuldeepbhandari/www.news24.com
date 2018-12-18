package com.news24.dao;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContextEvent;

import com.news24.beans.News;
import com.news24.listeners.NewsListener;

public class NewsDao implements DBInfoProvider{
	
	public static Connection getDBConnection() {
		Connection conn=null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			System.out.println(e);
		}
		return conn;
	}
	
	public static int addNewsToDb(News n) {
		int status=0;
		Connection conn =getDBConnection();
		String  sql = "insert into news(title, category, detail, author, newsDt) values(?,?,?,?,?)";
		try {
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, n.getTitle());
			ps.setString(2, n.getCategory());
			ps.setString(3, n.getDetail());			
			ps.setString(4, n.getAuthor());
			ps.setDate(5, n.getNewsDt());
			
			status = ps.executeUpdate();
			ps.close();conn.close();
			
		} catch (Exception e) {System.out.println(e);}
		
		
		return status;
	}
	
	
	public static int addNewsImage(String imageName) {
		int status=0;
		try {
			int maxid = getMaxNewsId();		
			Connection conn = getDBConnection();			
			String sql = "update news set image=? where newsId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, maxid+"_"+imageName);
			ps.setInt(2, maxid);
			
			status = ps.executeUpdate();
			
			
			
			
			ps.close();conn.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		return status;
	}
	
	public static int getMaxNewsId()throws Exception {
		Connection conn = getDBConnection();
		String sql = "select max(newsId) from news";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		int max=0;
		while(rs.next()) {
			max = rs.getInt(1);
		}
		rs.close();ps.close();conn.close();
		return max;
	}

	public static List<News> getAllNews() {
		List<News> list = new ArrayList<>();
		Connection con = getDBConnection();
		String sql = "select * from news";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				News n = new News();
				n.setNewsId(rs.getInt(1));
				n.setTitle(rs.getString(2));
				n.setCategory(rs.getString(3));
				n.setDetail(rs.getString(4));				
				n.setImage(rs.getString(5));
				n.setAuthor(rs.getString(6));
				n.setNewsDt(rs.getDate(7));
				list.add(n);
			}
			rs.close();ps.close();
		} catch (Exception e) {System.out.println(e);}
		return list;
	}
	
	public static List<News> getNewsByCategory(String category) {
		List<News> list = new ArrayList<>();
		Connection con = getDBConnection();
		String sql = "select * from news where category=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, category);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				News n = new News();
				n.setNewsId(rs.getInt(1));
				n.setTitle(rs.getString(2));
				n.setCategory(rs.getString(3));
				n.setDetail(rs.getString(4));				
				n.setImage(rs.getString(5));
				n.setAuthor(rs.getString(6));
				n.setNewsDt(rs.getDate(7));
				list.add(n);
			}
			rs.close();ps.close();
		} catch (Exception e) {System.out.println(e);}
		return list;
	}
	
	public static int deleteNewsById(int newsId) {
		System.out.println(newsId);
		int status=0;
		Connection conn = getDBConnection();
		String sql = "delete from news where newsId=?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, newsId);
			status = ps.executeUpdate();
			System.out.println("status: "+status);
			
			ps.close();conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}		
		return status;
	}
}
