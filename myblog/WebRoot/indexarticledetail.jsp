<%@page import="edu.xbmu.myblog.dao.CommentsDao"%>
<%@page import="edu.xbmu.myblog.dao.Comments"%>
<%@page import="java.net.URLEncoder"%>
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
String aid=request.getParameter("aid");
if(aid==null||aid.length()==0){
response.sendRedirect(request.getContextPath()+"/index.jsp");
return;
}
ArticlesDao articlesDao=new ArticlesDao();
Articles articles=articlesDao.findArticlesByArticlesId(Integer.parseInt(aid));
articlesDao.addClicks(Integer.parseInt(aid));//点击数量+1




%>
<%@include file="header.jsp" %><!--头部开始-->
<!--正文开始-->
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    
    
    
    <td width="680" valign="top"><table width="680" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd">
      <tr>
        <td align="center" bgcolor="#fcfcfc"><table width="650" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" align="left" class="F12Strong">博文内容</td>
          </tr>
          <tr>
            <td height="1" align="left" bgcolor="#dddddd">			</td>
          </tr>
          <tr>
            <td height="30" align="left"><a href="indexarticledetail.jsp?aid=<%=articles.getArticleId() %>" class="title"><%=articles.getTitle() %></a></td>
          </tr>
          <tr>
            <td height="30" align="left" class="F12Gray"><%=articles.getPubDate2String() %> 访问次数<%=articles.getClicks() %>次</td>
          </tr>
          <tr>
            <td align="left"><p class="content">　<%=articles.getContents() %>　</p></td>
          </tr>
          <tr>
            <td height="30" align="left"><p>&nbsp;</p></td>
          </tr>
          <tr>
            <td height="30" align="left" class="F12Strong">访客评论</td>
          </tr>
          <tr>
            <td height="1" align="left" bgcolor="#dddddd">			</td>
          </tr>
          <%
             CommentsDao commentsDao=new CommentsDao();
             ArrayList<Comments> list=commentsDao.findCommentsByArticleId(articles.getArticleId());
             if (list.size()==0)
             {
           %>
          <tr>
            <td height="30" align="left" class="F12Gray">该文章还没有评论内容，赶快抢沙发！！</td>
          </tr>
          <%}else{
              for(int i=0;i<list.size();i++)
              {
                  Comments comment=list.get(i);
              
              %>
              
          <tr>
            <td height="30" align="left" class="F12Gray"><%=comment.getAuthorName() %>：</td>
          </tr>
          <tr>
            <td height="30" align="left">　　<%=comment.getContent() %></td>
          </tr>
          <tr>
            <td height="30" align="right" class="F12Gray"><%=comment.getPubDate2String() %></td>
          </tr>
          <tr>
            <td height="1" align="left" bgcolor="#dddddd">			</td>
          </tr>
              
              <%
              
              }
          } %>
         
          <tr>
            <td height="30" align="left" class="F12Strong">发表评论</td>
          </tr>
          <tr>
            <td height="30" align="left"><form id="form2" name="form2" method="post" action="doprocess/docomment.jsp">
            
              <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
              <%
                 User userComment=(User)session.getAttribute("scsLogin");
                
                 if (userComment==null){
                  
               %>
              
                <tr>
                  <td width="100" height="30" align="right">&nbsp;</td>
                  <td><label><a href="index.jsp" class="L12Gray">登陆</a> <a href="register.jsp" class="L12Gray">注册</a></label></td>
                </tr>
                <%}else
                { %>
                
                <tr>
                  <td height="30" align="right">评论：</td>
                  <td><label>
                    <textarea name="comment" rows="5" class="inputTextW480"></textarea>
                    <input type="hidden" name="auid" value="<%=userComment.getId()%>"/>
                    <input type="hidden" name="aid" value="<%=articles.getArticleId()%>"/>
                  </label></td>
                </tr>
                <tr>
                  <td height="30" align="right">&nbsp;</td>
                  <td><label>
                    <input type="image" name="imageField2" src="images/publish.jpg" />
                  </label></td>
                </tr>
                <%} %>
              </table>
                        </form>            </td>
          </tr>
        </table></td>
      </tr>
      
    </table></td>
    
    
    
    <td>&nbsp;</td>
    <td width="200" valign="top">&nbsp;<%@include file="right.jsp" %><!--右侧开始-->
	  </td>
  </tr>
</table>
<!--正文结束-->
<%@include file="footer.jsp" %>
</body>
</html>

