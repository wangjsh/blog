package edu.xbmu.myblog.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.rowset.CachedRowSetImpl;

public class ArticlesDao {
	



	
	public ArrayList<Articles> findArticlesByKey(String key)
	{
		ArrayList<Articles> list=new ArrayList<Articles>();
		String sql="SELECT * FROM articles WHERE title LIKE ?";
		DbHelper helper=new DbHelper();
		try {
			Connection conn=helper.getConnection();
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, "%"+key+"%");
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				Articles a=new Articles();
				a.setArticleId(rs.getInt("articleId"));
				a.setTitle(rs.getString("title"));
				a.setPubDate(rs.getTimestamp("pubDate"));
				a.setClicks(rs.getInt("clicks"));
				a.setContents(rs.getString("contents"));
				list.add(a);
				 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
	public ArrayList<Articles> findAllArticleWithCommentsByAuthorId(int id)
	{
		ArrayList<Articles> list=new ArrayList<Articles>();
		String sql="SELECT ar.articleId,ar.authorId,ar.title,ar.pubDate,ar.clicks,comm.commCount " +
				"FROM (SELECT a.articleId,a.authorId,a.title,a.pubDate,a.clicks FROM articles a) ar " +
				"LEFT JOIN (SELECT articleId,COUNT(1) commCount FROM comments GROUP BY articleId) comm " +
				"ON ar.articleId=comm.articleId where ar.authorId=?";
		DbHelper helper=new DbHelper();
		try {
			Connection conn=helper.getConnection();
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				Articles a=new Articles();
				a.setArticleId(rs.getInt("articleId"));
				a.setTitle(rs.getString("title"));
				a.setPubDate(rs.getTimestamp("pubDate"));
				a.setClicks(rs.getInt("clicks"));
				a.setCommCount(rs.getInt("commCount"));
				
				list.add(a);
				 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
	public int addClicks(int id)
	{
		int rows=-1;
		DbHelper helper=new DbHelper(); 
		try{
			Connection conn=helper.getConnection();
			String sql="update articles set clicks=clicks+1 where articleId=?";
		
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			rows=pst.executeUpdate();
			
			pst.close();
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return rows;
	}
	public ArrayList<Articles> findArticlesAll(){
		ArrayList<Articles>list=new ArrayList<Articles>();
		DbHelper helper=new DbHelper();
		try {
			Connection conn=helper.getConnection();
			String sql="SELECT * FROM Articles";
			PreparedStatement pst=conn.prepareStatement(sql);
			
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				
			    Articles articles=new Articles();
			    articles.setArticleId(rs.getInt("articleId"));
				articles.setAuthorId(rs.getInt("authorId"));
				articles.setClicks(rs.getInt("clicks"));
				articles.setContents(rs.getString("contents"));
				articles.setPubDate(rs.getTimestamp("pubDate"));
				articles.setTitle(rs.getString("title"));
				list.add(articles);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public int removeArticlesByArticlesId(int id){
		int rows=-1;
		DbHelper helper=new DbHelper(); 
		try{
			Connection conn=helper.getConnection();
			String sql="DELETE FROM Articles WHERE articleId=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1,id);
			rows=pst.executeUpdate();
			pst.close();
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return rows;
	}
	public int modifyArticlesByArticlesId(Articles articles){
		int rows=-1;
		DbHelper helper=new DbHelper(); 
		try{
			Connection conn=helper.getConnection();
			String sql="UPDATE articles SET title=?,contents=?,pubDate=? WHERE articleId=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			
			pst.setString(1, articles.getTitle());
			pst.setString(2, articles.getContents());
			java.sql.Timestamp pubDate=new java.sql.Timestamp(articles.getPubDate().getTime());
			pst.setTimestamp(3, pubDate);
			pst.setInt(4, articles.getArticleId());
			rows=pst.executeUpdate();
			
			pst.close();
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return rows;
	}
	public Articles findArticlesByArticlesId(int id){
		Articles articles=null;
		DbHelper helper=new DbHelper();
		try {
			Connection conn=helper.getConnection();
			String sql="SELECT * FROM Articles WHERE articleId=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				
			    articles=new Articles();
			    articles.setArticleId(rs.getInt("articleId"));
				articles.setAuthorId(rs.getInt("authorId"));
				articles.setClicks(rs.getInt("clicks"));
				articles.setContents(rs.getString("contents"));
				articles.setPubDate(rs.getTimestamp("pubDate"));
				articles.setTitle(rs.getString("title"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return articles;
		
	}
	public ArrayList<Articles> findArticlesByAuthorId(int id){
		
		ArrayList<Articles>list=new ArrayList<Articles>();
		DbHelper helper=new DbHelper();
		try {
			Connection conn=helper.getConnection();
			String sql="SELECT * FROM Articles WHERE authorId=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				
			    Articles articles=new Articles();
			    articles.setArticleId(rs.getInt("articleId"));
				articles.setAuthorId(rs.getInt("authorId"));
				articles.setClicks(rs.getInt("clicks"));
				articles.setContents(rs.getString("contents"));
				articles.setPubDate(rs.getTimestamp("pubDate"));
				articles.setTitle(rs.getString("title"));
				list.add(articles);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public int addArticles(Articles articles){
		int rows=-1;
		DbHelper helper=new DbHelper(); 
		try{
			Connection conn=helper.getConnection();
			String sql="INSERT INTO articles(authorId,title,contents,pubDate,clicks) VALUES (?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, articles.getAuthorId());
			pst.setString(2, articles.getTitle());
			pst.setString(3, articles.getContents());
			java.sql.Timestamp pubDate=new java.sql.Timestamp(articles.getPubDate().getTime());
			pst.setTimestamp(4, pubDate);
			pst.setInt(5, 0);
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
