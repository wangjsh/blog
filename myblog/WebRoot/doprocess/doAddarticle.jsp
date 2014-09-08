<%@page import="java.net.URLEncoder"%>
<%@page import="edu.xbmu.myblog.dao.ArticlesDao"%>
<%@page import="edu.xbmu.myblog.dao.Articles"%>
<%@page import="edu.xbmu.myblog.dao.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doAddarticle.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
   User articlesuser=(User)session.getAttribute("scsLogin");
   request.setCharacterEncoding("utf-8");
   String title=request.getParameter("title");
   String userIntro=request.getParameter("userIntro");
   //安全性验证
   if(articlesuser==null){
	   String msg=URLEncoder.encode("您还没有登录","utf-8");
	   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
	   return;
   }
   if(title==null||title.length()==0){
	   String msg=URLEncoder.encode("标题不能为空","utf-8");
	   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
	   return;
   }
   if(userIntro==null||userIntro.length()==0){
	   String msg=URLEncoder.encode("内容不能为空","utf-8");
	   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
	   return;
   }
   Articles articles=new Articles();
   articles.setAuthorId(articlesuser.getId());
   articles.setTitle(title);
   articles.setContents(userIntro);
   Date pubdate=new Date();
   articles.setPubDate(pubdate);
   ArticlesDao articlesdao=new ArticlesDao();
   articlesdao.addArticles(articles);
   //文章发表成功
   String msg=URLEncoder.encode("文章发表成功","utf-8");
   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
    %>
  </body>
</html>
