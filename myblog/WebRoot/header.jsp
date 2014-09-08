<%@page import="edu.xbmu.myblog.dao.UserDetails"%>
<%@page import="edu.xbmu.myblog.dao.UserDetailDao"%>
<%@page import="edu.xbmu.myblog.dao.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    User userHeader=(User)session.getAttribute("scsLogin");
    String userString="我们";
    String headerimg="headerimg/default.gif";
    if (userHeader!=null)
    {
        UserDetailDao userDetailsDao=new UserDetailDao();
        UserDetails userdetails=userDetailsDao.findUserDetailById(userHeader.getId());
		userString=userdetails.getTrueName();
		headerimg=userdetails.getHeaderimg();
}
    
    

 %>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
  <tr>
    <td height="30">
    <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
	
      <tr>
        <td width="70" height="30"><img src="images/logo1.png" width="60" height="30" /></td>
        <td width="80" align="center" bgcolor="#191919"><a href="setInfo.jsp" class="f16white">修改资料</a></td>
        <td width="1" align="center">		</td>
        <td width="80" align="center" bgcolor="#191919"><a href="index.jsp" class="f16white">我的主页</a></td>
        <td width="1" align="center">		</td>
        <td width="80" align="center" bgcolor="#191919"><a href="myparticipant.jsp" class="f16white">我参与的</a></td>
        <td width="1" align="center">		</td>
        <td width="36" align="center"><img src="<%=headerimg %>" width="24" height="20" /></td>
        <td width="150"><a href="doprocess/doexit.jsp" class="f12white"><%=userString %>[退出]</a></td>
        <td>&nbsp;</td>
        <form id="form1" name="form1" method="post" action="searchArticles.jsp">
        <td width="170" align="center"><input name="key" type="text" class="key" id="key" value="搜索文章" /></td>
        <td width="24"><input type="image" src="images/search.jpg" border="0" width="24" height="21" title="搜索" /></td>
        </form>
      </tr>
	   
    </table></td>
  </tr>
</table>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
	 <!--banner开始-->
      <div class="gallery">
        <div id="slider">
          <ul>
            <li><div class="div"><img src="banner/main_banner1.jpg" alt="" width="900" height="306" border="0" class="screen" /></div></li>
			<li><div class="div"><img src="banner/main_banner2.jpg" alt="" width="900" height="306" border="0" class="screen" /></div></li>
			<li><div class="div"><img src="banner/main_banner3.jpg" alt="" width="900" height="306" border="0" class="screen" /></div></li>
          </ul>
          <div class="clr"></div>
        </div>
      <div class="clr"></div>
    </div>

    <!--banner结束-->
	</td>
  </tr>
</table>
<!--导航开始-->
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="10" height="30">&nbsp;</td>
        <td width="250" class="bigtitle"><%=userString %>的博客</td>
        <td width="30" align="center"><img src="images/house.gif" width="16" height="16" /></td>
        <td width="30" align="center"><a href="index.jsp">主页</a></td>
        <td width="30" align="center"><img src="images/ico_entry.gif" width="16" height="16" /></td>
        <td width="30" align="center"><a href="articlemanagerlist.jsp">日志</a></td>
        <td width="30" align="center"><img src="images/ico_picture.gif" width="16" height="16" /></td>
        <td width="30" align="center"><a href="#">相册</a></td>
        <td width="30" align="center"><img src="images/ico_video.gif" width="16" height="16" /></td>
        <td width="30" align="center"><a href="#">视频</a></td>
        <td width="30" align="center"><img src="images/icon.gif" width="16" height="16" /></td>
        <td width="30" align="center"><a href="#">微博</a></td>
        <td width="30" align="center"><img src="images/ico_profile.gif" width="16" height="16" /></td>
        <td width="30" align="center"><a href="showuserinfo.jsp">资料</a></td>
        <td width="30" align="center"><img src="images/ico_share2.gif" width="16" height="16" /></td>
        <td width="30" align="center"><a href="index.jsp">分享</a></td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<!--导航结束-->