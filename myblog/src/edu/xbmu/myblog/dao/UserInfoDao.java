package edu.xbmu.myblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserInfoDao {
	public int modifyPwdById(int id,String pwd){
		int rows=-1;
		DbHelper helper=new DbHelper();
		try {
			Connection conn=helper.getConnection();
			String sql="UPDATE userinfo SET loginPwd=? WHERE userid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1,pwd );
			pst.setInt(2, id);
			rows=pst.executeUpdate();
			pst.close();
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rows;
	}
	public User findUserInfoByName(String name){
		DbHelper helper=new DbHelper();
		User user=null;
		try {
			Connection conn=helper.getConnection();
			String sql="SELECT * FROM userinfo WHERE loginId=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1,name);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				user=new User();
				user.setId(rs.getInt("userid"));
				user.setName(name);
				
				
			}
			rs.close();
			pst.close();
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	public User findUserInfoByNameAndPwd(String name,String pwd){
		DbHelper helper=new DbHelper();
		User user=null;
		try {
			Connection conn=helper.getConnection();
			String sql="SELECT * FROM userinfo WHERE loginId=? AND loginPwd=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1,name);
			pst.setString(2, pwd);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				user=new User();
				user.setId(rs.getInt("userid"));
				user.setName(name);
				user.setPwd(pwd);
				
			}
			rs.close();
			pst.close();
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	public int saveUserInfo(User user){
		int rows=-1;
		DbHelper helper=new DbHelper();
		try {
			Connection conn=helper.getConnection();
			String sql="INSERT INTO userinfo (loginId,loginPwd) VALUES (?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, user.getName());
			pst.setString(2, user.getPwd());
			rows=pst.executeUpdate();
			pst.close();
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rows;
	} 
}
