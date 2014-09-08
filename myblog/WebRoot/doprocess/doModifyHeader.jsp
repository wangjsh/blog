<%@page import="java.net.URLEncoder"%>
<%@page import="edu.xbmu.myblog.dao.UserDetailDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doModifyHeader.jsp' starting page</title>
    
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
  
  String uid=request.getParameter("uid");
  String headerpath=request.getParameter("headerPath");
  UserDetailDao userheaderdao=new UserDetailDao();
  userheaderdao.updateHeaderById(Integer.parseInt(uid), headerpath);
  //修改成功，跳转到主页
   String msg=URLEncoder.encode("头像修改成功","utf-8");
	   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
  
  
   %>
  </body>
</html>
