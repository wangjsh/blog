<%@page import="edu.xbmu.myblog.dao.User"%>
<%@page import="edu.xbmu.myblog.dao.UserInfoDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doLogin.jsp' starting page</title>
    
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
    String name=request.getParameter("userName");
    String pwd=request.getParameter("pwd");
    //安全性验证
    //用户名验证
    if(name==null||name.length()<3)
    {
    String msg=URLEncoder.encode("用户名有点短","UTF-8");
    response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
    return;
    }
    //密码验证
       if(pwd==null||pwd.length()<3)
    {
    String msg=URLEncoder.encode("密码有点短","UTF-8");
    response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
    return;
    }
    UserInfoDao verify=new UserInfoDao();
    User u=verify.findUserInfoByNameAndPwd(name, pwd);
    if (u==null)
   {
	   String msg=URLEncoder.encode("用户名或者密码有误","UTF-8");
	   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
	   return;
   }
    
    session.setAttribute("scsLogin", u);//保存客户session对象
   
    //登陆成功
      String msg=URLEncoder.encode("登陆成功","utf-8");
	   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
    
     %>
  </body>
</html>
