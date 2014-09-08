<%@page import="java.net.URLEncoder"%>
<%@page import="edu.xbmu.myblog.dao.UserDetailDao"%>
<%@page import="edu.xbmu.myblog.dao.UserDetails"%>
<%@page import="edu.xbmu.myblog.dao.UserInfoDao"%>
<%@page import="edu.xbmu.myblog.dao.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<% //获取数据
   request.setCharacterEncoding("utf-8");
   String name=request.getParameter("loginId");
   String[] pwds=request.getParameterValues("loginPwd");
   String realname=request.getParameter("trueName");
   
   
   //用户名不能为空
   if(name==null||name.length()<3){
   //错误处理
   String msg=URLEncoder.encode("用户名长度不能小于3", "utf-8");
   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
   return;
   }
   //密码不能为空且长度不能小于6
   if(pwds==null||pwds[0].length()<6){
   //错误处理
   String msg=URLEncoder.encode("密码长度不能小于6", "utf-8");
   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
   return;
   
   }
   //且两次输入要一致
    if(!(pwds[0].equals(pwds[1]))){
   //错误处理
   String msg=URLEncoder.encode("两次密码要一致", "utf-8");
   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
   return;
   
   }
   //真实姓名不能为空
    if(realname==null||realname.length()==0){
   //错误处理
   String msg=URLEncoder.encode("真实姓名不能为空", "utf-8");
   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
   return;
   }
   //用户名不能重复
   UserInfoDao userinfodao=new UserInfoDao();
   User isUser=userinfodao.findUserInfoByName(name);
   if(isUser!=null){
   //错误处理
   String msg=URLEncoder.encode("用户名已存在", "utf-8");
   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
   return;
   }
   //向数据库中添加数据
   User user=new User();
   user.setName(name);
   user.setPwd(pwds[0]);
   userinfodao.saveUserInfo(user);
   
   User u=userinfodao.findUserInfoByNameAndPwd(name, pwds[0]);
   
   
   UserDetails userdetails=new UserDetails();
   UserDetailDao userdetaildao=new UserDetailDao();
   userdetaildao.saveUserDetailsWithRealname(u.getId(), realname);
   //注册成功，跳转页面
    String msg=URLEncoder.encode("注册成功","utf-8");
	   response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);

  %>