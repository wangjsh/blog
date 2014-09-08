package edu.xbmu.myblog.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DbHelper {
	static{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	public  Connection getConnection() throws SQLException
		{
			String url="jdbc:mysql://localhost:3306/myblog";
	        Connection conn=DriverManager.getConnection(url, "root", "root");
	        return conn;
		
		}
	public int executeUpdate(String sql){
		int rows=-1;
		Connection conn=null;
		Statement stmt=null;
		try{
			conn=this.getConnection();
			stmt=conn.createStatement();
			rows=stmt.executeUpdate(sql);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
			if(stmt!=null){
				stmt.close();
			}
			if(conn!=null&&!conn.isClosed()){
				conn.close();
			}
			}
			catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		return rows;
	}
}
