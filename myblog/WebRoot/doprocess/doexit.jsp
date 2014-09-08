<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%//清空session对象,返回主页
   session.invalidate(); 
    response.sendRedirect(request.getContextPath()+"/index.jsp");
    %>