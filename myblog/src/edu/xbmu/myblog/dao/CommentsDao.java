package edu.xbmu.myblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class CommentsDao {
	public ArrayList<Articles> findArticlesByUserid(int id)
	{
		ArrayList<Articles> list=new ArrayList<Articles>();
		
		DbHelper helper=new DbHelper();
		try {
			Connection conn=helper.getConnection();
			String sql="SELECT ar.articleId,ar.authorId,ar.title,ar.contents,ar.pubDate,ar.clicks FROM (SELECT a.articleId,a.authorId,a.title,a.contents,a.pubDate,a.clicks FROM articles a) ar JOIN (SELECT articleId FROM comments WHERE userid=? GROUP BY articleId) comm ON  comm.articleId=ar.articleId";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			while (rs.next())
			{
				Articles articles=new Articles();
				articles.setArticleId(rs.getInt("articleId"));
				articles.setAuthorId(rs.getInt("authorId"));
				articles.setTitle(rs.getString("title"));
				articles.setContents(rs.getString("contents"));
				articles.setPubDate(rs.getTimestamp("pubDate"));
				articles.setClicks(rs.getInt("clicks"));
				list.add(articles);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return list;
	}
	public int removeCommentsByArticleId(int id){
		int rows=-1;
		DbHelper helper=new DbHelper(); 
		try{
			Connection conn=helper.getConnection();
			String sql="DELETE FROM comments WHERE articleId=?";
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
	public int addCommentsById(Comments comments){
		int rows=-1;
		DbHelper helper=new DbHelper(); 
		try{
			Connection conn=helper.getConnection();
			String sql="INSERT INTO comments(articleId,userid,comment,commentPubDate) VALUES (?,?,?,?)";
		
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, comments.getArticleId());
			pst.setInt(2, comments.getUserId());
			pst.setString(3, comments.getContent());
			java.sql.Timestamp commentPubDate=new java.sql.Timestamp(comments.getPubDate().getTime());
			pst.setTimestamp(4, commentPubDate);
			rows=pst.executeUpdate();
			
			pst.close();
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return rows;
	}
	public ArrayList<Comments> findCommentsByArticleId(int id)
	{
		ArrayList<Comments> list=new ArrayList<Comments>();
		
		DbHelper helper=new DbHelper();
		try {
			Connection conn=helper.getConnection();
			String sql="SELECT c.commentId,c.articleId,c.userid,c.comment,c.commentPubDate,u.trueName FROM comments c, userdetails u WHERE  c.userid=u.userid and c.articleId=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			while (rs.next())
			{
				Comments comment=new Comments();
				comment.setCommentId(rs.getInt("commentId"));
				comment.setArticleId(rs.getInt("articleId"));
				comment.setUserId(rs.getInt("userid"));
				comment.setContent(rs.getString("comment"));
				comment.setPubDate(rs.getTimestamp("commentPubDate"));
				comment.setAuthorName(rs.getString("trueName"));
				list.add(comment);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		

		
		return list;
	}
}
