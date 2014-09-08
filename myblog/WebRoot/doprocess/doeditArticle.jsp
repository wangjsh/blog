<%@page import="java.net.URLEncoder"%>
<%@page import="edu.xbmu.myblog.dao.Articles"%>
<%@page import="edu.xbmu.myblog.dao.ArticlesDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doeditArticle.jsp' starting page</title>
    
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
   request.setCharacterEncoding("utf-8");
   String aid=request.getParameter("aid");
   String title=request.getParameter("title");
   String contents=request.getParameter("contents");
   if(aid==null||aid.length()==0){
   //提示信息
   String msg=URLEncoder.encode("您还没有登录或者还没有发表文章", "utf-8");
   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
   return;
   }
    if(title==null||title.length()==0){
   //提示信息
   String msg=URLEncoder.encode("请输入题目", "utf-8");
   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
   return;
   }
    if(contents==null||contents.length()==0){
   //提示信息
   String msg=URLEncoder.encode("内容不能为空", "utf-8");
   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
   return;
   }
   Articles articles=new Articles();
   articles.setArticleId(Integer.parseInt(aid));
   articles.setTitle(title);
   Date pubdate=new Date();
   articles.setPubDate(pubdate);
   articles.setContents(contents);
   ArticlesDao articlesdao=new ArticlesDao();
   articlesdao.modifyArticlesByArticlesId(articles);
   //文章修改成功，跳转提示信息页面
    String msg=URLEncoder.encode("文章修改成功","utf-8");
	   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
    %>
  </body>
</html>
