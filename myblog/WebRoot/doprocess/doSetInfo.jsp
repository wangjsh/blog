<%@page import="edu.xbmu.myblog.dao.UserDetailDao"%>
<%@page import="edu.xbmu.myblog.dao.UserDetails"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doSetInfo.jsp' starting page</title>
    
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
   String uid=request.getParameter("uid");
   String gender=request.getParameter("gender");
   String age=request.getParameter("age");
   String mail=request.getParameter("mail");
   String qq=request.getParameter("qq");
   //安全性验证
   if(age==null||age.length()==0){
   //跳转错误处理界面
   String msg=URLEncoder.encode("请输入年龄！","utf-8");
   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
   return;
   }
    if(mail==null||mail.length()==0){
   //跳转错误处理界面
   String msg=URLEncoder.encode("请输入Email！","utf-8");
   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
   return;
   }
    if(qq==null||qq.length()==0){
   //跳转错误处理界面
   String msg=URLEncoder.encode("请输入qq！","utf-8");
   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
   return;
   }
   //修改数据库中的用户信息
   UserDetails ud=new UserDetails();
   ud.setAge(Integer.parseInt(age));
   ud.setGender(gender);
   ud.setMail(mail);
   ud.setQq(qq);
   ud.setUserId(Integer.parseInt(uid));
   
   UserDetailDao userdetailupdate=new UserDetailDao();
   userdetailupdate.updateUserDetailById(ud);
   //添加成功，返回主页
    String msg=URLEncoder.encode("详细信息添加成功","utf-8");
	   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
    %>
  </body>
</html>
