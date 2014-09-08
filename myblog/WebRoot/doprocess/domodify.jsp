<%@page import="java.net.URLEncoder"%>
<%@page import="edu.xbmu.myblog.dao.UserInfoDao"%>
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
    
    <title>My JSP 'domodify.jsp' starting page</title>
    
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
   <%String pwd=request.getParameter("pwd");
     String[] pwd1=request.getParameterValues("pwd1");
     //安全验证
     User user=(User)session.getAttribute("scsLogin");
      UserInfoDao userinfodao=new UserInfoDao();
    User u=userinfodao.findUserInfoByNameAndPwd(user.getName(), pwd);
     if(u==null){
     String msg=URLEncoder.encode("你输入的旧密码不正确","utf-8");
     response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
     return;
     }
     if(pwd1[0].length()==0||pwd1[0].length()<6){
       String msg=URLEncoder.encode("你输入的新密码太短了","utf-8");
     response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
      return;
     }
     if(!(pwd1!=null&&pwd1[0].equals(pwd1[1]))){
       String msg=URLEncoder.encode("你输入的两次新密码不一致","utf-8");
     response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
      return;
     }
     
    
     u=userinfodao.findUserInfoByName(user.getName());
     userinfodao.modifyPwdById(u.getId(), pwd1[0]);
     
     //修改密码成功
      String msg=URLEncoder.encode("密码修改成功","utf-8");
	   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
    %>
  </body>
</html>
