<%@page import="edu.xbmu.myblog.dao.CommentsDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="edu.xbmu.myblog.dao.ArticlesDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String aid=request.getParameter("aid");
ArticlesDao articlesdao=new ArticlesDao();
articlesdao.removeArticlesByArticlesId(Integer.parseInt(aid));
CommentsDao commentsDao=new CommentsDao();
commentsDao.removeCommentsByArticleId(Integer.parseInt(aid));
String msg=URLEncoder.encode("删除成功","utf-8");
response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
%>
