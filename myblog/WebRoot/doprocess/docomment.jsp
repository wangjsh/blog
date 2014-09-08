<%@page import="edu.xbmu.myblog.dao.Comments"%>
<%@page import="edu.xbmu.myblog.dao.CommentsDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%request.setCharacterEncoding("utf-8");//接受数据转换
String auid=request.getParameter("auid");
String aid=request.getParameter("aid");
String content=request.getParameter("comment");
//安全性验证
if(content==null||content.length()==0){
String msg=URLEncoder.encode("您没有输入评论！","utf-8");
response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
return;
}
//评论成功
CommentsDao commentsDao=new CommentsDao();
Comments comments=new Comments();
comments.setArticleId(Integer.parseInt(aid));
comments.setUserId(Integer.parseInt(auid));
comments.setContent(content);
Date pubDate=new Date();
comments.setPubDate(pubDate);
commentsDao.addCommentsById(comments);
//跳转提示界面
String msg=URLEncoder.encode("评论成功！","utf-8");
response.sendRedirect(request.getContextPath()+"/error.jsp?msg="+msg);
%>
