<%@page import="edu.xbmu.myblog.dao.Articles"%>
<%@page import="edu.xbmu.myblog.dao.ArticlesDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>我的博客</title>
<link href="CSS/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body {margin: 0px;}
a.f12white:link {font-size: 12px;color: #FFFFFF;text-decoration: none;}
a.f12white:visited {font-size: 12px;color: #FFFFFF;text-decoration: none;}
a.f12white:hover {font-size: 12px;color: #FFFFFF;text-decoration: none;}
a.f16white:link {font-size: 16px;color: #FFFFFF;text-decoration: none;}
a.f16white:visited {font-size: 16px;color: #FFFFFF;text-decoration: none;}
a.f16white:hover {font-size: 16px;color: #FFFFFF;text-decoration: none;}
.key {color: #202020;background-color: #E8E8E8;	height: 19px;	width: 170px;border: 1px solid #000000;}
</style>
<!-- 导入banner资源开始 -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/easySlider1.5.js"></script>
<script type="text/javascript" charset="utf-8">
// <![CDATA[
$(document).ready(function(){	
	$("#slider").easySlider({
		controlsBefore:	'<p id="controls">',
		controlsAfter:	'</p>',
		auto: true, 
		continuous: true
	});	
});
// ]]>
</script>
<style type="text/css">
.gallery { width:900px; height:306px; margin:0 auto; padding:0; }
#slider { margin:0; padding:0; list-style:none; }
#slider ul,
#slider li { margin:0; padding:0; list-style:none; }
#slider li { width:900px; height:306px; overflow:hidden; }
p#controls { margin:0; padding:0; position:relative; }
#prevBtn { display:block; margin:0; overflow:hidden; width:26px; height:32px; position:absolute; left: -30px; top:-150px; }
#nextBtn { display:block; margin:0; overflow:hidden; width:26px; height:32px; position:absolute; left: 910px; top:-150px; }
#prevBtn a { display:block; width:26px; height:32px; background:url(img/c_left.gif) no-repeat 0 0; }
#nextBtn a { display:block; width:26px; height:32px; background:url(img/c_right.gif) no-repeat 0 0; }
</style>
<!-- 导入banner资源结束 -->

</head>

<body>
<%
String uid=request.getParameter("uid");
//安全验证
if(uid==null||uid.length()==0)
{
response.sendRedirect(request.getContextPath()+"/index.jsp");
return;
}
//头部以及右部显示登录用户的信息
UserDetailDao userdetaildaosetinfo=new UserDetailDao();
UserDetails tname=userdetaildaosetinfo.findUserDetailById(Integer.parseInt(uid));
//

%>
<%@include file="header.jsp" %><!--头部开始-->
<!--正文开始-->
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    
    
 
    <td width="680" valign="top"><table width="680" border="0" cellpadding="10" cellspacing="1" bgcolor="#dddddd">
      <tr>
        <td align="center" bgcolor="#fcfcfc" colspan="5"><table width="650" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" align="center" bgcolor="#507cd1" class="F14WhiteStrong">博文标题</td>
            <td width="100" align="center" bgcolor="#507cd1" class="F14WhiteStrong">发表日期</td>
            <td width="50" align="center" bgcolor="#507cd1" class="F14WhiteStrong">点击</td>
            <td width="50" align="center" bgcolor="#507cd1" class="F14WhiteStrong">评论</td>
            <td width="50" align="center" bgcolor="#507cd1" class="F14WhiteStrong">编辑</td>
            <td width="50" align="center" bgcolor="#507cd1" class="F14WhiteStrong">删除</td>
            <td width="50" align="center" bgcolor="#507cd1" class="F14WhiteStrong">详细</td>
          </tr>
          <%
          ArticlesDao articlesdao=new ArticlesDao();
         ArrayList<Articles>list=articlesdao.findArticlesByAuthorId(Integer.parseInt(uid));
          for(int i=0;i<list.size();i++){
         Articles articles=list.get(i);
       
         
          %>
          <tr>
            <td height="30" align="left" bgcolor="#eff3fb"><%=articles.getTitle()%></td>
            <td align="center" bgcolor="#eff3fb"><%=articles.getPubDate() %></td>
            <td align="center" bgcolor="#eff3fb"><%=articles.getClicks() %></td>
            <td align="center" bgcolor="#eff3fb"><%=articles.getCommCount() %></td>
            <td align="center" bgcolor="#eff3fb"><a href="editArticle.jsp?aid=<%=articles.getArticleId()%>">编辑</a></td>
            <td align="center" bgcolor="#eff3fb"><a href="doprocess/doDeleteArticle.jsp?aid=<%=articles.getArticleId()%>">删除</a></td>
            <td align="center" bgcolor="#eff3fb"><a href="articledetail.jsp?aid=<%=articles.getArticleId()%>">详细</a></td>
          </tr>
         <%} %>
          
        </table>
      
        </td>
      </tr>
      
    </table></td>
    
    
    
    <td>&nbsp;</td>
    <td width="200" valign="top">
    <%@include file="right.jsp" %><!--右侧开始-->
	  </td>
  </tr>
</table>
<!--正文结束-->
<%@include file="footer.jsp" %>
</body>
</html>

