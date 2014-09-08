package edu.xbmu.myblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDetailDao {
	public int updateHeaderById(int id,String headerpath){
		int rows=-1;
		DbHelper helper=new DbHelper(); 
		try{
			Connection conn=helper.getConnection();
			String sql="UPDATE userdetails SET headerimg=? WHERE userid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1,headerpath);
		   pst.setInt(2, id);
			rows=pst.executeUpdate();
			
			pst.close();
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return rows;
	}
    public int updateUserDetailById(UserDetails ud){
    	int rows=-1;
		DbHelper helper=new DbHelper(); 
		try{
			Connection conn=helper.getConnection();
			String sql="UPDATE userdetails SET gender=?,age=?,mail=?,qq=? WHERE userid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, ud.getGender());
		    pst.setInt(2, ud.getAge());
		    pst.setString(3, ud.getMail());
		    pst.setString(4, ud.getQq());
		    pst.setInt(5, ud.getUserId());
			rows=pst.executeUpdate();
			
			pst.close();
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return rows;
    }
	public UserDetails findUserDetailById(int id){
		UserDetails userdetails=null;
		DbHelper helper=new DbHelper();
		try {
			Connection conn=helper.getConnection();
			String sql="SELECT * FROM userdetails WHERE userid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				userdetails=new UserDetails();
				userdetails.setUserId(id);
				userdetails.setTrueName(rs.getString("trueName"));
				userdetails.setGender(rs.getString("gender"));
				userdetails.setAge(rs.getInt("age"));
				userdetails.setMail(rs.getString("mail"));
				userdetails.setQq(rs.getString("qq"));
				userdetails.setHeaderimg(rs.getString("headerimg"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userdetails;
	}
	public int saveUserDetailsWithRealname(int id,String realname){
		int rows=-1;
		DbHelper helper=new DbHelper(); 
		try{
			Connection conn=helper.getConnection();
			String sql="insert INTO UserDetails (userid,trueName)VALUES (?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, realname);
			rows=pst.executeUpdate();
			
			pst.close();
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return rows;
	}
}
