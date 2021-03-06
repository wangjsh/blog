<%@page import="java.net.URLEncoder"%>
<%@page import="edu.xbmu.myblog.dao.Articles"%>
<%@page import="edu.xbmu.myblog.dao.ArticlesDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="divpage" class="edu.xbmu.myblog.dao.DivArticles"  scope="session" />
<jsp:setProperty  name="divpage" property="showPage" />
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

<%@include file="header.jsp" %><!--头部开始-->
<!--正文开始-->
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="680" valign="top"><table width="680" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd">
      <tr>
        <td align="center" bgcolor="#fcfcfc" colspan="5"><table width="650" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" align="left" class="F12Strong">全部博文</td>
          </tr>
          <tr>
            <td height="1" align="left" bgcolor="#dddddd"></td>
          </tr>

          <tr>
            <td height="1" align="left" bgcolor="#dddddd"></td>
          </tr>
        </table>
          <p>&nbsp;</p>
     
        <%
         
         List<Articles> list1= new ArrayList<Articles>();
         list1 = divpage.getPresentPageResult();
          for(int i=0;i<list1.size();i++){
          Articles articles=list1.get(i);
        
         %>
            <table width="650" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" align="left"><a href="indexarticledetail.jsp?aid=<%=articles.getArticleId() %>" class="title"><%=articles.getTitle() %></a></td>
            </tr>
            
            <tr>
              <td align="left"><p class="content"><%=articles.getContents2String() %> </p></td>
            </tr>
            <tr>
              <td height="30" align="left" class="F12Gray">&gt;&gt;<a href="indexarticledetail.jsp?aid=<%=articles.getArticleId() %>" class="L12Gray">阅读全文</a></td>
            </tr>
            <tr>
              <td height="30" align="right" class="F12Gray">点击次数<%=articles.getClicks() %>次　<%=articles.getPubDate2String() %> </td>
            </tr>
              <tr>
              <td height="1" align="left" bgcolor="#dddddd"></td>
            </tr>
          </table>
          <%} %>
       
          <p></p>
             <tr width="650">
      <td width="250" align="right">
      <form action="">
      <input type="hidden" name="showPage" value=1>
      <input type="submit" name="g" value="首页">	
      	</form>
      </td>
      <td>
      <form action="">
      <input type="hidden" name="showPage" value="<%=divpage.getShowPage()-1%>">
      <input type="submit" name="g" value="上一页">	
      	</form>
      </td>
     <td>第<jsp:getProperty name="divpage" property="showPage" />/<jsp:getProperty name="divpage" property="pageAllCount" />页</td>
	 <td>
      <form action="">
      <input type="hidden" name="showPage" value="<%=divpage.getShowPage()+1%>">
      <input type="submit" name="g" value="下一页">	
      	</form>
      </td>   
       <td width="250">
      <form action="">
      <input type="hidden" name="showPage" value="<%=divpage.getPageAllCount()%>">
      <input type="submit" name="g" value="末页">	
      	</form>
      </td>
      	</tr>
          </td>
      </tr>
      
     
      
    </table></td>
    <td></td>
    <td width="200" valign="top">
	<%@include file="right.jsp" %><!--右侧开始-->
	  </td>
  </tr>
  

</table>
<!--正文结束-->
<%@include file="footer.jsp" %>
</body>
</html>

