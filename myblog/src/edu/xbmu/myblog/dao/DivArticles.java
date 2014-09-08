package edu.xbmu.myblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sun.rowset.CachedRowSetImpl;

public class DivArticles {
	
		int pageSize = 2; // 每页显示的记录数
		int pageAllCount = 0; // 分页后的总页数
		int showPage = 1; // 当前显示页
		List<Articles> presentPageResult; // 显示当前页内容
		CachedRowSetImpl rowSet; // 用于存储ResultSet对象
		List<Articles> list =null;

		public DivArticles()
		{
			
			DbHelper helper = new DbHelper();
			
			try
			{   Connection conn=helper.getConnection();
			    String sql="SELECT * FROM articles";
				PreparedStatement pst=conn.prepareStatement(sql);
				ResultSet rs=pst.executeQuery();
				rowSet = new CachedRowSetImpl(); // 创建行集对象
				rowSet.populate(rs);//存储文章对象
				pst.close(); // 关闭连接
				rowSet.last();
				int m = rowSet.getRow(); // 总行数
				int n = pageSize;
				pageAllCount = ((m % n) == 0) ? (m / n) : (m / n + 1);
			} catch (Exception e)
			{
				e.printStackTrace();
			}
		}

		public int getPageSize()
		{
			return pageSize;
		}

		public int getPageAllCount()
		{
			return pageAllCount;
		}

		public void setShowPage(int n)
		{
			showPage = n;
		}

		public int getShowPage()
		{
			return showPage;
		}

		public List<Articles> getPresentPageResult()
		{
			if (showPage > pageAllCount)
				showPage = 1;
			if (showPage <= 0)
				showPage = pageAllCount;
			presentPageResult = show(getShowPage());
			return presentPageResult;
		}

		public List<Articles> show(int page)
		{
			try
			{
				rowSet.absolute((page - 1) * pageSize + 1);
				Articles a=null;
				list=new ArrayList<Articles>();
				for (int i = 0; i < pageSize; i++)
				{   
					a=new Articles();
					a.setAuthorId(rowSet.getInt("authorId"));
					a.setArticleId(rowSet.getInt("articleId"));
					a.setTitle(rowSet.getString("title"));
					a.setPubDate(rowSet.getTimestamp("pubDate"));
					a.setClicks(rowSet.getInt("clicks"));
					a.setContents(rowSet.getString("contents"));
					list.add(a);
					if(!rowSet.next())
					{
						break;
					}
					else
					{
						continue;
					}
				}

			} catch (Exception exp)
			{
				exp.printStackTrace();
			}
			return list;
		}
	}

