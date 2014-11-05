
<%@page import="edu.xbmu.myblog.dao.UserDetails"%>
<%@page import="edu.xbmu.myblog.dao.UserDetailDao"%>
<%@page import="edu.xbmu.myblog.dao.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
     User user=(User)session.getAttribute("scsLogin");
    if (user==null)
    {
%>
<!--正文右侧开始-->
	<table width="200" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
      <tr>
        <td height="30" bgcolor="#fafafa">&nbsp;用户登录</td>
      </tr>
      <tr>
        <td height="80" bgcolor="#FFFFFF">
        <form id="form1" name="form1" method="post" action="doprocess/doLogin.jsp">
          <table width="190" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="56" height="30" align="right">用户名：</td>
              <td><label>
                <input name="userName" type="text" class="inputTextW110H22" />
              </label></td>
            </tr>
            <tr>
              <td height="30" align="right">密　码：</td>
              <td><label>
                <input name="pwd" type="password" class="inputTextW110H22" />
              </label></td>
            </tr>
            <tr>
              <td height="30" colspan="2" align="center">记住密码
                <label>
                <input type="radio" name="rad" value="radiobutton" />
                是
                <input name="rad" type="radio" value="radiobutton" checked="checked" />
                否</label></td>
            </tr>
            <tr>
              <td height="30" colspan="2" align="center"><table width="150" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="center"><input type="image" name="imageField" src="images/login.jpg" /></td>
                  <td align="center"><a href="register.jsp"><img src="images/reg.jpg" width="74" height="22" /></a></td>
                </tr>
              </table>                </td>
              </tr>
          </table>
                </form>
        </td>
      </tr>
    </table>
    <%}
    else
    {
    UserDetailDao userdetaildao=new UserDetailDao();
    UserDetails userdetail=userdetaildao.findUserDetailById(user.getId());
    %>
      <table width="200" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
        <tr>
          <td height="30" bgcolor="#fafafa">&nbsp;个人资料</td>
        </tr>
        <tr>
          <td height="80" bgcolor="#FFFFFF"><table width="190" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="30" colspan="2" align="left" class="F12Gray"><table width="190" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="center"><img src="<%=userdetail.getHeaderimg() %>" width="180" height="140" /></td>
                    </tr>
                    <tr>
                      <td height="25" align="center"><%=userdetail.getTrueName()%></td>
                    </tr>
                    <tr>
                      <td height="2" align="center" bgcolor="#E6E6E6"></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td height="20" colspan="2" align="center"><img src="images/information.jpg" width="177" height="90" /></td>
              </tr>
              <tr>
                <td height="20" colspan="2" align="left">&nbsp;</td>
              </tr>
              <tr>
                <td width="75" height="25" align="center"><a href="addarticle.html"><img src="images/icon1.png" width="12" height="12" border="0" /></a></td>
                <td width="115" align="left"><a href="addarticle.jsp?uid=<%=user.getId()%>">发表文章</a></td>
              </tr>
              <tr>
                <td height="25" align="center"><a href="addarticle.html"><img src="images/icon1.png" width="12" height="12" border="0" /></a><a href="articlemanagerlist.html"></a></td>
                <td height="20" align="left"><a href="articlemanagerlist.jsp?uid=<%=user.getId()%>">文章管理</a></td>
              </tr>
              <tr>
                <td height="25" align="center"><a href="addarticle.html"><img src="images/icon1.png" width="12" height="12" border="0" /></a><a href="setinfo.html"></a></td>
                <td height="20" align="left"><a href="setInfo.jsp">个人设置</a></td>
              </tr>
              <tr>
                <td height="25" align="center"><a href="addarticle.html"><img src="images/icon1.png" width="12" height="12" border="0" /></a><a href="changepwd.html"></a></td>
                <td height="20" align="left"><a href="modifypwd.jsp">更改密码</a></td>
              </tr>
                <tr>
                <td height="25" align="center"><a href="addarticle.html"><img src="images/icon1.png" width="12" height="12" border="0" /></a><a href="changepwd.html"></a></td>
                <td height="20" align="left"><a href="modifyHeader.jsp?uid=<%=user.getId()%>">更改头像</a></td>
              </tr>
              <tr>
                <td height="30" colspan="2" align="center"><label><a href="doprocess/doexit.jsp"><img src="images/exitlogin.jpg" width="74" height="22" border="0" /></a></label></td>
              </tr>
          </table></td>
        </tr>
      </table>
      <%} %>
      
      <table width="200" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
        <tr>
          <td height="30" bgcolor="#fafafa">&nbsp;博客用户</td>
        </tr>
        <tr>
          <td height="80" valign="top" bgcolor="#FFFFFF"><table width="180" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="50" align="center" valign="top"><img src="headerimg/linchong.jpg" alt="林冲" width="50" /></td>
              <td width="15" align="center" valign="top">&nbsp;</td>
              <td align="center" valign="top"><img src="headerimg/lujunyi.jpg" alt="卢俊义" width="50" /></td>
              <td width="15" align="center" valign="top">&nbsp;</td>
              <td align="center" valign="top"><img src="headerimg/panjinlian.jpg" alt="潘金莲" width="50" /></td>
            </tr>
            <tr>
              <td height="50" align="center" valign="top"><img src="headerimg/songjiang.jpg" alt="宋江" width="50" /></td>
              <td align="center" valign="top">&nbsp;</td>
              <td align="center" valign="top"><img src="headerimg/wusong.jpg" alt="武松" width="50" /></td>
              <td align="center" valign="top">&nbsp;</td>
              <td align="center" valign="top"><img src="headerimg/ximenqing.jpg" alt="西门庆" width="50" /></td>
            </tr>
          </table></td>
        </tr>
      </table>
	  <!--正文右侧结束-->